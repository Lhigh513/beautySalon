package com.group54.service;

import com.group54.enity.Category;

import java.util.List;

public interface CategoryService {
    public List<Category> getAllCategory();
    public boolean updateCategory(String[] params);
    public boolean insertCategory(String[] params);
    public boolean deleteCategory(String param);
}
