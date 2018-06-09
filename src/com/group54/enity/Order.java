package com.group54.enity;


/**
 * 面向数据库的映射
 */
public class Order {
    private int id;
    private String date;
    private int employeeId;
    private int productId;
    private int status;
    private int money;

    public Order() {
    }

    public Order(int id, String date, int employeeId, int productId, int status, int money) {
        this.id = id;
        this.date = date;
        this.employeeId = employeeId;
        this.productId = productId;
        this.status = status;
        this.money = money;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }
}
