package com.group54.service.impl;

import com.group54.dao.EmployeeDao;
import com.group54.enity.Employee;
import com.group54.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    private EmployeeDao employeeDao=null;
    @Override
    public List<Employee> showEmployee() {
        return employeeDao.getAllEmployee();
    }

    @Override
    public boolean updateEmployee(String[] params) {
        int id=Integer.parseInt(params[0]);
        String name=params[1];
        String roleName=params[2];
        String password=employeeDao.getPassword(id);
        int roleId=employeeDao.getRoleId(id);
        if(roleId!=employeeDao.getRoleIdByRoleName(roleName)){
             roleId=employeeDao.getRoleIdByRoleName(roleName);
            Employee employee=new Employee(id,name,password,roleName,roleId);
            return employeeDao.updateEmployee(employee);
        }else {
            Employee employee=new Employee(id,name,password,roleName,roleId);
            return employeeDao.updateEmployee(employee);
        }
    }

    @Override
    public boolean deleteEmployee(String param) {
        return false;
    }

    @Override
    public boolean insertEmployee(String[] params) {
        int id=Integer.parseInt(params[0]);
        String name=params[1];
        String roleName=params[2];
        String password="000";//新增职员的密码默认为000,后可通过新增模块'个人中心'，完成对密码的修改
        int roleId=employeeDao.getRoleIdByRoleName(roleName);
        return employeeDao.insertEmployee(new Employee(id,name,password,roleName,roleId));
    }

    @Override
    public List<String> getRoleName() {
        return employeeDao.getRoleName();
    }
}
