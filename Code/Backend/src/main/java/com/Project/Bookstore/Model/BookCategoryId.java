package com.Project.Bookstore.Model;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Objects;
@Getter
@Setter
@Embeddable
public class BookCategoryId implements Serializable {
    @Column(name = "MaTheLoai")
    private String categoryId;

    @Column(name = "MaSach")
    private String bookId;

    public BookCategoryId() {}
    public BookCategoryId(String orderId, String bookId) {
        this.categoryId = orderId;
        this.bookId = bookId;
    }
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        BookCategoryId that = (BookCategoryId) o;
        return Objects.equals(categoryId, that.categoryId) &&
                Objects.equals(bookId, that.bookId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(categoryId, bookId);
    }
}
