package com.Project.Bookstore.Model;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.Data;

import java.io.Serializable;
import java.util.Objects;

@Data
@Embeddable
public class OrderItemId implements Serializable {

    @Column(name = "MaDonHang")
    private String orderId;

    @Column(name = "MaSach")
    private String bookId;

    public OrderItemId() {}

    public OrderItemId(String orderId, String bookId) {
        this.orderId = orderId;
        this.bookId = bookId;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        OrderItemId that = (OrderItemId) o;
        return Objects.equals(orderId, that.orderId) &&
                Objects.equals(bookId, that.bookId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(orderId, bookId);
    }
}
