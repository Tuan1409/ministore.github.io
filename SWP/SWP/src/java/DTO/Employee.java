/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author PC
 */
public class Employee {

    private int employeeID;
    private String employeename;
    private String employeeavatar;
    private String username;
    private String birthday;
    private String employeesex;
    private String employeepassword;

    private String employeeaddress;
    private String employeephone;
    private String emprole;

    public Employee() {
    }

    public Employee(int employeeID, String employeename, String employeeavatar, String username, String birthday, String employeesex, String employeepassword, String employeeaddress, String employeephone, String emprole) {
        this.employeeID = employeeID;
        this.employeename = employeename;
        this.employeeavatar = employeeavatar;
        this.username = username;
        this.birthday = birthday;
        this.employeesex = employeesex;
        this.employeepassword = employeepassword;
        this.employeeaddress = employeeaddress;
        this.employeephone = employeephone;
        this.emprole = emprole;
    }

    public int getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(int employeeID) {
        this.employeeID = employeeID;
    }

    public String getEmployeename() {
        return employeename;
    }

    public void setEmployeename(String employeename) {
        this.employeename = employeename;
    }

    public String getEmployeeavatar() {
        return employeeavatar;
    }

    public void setEmployeeavatar(String employeeavatar) {
        this.employeeavatar = employeeavatar;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getEmployeesex() {
        return employeesex;
    }

    public void setEmployeesex(String employeesex) {
        this.employeesex = employeesex;
    }

    public String getEmployeepassword() {
        return employeepassword;
    }

    public void setEmployeepassword(String employeepassword) {
        this.employeepassword = employeepassword;
    }

    public String getEmployeeaddress() {
        return employeeaddress;
    }

    public void setEmployeeaddress(String employeeaddress) {
        this.employeeaddress = employeeaddress;
    }

    public String getEmployeephone() {
        return employeephone;
    }

    public void setEmployeephone(String employeephone) {
        this.employeephone = employeephone;
    }

    public String getEmprole() {
        return emprole;
    }

    public void setEmprole(String emprole) {
        this.emprole = emprole;
    }

}
