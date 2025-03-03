package com.example.web_controller.service;

import com.example.web_controller.entity.Category;
import com.example.web_controller.reposirories.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService {
    @Autowired
    CategoryRepository categoryRepository;
    public List<Category> getAll( ){
        return categoryRepository.findAll();
    }

    public void add(Category category ){
        categoryRepository.save(category);
    }
    public void update(Category category ){
        categoryRepository.save(category);
    }
}
