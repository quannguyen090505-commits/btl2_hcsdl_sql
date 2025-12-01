package com.Project.Bookstore.Controller;

import com.Project.Bookstore.Model.Category;
import com.Project.Bookstore.Service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@CrossOrigin(origins = "http://localhost:5173")
@RestController
@RequestMapping("/category")
public class CategoryController {
    private final CategoryService categoryService;
    @Autowired
    public CategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }
    @GetMapping
    public List<Category> findAll() {
        return this.categoryService.findAll();
    }
    @GetMapping("/{id}")
    public Category findById(@PathVariable String id) {
        return this.categoryService.findById(id);
    }
}
