package com.example.web_controller.reposirories;

import com.example.web_controller.entity.Cart;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface CartRepository extends JpaRepository<Cart, Integer> {
    List<Cart> findAllByUserId(UUID id);

    Cart findCartByProductIdAndUserId(Integer productId, UUID userId);
}