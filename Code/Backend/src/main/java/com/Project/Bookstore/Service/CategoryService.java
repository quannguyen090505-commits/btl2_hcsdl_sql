package com.Project.Bookstore.Service;

import com.Project.Bookstore.Model.Category;
import com.Project.Bookstore.Repository.CategoryRepository;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService {
    private final CategoryRepository categoryRepository;
    @Autowired
    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }
    public Category findById(String id) {
        return this.categoryRepository.findById(id).orElse(null);
    }
    public List<Category> findAll() {
        return this.categoryRepository.findAll();
    }
}
