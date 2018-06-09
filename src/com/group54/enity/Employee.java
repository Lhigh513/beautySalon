package com.group54.enity;

public class Employee {
    private int id;
    private String name;
    private String password;
    private String roleName;
    private int roleId;

    public Employee() {
    }

    public Employee(int id, String name, String password, String roleName, int roleId) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.roleName = roleName;
        this.roleId = roleId;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }
}
