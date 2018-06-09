package com.group54.service;

import com.group54.enity.Product;
import com.group54.enity.ProductList;

import java.util.List;

public interface ProductService {
    public List<ProductList> showProduct();
    public boolean updateProduct(String[] params);
    public boolean deleteProduct(String param);
    public boolean addProduct(String[] params);
    public boolean classifyProduct();
    public List<String> getAllCategoryName();
}
