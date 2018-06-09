package com.group54.enity;


//前端页面的数据的映射
public class OrderList {
   private int id;
   private String date;
   private String name;//服务技师的姓名
   private String productName;
   private int money;
   private int status;

    public OrderList() {
    }

    public OrderList(int id, String date, String name, String productName, int money, int status) {
        this.id = id;
        this.date = date;
        this.name = name;
        this.productName = productName;
        this.money = money;
        this.status = status;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
//select 'id' ,date,employee.name,product.name, money,status from `order` left join(`employee`,`product`)on(order.employeeId=employee.id and order.productId=product.id);