package com.group54.enity;

public class Customer {
    private int id;
    private String cid;
    private String name;
    private String gender;
    private String phone;


    public Customer(int id, String cid, String name, String gender, String phone) {
        this.id = id;
        this.cid = cid;
        this.name = name;
        this.gender = gender;
        this.phone = phone;
    }

    public Customer() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
}
