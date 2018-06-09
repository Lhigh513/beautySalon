package com.group54.dao;

import com.group54.enity.Product;
import com.group54.enity.ProductList;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductDao {
    public List<ProductList> getProductList();
    public List<String> getCategoryName();
    public List<Product> getAllProduct();
    public boolean updateProduct(Product product);
    public boolean deleteProduct(int id);
    public boolean insertProduct(Product product);


}
//select p.categoryId from product p left join  category c on p.categoryId=c.id where c.categoryName='补水';
//select c.categoryName from  category c left join  product p on p.categoryId=c.id;