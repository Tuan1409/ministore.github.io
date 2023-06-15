/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.Order;
import Utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author kienb
 */
public class OrderDAO extends DAO {

    public List<Order> getAll() {
        List<Order> list = new ArrayList<>();
        String sql = "Select o.OrderID,o.OrderDate,c.CustomerName,count(p.ProductID) as total,ISNULL(sum(od.Quantity * p.ProductPrice * (100 - p.Disscount) / 100),0) as [revunue] from Orders o left join Customer c on\n" +
"o.CustomerID = c.CustomerID left join Orderdetail od on o.OrderID = od.OrderID left join Product p on od.ProdcutID = p.ProductID group by o.OrderID,o.OrderDate,c.CustomerName";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setOrderId(rs.getInt(1));
                o.setOrderDate(rs.getTimestamp(2).toLocalDateTime());
                o.setCustomerName(rs.getString(3));
                o.setTotal(rs.getDouble(5));
                o.setTotalProduct(rs.getInt(4));
                list.add(o);
            }
            return list;
        } catch (SQLException e) {
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return list;
    }
}
