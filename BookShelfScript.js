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

const searchModal = document.getElementById('search-modal');


function renderBooks() {
    const tbody = document.getElementById('book-table-body');
    tbody.innerHTML = ''; 
    const isGuestView = true; 

    books.forEach(book => {
        const row = tbody.insertRow();
        const coverHtml = book.cover 
            ? `<img src="${book.cover}" alt="${book.title} cover">` 
            : `<div class="no-cover-placeholder">🖼️</div>`;

        row.innerHTML = `
            <td class="book-cover-cell">${coverHtml}</td>
            <td class="book-title-cell">${book.title}</td>
            <td class="book-language-cell">${book.language || 'N/A'}</td>
            <td class="book-pages-cell">${book.pages || 'N/A'}</td> 
            <td class="price-cell">${book.price.toLocaleString('vi-VN')} VNĐ</td>
            <td class="stock-cell">${book.stock}</td>
            <td>${book.publisher || 'N/A'}</td>
            <td>${book.pubYear || 'N/A'}</td> <td>${book.author || 'N/A'}</td>
        `;
    });
    
    const actionHeader = document.getElementById('book-results-table').querySelector('th.action-cell');
    if (actionHeader) actionHeader.style.display = 'none';
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

    if (minPriceInput.value.trim() !== '' && (isNaN(minPrice) || minPrice < 0)) {
        isValid = setError(minPriceInput, 'min-price-error', 'Giá tối thiểu phải là số dương lớn hơn hoặc bằng 0.') && isValid;
    }
    if (maxPriceInput.value.trim() !== '' && (isNaN(maxPrice) || maxPrice < 0)) {
        isValid = setError(minPriceInput, 'min-price-error', 'Giá tối đa phải là số dương lớn hơn hoặc bằng 0.') && isValid;
    }
    
    if (isValid && !isNaN(minPrice) && !isNaN(maxPrice) && minPriceInput.value.trim() !== '' && maxPriceInput.value.trim() !== '' && minPrice > maxPrice) {
        setError(minPriceInput, 'min-price-error', 'Giá tối thiểu không thể lớn hơn giá tối đa.');
        setError(maxPriceInput, 'max-price-error', 'Giá tối đa phải lớn hơn giá tối thiểu.');
        isValid = false;
    }

    formMessage.style.display = 'block';
    if (isValid) {
        formMessage.className = 'form-message success';
        formMessage.textContent = 'Dữ liệu đã hợp lệ. Đang thực hiện tìm kiếm...';
        
        setTimeout(() => searchModal.style.display = 'none', 1500);
        renderBooks(); 
    } else {
        formMessage.className = 'form-message error';
        formMessage.textContent = 'Vui lòng kiểm tra lại các trường bị lỗi.';
    }
});



document.addEventListener('DOMContentLoaded', () => {
    renderBooks(); 

    document.getElementById('btn-show-search').onclick = () => {
        if (searchModal) {
            searchModal.style.display = 'block';
        }
    };
    
    document.querySelectorAll('.modal .close-btn').forEach(btn => {
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