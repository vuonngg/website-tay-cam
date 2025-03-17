package com.example.web_controller.controller;

import com.example.web_controller.entity.Cart;
import com.example.web_controller.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/cart")
public class CartController {
    @Autowired
    CartService cartService;

    @GetMapping("/hien-thi/{id}")
    public List<Cart> getAll(@PathVariable("id")UUID idUser){
        return cartService.getAllbyUserId(idUser);
    }
    @DeleteMapping("/delete")
    public void delete(@RequestBody Cart cart){
        cartService.delete(cart);
    }
    @PostMapping("/add")
    public void add(@RequestBody Cart cart){

        cartService.add(cart);
    }
    @PutMapping ("/update")
    public void update(@RequestBody Cart cart){
        cartService.update(cart);
    }
}
