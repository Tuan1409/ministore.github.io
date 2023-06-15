/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

import java.util.List;

/**
 *
 * @author kienb
 */
public class RevunueDTO {
    private int empTotal;
    private int proTotal;
    private List<Order> listOrder;
    private List<Product> proList;
    private List<Employee> emplist;

    public RevunueDTO() {
    }

    public RevunueDTO(int empTotal, int proTotal, List<Order> listOrder, List<Product> proList, List<Employee> emplist) {
        this.empTotal = empTotal;
        this.proTotal = proTotal;
        this.listOrder = listOrder;
        this.proList = proList;
        this.emplist = emplist;
    }

    public int getEmpTotal() {
        return empTotal;
    }

    public void setEmpTotal(int empTotal) {
        this.empTotal = empTotal;
    }

    public int getProTotal() {
        return proTotal;
    }

    public void setProTotal(int proTotal) {
        this.proTotal = proTotal;
    }

    public List<Order> getListOrder() {
        return listOrder;
    }

    public void setListOrder(List<Order> listOrder) {
        this.listOrder = listOrder;
    }

    public List<Product> getProList() {
        return proList;
    }

    public void setProList(List<Product> proList) {
        this.proList = proList;
    }

    public List<Employee> getEmplist() {
        return emplist;
    }

    public void setEmplist(List<Employee> emplist) {
        this.emplist = emplist;
    }

   
    
    
}
