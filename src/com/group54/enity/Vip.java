package com.group54.enity;

import java.util.Date;

public class Vip {
    private int id;
    private String name;
    private String gender;
    private String phone;
    private String name2;
    private String phone2;
    private String regdate;
    private int level;
    public Vip() {
    }

    public Vip(int id, String name, String gender, String phone, String name2, String phone2, String regdate, int level) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.phone = phone;
        this.name2 = name2;
        this.phone2 = phone2;
        this.regdate = regdate;
        this.level = level;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName2() {
        return name2;
    }

    public void setName2(String name2) {
        this.name2 = name2;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPhone2() {
        return phone2;
    }

    public void setPhone2(String phone2) {
        this.phone2 = phone2;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }
}
