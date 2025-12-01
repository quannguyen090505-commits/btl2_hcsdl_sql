package com.Project.Bookstore.Model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Data
@Table(name = "donhang")
@AllArgsConstructor
@NoArgsConstructor
public class Order {
    @Id
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaDonHang")
    private String id;

    @Column(name = "MaNguoiMua")
    private String customerId;

    @Column(name = "NgayTaoDon")
    private LocalDate dateCreated;
    @Column(name = "TrangThai")
    private String status;
    @Column(name = "PhuongThucThanhToan")
    private String paymentMethod;
    @Column(name = "TongGia")
    private int price;
    @Column(name = "MaGiamGia")
    private String discount;
    @Column(name = "GiaCuoiCung")
    private int finalPrice;
    //xem lai
    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL,  orphanRemoval = true)
    @JsonIgnoreProperties("order")
    private List<OrderItem> orderItemList = new ArrayList<>();
}
