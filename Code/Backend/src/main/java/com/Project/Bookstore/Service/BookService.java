package com.Project.Bookstore.Service;

import com.Project.Bookstore.Model.Book;
import com.Project.Bookstore.Model.BookCategory;
import com.Project.Bookstore.Model.BookCategoryId;
import com.Project.Bookstore.Model.BookStatistic;
import com.Project.Bookstore.Repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.Year;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class BookService {

    private final BookRepository bookRepository;

    @Autowired
    public BookService(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    public List<Book> getAllBook() {
        return this.bookRepository.findAll();
    }
    public Book getBookById(String id) {
        return bookRepository.findById(id).orElse(null);
    }

//    public Book saveBook(Book book) {
//        if (book.getId() == null || book.getId().isEmpty()) {
//            book.setId(UUID.randomUUID().toString());
//        }
//        return bookRepository.save(book);
//    }
    public Book updateBook(Book book) {
        if(!bookRepository.existsById(book.getId())){
            throw new RuntimeException("No Book Found");
        }
        return this.saveBook(book);
    }
    public Book addBook(Book book) {
        if(bookRepository.existsById(book.getId())){
            throw new RuntimeException("Book Already Exists");
        }
        return this.saveBook(book);
    }
    public Book saveBook(Book book) {
        if (book.getPrice() == null || book.getPrice() <= 0) {
            throw new IllegalArgumentException("Price must be greater than 0");
        }

        if (book.getQuantity() == null || book.getQuantity() < 0) {
            throw new IllegalArgumentException("Quantity must be greater than or equal to 0");
        }

        if (book.getNumPage() == null || book.getNumPage() <= 0) {
            throw new IllegalArgumentException("NumPage must be greater than 0");
        }

        int currentYear = Year.now().getValue();
        if (book.getPublicationYear() == null ||
                book.getPublicationYear() <= 0 ||
                book.getPublicationYear() > currentYear) {
            throw new IllegalArgumentException("Year must be between 1 and" + currentYear);
        }
        if (book.getCategories() != null) {
            for (BookCategory bc : book.getCategories()) {
                bc.setBook(book);
                bc.setId(new BookCategoryId(bc.getCategory().getId(), book.getId()));
            }
        }
        return bookRepository.save(book);
    }


    public void deleteBook(String id) {
        if(!bookRepository.existsById(id)){
            throw new RuntimeException("Book Not Found");
        }
        bookRepository.deleteById(id);
    }
    public List<Book> searchBook(String tuKhoa, Integer giaMin, Integer giaMax, String tenTheLoai, String sapXep) {
        List<String> bookIds = bookRepository.findBookId(tuKhoa, giaMin, giaMax, tenTheLoai, sapXep);
        if (bookIds.isEmpty()) {
            return new ArrayList<>();
        }
        List<Book> books = new ArrayList<>();
        for (String id : bookIds) {
            String bookid = id.split(",")[0];
            books.add(bookRepository.findById(bookid).orElse(null));
        }
        return books;
    }
    public List<BookStatistic> getBestSellingBooks(LocalDate fromDate, LocalDate toDate, Integer minQuantity) {
        return bookRepository.getBestSellingBooks(fromDate, toDate, minQuantity);
    }
}
