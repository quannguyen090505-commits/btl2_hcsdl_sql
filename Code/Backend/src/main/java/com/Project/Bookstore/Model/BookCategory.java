package com.Project.Bookstore.Model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "thuoctheloai")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class BookCategory {
    @EmbeddedId
    private BookCategoryId id = new BookCategoryId();

    @ManyToOne
    @MapsId("bookId")
    @JoinColumn(name = "MaSach")
    @JsonIgnore
    private Book book;

    @ManyToOne
    @MapsId("categoryId")
    @JoinColumn(name = "MaTheLoai")
    private Category category;
}
