// src/components/AdminBookList.jsx
import React, { useState, useEffect, useCallback } from 'react';
import { fetchBooks, createBook, updateBook, deleteBookApi, searchBooks, getBookStatistics } from '../services/api.jsx';
import SearchModal from './Modals/SearchModal.jsx';
import CrudModal from './Modals/CrudModal.jsx';
import StatsModal from './Modals/StatsModal.jsx';

const AdminBookList = () => {
    const [books, setBooks] = useState([]);
    const [loading, setLoading] = useState(true);
    const [searchModalOpen, setSearchModalOpen] = useState(false);
    const [crudModalOpen, setCrudModalOpen] = useState(false);
    const [statsModalOpen, setStatsModalOpen] = useState(false);
    const [editingBook, setEditingBook] = useState(null);
    
    // Hàm gọi API lấy sách
    const loadBooks = useCallback(async (searchResults = null) => {
        setLoading(true);
        try {
            if (searchResults) {
                // If search results are provided, use them
                setBooks(searchResults);
            } else {
                // Otherwise fetch all books
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

    // Handle search from SearchModal
    // In AdminBookList.jsx and GuestBookList.jsx, update handleSearch:
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

    // Handle create/update book
    const handleCreateUpdate = async (bookData) => {
        try {
            if (bookData.id) {
                // UPDATE - use code as ID for backend
                await updateBook(bookData.code, bookData);
                alert(`Cập nhật sách "${bookData.title}" thành công!`);
            } else {
                // CREATE
                await createBook(bookData);
                alert(`Thêm sách "${bookData.title}" thành công!`);
            }
            setCrudModalOpen(false);
            loadBooks(); // Reload books
        } catch (error) {
            console.error("Lỗi CRUD:", error);
            alert("Thao tác thất bại: " + (error.message || "Lỗi không xác định"));
        }
    };

    const handleDelete = async (id, title) => {
        if (window.confirm(`Bạn có chắc chắn muốn xóa sách "${title}" không?`)) {
            try {
                await deleteBookApi(id);
                alert(`Đã xóa sách "${title}" thành công.`);
                loadBooks(); // Reload books
            } catch (error) {
                console.error("Lỗi xóa sách:", error);
                alert("Xóa sách thất bại: " + (error.message || "Lỗi không xác định"));
            }
        }
    };
    
    const handleEditClick = (book) => {
        setEditingBook(book);
        setCrudModalOpen(true);
    };

    const handleAddClick = () => {
        setEditingBook(null);
        setCrudModalOpen(true);
    };

    if (loading) return <p style={{ textAlign: 'center' }}>Đang tải dữ liệu...</p>;

    return (
        <div className="container">
            <h2>Quản Lý Danh Sách Tác Phẩm Sách</h2>
            
            <div className="action-bar">
                <button className="action-button btn-search" onClick={() => setSearchModalOpen(true)}>🔍 Tìm Kiếm & Lọc</button>
                <button className="action-button btn-add" onClick={handleAddClick}>➕ Thêm Sách Mới</button>
                <button className="action-button btn-info" onClick={() => setStatsModalOpen(true)}>📊 Thống Kê Doanh Thu</button> 
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
                        <th className="action-cell">Thao Tác</th>
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
                            <td className="action-cell">
                                <button className="action-button btn-edit btn" onClick={() => handleEditClick(book)}>Sửa</button>
                                <button className="action-button btn-delete btn" onClick={() => handleDelete(book.id, book.title)}>Xóa</button>
                            </td>
                        </tr>
                    ))}
                    {books.length === 0 && (
                        <tr><td colSpan="12" style={{ textAlign: 'center' }}>Không tìm thấy sách nào.</td></tr>
                    )}
                </tbody>
            </table>
            
            {/* Modals */}
            <SearchModal 
                isOpen={searchModalOpen} 
                onClose={() => setSearchModalOpen(false)} 
                onSearch={handleSearch} 
            />
            
            <CrudModal 
                isOpen={crudModalOpen} 
                onClose={() => setCrudModalOpen(false)} 
                onSubmit={handleCreateUpdate} 
                bookToEdit={editingBook}
            />

            <StatsModal
                isOpen={statsModalOpen}
                onClose={() => setStatsModalOpen(false)}
                salesData={[]} // Will use real API
                allBooks={books}
            />
        </div>
    );
};

export default AdminBookList;