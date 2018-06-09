package com.group54.service.impl;

import com.group54.dao.VipCustomerDao;
import com.group54.enity.Vip;
import com.group54.service.VipCustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VipCustomerServicdeImpl implements VipCustomerService {
    @Autowired
    private VipCustomerDao vipDao=null;
    @Override
    public List<Vip> getAllVip() {

        return vipDao.getAllVip();
    }

    @Override
    public Vip getVip(int id) {
        return vipDao.getCustomer(id);
    }


    @Override
    public boolean addVip(String[] params) {
        return vipDao.insertCustomer(new Vip(Integer.parseInt(params[0]),params[1],params[2],params[3],params[4],params[5],params[6],Integer.parseInt(params[7])));
    }

    @Override
    public boolean updateVip(String[] params) {
        return vipDao.updateCustomer(new Vip(Integer.parseInt(params[0]),params[1],params[2],params[3],params[4],params[5],params[6],Integer.parseInt(params[7])));
    }

    @Override
    public boolean deleteVip(String param) {
        return vipDao.deleteCustomer(Integer.parseInt(param));
    }
}
