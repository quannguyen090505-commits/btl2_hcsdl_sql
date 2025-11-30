// src/components/Modals/CrudModal.js

import React, { useState, useEffect } from 'react';

const CrudModal = ({ isOpen, onClose, onSubmit, bookToEdit }) => {
    const initialState = {
        id: '',
        title: '',
        code: '',
        cover: '',
        price: '',
        stock: '',
        publisher: '',
        language: '',
        translator: ''
    };
    
    const [formData, setFormData] = useState(initialState);

    useEffect(() => {
        if (bookToEdit) {
            setFormData(bookToEdit);
        } else {
            setFormData(initialState);
        }
    }, [bookToEdit]); // Cập nhật form khi bookToEdit thay đổi

    if (!isOpen) return null;
    
    const isEditing = !!bookToEdit;

    const handleChange = (e) => {
        setFormData({ ...formData, [e.target.name]: e.target.value });
    };

    const handleSubmit = (e) => {
        e.preventDefault();
        // Kiểm tra hợp lệ đơn giản (có thể mở rộng thêm)
        if (!formData.title || !formData.code || !formData.price || !formData.stock) {
            alert("Vui lòng nhập đầy đủ Tên Sách, Mã Sách, Giá và Tồn Kho.");
            return;
        }
        
        onSubmit(formData);
    };

    return (
        <div id="crud-modal" className="modal" style={{ display: 'block' }}>
            <div className="modal-content">
                <span className="close-btn crud-close-btn" onClick={onClose}>&times;</span>
                <h1 id="crud-modal-title">{isEditing ? `Sửa Sách: ${bookToEdit.title}` : 'Form Thêm Sách Mới'}</h1>
                
                <form id="crud-form" onSubmit={handleSubmit}>
                    <input type="hidden" id="book-id" name="id" value={formData.id}/>
                    
                    <div className="form-group">
                        <label htmlFor="title">Tên Sách:</label>
                        <input type="text" id="title" name="title" value={formData.title} onChange={handleChange} required/>
                    </div>
                    
                    <div className="form-group">
                        <label htmlFor="code">Mã Sách:</label> 
                        <input type="text" id="code" name="code" value={formData.code} onChange={handleChange} required/>
                    </div>
                    
                    <div className="form-group">
                        <label htmlFor="cover">Ảnh Bìa (URL):</label>
                        <input type="text" id="cover" name="cover" value={formData.cover} onChange={handleChange} placeholder="http://..."/>
                        <div id="cover-preview" style={{ maxWidth: '100px', marginTop: '10px' }}>
                            {formData.cover && <img src={formData.cover} alt="Preview" style={{ width: '100%', height: 'auto' }} />}
                        </div>
                    </div>

                    <div className="form-group">
                        <label htmlFor="price">Giá Tiền (VNĐ):</label>
                        <input type="number" id="price" name="price" value={formData.price} onChange={handleChange} min="0" required/>
                    </div>

                    <div className="form-group">
                        <label htmlFor="stock">Tồn Kho:</label>
                        <input type="number" id="stock" name="stock" value={formData.stock} onChange={handleChange} min="0" required/>
                    </div>

                    <div className="form-group">
                        <label htmlFor="publisher">Nhà Xuất Bản:</label>
                        <input type="text" id="publisher" name="publisher" value={formData.publisher} onChange={handleChange}/>
                    </div>

                    <div className="form-group">
                        <label htmlFor="language">Ngôn Ngữ:</label>
                        <input type="text" id="language" name="language" value={formData.language} onChange={handleChange}/>
                    </div>

                    <div className="form-group">
                        <label htmlFor="translator">Dịch Giả:</label>
                        <input type="text" id="translator" name="translator" value={formData.translator} onChange={handleChange}/>
                    </div>

                    <button type="submit" className="search-button" id="crud-submit-btn">
                        {isEditing ? 'Cập Nhật Sách' : 'Thêm Sách'}
                    </button>
                </form>
            </div>
        </div>
    );
};

export default CrudModal;