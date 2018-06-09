package com.group54.enity;

public class TempTotalMoney {
    private int id;
    private int money;

    public TempTotalMoney() {
    }

    public TempTotalMoney(int id, int money) {
        this.id = id;
        this.money = money;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }
}
