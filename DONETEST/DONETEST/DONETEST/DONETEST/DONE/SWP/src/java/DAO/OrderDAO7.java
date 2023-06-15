/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Utils.DBContext;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import DTO.ListOrders;
import DTO.OrderDetail;

/**
 *
 * @author PC
 */
public class OrderDAO7 {

    private DBContext db;

    public OrderDAO7() {
        db = new DBContext();
    }

    public OrderDAO7(DBContext db) {
        this.db = db;
    }

    public DBContext getDb() {
        return db;
    }

    public void setDb(DBContext db) {
        this.db = db;
    }

    public List<ListOrders> readAllOrders() {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        List<ListOrders> listOrders = new ArrayList<>();

        try {
            String sql = "select  OrderID, OrderDate, CustomerName, Phone\n"
                    + "from Orders o join Customer c on o.CustomerID = c.CustomerID";
            PreparedStatement stmt = db.getConn().prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int OrderID = rs.getInt("OrderID");
                Date OrderDate = rs.getDate("OrderDate");
                String CustomerName = rs.getString("CustomerName");
                String Phone = rs.getString("Phone");
                ListOrders order = new ListOrders(OrderID, OrderDate, CustomerName, Phone);
                listOrders.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO7.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listOrders;
    }

    public List<OrderDetail> readOrderDetail(int orderID) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        List<OrderDetail> orderDetails = new ArrayList<>();

        try {
            String sql = "select ProdcutID, ProductLink, ProductName, ProductPrice, od.Quantity, PayName, VoucherName,OrderDate  \n"
                    + "from Orderdetail od join Orders o on od.OrderID = o.OrderID\n"
                    + "join Product pro on pro.ProductID = od.ProdcutID\n"
                    + "join Payment pay on pay.PayID = o.PayID\n"
                    + "join Voucher v on v.VoucherID = o.VoucherID\n"
                    + "where o.OrderID = ?";
            PreparedStatement stmt = db.getConn().prepareStatement(sql);
            stmt.setInt(1, orderID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int ProdcutID = rs.getInt("ProdcutID");
                String ProductLink = rs.getString("ProductLink");
                String ProductName = rs.getString("ProductName");
                Double ProductPrice = rs.getDouble("ProductPrice");
                int Quantity = rs.getInt("Quantity");
                String PayName = rs.getString("PayName");
                String VoucherName = rs.getString("VoucherName");
                Date OrderDate = rs.getDate("OrderDate");
                OrderDetail order = new OrderDetail(ProdcutID, ProductLink, ProductName, ProductPrice, Quantity, PayName, VoucherName, OrderDate);
                orderDetails.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO7.class.getName()).log(Level.SEVERE, null, ex);
        }

        return orderDetails;
    }

    public void deleteOrder(int orderID) {
        try {

            String sql;
            sql = "delete from Orders where OrderID = ?";

            PreparedStatement stmt = db.getConn().prepareStatement(sql);
            stmt.setInt(1, orderID);
            stmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO7.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addOrder(int customerID, Date orderDate, int payID, int voucherID) throws SQLException {
        try {
            String sql;
            sql = "insert into Orders( OrderDate, CustomerID, PayID, VoucherID) values (?, ?, ?, ?)";

            PreparedStatement stmt = db.getConn().prepareStatement(sql);

            stmt.setDate(1, orderDate);
            stmt.setInt(2, customerID);
            stmt.setInt(3, payID);
            stmt.setInt(4, voucherID);

            stmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO7.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void main(String[] args) {
        OrderDAO7 dao = new OrderDAO7();
        List<OrderDetail> od = dao.readOrderDetail(2);
        System.out.println(od.get(1).getProductPrice());
    }
}
