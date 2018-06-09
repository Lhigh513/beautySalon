package com.group54.service.impl;

import com.group54.dao.EmployeeDao;
import com.group54.dao.UserDao;
import com.group54.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class LoginServiceImpl implements LoginService{
    @Autowired
    EmployeeDao employeeDao=null;
    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    @Override
    public boolean verify(String id,String password){
            if(employeeDao.getEmployeeId().contains(Integer.parseInt(id))){
                if(employeeDao.getPassword(Integer.parseInt(id)).equals(password)){
                    return true;
                }return false;
        }
        return false;
    }

    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    @Override
    public int getRole(String id) {
        return employeeDao.getRoleId(Integer.parseInt(id));
    }


}
