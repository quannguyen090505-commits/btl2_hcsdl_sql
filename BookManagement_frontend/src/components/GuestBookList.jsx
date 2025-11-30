// src/components/GuestBookList.js

import React, { useState, useEffect, useCallback } from 'react';
import { fetchBooks } from '../services/api.jsx';
import SearchModal from './Modals/SearchModal.jsx';

const GuestBookList = () => {
    const [books, setBooks] = useState([]);
    const [loading, setLoading] = useState(true);
    const [searchModalOpen, setSearchModalOpen] = useState(false);
    
    // Hàm gọi API lấy sách
    const loadBooks = useCallback(async (params = {}) => {
        setLoading(true);
        try {
            const data = await fetchBooks(params);
            setBooks(data);
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
                        <th>Ảnh Bìa</th>
                        <th>Tên Sách</th>
                        <th>Giá Tiền</th>
                        <th>Tồn Kho</th>
                        <th>Nhà Xuất Bản</th>
                        <th>Ngôn Ngữ</th>
                        <th>Dịch Giả</th>
                    </tr>
                </thead>
                <tbody id="book-table-body">
                    {books.map(book => (
                        <tr key={book.id}>
                            <td className="book-code-cell">{book.code}</td>
                            <td className="book-cover-cell">
                                {book.cover ? <img src={book.cover} alt={book.title} style={{ width: '60px', height: '80px' }} /> : <div className="no-cover-placeholder">🖼️</div>}
                            </td>
                            <td className="book-title-cell">{book.title}</td>
                            <td className="price-cell">{book.price.toLocaleString('vi-VN')} VNĐ</td>
                            <td className="stock-cell">{book.stock}</td>
                            <td>{book.publisher || 'N/A'}</td>
                            <td>{book.language || 'N/A'}</td>
                            <td>{book.translator || 'N/A'}</td>
                        </tr>
                    ))}
                    {books.length === 0 && (
                        <tr><td colSpan="8" style={{ textAlign: 'center' }}>Không tìm thấy sách nào.</td></tr>
                    )}
                </tbody>
            </table>
            
            <SearchModal 
                isOpen={searchModalOpen} 
                onClose={() => setSearchModalOpen(false)} 
                onSearch={loadBooks} 
            />
        </div>
    );
};

export default GuestBookList;