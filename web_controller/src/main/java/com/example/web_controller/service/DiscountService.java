package com.example.web_controller.service;

import com.example.web_controller.entity.Discount;
import com.example.web_controller.reposirories.DiscountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DiscountService {
    @Autowired
    DiscountRepository discountRepository;
    public List<Discount>getAll(){
        return discountRepository.findAll();
    }
    public Discount getOne(Integer id){
        return discountRepository.findById(id).get();
    }
    public void delete(Integer id){
        discountRepository.deleteById(id);
    }
    public void add(Discount discount){
        discountRepository.save(discount);
    }
    public void update(Discount discount){
        discountRepository.save(discount);
    }
}
