package com.group54.service;

public interface LoginService {
    public boolean verify(String name,String password);
    public int getRole(String id);
}
