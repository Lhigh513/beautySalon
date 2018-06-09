package com.group54.dao;

import com.group54.enity.Category;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryDao {
    public List<Category> getAllCategory();
    public List<String> getAllCategoryName();
    public Integer getCategoryId(String categoryName);
    public boolean deleteCategory(int id);
    public boolean updateCategory(Category category);
    public boolean insertCategory(Category category);

}
