let books = [
  { "code": "001", "title": "Giai Tich 1", "language": "Tieng Viet", "author": "Nguyen Hung Cuong", "publisher": "Nxb.DHQG TP.HCM", "pages": 113, "pubYear": 2021, "price": 75000, "stock": 30, "branchCode": "001", "id": 1, "cover": "https://via.placeholder.com/60x80?text=001" },
  { "code": "002", "title": "Giai tich 2", "language": "Tieng Viet", "author": "Le Bao Dien", "publisher": "Nxb.DHQG TP.HCM", "pages": 250, "pubYear": 2021, "price": 80000, "stock": 36, "branchCode": "001", "id": 2, "cover": "https://via.placeholder.com/60x80?text=002" },
  { "code": "003", "title": "Dai so tuyen tinh", "language": "Tieng Viet", "author": "Nguyen Chi Anh", "publisher": "Nxb.DHQG TP.HCM", "pages": 250, "pubYear": 2022, "price": 65000, "stock": 50, "branchCode": "002", "id": 3, "cover": "https://via.placeholder.com/60x80?text=003" },
  { "code": "004", "title": "Co so du lieu", "language": "Tieng Viet", "author": "Le Dinh tu", "publisher": "Nxb.DHQG TP.HCM", "pages": 700, "pubYear": 2025, "price": 175000, "stock": 10, "branchCode": "002", "id": 4, "cover": "https://via.placeholder.com/60x80?text=004" },
  { "code": "006", "title": "He Thong So", "language": "Tieng Viet", "author": "Nguyen cao Thang", "publisher": "Nxb.DHQG TP.HCM", "pages": 300, "pubYear": 2020, "price": 65000, "stock": 20, "branchCode": "003", "id": 5, "cover": "https://via.placeholder.com/60x80?text=006" },
  { "code": "007", "title": "Cau truc du lieu va Giai thuat", "language": "tieng Viet", "author": "Nguyen Tuan Anh", "publisher": "Nxb.DHQG TP.HCM", "pages": 600, "pubYear": 2022, "price": 70000, "stock": 20, "branchCode": "002", "id": 6, "cover": "https://via.placeholder.com/60x80?text=007" },
  { "code": "008", "title": "Lich su Dang", "language": "Tieng Viet", "author": "Phan Manh Tuan", "publisher": "Nxb.DHQG TP.HCM", "pages": 1000, "pubYear": 2021, "price": 50000, "stock": 30, "branchCode": "002", "id": 7, "cover": "https://via.placeholder.com/60x80?text=008" },
  { "code": "009", "title": "Chu Nghi Xa Hoi Khoa Hoc", "language": "Tieng Viet", "author": "Nguyen Thi Dinh", "publisher": "Nxb.DHQG TP.HCM", "pages": 1112, "pubYear": 2021, "price": 50000, "stock": 27, "branchCode": "004", "id": 8, "cover": "https://via.placeholder.com/60x80?text=009" },
  { "code": "010", "title": "Tu Tuong Ho Chi Minh", "language": "Tieng Viet", "author": "Le Trong Tien", "publisher": "Nxb.DHQG TP.HCM", "pages": 1500, "pubYear": 2021, "price": 55000, "stock": 35, "branchCode": "004", "id": 9, "cover": "https://via.placeholder.com/60x80?text=010" },
  { "code": "011", "title": "Giao Duc Quoc Phong & An ni", "language": "tieng viet", "author": "nguyen tuan quang", "publisher": "Nxb.DHQG TP.HCM", "pages": 350, "pubYear": 2019, "price": 50000, "stock": 25, "branchCode": "001", "id": 10, "cover": "https://via.placeholder.com/60x80?text=011" },
  { "code": "005", "title": "Discrete mathematic", "language": "Tieng Anh", "author": "", "publisher": "Mc Graw Hill Education", "pages": 2500, "pubYear": 2019, "price": 300000, "stock": 5, "branchCode": "005", "id": 11, "cover": "https://via.placeholder.com/60x80?text=005" }
];
let nextBookId = 12; 


const salesData = [
    { date: '2025-11-01', bookCode: '001', quantity: 10 },
    { date: '2025-11-05', bookCode: '004', quantity: 8 },  
    { date: '2025-11-10', bookCode: '003', quantity: 15 },
    { date: '2025-11-15', bookCode: '001', quantity: 5 },  
    { date: '2025-11-28', bookCode: '011', quantity: 1 }, 
    { date: '2025-10-30', bookCode: '003', quantity: 5 }, 
    { date: '2025-11-20', bookCode: '999', quantity: 100 }, 
];


const searchModal = document.getElementById('search-modal');
const crudModal = document.getElementById('crud-modal');
const statsModal = document.getElementById('stats-modal');

/**
 * @param {boolean} isGuestView 
 */
function renderBooks(isGuestView = false) {
    const tbody = document.getElementById('book-table-body');
    tbody.innerHTML = ''; 

    books.forEach(book => {
        const row = tbody.insertRow();
        const coverHtml = book.cover 
            ? `<img src="${book.cover}" alt="${book.title} cover">` 
            : `<div class="no-cover-placeholder">🖼️</div>`;

        let rowContent = `
            <td class="book-code-cell">${book.code || 'N/A'}</td> 
            <td class="book-cover-cell">${coverHtml}</td>
            <td class="book-title-cell">${book.title}</td>
            <td class="book-language-cell">${book.language || 'N/A'}</td>
            <td class="book-pages-cell">${book.pages || 'N/A'}</td> 
            <td class="price-cell">${book.price.toLocaleString('vi-VN')} VNĐ</td>
            <td class="stock-cell">${book.stock}</td>
            <td>${book.publisher || 'N/A'}</td>
            <td>${book.pubYear || 'N/A'}</td> 
            <td>${book.author || book.translator || 'N/A'}</td>
            <td class="book-branch-cell">${book.branchCode || 'N/A'}</td> 
        `;

        if (!isGuestView) {
            rowContent += `
                <td class="action-cell">
                    <button class="action-button btn-edit btn" onclick="editBook(${book.id})">Sửa</button>
                    <button class="action-button btn-delete btn" onclick="deleteBook(${book.id})">Xóa</button>
                </td>
            `;
        }
        
        row.innerHTML = rowContent;
    });

    const actionHeader = document.getElementById('book-results-table').querySelector('th.action-cell');
    if (actionHeader) {
        actionHeader.style.display = isGuestView ? 'none' : 'table-cell';
    }
}


function setError(inputElement, errorElementId, message) {
    document.getElementById(errorElementId).textContent = message;
    inputElement.classList.add('input-error');
    return false;
}

function clearError(inputElement, errorElementId) {
    const errorElement = document.getElementById(errorElementId);
    if (errorElement) errorElement.textContent = '';
    inputElement.classList.remove('input-error');
}


document.getElementById('search-form').addEventListener('submit', function(event) {
    event.preventDefault();
    
    const minPriceInput = document.getElementById('min-price');
    const maxPriceInput = document.getElementById('max-price');
    const formMessage = document.getElementById('form-message');


    let isValid = true; 
    const minPrice = parseFloat(minPriceInput.value);
    const maxPrice = parseFloat(maxPriceInput.value);
    
    clearError(minPriceInput, 'min-price-error');
    clearError(maxPriceInput, 'max-price-error');

    if ((isNaN(minPrice) || minPrice < 0)) {
        isValid = setError(minPriceInput, 'min-price-error', 'Giá tối thiểu phải là số dương lớn hơn hoặc bằng 0.') && isValid;
    }
    
    if ((isNaN(maxPrice) || maxPrice < 0)) {
        isValid = setError(maxPriceInput, 'max-price-error', 'Giá tối đa phải là số dương lớn hơn hoặc bằng 0.') && isValid; 
    }
    
    if (minPrice > maxPrice) {       
        setError(minPriceInput, 'min-price-error', 'Giá tối thiểu không thể lớn hơn giá tối đa.');
        setError(maxPriceInput, 'max-price-error', 'Giá tối đa phải lớn hơn giá tối thiểu.');
        isValid = isValid && false;
    }
       

    formMessage.style.display = 'block';
    if (isValid) {
        formMessage.className = 'form-message success';
        formMessage.textContent = 'Dữ liệu đã hợp lệ. Đang thực hiện tìm kiếm...';
        
        setTimeout(() => searchModal.style.display = 'none', 1500);
        
        const isGuestView = document.body.classList.contains('guest-view');
        renderBooks(isGuestView); 
    } else {
        formMessage.className = 'form-message error';
        formMessage.textContent = 'Vui lòng kiểm tra lại các trường bị lỗi.';
    }
});


const statsForm = document.getElementById('stats-form');
const statsResultsArea = document.getElementById('stats-results-area');

/**
* @param {string} start 
* @param {string} end 
* @param {number} minQty 
* @returns {Array<Object>} 
*/
function aggregateSales(start, end, minQty) {
    const aggregated = {};
    
    const startDate = new Date(start);
    const endDate = new Date(end);
    endDate.setHours(23, 59, 59, 999); 

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
        const bookInfo = books.find(b => b.code === code);
        
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
}

function displayStatsResults(results) {
    const tbody = document.getElementById('stats-table-body');
    tbody.innerHTML = ''; 

    if (results.length === 0) {
        tbody.innerHTML = '<tr><td colspan="4" style="text-align: center; color: #777;">Không có sách nào thỏa mãn tiêu chí thống kê.</td></tr>';
    } else {
        results.forEach(item => {
            const row = tbody.insertRow();
            row.innerHTML = `
                <td>${item.code}</td>
                <td>${item.title}</td>
                <td class="stats-quantity">${item.quantity.toLocaleString('vi-VN')}</td>
                <td class="stats-revenue">${item.revenue.toLocaleString('vi-VN')} VNĐ</td>
            `;
        });
    }

    statsResultsArea.style.display = 'block';
}

statsForm.addEventListener('submit', function(event) {
    event.preventDefault();
    
    const startDateInput = document.getElementById('start-date');
    const endDateInput = document.getElementById('end-date');
    const minQuantityInput = document.getElementById('min-quantity');
    const statsFormMessage = document.getElementById('stats-form-message');

    let isValid = true;
    
    clearError(startDateInput, 'start-date-error');
    clearError(endDateInput, 'end-date-error');
    clearError(minQuantityInput, 'min-quantity-error');
    statsFormMessage.style.display = 'none';

    const startDate = new Date(startDateInput.value);
    const endDate = new Date(endDateInput.value);
    const minQuantity = parseInt(minQuantityInput.value);

    if (startDateInput.value === '' || endDateInput.value === '') {
        isValid = setError(startDateInput, 'start-date-error', 'Vui lòng chọn đầy đủ ngày bắt đầu và kết thúc.');
    } else if (startDate > endDate) {
        isValid = setError(startDateInput, 'start-date-error', 'Ngày bắt đầu không thể sau ngày kết thúc.');
    }
    
    if (isNaN(minQuantity) || minQuantity < 1) {
        isValid = setError(minQuantityInput, 'min-quantity-error', 'Số lượng tối thiểu phải là số nguyên dương.');
    }
    
    if (!isValid) {
        statsFormMessage.className = 'form-message error';
        statsFormMessage.textContent = 'Vui lòng kiểm tra lại dữ liệu thống kê.';
        statsFormMessage.style.display = 'block';
        statsResultsArea.style.display = 'none';
        return;
    }
    
    const results = aggregateSales(startDateInput.value, endDateInput.value, minQuantity);
    displayStatsResults(results);

    statsFormMessage.className = 'form-message success';
    statsFormMessage.textContent = `Thống kê hoàn tất. Tìm thấy ${results.length} đầu sách.`;
    statsFormMessage.style.display = 'block';
});

const crudForm = document.getElementById('crud-form');
const crudModalTitle = document.getElementById('crud-modal-title');
const crudSubmitBtn = document.getElementById('crud-submit-btn');

const crudTitle = document.getElementById('crud-title');
const crudCode = document.getElementById('crud-code');
const crudPrice = document.getElementById('crud-price');
const crudStock = document.getElementById('crud-stock');
const crudCover = document.getElementById('crud-cover');
const crudPublisher = document.getElementById('crud-publisher');
const crudLanguage = document.getElementById('crud-language');
const crudTranslator = document.getElementById('crud-translator');
const bookIdInput = document.getElementById('book-id');

const crudPages = document.getElementById('crud-pages');
const crudBranchCode = document.getElementById('crud-branch-code');
const crudPubYear = document.getElementById('crud-pub-year'); 

function setupAddForm() {
    if (!crudModal) return; 
    
    crudForm.reset();
    bookIdInput.value = '';
    crudModalTitle.textContent = 'Form Thêm Sách Mới';
    crudSubmitBtn.textContent = 'Thêm Sách';
    document.getElementById('cover-preview').innerHTML = ''; 
    crudModal.style.display = 'block';
}

function editBook(bookId) {
    if (!crudModal) return; 
    
    const book = books.find(b => b.id === bookId);
    if (!book) return;

    bookIdInput.value = book.id;
    crudTitle.value = book.title;
    crudCode.value = book.code; 
    crudPrice.value = book.price;
    crudStock.value = book.stock;
    crudCover.value = book.cover;
    crudPublisher.value = book.publisher;
    crudLanguage.value = book.language;
    crudTranslator.value = book.author || book.translator || ''; 
    
    crudPages.value = book.pages; 
    crudBranchCode.value = book.branchCode;
    crudPubYear.value = book.pubYear;
    
    crudModalTitle.textContent = `Sửa Sách: ${book.title}`;
    crudSubmitBtn.textContent = 'Cập Nhật Sách';
    
    document.getElementById('cover-preview').innerHTML = book.cover 
        ? `<img src="${book.cover}" style="width:100%; height:auto;" alt="Preview">` 
        : '';
    
    crudModal.style.display = 'block';
}

if (crudForm) { 
    crudForm.addEventListener('submit', function(event) {
        event.preventDefault();

        const bookId = bookIdInput.value;
        const isEditing = !!bookId;
        
        const bookData = {
            title: crudTitle.value,
            code: crudCode.value, 
            price: parseFloat(crudPrice.value),
            stock: parseInt(crudStock.value),
            cover: crudCover.value.trim(),
            publisher: crudPublisher.value,
            language: crudLanguage.value,
            author: crudTranslator.value, 
            
            pages: parseInt(crudPages.value),
            branchCode: crudBranchCode.value,
            pubYear: parseInt(crudPubYear.value) 
        };

        if (isEditing) {
            const index = books.findIndex(b => b.id === parseInt(bookId));
            if (index !== -1) {
                books[index] = { ...books[index], ...bookData };
                alert(`Đã cập nhật sách: ${bookData.title}`);
            }
        } else {
            const newBook = { id: nextBookId++, ...bookData };
            books.push(newBook);
            alert(`Đã thêm sách mới: ${bookData.title}`);
        }

        crudModal.style.display = 'none';
        renderBooks(); 
    });
}


function deleteBook(bookId) {
    const book = books.find(b => b.id === bookId);
    if (confirm(`Bạn có chắc chắn muốn xóa sách "${book.title}" không?`)) {
        books = books.filter(b => b.id !== bookId);
        renderBooks();
    }
}


document.addEventListener('DOMContentLoaded', () => {
    const isGuestView = document.body.classList.contains('guest-view');
    
    renderBooks(isGuestView); 

    document.getElementById('btn-show-search').onclick = () => searchModal.style.display = 'block';

    if (!isGuestView) {
        document.getElementById('btn-show-add').onclick = setupAddForm;
        
        const btnShowStats = document.getElementById('btn-show-stats');
        if (btnShowStats) {
            btnShowStats.onclick = () => {
                statsResultsArea.style.display = 'none'; 
                statsModal.style.display = 'block';
            }
        }
    }

    document.querySelectorAll('.close-btn').forEach(btn => {
        btn.onclick = function() {
            this.closest('.modal').style.display = 'none';
        }
    });

    window.onclick = function(event) {
        if (event.target.classList.contains('modal')) {
            event.target.style.display = 'none';
        }
    }
});