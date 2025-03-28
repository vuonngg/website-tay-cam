package com.example.web_controller.controller;

import com.example.web_controller.entity.Category;
import com.example.web_controller.entity.Product;
import com.example.web_controller.service.CategoryService;
import com.example.web_controller.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PagedModel;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.util.List;

@RestController
@RequestMapping("/products")
public class ProductController {
    @Autowired
    ProductService productService;
    @Autowired
    CategoryService categoryService;

    @GetMapping("/hien-thi/category")
    public List<Category> getAllCategory() {
        return categoryService.getAll();
    }

    @GetMapping("/hien-thi")
    public List<Product> getAll() {
        return productService.getAll();
    }

    @PostMapping("/add")
    public void add(@RequestBody Product product) {
        productService.save(product);
    }

    @PutMapping("/update")
    public void update(@RequestBody Product product) {
        productService.save(product);
    }

    @DeleteMapping("/delete/{id}")
    public void delete(@PathVariable("id") Integer id) {
        productService.delete(id);
    }

    @GetMapping("/get-product/{id}")
    public Product getOne(@PathVariable("id") Integer id){
        return productService.getOne(id);
    }

    @GetMapping("/search")
    public List<Product> search(
            @RequestParam(value = "duLieu", required = false) String ten,
            @RequestParam(value = "danhMuc", required = false) Integer danhMuc,
            @RequestParam(value = "gia1", required = false) BigDecimal gia1,
            @RequestParam(value = "gia2", required = false) BigDecimal gia2,
            @RequestParam(value = "soLuong", required = false) Integer soLuong) {

        // Kiểm tra và xử lý các tham số null hoặc rỗng (nếu cần)
        if (gia1 != null && gia2 != null && gia1.compareTo(gia2) > 0) {
            // Đảm bảo gia1 < gia2
            BigDecimal temp = gia1;
            gia1 = gia2;
            gia2 = temp;
        }

        return productService.searchProduct(ten, danhMuc, gia1, gia2, soLuong);
    }

}
