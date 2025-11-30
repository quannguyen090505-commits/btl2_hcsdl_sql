// src/components/AdminBookList.js

import React, { useState, useEffect, useCallback } from 'react';
import { fetchBooks, createBook, updateBook, deleteBookApi, salesData } from '../services/api.jsx';
import SearchModal from './Modals/SearchModal.jsx';
import CrudModal from './Modals/CrudModal.jsx';
import StatsModal from './Modals/StatsModal.jsx';

const AdminBookList = () => {
    const [books, setBooks] = useState([]);
    const [loading, setLoading] = useState(true);
    const [searchModalOpen, setSearchModalOpen] = useState(false);
    const [crudModalOpen, setCrudModalOpen] = useState(false);
    const [statsModalOpen, setStatsModalOpen] = useState(false);
    const [editingBook, setEditingBook] = useState(null); // null: thêm mới, object: chỉnh sửa
    
    // Hàm gọi API lấy sách (đã bao gồm lọc/tìm kiếm)
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


    // === LOGIC CRUD ===

    const handleCreateUpdate = async (bookData) => {
        try {
            if (bookData.id) {
                // UPDATE
                await updateBook(bookData.id, bookData);
                alert(`Cập nhật sách ${bookData.title} thành công!`);
            } else {
                // CREATE
                await createBook(bookData);
                alert(`Thêm sách ${bookData.title} thành công!`);
            }
            setCrudModalOpen(false);
            loadBooks(); // Tải lại danh sách
        } catch (error) {
            console.error("Lỗi CRUD:", error);
            alert("Thao tác thất bại.");
        }
    };

    const handleDelete = async (id, title) => {
        if (window.confirm(`Bạn có chắc chắn muốn xóa sách "${title}" không?`)) {
            try {
                await deleteBookApi(id);
                alert(`Đã xóa sách ${title} thành công.`);
                loadBooks(); // Tải lại danh sách
            } catch (error) {
                console.error("Lỗi xóa sách:", error);
                alert("Xóa sách thất bại.");
            }
        }
    };
    
    const handleEditClick = (book) => {
        setEditingBook(book);
        setCrudModalOpen(true);
    };

    const handleAddClick = () => {
        setEditingBook(null); // Đặt null để báo hiệu là Thêm mới
        setCrudModalOpen(true);
    };

    // === RENDER ===
    
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
                        <th>Ảnh Bìa</th>
                        <th>Tên Sách</th>
                        <th>Giá Tiền</th>
                        <th>Tồn Kho</th>
                        <th>Nhà Xuất Bản</th>
                        <th>Ngôn Ngữ</th>
                        <th>Dịch Giả</th>
                        <th className="action-cell">Thao Tác</th>
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
                            <td className="action-cell">
                                <button className="action-button btn-edit btn" onClick={() => handleEditClick(book)}>Sửa</button>
                                <button className="action-button btn-delete btn" onClick={() => handleDelete(book.id, book.title)}>Xóa</button>
                            </td>
                        </tr>
                    ))}
                    {books.length === 0 && (
                        <tr><td colSpan="9" style={{ textAlign: 'center' }}>Không tìm thấy sách nào.</td></tr>
                    )}
                </tbody>
            </table>
            
            {/* Modals */}
            <SearchModal 
                isOpen={searchModalOpen} 
                onClose={() => setSearchModalOpen(false)} 
                onSearch={loadBooks} 
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
                salesData={salesData}
                allBooks={books}
            />
        </div>
    );
};

export default AdminBookList;