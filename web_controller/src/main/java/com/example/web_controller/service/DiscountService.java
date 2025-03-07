package com.example.web_controller.service;

import com.example.web_controller.entity.Discount;
import com.example.web_controller.reposirories.DiscountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
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

    public List<Discount> search(String duLieu, String trangThai, LocalDate toDay){
       return discountRepository.searchDiscounts(duLieu,trangThai,toDay);
    }

    public boolean checkCode(String code, Integer id){
        if(id == null){
            return discountRepository.existsByCode(code);
        }else{
            return discountRepository.existsByCodeAndIdNot(code,id);
        }
    }
}
