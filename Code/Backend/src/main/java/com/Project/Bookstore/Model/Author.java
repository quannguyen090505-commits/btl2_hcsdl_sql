package com.Project.Bookstore.Model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "tacgia")
public class Author {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "MaTacGia")
    private String id;

    @Column(name = "ButDanh")
    private String name;

    @Column(name = "QueQuan")
    private String country;

    @Column(name = "NamSinh")
    private LocalDate dateOfBirth;

    @Column(name = "SoLuongSach")
    private int quantity;
}
