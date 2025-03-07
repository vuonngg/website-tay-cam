package com.example.web_controller.reposirories;

import com.example.web_controller.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.math.BigDecimal;
import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Integer> {
    @Query("""
    SELECT p FROM Product p WHERE 
    (LOWER(p.name) LIKE LOWER(CONCAT('%', :duLieu, '%')) OR :duLieu IS NULL) 
    AND (p.category.id = :category OR :category IS NULL) 
    AND (p.price BETWEEN :price1 AND :price2 OR :price1 IS NULL OR :price2 IS NULL) 
    AND (ABS(p.quantity - :quantity) <= 20 OR :quantity IS NULL)
""")
    List<Product> searchProducts(
            @Param("duLieu") String duLieu,  // Dùng để tìm theo tên
            @Param("category") Integer category,  // Dùng để tìm theo category
            @Param("price1") BigDecimal price1,  // Dùng để tìm theo giá từ
            @Param("price2") BigDecimal price2,  // Dùng để tìm theo giá đến
            @Param("quantity") Integer quantity);  // Dùng để tìm theo số lượng
}