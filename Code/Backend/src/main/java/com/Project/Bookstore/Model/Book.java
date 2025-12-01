package com.Project.Bookstore.Model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.util.*;

@Entity
@Getter
@Setter
@Table(name = "sach")
public class Book{
    @Id
    @Column(name = "MaSach")
    //@GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    @Column(name = "TenSach")
    private String title;
    @Column(name = "NgonNgu")
    private String language;
    @Column(name = "DichGia")
    private String translator;
    @Column(name = "TenNhaXuatBan")
    private String publisher;
    @Column(name = "NamXuatBan")
    private Integer publicationYear;
    @Column(name = "Gia")
    private Integer price;
    @Column(name = "SoLuongTonKho")
    private Integer quantity;
    @Column(name = "SoTrang")
    private Integer numPage;
    @Column(name = "MaChiNhanh")
    private String BranchId;

    @OneToMany(mappedBy = "book", cascade = CascadeType.ALL,orphanRemoval = true)
    @JsonIgnoreProperties("book")
    private List<BookCategory> categories = new ArrayList<>();

}