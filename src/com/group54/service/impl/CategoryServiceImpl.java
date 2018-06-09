package com.group54.service.impl;

import com.group54.dao.CategoryDao;
import com.group54.enity.Category;
import com.group54.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryDao categoryDao=null;

    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    @Override
    public List<Category> getAllCategory() {
        return categoryDao.getAllCategory();
    }

    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    @Override
    public boolean updateCategory(String[] params) {
        Category category=new Category(Integer.parseInt(params[0]),params[1]);
        return categoryDao.updateCategory(category);
    }

    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    @Override
    public boolean insertCategory(String[] params) {
        Category category=new Category(Integer.parseInt(params[0]),params[1]);
        return categoryDao.insertCategory(category);
    }

    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    @Override
    public boolean deleteCategory(String param) {
        return categoryDao.deleteCategory(Integer.parseInt(param));
    }
}
