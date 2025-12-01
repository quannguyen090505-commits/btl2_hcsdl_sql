// src/components/Modals/StatsModal.jsx
import React, { useState } from 'react';
import { getBookStatistics } from '../../services/api.jsx';

const StatsModal = ({ isOpen, onClose, salesData, allBooks }) => {
    const [formData, setFormData] = useState({
        startDate: '',
        endDate: '',
        minQuantity: 0
    });
    const [results, setResults] = useState(null);
    const [message, setMessage] = useState('');
    const [errors, setErrors] = useState({});
    const [loading, setLoading] = useState(false);

    if (!isOpen) return null;

    const handleChange = (e) => {
        setFormData({ ...formData, [e.target.name]: e.target.value });
        setErrors({});
        setMessage('');
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        setResults(null); 
        setLoading(true);
        
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
        if (isNaN(minQty) || minQty < 0) {
            newErrors.minQuantity = 'Số lượng tối thiểu phải là số không âm.';
        }
        
        if (Object.keys(newErrors).length > 0) {
            setErrors(newErrors);
            setMessage({ type: 'error', text: 'Vui lòng kiểm tra lại dữ liệu thống kê.' });
            setLoading(false);
            return;
        }

        try {
            // Call real API for statistics
            const params = {
                fromDate: startDate,
                toDate: endDate,
                minQuantity: minQty
            };
            
            const statistics = await getBookStatistics(params);
            
            // Transform backend response to frontend structure
            const transformedResults = statistics.map(stat => ({
                code: stat.maSach,
                title: stat.tenSach,
                quantity: stat.tongSoLuongBan,
                revenue: stat.tongDoanhThu,
                soLanDat: stat.soLanDat
            }));
            
            setResults(transformedResults);
            setMessage({ type: 'success', text: `Thống kê hoàn tất. Tìm thấy ${transformedResults.length} đầu sách.` });
        } catch (error) {
            console.error('Error getting statistics:', error);
            setMessage({ type: 'error', text: 'Lỗi khi lấy thống kê từ server: ' + error.message });
        } finally {
            setLoading(false);
        }
    };

    return (
        <div id="stats-modal" className="modal" style={{ display: 'block' }}>
            <div className="modal-content">
                <span className="close-btn stats-close-btn" onClick={onClose}>&times;</span>
                <h1 id="stats-modal-title">📊 Thống Kê Sách Bán Ra</h1>
                
                <form id="stats-form" onSubmit={handleSubmit}>
                    
                    <div className="price-group">
                        <div className="form-group price-field">
                            <label htmlFor="startDate">Từ ngày:</label>
                            <input type="date" id="startDate" name="startDate" value={formData.startDate} onChange={handleChange} required className={errors.date ? 'input-error' : ''} />
                            <div className="error-message" id="start-date-error">{errors.date}</div>
                        </div>
                        
                        <div className="form-group price-field">
                            <label htmlFor="endDate">Đến ngày:</label>
                            <input type="date" id="endDate" name="endDate" value={formData.endDate} onChange={handleChange} required className={errors.date ? 'input-error' : ''} />
                        </div>
                    </div>

                    <div className="form-group">
                        <label htmlFor="minQuantity">Số lượng bán tối thiểu:</label>
                        <input type="number" id="minQuantity" name="minQuantity" value={formData.minQuantity} onChange={handleChange} min="0" required className={errors.minQuantity ? 'input-error' : ''}/>
                        <div className="error-message" id="min-quantity-error">{errors.minQuantity}</div>
                    </div>

                    <button type="submit" className="search-button" disabled={loading}>
                        {loading ? 'Đang xử lý...' : 'Xem Thống Kê'}
                    </button>
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
                                    <th>Số Lần Đặt</th>
                                    <th>Tổng Số Lượng Bán</th>
                                    <th>Tổng Doanh Thu</th>
                                </tr>
                            </thead>
                            <tbody id="stats-table-body">
                                {results.length === 0 ? (
                                    <tr><td colSpan="5" style={{ textAlign: 'center', color: '#777' }}>Không có sách nào thỏa mãn tiêu chí thống kê.</td></tr>
                                ) : (
                                    results.map((item, index) => (
                                        <tr key={index}>
                                            <td>{item.code}</td>
                                            <td>{item.title}</td>
                                            <td className="stats-quantity">{item.soLanDat || 0}</td>
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