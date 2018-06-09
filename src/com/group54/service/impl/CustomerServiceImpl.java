package com.group54.service.impl;

import com.group54.enity.Customer;
import com.group54.dao.CustomerDao;
import com.group54.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerDao customerDao=null;

    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    @Override
    public List<Customer> getAllCustomer() {
       return customerDao.getAllCustomer();
    }

    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)    @Override
    public Customer getCustomer(int id) {
        return customerDao.getCustomer(id);
    }

    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    @Override
    public boolean deleteCustomer() {
        return false;
    }

    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    @Override
    public boolean updateCustomer(Customer customer) {
        return customerDao.updateCustomer(customer);
    }

    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    @Override
    public boolean addCustomer(Customer customer) {
        return customerDao.insertCustomer(customer);
    }

    @Override
    public boolean addCustomer(String[] params) {
        Customer customer=new Customer(Integer.parseInt(params[0]),params[1],params[2],params[3],params[4]);
        return customerDao.insertCustomer(customer);
    }

    @Override
    public boolean updateCustomer(String[] params) {
        Customer customer=new Customer(Integer.parseInt(params[0]),params[1],params[2],params[3],params[4]);
        if (customerDao.updateCustomer(customer)) return true;
        else return false;
    }

    @Override
    public boolean deleteCustomer(String param) {
        return customerDao.deleteCustomer(Integer.parseInt(param));
    }
}
