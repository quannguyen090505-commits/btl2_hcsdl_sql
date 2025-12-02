
````markdown
# 📚 Web Bán Sách (Book Store App)

Dự án website thương mại điện tử bán sách full-stack, được xây dựng với mục tiêu cung cấp trải nghiệm mua sắm nhanh chóng và quản lý sách hiệu quả.

## 🛠 Công nghệ sử dụng

* **Backend:** Java, Spring Boot (Spring Data JPA, Spring Security).
* **Frontend:** ReactJS (Axios, React Router).
* **Database:** MySQL.

---

## 🚀 Hướng dẫn cài đặt & Chạy ứng dụng

### 1. Yêu cầu hệ thống (Prerequisites)
* Java Development Kit (JDK) 17 trở lên.
* Node.js & npm.
* MySQL Server.

### 2. Cấu hình Database
1.  Mở MySQL và tạo một database mới (ví dụ: `bookstore_db`).
2.  Mở file `src/main/resources/application.properties` trong thư mục Backend và cập nhật thông tin:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/bookstore_db
spring.datasource.username=root
spring.datasource.password=your_password
spring.jpa.hibernate.ddl-auto=update
````

### 3\. Chạy Backend (Spring Boot)


```bash
# Cài đặt dependencies
./mvn clean install

# Chạy ứng dụng
./mvn spring-boot:run
```

*Backend sẽ chạy tại: `http://localhost:8080`*

### 4\. Chạy Frontend (ReactJS)


```bash
# Cài đặt node modules
npm install

# Chạy ứng dụng
npm run dev

```

*Frontend sẽ chạy tại: `http://localhost:5173`*

-----
