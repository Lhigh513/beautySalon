package com.group54.enity;

/**
 * 这是关于数据库product表的映射
 */
public class Product {
    private int id;
    private String productName;
    private int price;
    private int categoryId;
    public Product() {
    }

    public Product(int id, String name,  int price, int categoryId) {
        this.id = id;
        this.productName = name;
        this.price = price;
        this.categoryId = categoryId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return productName;
    }

    public void setName(String name) {
        this.productName = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }
}
