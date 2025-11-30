// src/components/Modals/StatsModal.js

import React, { useState } from 'react';

// Hàm tính toán thống kê (di chuyển từ logic JS cũ)
const aggregateSales = (start, end, minQty, salesData, allBooks) => {
    const aggregated = {};
    const startDate = new Date(start);
    const endDate = new Date(end);
    endDate.setHours(23, 59, 59, 999); 
    
    // Tạo map thông tin sách để tra cứu nhanh
    const bookMap = allBooks.reduce((acc, book) => {
        acc[book.code] = book;
        return acc;
    }, {});

    salesData.forEach(sale => {
        const saleDate = new Date(sale.date);
        if (saleDate >= startDate && saleDate <= endDate) {
            const code = sale.bookCode;
            if (!aggregated[code]) {
                aggregated[code] = { quantity: 0, revenue: 0 };
            }
            aggregated[code].quantity += sale.quantity;
        }
    });

    const finalResults = [];
    
    for (const code in aggregated) {
        const bookInfo = bookMap[code];
        
        if (!bookInfo || aggregated[code].quantity < minQty) {
            continue;
        }
        
        aggregated[code].revenue = aggregated[code].quantity * bookInfo.price;
        
        finalResults.push({
            code: code,
            title: bookInfo.title,
            quantity: aggregated[code].quantity,
            revenue: aggregated[code].revenue
        });
    }

    return finalResults.sort((a, b) => b.revenue - a.revenue);
};


const StatsModal = ({ isOpen, onClose, salesData, allBooks }) => {
    const [formData, setFormData] = useState({
        startDate: '',
        endDate: '',
        minQuantity: 1
    });
    const [results, setResults] = useState(null);
    const [message, setMessage] = useState('');
    const [errors, setErrors] = useState({});

    if (!isOpen) return null;

    const handleChange = (e) => {
        setFormData({ ...formData, [e.target.name]: e.target.value });
        setErrors({});
        setMessage('');
    };

    const handleSubmit = (e) => {
        e.preventDefault();
        setResults(null); 
        
        const { startDate, endDate, minQuantity } = formData;
        const start = new Date(startDate);
        const end = new Date(endDate);
        const minQty = parseInt(minQuantity);
        const newErrors = {};

        // Validation
        if (!startDate || !endDate) {
            newErrors.date = 'Vui lòng chọn đầy đủ ngày.';
        } else if (start > end) {
            newErrors.date = 'Ngày bắt đầu không thể sau ngày kết thúc.';
        }
        if (isNaN(minQty) || minQty < 1) {
            newErrors.minQuantity = 'Số lượng tối thiểu phải là số nguyên dương.';
        }
        
        if (Object.keys(newErrors).length > 0) {
            setErrors(newErrors);
            setMessage({ type: 'error', text: 'Vui lòng kiểm tra lại dữ liệu thống kê.' });
            return;
        }

        // Thực hiện thống kê
        const aggregatedResults = aggregateSales(startDate, endDate, minQty, salesData, allBooks);
        setResults(aggregatedResults);
        setMessage({ type: 'success', text: `Thống kê hoàn tất. Tìm thấy ${aggregatedResults.length} đầu sách.` });
    };

    return (
        <div id="stats-modal" className="modal" style={{ display: 'block' }}>
            <div className="modal-content">
                <span className="close-btn stats-close-btn" onClick={onClose}>&times;</span>
                <h1 id="stats-modal-title">📊 Thống Kê Sách Bán Ra</h1>
                
                <form id="stats-form" onSubmit={handleSubmit}>
                    
                    <div className="price-group">
                        <div className="form-group price-field">
                            <label htmlFor="startDate">Thời gian Bắt đầu:</label>
                            <input type="date" id="startDate" name="startDate" value={formData.startDate} onChange={handleChange} required className={errors.date ? 'input-error' : ''} />
                            <div className="error-message" id="start-date-error">{errors.date}</div>
                        </div>
                        
                        <div className="form-group price-field">
                            <label htmlFor="endDate">Thời gian Kết thúc:</label>
                            <input type="date" id="endDate" name="endDate" value={formData.endDate} onChange={handleChange} required className={errors.date ? 'input-error' : ''} />
                            {/* <div className="error-message" id="end-date-error"></div> */}
                        </div>
                    </div>

                    <div className="form-group">
                        <label htmlFor="minQuantity">Số lượng bán Tối thiểu:</label>
                        <input type="number" id="minQuantity" name="minQuantity" value={formData.minQuantity} onChange={handleChange} min="1" required className={errors.minQuantity ? 'input-error' : ''}/>
                        <div className="error-message" id="min-quantity-error">{errors.minQuantity}</div>
                    </div>

                    <button type="submit" className="search-button">Xem Thống Kê</button>
                    {message.text && <div className={`form-message ${message.type}`} style={{ display: 'block' }}>{message.text}</div>}
                </form>

                {/* Khu vực hiển thị kết quả */}
                {results && (
                    <div id="stats-results-area" style={{ marginTop: '30px', display: 'block' }}>
                        <h3>Kết Quả Thống Kê</h3>
                        <table id="stats-results-table">
                            <thead>
                                <tr>
                                    <th>Mã Sách</th>
                                    <th>Tên Sách</th>
                                    <th>Số Lượng Bán</th>
                                    <th>Tổng Doanh Thu</th>
                                </tr>
                            </thead>
                            <tbody id="stats-table-body">
                                {results.length === 0 ? (
                                    <tr><td colSpan="4" style={{ textAlign: 'center', color: '#777' }}>Không có sách nào thỏa mãn tiêu chí thống kê.</td></tr>
                                ) : (
                                    results.map((item, index) => (
                                        <tr key={index}>
                                            <td>{item.code}</td>
                                            <td>{item.title}</td>
                                            <td className="stats-quantity">{item.quantity.toLocaleString('vi-VN')}</td>
                                            <td className="stats-revenue">{item.revenue.toLocaleString('vi-VN')} VNĐ</td>
                                        </tr>
                                    ))
                                )}
                            </tbody>
                        </table>
                    </div>
                )}

            </div>
        </div>
    );
};

export default StatsModal;