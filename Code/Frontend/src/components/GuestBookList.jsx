// src/components/GuestBookList.js
import React, { useState, useEffect, useCallback } from 'react';
import { fetchBooks, searchBooks } from '../services/api.jsx';
import SearchModal from './Modals/SearchModal.jsx';

const GuestBookList = () => {
    const [books, setBooks] = useState([]);
    const [loading, setLoading] = useState(true);
    const [searchModalOpen, setSearchModalOpen] = useState(false);
    
    // Hàm gọi API lấy sách
    const loadBooks = useCallback(async (searchResults = null) => {
        setLoading(true);
        try {
            if (searchResults) {
                setBooks(searchResults);
            } else {
                const data = await fetchBooks();
                setBooks(data);
            }
        } catch (error) {
            console.error("Lỗi khi fetch sách:", error);
            alert("Không thể tải dữ liệu sách.");
        } finally {
            setLoading(false);
        }
    }, []);

    useEffect(() => {
        loadBooks();
    }, [loadBooks]);

    // Handle search
    // const handleSearch = async (searchParams) => {
    //     try {
    //     const results = await searchBooks(searchParams);
    //     setBooks(results); // Update the books state
    //     } catch (error) {
    //     console.error("Lỗi khi tìm kiếm sách:", error);
    //     alert("Lỗi khi tìm kiếm sách.");
    //     }
    // };

    const handleSearch = (results) => {
        setBooks(results); // This updates the books state with search results
    };

    if (loading) return <p style={{ textAlign: 'center' }}>Đang tải dữ liệu...</p>;

    return (
        <div className="container guest-view">
            <h2>Danh Sách Tác Phẩm Sách</h2>
            
            <div className="action-bar">
                <button className="action-button btn-search" onClick={() => setSearchModalOpen(true)}>🔍 Tìm Kiếm & Lọc</button>
            </div>

            <table id="book-results-table">
                <thead>
                    <tr>
                        <th>Mã Sách</th>
                        <th>Tên Sách</th>
                        <th>Ngôn Ngữ</th>
                        <th>Dịch Giả</th>
                        <th>Nhà Xuất Bản</th>
                        <th>Năm XB</th>
                        <th>Giá Tiền</th>
                        <th>Số Lượng</th>
                        <th>Số Trang</th>
                        <th>Thể Loại</th>
                        <th>Chi Nhánh</th>
                    </tr>
                </thead>
                <tbody id="book-table-body">
                    {books.map(book => (
                        <tr key={book.id}>
                            <td className="book-code-cell">{book.id}</td>
                            <td className="book-title-cell">{book.title}</td>
                            <td>{book.language || 'N/A'}</td>
                            <td>{book.translator || 'Không có'}</td>
                            <td>{book.publisher || 'N/A'}</td>
                            <td>{book.publicationYear}</td>
                            <td className="price-cell">{book.price.toLocaleString('vi-VN')} VNĐ</td>
                            <td className="stock-cell">{book.quantity}</td>
                            <td>{book.numPage}</td>
                            <td>
                                {book.categories && book.categories.length > 0 
                                    ? book.categories.map(cat => cat.category?.name || cat.name).join(', ')
                                    : 'Không có'}
                            </td>
                            <td>{book.branchId}</td>
                        </tr>
                    ))}
                    {books.length === 0 && (
                        <tr><td colSpan="11" style={{ textAlign: 'center' }}>Không tìm thấy sách nào.</td></tr>
                    )}
                </tbody>
            </table>
            
            <SearchModal 
                isOpen={searchModalOpen} 
                onClose={() => setSearchModalOpen(false)} 
                onSearch={handleSearch} 
            />
        </div>
    );
};

export default GuestBookList;