package com.example.web_controller.service;

import com.example.web_controller.entity.Cart;
import com.example.web_controller.reposirories.CartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;
@Service

public class CartService {
    @Autowired
    CartRepository cartRepository;
    public List<Cart> getAllbyUserId(UUID id){
        return cartRepository.findAllByUserId(id);
    }

    public void delete(Cart cart){
        cartRepository.delete(cart);
    }

    public void add(Cart cart){
        Integer productId = cart.getProduct().getId();
        UUID userId = cart.getUser().getId();

        Cart sanPham = cartRepository.findCartByProductIdAndUserId(productId,userId);
        if(sanPham != null){
            sanPham.setQuantity(cart.getQuantity() + sanPham.getQuantity());
            cartRepository.save(sanPham);
        }else {
            cartRepository.save(cart);
        }
    }
    public void update(Cart cart){
        cartRepository.save(cart);
    }

}
