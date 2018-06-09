package com.group54.enity;

public class VipOrder {
    private int orderId;
    private int vipId;
    private String time;
    private String name;
    private String phone;
    private int money;

    public VipOrder(int orderId, int vipId, String time, String name, String phone, int money) {
        this.orderId = orderId;
        this.vipId = vipId;
        this.time = time;
        this.name = name;
        this.phone = phone;
        this.money = money;
    }


    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getVipId() {
        return vipId;
    }

    public void setVipId(int vipId) {
        this.vipId = vipId;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }
}
