package com.example.web_controller.reposirories;

import com.example.web_controller.entity.Discount;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.List;

public interface DiscountRepository extends JpaRepository<Discount, Integer> {
    @Query("""
        SELECT d FROM Discount d
        WHERE (:keyword IS NULL OR d.code LIKE %:keyword% 
               OR CAST(d.quantity AS string) LIKE %:keyword% 
               OR CAST(d.percentage AS string) LIKE %:keyword%)
        AND (:status = 'ALL' 
             OR (:status = 'INACTIVE' AND d.validFrom > :today)
             OR (:status = 'ACTIVE' AND d.validFrom <= :today AND d.validTo >= :today)
             OR (:status = 'EXPIRED' AND d.validTo < :today))
    """)
    List<Discount> searchDiscounts(@Param("keyword") String keyword,
                                 @Param("status") String status,
                                 @Param("today") LocalDate today);

    // Kiểm tra xem mã giảm giá đã tồn tại hay chưa (dùng cho thêm mới)
    boolean existsByCode(String code);

    // Kiểm tra xem mã giảm giá đã tồn tại nhưng không tính bản ghi có ID đang cập nhật
    boolean existsByCodeAndIdNot(String code, Integer id);


}