package com.group54.service;

import com.group54.enity.Customer;

import java.util.List;

public interface CustomerService {
    public List<Customer> getAllCustomer();
    public Customer getCustomer(int id);
    public boolean deleteCustomer();
    public boolean updateCustomer(Customer customer);
    public boolean addCustomer(Customer customer);
    public boolean addCustomer(String[] params);
    public boolean updateCustomer(String[] params);
    public boolean deleteCustomer(String param);
}
