package com.group54.service.impl;

import com.group54.dao.RoleDao;
import com.group54.enity.Role;
import com.group54.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


@Service
public class RoleServiceImpl implements RoleService{
    @Autowired
    private RoleDao roleMapper = null;

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    public Role getRole(int id) {
        return roleMapper.getRole(id);
    }


}
