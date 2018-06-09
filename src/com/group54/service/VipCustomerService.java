package com.group54.service;

import com.group54.enity.Vip;

import java.util.List;

public interface VipCustomerService {
    public List<Vip> getAllVip();
    public Vip getVip(int id);
    public boolean addVip(String[] params);
    public boolean updateVip(String[] params);
    public boolean deleteVip(String param);
}
