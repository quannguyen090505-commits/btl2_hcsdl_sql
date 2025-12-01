package com.Project.Bookstore.Controller;

import com.Project.Bookstore.Model.Book;
import com.Project.Bookstore.Model.BookStatistic;
import com.Project.Bookstore.Service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;
@CrossOrigin(origins = "http://localhost:5173")
@RestController
@RequestMapping("/book")
public class BookController {
    private final BookService bookService;

    @Autowired
    public BookController(BookService bookService) {
        this.bookService = bookService;
    }
    @GetMapping
    public List<Book> getAllBooks() {
        return this.bookService.getAllBook();
    }
    @PostMapping
    public ResponseEntity<?> addBook(@RequestBody Book book) {
        try{
            Book addedBook = bookService.addBook(book);
            return ResponseEntity.ok(addedBook);
        }
        catch(IllegalArgumentException e){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
        catch(RuntimeException e){
            return ResponseEntity.status(HttpStatus.CONFLICT).body(e.getMessage());
        }

    }
    @PutMapping
    public ResponseEntity<?> updateBook(@RequestBody Book book) {
        try{
            Book updatedBook = this.bookService.updateBook(book);
            return ResponseEntity.ok(updatedBook);
        }
        catch(IllegalArgumentException e){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
        catch (RuntimeException e){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        }

    }
    @GetMapping("/{id}")
    public ResponseEntity<Book> getBookById(@PathVariable String id) {
        Book book = this.bookService.getBookById(id);
        if(book == null){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }
        return ResponseEntity.ok(book);
    }
    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteBookById(@PathVariable String id) {
        try {
            this.bookService.deleteBook(id);
            return ResponseEntity.ok().build();
        }
        catch (RuntimeException e){
            return  ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        }
    }
    @GetMapping("/search")
    public List<Book> searchBooks(
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false) Integer minPrice,
            @RequestParam(required = false) Integer maxPrice,
            @RequestParam(required = false) String genre,
            @RequestParam(required = false) String sort
    )
    {
        return bookService.searchBook(keyword, minPrice, maxPrice, genre, sort);
    }
    @GetMapping("/statistic")
    public List<BookStatistic> getBookStatistic(
            @RequestParam("fromDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate fromDate,
            @RequestParam("toDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate toDate,
            @RequestParam(value = "minQuantity", defaultValue = "0") Integer minQuantity
    ) {
        return bookService.getBestSellingBooks(fromDate, toDate, minQuantity);
    }
}
