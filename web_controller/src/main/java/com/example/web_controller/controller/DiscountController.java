package com.example.web_controller.controller;

import com.example.web_controller.entity.Discount;
import com.example.web_controller.service.DiscountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.util.List;
@RestController
@RequestMapping("/discounts")
public class DiscountController {
    private final DiscountService discountService;

    public DiscountController(DiscountService discountService) {
        this.discountService = discountService;
    }
    @GetMapping("/hien-thi")
    @ResponseBody
    public List<Discount> getAll() {
        System.out.println("list nhe:  ---"+  discountService.getAll());
        return discountService.getAll();
    }

    @GetMapping("/getOne/{id}")
    public Discount getOne(@PathVariable("id") Integer id) {
        return discountService.getOne(id);
    }
    @PostMapping("/add")
    public void add(@RequestBody Discount dicount){
        discountService.add(dicount);
        System.out.println("them oke");
    }
    @PutMapping("/update")
    public void update(@RequestBody Discount dicount){

        discountService.update(dicount);
    }
    @DeleteMapping("/delete/{id}")
    public void delete(@PathVariable("id") Integer id){
        discountService.delete(id);
    }

    @GetMapping("/search")
    public List<Discount> timKiem(@RequestParam("duLieu") String duLieu, @RequestParam("trangThai") String trangThai){
        LocalDate toDay = LocalDate.now();
        return discountService.search(duLieu,trangThai,toDay);
    }

    @GetMapping("/checkCode")
    public boolean checkCode(@RequestParam("code") String code,@RequestParam( "id") Integer id){
        if(id == -1){
            id = null;
        }
        return discountService.checkCode(code,id);
    }
}
