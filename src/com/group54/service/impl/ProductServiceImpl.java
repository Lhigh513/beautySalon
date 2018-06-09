package com.group54.service.impl;

import com.group54.dao.CategoryDao;
import com.group54.dao.ProductDao;
import com.group54.enity.Product;
import com.group54.enity.ProductList;
import com.group54.service.ProductService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDao productDao=null;

    @Autowired
    private CategoryDao categoryDao=null;

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    public List<ProductList> showProduct() {
        return productDao.getProductList();
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    public boolean updateProduct(String[] params) {
        int categoryId=categoryDao.getCategoryId(params[3]);
        int id=Integer.parseInt(params[0]);
        int price=Integer.parseInt(params[2]);
        return productDao.updateProduct(new Product(id,params[1],price,categoryId));
    }

    @Override
    public boolean deleteProduct(String param) {
        if(param.contains("\"")){
            return  productDao.deleteProduct(Integer.parseInt(param.replace("\"","")));
        }
        return false;
    }

    @Override
    public boolean addProduct(String[] params) {
        int categoryId=categoryDao.getCategoryId(params[3]);
        int id=Integer.parseInt(params[0]);
        int price=Integer.parseInt(params[2]);
        return productDao.insertProduct(new Product(id,params[1],price,categoryId));
    }

    @Override
    public boolean classifyProduct() {
        return false;
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    public List<String> getAllCategoryName() {
        return categoryDao.getAllCategoryName();
    }
}
