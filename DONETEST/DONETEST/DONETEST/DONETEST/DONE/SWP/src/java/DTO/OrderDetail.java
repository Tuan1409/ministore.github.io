/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

import java.sql.Date;

/**
 *
 * @author PC
 */
public class OrderDetail {
    private int productID;
    private String productLink;
    private String productName;
    private double productPrice;
    private int quatity;
    private String PayName;
    private String VoucherName;
    private Date orderDate;

    public OrderDetail() {
    }

    public OrderDetail(int productID, String productLink, String productName, double productPrice, int quatity, String PayName, String VoucherName, Date orderDate) {
        this.productID = productID;
        this.productLink = productLink;
        this.productName = productName;
        this.productPrice = productPrice;
        this.quatity = quatity;
        this.PayName = PayName;
        this.VoucherName = VoucherName;
        this.orderDate = orderDate;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductLink() {
        return productLink;
    }

    public void setProductLink(String productLink) {
        this.productLink = productLink;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public int getQuatity() {
        return quatity;
    }

    public void setQuatity(int quatity) {
        this.quatity = quatity;
    }

    public String getPayName() {
        return PayName;
    }

    public void setPayName(String PayName) {
        this.PayName = PayName;
    }

    public String getVoucherName() {
        return VoucherName;
    }

    public void setVoucherName(String VoucherName) {
        this.VoucherName = VoucherName;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }
    
    
}
