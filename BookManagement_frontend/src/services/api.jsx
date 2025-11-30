// src/services/api.js

const API_BASE_URL = 'http://localhost:8080/api/books'; // Endpoint BE giả định

// Dữ liệu mẫu (sẽ được thay thế bằng dữ liệu từ BE)
const initialBooks =  [
  { "code": "001", "title": "Giai Tich 1", "language": "Tieng Viet", "author": "Nguyen Hung Cuong", "publisher": "Nxb.DHQG TP.HCM", "pages": 113, "pubYear": 2021, "price": 75000, "stock": 30, "branchCode": "001", "id": 1, "cover": "https://via.placeholder.com/60x80?text=001" },
  { "code": "002", "title": "Giai tich 2", "language": "Tieng Viet", "author": "Le Bao Dien", "publisher": "Nxb.DHQG TP.HCM", "pages": 250, "pubYear": 2021, "price": 80000, "stock": 36, "branchCode": "001", "id": 2, "cover": "https://via.placeholder.com/60x80?text=002" },
  { "code": "003", "title": "Dai so tuyen tinh", "language": "Tieng Viet", "author": "Nguyen Chi Anh", "publisher": "Nxb.DHQG TP.HCM", "pages": 250, "pubYear": 2022, "price": 65000, "stock": 50, "branchCode": "002", "id": 3, "cover": "https://via.placeholder.com/60x80?text=003" },
  { "code": "004", "title": "Co so du lieu", "language": "Tieng Viet", "author": "Le Dinh tu", "publisher": "Nxb.DHQG TP.HCM", "pages": 700, "pubYear": 2025, "price": 175000, "stock": 10, "branchCode": "002", "id": 4, "cover": "https://via.placeholder.com/60x80?text=004" },
  { "code": "005", "title": "Discrete mathematic", "language": "Tieng Anh", "author": "", "publisher": "Mc Graw Hill Education", "pages": 2500, "pubYear": 2019, "price": 300000, "stock": 5, "branchCode": "005", "id": 11, "cover": "https://via.placeholder.com/60x80?text=005" },
  { "code": "006", "title": "He Thong So", "language": "Tieng Viet", "author": "Nguyen cao Thang", "publisher": "Nxb.DHQG TP.HCM", "pages": 300, "pubYear": 2020, "price": 65000, "stock": 20, "branchCode": "003", "id": 5, "cover": "https://via.placeholder.com/60x80?text=006" },
  { "code": "007", "title": "Cau truc du lieu va Giai thuat", "language": "tieng Viet", "author": "Nguyen Tuan Anh", "publisher": "Nxb.DHQG TP.HCM", "pages": 600, "pubYear": 2022, "price": 70000, "stock": 20, "branchCode": "002", "id": 6, "cover": "https://via.placeholder.com/60x80?text=007" },
  { "code": "008", "title": "Lich su Dang", "language": "Tieng Viet", "author": "Phan Manh Tuan", "publisher": "Nxb.DHQG TP.HCM", "pages": 1000, "pubYear": 2021, "price": 50000, "stock": 30, "branchCode": "002", "id": 7, "cover": "https://via.placeholder.com/60x80?text=008" },
  { "code": "009", "title": "Chu Nghi Xa Hoi Khoa Hoc", "language": "Tieng Viet", "author": "Nguyen Thi Dinh", "publisher": "Nxb.DHQG TP.HCM", "pages": 1112, "pubYear": 2021, "price": 50000, "stock": 27, "branchCode": "004", "id": 8, "cover": "https://via.placeholder.com/60x80?text=009" },
  { "code": "010", "title": "Tu Tuong Ho Chi Minh", "language": "Tieng Viet", "author": "Le Trong Tien", "publisher": "Nxb.DHQG TP.HCM", "pages": 1500, "pubYear": 2021, "price": 55000, "stock": 35, "branchCode": "004", "id": 9, "cover": "https://via.placeholder.com/60x80?text=010" },
  { "code": "011", "title": "Giao Duc Quoc Phong & An ni", "language": "tieng viet", "author": "nguyen tuan quang", "publisher": "Nxb.DHQG TP.HCM", "pages": 350, "pubYear": 2019, "price": 50000, "stock": 25, "branchCode": "001", "id": 10, "cover": "https://via.placeholder.com/60x80?text=011" },
];

// Dữ liệu mẫu bán hàng cho thống kê (giữ nguyên)
export const salesData = [
    { date: '2025-11-01', bookCode: '001', quantity: 10 },
    { date: '2025-11-05', bookCode: '004', quantity: 8 },  
    { date: '2025-11-10', bookCode: '003', quantity: 15 },
    { date: '2025-11-15', bookCode: '001', quantity: 5 },  
    { date: '2025-11-28', bookCode: '011', quantity: 1 }, 
    { date: '2025-10-30', bookCode: '003', quantity: 5 }, 
    { date: '2025-11-20', bookCode: '999', quantity: 100 }, 
];




/**
 * GET: Lấy danh sách sách (bao gồm logic tìm kiếm/lọc)
 * @param {object} params - Các tham số tìm kiếm (keyword, minPrice, category...)
 */
export async function fetchBooks(params = {}) {
    // Chuyển đổi params thành chuỗi query string: ?keyword=abc&minPrice=100
    const query = new URLSearchParams(params).toString();
    const url = `${API_BASE_URL}?${query}`;

    console.log('API CALL: FETCH books with URL:', url);
    
    // GIẢ LẬP GỌI API (Thực tế sẽ dùng fetch(url))
    // return (await fetch(url)).json(); 

    // Hiện tại: Trả về dữ liệu mẫu tĩnh
    await new Promise(resolve => setTimeout(resolve, 500)); 
    return initialBooks.filter(book => 
        (params.keyword ? book.title.toLowerCase().includes(params.keyword.toLowerCase()) : true)
    );
}

/**
 * POST: Thêm sách mới
 * @param {object} bookData - Dữ liệu sách mới
 */
export async function createBook(bookData) {
    console.log('API CALL: CREATE book:', bookData);
    
    // GIẢ LẬP FETCH POST
    /*
    const response = await fetch(API_BASE_URL, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(bookData)
    });
    return response.json();
    */

    // Hiện tại: Thêm vào mảng mẫu (chỉ dùng cho FE)
    const newBook = { ...bookData, id: Date.now() };
    initialBooks.push(newBook);
    return newBook;
}

/**
 * PUT: Cập nhật sách hiện có
 * @param {number} id - ID sách
 * @param {object} bookData - Dữ liệu cập nhật
 */
export async function updateBook(id, bookData) {
    console.log(`API CALL: UPDATE book ID ${id}:`, bookData);

    // GIẢ LẬP FETCH PUT
    /*
    const response = await fetch(`${API_BASE_URL}/${id}`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(bookData)
    });
    return response.json();
    */

    // Hiện tại: Cập nhật trong mảng mẫu
    const index = initialBooks.findIndex(b => b.id === id);
    if (index !== -1) {
        initialBooks[index] = { ...initialBooks[index], ...bookData };
        return initialBooks[index];
    }
    throw new Error('Book not found for update');
}

/**
 * DELETE: Xóa sách
 * @param {number} id - ID sách cần xóa
 */
export async function deleteBookApi(id) {
    console.log(`API CALL: DELETE book ID ${id}`);

    // GIẢ LẬP FETCH DELETE
    /*
    const response = await fetch(`${API_BASE_URL}/${id}`, {
        method: 'DELETE',
    });
    return response.status === 204; // Trả về true nếu thành công
    */

    // Hiện tại: Xóa khỏi mảng mẫu
    const initialLength = initialBooks.length;
    const newLength = initialBooks.filter(book => book.id !== id).length;
    return newLength < initialLength;
}