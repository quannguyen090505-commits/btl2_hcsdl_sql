// src/components/Modals/CrudModal.jsx
import React, { useState, useEffect } from 'react';

const CrudModal = ({ isOpen, onClose, onSubmit, bookToEdit }) => {
    const initialState = {
        id: '',
        title: '',
        code: '',
        language: 'Tiếng Việt',
        translator: '',
        publisher: '',
        publicationYear: new Date().getFullYear(),
        price: '',
        quantity: '', // This maps to backend 'quantity'
        numPage: 200,
        branchId: '001',
        categories: []
    };
    
    const [formData, setFormData] = useState(initialState);
    const [categoryInput, setCategoryInput] = useState(''); // Separate state for input

    useEffect(() => {
        if (bookToEdit) {
            // Transform backend book data to frontend structure
            const transformedBook = {
                id: bookToEdit.id,
                title: bookToEdit.title,
                code: bookToEdit.id,
                language: bookToEdit.language,
                translator: bookToEdit.translator || '',
                publisher: bookToEdit.publisher,
                publicationYear: bookToEdit.publicationYear,
                price: bookToEdit.price,
                quantity: bookToEdit.quantity,
                numPage: bookToEdit.numPage,
                branchId: bookToEdit.branchId,
                categories: bookToEdit.categories || []
            };
            setFormData(transformedBook);
            // Set category input string
            setCategoryInput(
                transformedBook.categories
                    .map(c => c.category?.id || c.id?.categoryId || c)
                    .join(', ')
            );
        } else {
            setFormData(initialState);
            setCategoryInput('');
        }
    }, [bookToEdit]);

    if (!isOpen) return null;
    
    const isEditing = !!bookToEdit;

    const handleChange = (e) => {
        setFormData({ ...formData, [e.target.name]: e.target.value });
    };

    const handleCategoryChange = (e) => {
        const value = e.target.value;
        setCategoryInput(value);
        
        // Parse categories when input changes
        const categoryIds = value.split(/[,，\s]+/) // Split by comma, Chinese comma, or whitespace
            .map(id => id.trim())
            .filter(id => id && /^\d+$/.test(id)); // Only keep numeric IDs
        
        setFormData({
            ...formData,
            categories: categoryIds.map(id => ({
                category: { id }
            }))
        });
    };

    const handleSubmit = (e) => {
        e.preventDefault();
        // Validate required fields
        if (!formData.title || !formData.code || !formData.price || !formData.quantity) {
            alert("Vui lòng nhập đầy đủ Tên Sách, Mã Sách, Giá và Số lượng.");
            return;
        }
        
        // Ensure categories are properly formatted
        const finalFormData = {
            ...formData,
            categories: formData.categories.map(cat => {
                // Ensure each category has the right structure
                if (typeof cat === 'string') {
                    return { category: { id: cat } };
                }
                if (cat.category && cat.category.id) {
                    return cat;
                }
                return { category: { id: cat } };
            })
        };
        
        onSubmit(finalFormData);
    };

    return (
        <div id="crud-modal" className="modal" style={{ display: 'block' }}>
            <div className="modal-content">
                <span className="close-btn crud-close-btn" onClick={onClose}>&times;</span>
                <h1 id="crud-modal-title">{isEditing ? `Sửa Sách: ${bookToEdit.title}` : 'Form Thêm Sách Mới'}</h1>
                
                <form id="crud-form" onSubmit={handleSubmit}>
                    <input type="hidden" id="book-id" name="id" value={formData.id}/>
                    
                    <div className="form-group">
                        <label htmlFor="code">Mã Sách:</label> 
                        <input type="text" id="code" name="code" value={formData.code} onChange={handleChange} required/>
                    </div>

                    <div className="form-group">
                        <label htmlFor="title">Tên Sách:</label>
                        <input type="text" id="title" name="title" value={formData.title} onChange={handleChange} required/>
                    </div>
                    
                    <div className="form-group">
                        <label htmlFor="language">Ngôn Ngữ:</label>
                        <input type="text" id="language" name="language" value={formData.language} onChange={handleChange} required/>
                    </div>

                    <div className="form-group">
                        <label htmlFor="translator">Dịch Giả:</label>
                        <input type="text" id="translator" name="translator" value={formData.translator} onChange={handleChange} placeholder="Không có dịch giả (để trống)"/>
                    </div>

                    <div className="form-group">
                        <label htmlFor="publisher">Nhà Xuất Bản:</label>
                        <input type="text" id="publisher" name="publisher" value={formData.publisher} onChange={handleChange} required/>
                    </div>

                    <div className="form-group">
                        <label htmlFor="publicationYear">Năm Xuất Bản:</label>
                        <input type="number" id="publicationYear" name="publicationYear" value={formData.publicationYear} onChange={handleChange} min="1900" max="2100" required/>
                    </div>

                    <div className="form-group">
                        <label htmlFor="price">Giá Tiền (VNĐ):</label>
                        <input type="number" id="price" name="price" value={formData.price} onChange={handleChange} min="0" required/>
                    </div>

                    <div className="form-group">
                        <label htmlFor="quantity">Số Lượng:</label>
                        <input type="number" id="quantity" name="quantity" value={formData.quantity} onChange={handleChange} min="0" required/>
                    </div>

                    <div className="form-group">
                        <label htmlFor="numPage">Số Trang:</label>
                        <input type="number" id="numPage" name="numPage" value={formData.numPage} onChange={handleChange} min="1" required/>
                    </div>

                    <div className="form-group">
                        <label htmlFor="branchId">Chi Nhánh:</label>
                        <select id="branchId" name="branchId" value={formData.branchId} onChange={handleChange} required>
                            <option value="001">Chi nhánh 1</option>
                            <option value="002">Chi nhánh 2</option>
                            <option value="003">Chi nhánh 3</option>
                            <option value="004">Chi nhánh 4</option>
                            <option value="005">Chi nhánh 5</option>
                        </select>
                    </div>

                    <div className="form-group">
                        <label htmlFor="categories">Thể Loại (ID):</label>
                        <div style={{ fontSize: '14px', color: '#666', marginBottom: '5px' }}>
                            Lưu ý: Nhập ID thể loại đã có trong database, phân cách bằng dấu phẩy hoặc khoảng trắng
                            <br />(001: KHMT, 002: Chính trị, 003: Đại cương, 004: KTMT, 005: GDQP)
                        </div>
                        <input 
                            type="text" 
                            id="categories" 
                            name="categories" 
                            value={categoryInput}
                            onChange={handleCategoryChange}
                            placeholder="VD: 001, 003 hoặc 001 003"
                        />
                        <div style={{ fontSize: '12px', color: '#666', marginTop: '5px' }}>
                            Đã nhập: {formData.categories.length} thể loại
                            {formData.categories.length > 0 && 
                                ` (${formData.categories.map(c => c.category?.id || c).join(', ')})`
                            }
                        </div>
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