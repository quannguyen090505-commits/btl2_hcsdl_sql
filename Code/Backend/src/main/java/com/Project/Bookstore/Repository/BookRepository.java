package com.Project.Bookstore.Repository;

import com.Project.Bookstore.Model.Book;
import com.Project.Bookstore.Model.BookStatistic;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface BookRepository extends JpaRepository<Book,String> {
    @Query(value = "CALL sp_TimKiemSach(:tuKhoa, :giaMin, :giaMax, :tenTheLoai, :sapXep)", nativeQuery = true)
    List<String> findBookId(
            @Param("tuKhoa") String tuKhoa,
            @Param("giaMin") Integer giaMin,
            @Param("giaMax") Integer giaMax,
            @Param("tenTheLoai") String tenTheLoai,
            @Param("sapXep") String sapXep
    );
    @Query(value = "CALL sp_ThongKeSachBanChay(:ngayBatDau, :ngayKetThuc, :soLuongToiThieu)", nativeQuery = true)
    List<BookStatistic> getBestSellingBooks(
            @Param("ngayBatDau") LocalDate ngayBatDau,
            @Param("ngayKetThuc") LocalDate ngayKetThuc,
            @Param("soLuongToiThieu") Integer soLuongToiThieu
    );
}
