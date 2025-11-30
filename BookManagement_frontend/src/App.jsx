// src/App.js

import React, { useState } from 'react';
import AdminBookList from './components/AdminBookList.jsx';
import GuestBookList from './components/GuestBookList.jsx';
import './styles/BookManagementStyle.css';

const App = () => {
    // Giả lập trạng thái người dùng/định tuyến
    const [isAdmin, setIsAdmin] = useState(true); 

    return (
        <div>
            <div style={{ textAlign: 'center', margin: '20px 0', borderBottom: '1px solid #ccc' }}>
                <button onClick={() => setIsAdmin(true)} style={{ margin: '5px', padding: '10px', background: isAdmin ? '#004792' : 'gray', color: 'white' }}>
                    Chế độ Admin
                </button>
                <button onClick={() => setIsAdmin(false)} style={{ margin: '5px', padding: '10px', background: !isAdmin ? '#004792' : 'gray', color: 'white' }}>
                    Chế độ Khách
                </button>
            </div>

            {isAdmin ? <AdminBookList /> : <GuestBookList />}
        </div>
    );
};

export default App;