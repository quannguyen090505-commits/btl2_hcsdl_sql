package com.Project.Bookstore.Model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "donhangbaogom")
public class OrderItem {
    @EmbeddedId
    private OrderItemId id;

    @ManyToOne
    @MapsId("orderId")
    @JoinColumn(name = "MaDonHang")
    private Order order;

    @ManyToOne
    @MapsId("bookId")
    @JoinColumn(name = "MaSach")
    private Book book;

    @Column(name = "SoLuong")
    private int quantity;
    @Column(name = "TongGia")
    private int price;

}
