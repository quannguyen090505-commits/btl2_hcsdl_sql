// src/services/api.jsx

const API_BASE_URL = 'http://localhost:8080';

// Helper function to handle API responses
const handleResponse = async (response) => {
  if (!response.ok) {
    const error = await response.text();
    throw new Error(error || `HTTP error! status: ${response.status}`);
  }
  return response.json();
};

/**
 * GET: Lấy danh sách tất cả sách
 */
export async function fetchBooks() {
  try {
    const response = await fetch(`${API_BASE_URL}/book`);
    return await handleResponse(response);
  } catch (error) {
    console.error('Error fetching books:', error);
    throw error;
  }
}

/**
 * GET: Tìm kiếm sách với các tham số
 * @param {object} params - Các tham số tìm kiếm
 */
// In src/services/api.jsx, update the searchBooks function:
// In src/services/api.jsx, replace the searchBooks function with this:
export async function searchBooks(params = {}) {
    try {
      // Build query string
      const queryParams = new URLSearchParams();
      
      // Add parameters if they exist
      if (params.keyword) queryParams.append('keyword', params.keyword);
      if (params.minPrice) queryParams.append('minPrice', params.minPrice);
      if (params.maxPrice) queryParams.append('maxPrice', params.maxPrice);
      if (params.genre) queryParams.append('genre', params.genre);
      if (params.sort) queryParams.append('sort', params.sort);
      
      const queryString = queryParams.toString();
      const url = queryString 
        ? `${API_BASE_URL}/book/search?${queryString}`
        : `${API_BASE_URL}/book/search`;
      
      console.log('🔍 Search API call:', url);
      
      const response = await fetch(url);
      
      if (!response.ok) {
        const errorText = await response.text();
        console.error('❌ Search API error:', errorText);
        throw new Error(`Search failed: ${response.status} ${errorText}`);
      }
      
      const data = await response.json();
      console.log('✅ Search results count:', data.length);
      return data;
      
    } catch (error) {
      console.error('❌ Error in searchBooks:', error);
      throw error;
    }
  }

/**
 * GET: Lấy sách theo ID
 */
export async function getBookById(id) {
  try {
    const response = await fetch(`${API_BASE_URL}/book/${id}`);
    return await handleResponse(response);
  } catch (error) {
    console.error(`Error fetching book ${id}:`, error);
    throw error;
  }
}

/**
 * POST: Thêm sách mới
 * @param {object} bookData - Dữ liệu sách mới
 */
export async function createBook(bookData) {
  try {
    // Transform frontend data structure to backend structure
    const backendBookData = {
      id: bookData.code || bookData.id,
      title: bookData.title,
      language: bookData.language || 'Tiếng Việt',
      translator: bookData.translator || null,
      publisher: bookData.publisher,
      publicationYear: parseInt(bookData.publicationYear) || 2024,
      price: parseInt(bookData.price),
      quantity: parseInt(bookData.quantity),
      numPage: parseInt(bookData.numPage) || 200,
      branchId: bookData.branchCode || "001",
      categories: bookData.categories || []
    };
    
    console.log('Creating book:', backendBookData);
    
    const response = await fetch(`${API_BASE_URL}/book`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(backendBookData)
    });
    
    return await handleResponse(response);
  } catch (error) {
    console.error('Error creating book:', error);
    throw error;
  }
}

/**
 * PUT: Cập nhật sách
 */
export async function updateBook(id, bookData) {
  try {
    // Transform frontend data structure to backend structure
    const backendBookData = {
      id: bookData.code || id,
      title: bookData.title,
      language: bookData.language || 'Tiếng Việt',
      translator: bookData.translator || null,
      publisher: bookData.publisher,
      publicationYear: parseInt(bookData.publicationYear) || 2024,
      price: parseInt(bookData.price),
      quantity: parseInt(bookData.quantity),
      numPage: parseInt(bookData.numPage) || 200,
      branchId: bookData.branchCode || "001",
      categories: bookData.categories || []
    };
    
    console.log(`Updating book ${id}:`, backendBookData);
    
    const response = await fetch(`${API_BASE_URL}/book`, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(backendBookData)
    });
    
    return await handleResponse(response);
  } catch (error) {
    console.error(`Error updating book ${id}:`, error);
    throw error;
  }
}

/**
 * DELETE: Xóa sách
 */
export async function deleteBookApi(id) {
  try {
    const response = await fetch(`${API_BASE_URL}/book/${id}`, {
      method: 'DELETE',
    });
    
    if (response.ok) {
      return true;
    } else {
      const error = await response.text();
      throw new Error(error);
    }
  } catch (error) {
    console.error(`Error deleting book ${id}:`, error);
    throw error;
  }
}

/**
 * GET: Lấy danh sách thể loại
 */
export async function fetchCategories() {
  try {
    const response = await fetch(`${API_BASE_URL}/category`);
    return await handleResponse(response);
  } catch (error) {
    console.error('Error fetching categories:', error);
    throw error;
  }
}

/**
 * GET: Thống kê sách bán ra
 * @param {object} params - Tham số thống kê
 */
export async function getBookStatistics(params) {
  try {
    const queryParams = new URLSearchParams();
    queryParams.append('fromDate', params.fromDate);
    queryParams.append('toDate', params.toDate);
    queryParams.append('minQuantity', params.minQuantity || 0);
    
    const url = `${API_BASE_URL}/book/statistic?${queryParams.toString()}`;
    console.log('Getting statistics with URL:', url);
    
    const response = await fetch(url);
    return await handleResponse(response);
  } catch (error) {
    console.error('Error getting statistics:', error);
    throw error;
  }
}

// Dữ liệu mẫu cho thống kê (tạm thời)
export const salesData = [
  { date: '2025-11-01', bookCode: '001', quantity: 10 },
  { date: '2025-11-05', bookCode: '004', quantity: 8 },  
  { date: '2025-11-10', bookCode: '003', quantity: 15 },
  { date: '2025-11-15', bookCode: '001', quantity: 5 },  
  { date: '2025-11-28', bookCode: '011', quantity: 1 }, 
  { date: '2025-10-30', bookCode: '003', quantity: 5 }, 
  { date: '2025-11-20', bookCode: '999', quantity: 100 }, 
];