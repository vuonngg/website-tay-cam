package com.example.web_controller.service;

import com.example.web_controller.entity.Product;
import com.example.web_controller.reposirories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {
    @Autowired
    ProductRepository productRepository;

    public List<Product> getAll(){
        return productRepository.findAll();
    }
    public Product getOne(Integer id){
        return productRepository.findById(id).get();
    }
    public  void sava(Product product){
        productRepository.save(product);
    }
    public void delete( Integer id){
        productRepository.deleteById(id);
    }
}
