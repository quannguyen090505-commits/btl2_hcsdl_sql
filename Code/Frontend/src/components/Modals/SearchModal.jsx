// src/components/Modals/SearchModal.jsx
import React, { useState } from 'react';
import { searchBooks } from '../../services/api.jsx';

const SearchModal = ({ isOpen, onClose, onSearch }) => {
    const [formData, setFormData] = useState({
        keyword: '',
        minPrice: '',
        maxPrice: '',
        genre: '',  // Changed from 'category' to 'genre' to match backend
        sort: 'relevance'  // Changed from 'sortOrder' to 'sort'
    });
    const [errors, setErrors] = useState({});
    const [message, setMessage] = useState('');
    const [loading, setLoading] = useState(false);

    if (!isOpen) return null;

    const handleChange = (e) => {
        const { name, value } = e.target;
        setFormData(prev => ({ ...prev, [name]: value }));
        if (errors[name]) {
            setErrors(prev => ({ ...prev, [name]: '' }));
        }
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
        if (formData.minPrice && formData.maxPrice && minPrice > maxPrice) {
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
    
        setLoading(true);
        setMessage({ type: 'info', text: 'Đang tìm kiếm...' });
    
        try {
            // Prepare parameters - backend expects exact parameter names
            const searchParams = {};
            
            // Add parameters if they have values
            if (formData.keyword.trim()) searchParams.keyword = formData.keyword.trim();
            if (formData.minPrice) searchParams.minPrice = formData.minPrice; // Don't parseInt here
            if (formData.maxPrice) searchParams.maxPrice = formData.maxPrice; // Don't parseInt here
            if (formData.genre) searchParams.genre = formData.genre;
            if (formData.sort && formData.sort !== 'relevance') searchParams.sort = formData.sort;
            
            console.log('📤 Sending search params:', searchParams);
            
            // Call the search API
            const results = await searchBooks(searchParams);
            console.log('📥 Received results:', results);
            
            // Pass results to parent component
            onSearch(results);
            
            setMessage({ 
                type: 'success', 
                text: `Tìm kiếm thành công! Tìm thấy ${results.length} kết quả.` 
            });
            
            // Auto-close after success
            setTimeout(() => {
                onClose();
                setLoading(false);
                setMessage('');
            }, 1500);
            
        } catch (error) {
            console.error('❌ Search failed:', error);
            setMessage({ 
                type: 'error', 
                text: `Lỗi tìm kiếm: ${error.message || 'Vui lòng thử lại.'}` 
            });
            setLoading(false);
        }
    };

    const handleReset = () => {
        setFormData({
            keyword: '',
            minPrice: '',
            maxPrice: '',
            genre: '',
            sort: 'relevance'
        });
        setErrors({});
        setMessage('');
    };

    return (
        <div id="search-modal" className="modal" style={{ display: 'block' }}>
            <div className="modal-content">
                <span className="close-btn search-close-btn" onClick={onClose}>&times;</span>
                <h1>Form Tìm Kiếm Sách</h1>
                
                <form id="search-form" onSubmit={handleSubmit}>
                    
                    <div className="form-group">
                        <label htmlFor="keyword">Từ khóa:</label>
                        <input 
                            type="text" 
                            id="keyword" 
                            name="keyword" 
                            value={formData.keyword} 
                            onChange={handleChange} 
                            placeholder="Tên sách, tác giả, mô tả..."
                            disabled={loading}
                        />
                    </div>

                    <div className="price-group">
                        <div className="form-group price-field">
                            <label htmlFor="minPrice">Giá tối thiểu (VNĐ):</label>
                            <input 
                                type="number" 
                                id="minPrice" 
                                name="minPrice" 
                                value={formData.minPrice} 
                                onChange={handleChange} 
                                min="0" 
                                step="1000"
                                placeholder="0" 
                                className={errors.minPrice || errors.priceRange ? 'input-error' : ''}
                                disabled={loading}
                            />
                            {errors.minPrice && <div className="error-message">{errors.minPrice}</div>}
                        </div>
                        
                        <div className="form-group price-field">
                            <label htmlFor="maxPrice">Giá tối đa (VNĐ):</label>
                            <input 
                                type="number" 
                                id="maxPrice" 
                                name="maxPrice" 
                                value={formData.maxPrice} 
                                onChange={handleChange} 
                                min="0" 
                                step="1000"
                                placeholder="1000000" 
                                className={errors.maxPrice || errors.priceRange ? 'input-error' : ''}
                                disabled={loading}
                            />
                            {errors.maxPrice && <div className="error-message">{errors.maxPrice}</div>}
                        </div>
                    </div>
                    
                    {errors.priceRange && (
                        <div className="error-message" style={{ marginTop: '-10px', marginBottom: '15px' }}>
                            {errors.priceRange}
                        </div>
                    )}

                    <div className="form-group">
                        <label htmlFor="genre">Thể loại:</label>
                        <select 
                            id="genre" 
                            name="genre" 
                            value={formData.genre} 
                            onChange={handleChange}
                            disabled={loading}
                        >
                            <option value="">Tất cả thể loại</option>
                            <option value="Dai cuong">Đại Cương</option>
                            <option value="Khoa hoc May tinh">Chuyên ngành KHMT</option>
                            <option value="Ki Thuat May Tinh">Chuyên ngành KTMT</option>
                            <option value="Chinh tri">Chính Trị</option>
                            <option value="GDQP">GDQP</option>
                        </select>
                    </div>

                    <div className="form-group">
                        <label htmlFor="sort">Sắp xếp theo:</label>
                        <select 
                            id="sort" 
                            name="sort" 
                            value={formData.sort} 
                            onChange={handleChange}
                            disabled={loading}
                        >
                            <option value="MAC_DINH">Tên A-Z</option>
                            <option value="GIA_TANG">Giá tăng dần</option>
                            <option value="GIA_GIAM">Giá giảm dần</option>
                        </select>
                    </div>

                    <div className="form-buttons">
                        <button 
                            type="button" 
                            className="reset-button" 
                            onClick={handleReset}
                            disabled={loading}
                        >
                            Đặt lại
                        </button>
                        <button 
                            type="submit" 
                            className="search-button" 
                            disabled={loading}
                        >
                            {loading ? 'Đang tìm...' : 'Tìm Kiếm'}
                        </button>
                    </div>
                    
                    {message.text && (
                        <div className={`form-message ${message.type}`} style={{ display: 'block', marginTop: '15px' }}>
                            {message.text}
                        </div>
                    )}

                </form>
            </div>
        </div>
    );
};

export default SearchModal;