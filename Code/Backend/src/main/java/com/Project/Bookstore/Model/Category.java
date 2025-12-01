package com.Project.Bookstore.Model;


import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "theloai")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Category {
    @Id
    //@GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "MaTheLoai")
    private String id;
    @Column(name = "TenPhanLoai")
    private String name;
    @Column(name = "ThongTinMoTa")
    private String description;

//    @OneToMany(mappedBy = "category")
//    @JsonIgnore
//    private List<BookCategory> books = new ArrayList<>();
}
