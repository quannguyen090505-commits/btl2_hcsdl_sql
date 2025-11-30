// src/components/Modals/SearchModal.js

import React, { useState } from 'react';

const SearchModal = ({ isOpen, onClose, onSearch }) => {
    const [formData, setFormData] = useState({
        keyword: '',
        minPrice: '',
        maxPrice: '',
        category: '',
        sortOrder: 'relevance'
    });
    const [errors, setErrors] = useState({});
    const [message, setMessage] = useState('');

    if (!isOpen) return null;

    const handleChange = (e) => {
        setFormData({ ...formData, [e.target.name]: e.target.value });
        setErrors({ ...errors, [e.target.name]: '' }); // Xóa lỗi khi người dùng nhập
        setMessage('');
    };

    const validate = () => {
        const newErrors = {};
        const minPrice = parseFloat(formData.minPrice);
        const maxPrice = parseFloat(formData.maxPrice);

        if (formData.minPrice && (isNaN(minPrice) || minPrice < 0)) {
            newErrors.minPrice = 'Giá tối thiểu phải là số dương.';
        }
        if (formData.maxPrice && (isNaN(maxPrice) || maxPrice < 0)) {
            newErrors.maxPrice = 'Giá tối đa phải là số dương.';
        }
        if (!newErrors.minPrice && !newErrors.maxPrice && minPrice > 0 && maxPrice > 0 && minPrice > maxPrice) {
            newErrors.priceRange = 'Giá tối thiểu không thể lớn hơn giá tối đa.';
        }
        
        setErrors(newErrors);
        return Object.keys(newErrors).length === 0;
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        if (!validate()) {
            setMessage({ type: 'error', text: 'Vui lòng kiểm tra lại các trường bị lỗi.' });
            return;
        }

        try {
            await onSearch(formData);
            setMessage({ type: 'success', text: 'Tìm kiếm thành công!' });
            setTimeout(() => {
                onClose();
                setMessage('');
            }, 500);
        } catch (error) {
            setMessage({ type: 'error', text: 'Lỗi trong quá trình tìm kiếm.' });
        }
    };

    return (
        <div id="search-modal" className="modal" style={{ display: 'block' }}>
            <div className="modal-content">
                <span className="close-btn search-close-btn" onClick={onClose}>&times;</span>
                <h1>Form Tìm Kiếm Sách</h1>
                
                <form id="search-form" onSubmit={handleSubmit}>
                    
                    <div className="form-group">
                        <label htmlFor="keyword">Từ khóa trong tên sách:</label>
                        <input type="text" id="keyword" name="keyword" value={formData.keyword} onChange={handleChange} placeholder="Nhập tên sách..."/>
                    </div>

                    <div className="price-group">
                        <div className="form-group price-field">
                            <label htmlFor="minPrice">Giá tối thiểu (VNĐ):</label>
                            <input type="number" id="minPrice" name="minPrice" value={formData.minPrice} onChange={handleChange} min="0" placeholder="0" className={errors.minPrice || errors.priceRange ? 'input-error' : ''}/>
                            <div className="error-message" id="min-price-error">{errors.minPrice || (errors.priceRange ? errors.priceRange : '')}</div>
                        </div>
                        
                        <div className="form-group price-field">
                            <label htmlFor="maxPrice">Giá tối đa (VNĐ):</label>
                            <input type="number" id="maxPrice" name="maxPrice" value={formData.maxPrice} onChange={handleChange} min="0" placeholder="1000000" className={errors.maxPrice || errors.priceRange ? 'input-error' : ''}/>
                            <div className="error-message" id="max-price-error">{errors.maxPrice}</div>
                        </div>
                    </div>

                    <div className="form-group">
                        <label htmlFor="category">Thể loại:</label>
                        <select id="category" name="category" value={formData.category} onChange={handleChange}>
                            <option value="">Tất cả thể loại</option>
                            <option value="general subject">Đại Cương</option>
                            <option value="Computer science major">Chuyên ngành KHMT</option>
                            <option value="Computer engineering major">Chuyên ngành KTMT</option>
                            <option value="politcis">Chinh Tri</option>
                        </select>
                    </div>

                    <div className="form-group">
                        <label htmlFor="sortOrder">Thứ tự sắp xếp:</label>
                        <select id="sortOrder" name="sortOrder" value={formData.sortOrder} onChange={handleChange}>
                            <option value="relevance">Mức độ liên quan</option>
                            <option value="price-asc">Giá tăng dần</option>
                            <option value="price-desc">Giá giảm dần</option>
                            <option value="title-asc">Tên A-Z</option>
                        </select>
                    </div>

                    <button type="submit" className="search-button">Tìm Kiếm</button>
                    {message.text && <div className={`form-message ${message.type}`} style={{ display: 'block' }}>{message.text}</div>}

                </form>
            </div>
        </div>
    );
};

export default SearchModal;