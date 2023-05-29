/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.Category;
import DTO.Product;
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
public class ProductDAO {

    public List<Product> getAll() {
        List<Product> list = new ArrayList<>();
        String sql = "Select p.*,c.CategoryName from Product p left join Categorie c on p.CategoryID = c.CategoryID";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt(1));
                p.setProductLink(rs.getString(2));
                p.setProductName(rs.getString(3));
                p.setProductPrice(rs.getDouble(4));
                p.setDiscount(rs.getDouble(5));
                p.setCategory(new Category(rs.getInt(8), rs.getString(10)));
                p.setQuantity(rs.getInt(7));
                p.setStatus(rs.getBoolean(6));
                if(!p.getProductLink().contains("http")){
                    p.setProductLink("./upload/" + p.getProductLink());
                }
                list.add(p);
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

    public Product getProductByID(String id) {
        String sql = "Select p.*,c.CategoryName from Product p left join Categorie c on p.CategoryID = c.CategoryID\n"
                + "where p.ProductID = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt(1));
                p.setProductLink(rs.getString(2));
                p.setProductName(rs.getString(3));
                p.setProductPrice(rs.getDouble(4));
                p.setDiscount(rs.getDouble(5));
                p.setCategory(new Category(rs.getInt(8), rs.getString(10)));
                p.setQuantity(rs.getInt(7));
                p.setStatus(rs.getBoolean(6));
                return p;
            }
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
        return null;
    }

    public void updateSP(String id, String name, String price, String discount, String cateID, String quantity) {
        String sql = "UPDATE [dbo].[Product]\n"
                + "   SET \n"
                + "      [ProductName] = ?\n"
                + "      ,[ProductPrice] = ?\n"
                + "      ,[Disscount] = ?\n"
                + "      ,[Quatity] = ?\n"
                + "      ,[CategoryID] = ?\n"
                + " WHERE ProductID = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setDouble(2, Double.parseDouble(price));
            ps.setDouble(3, Double.parseDouble(discount));
            ps.setInt(4, Integer.parseInt(quantity));
            ps.setInt(5, Integer.parseInt(cateID));
            ps.setInt(6, Integer.parseInt(id));
            ps.executeUpdate();
            return;
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
    }

    public void insert(String name, String price, String discount, String cateID, String quantity, String productLink) {
        String sql = "INSERT INTO [dbo].[Product]\n"
                + "           ([ProductLink]\n"
                + "           ,[ProductName]\n"
                + "           ,[ProductPrice]\n"
                + "           ,[Disscount]\n"
                + "           ,[ProductStatus]\n"
                + "           ,[Quatity]\n"
                + "           ,[CategoryID])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,1,?,?)";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, productLink);
            ps.setString(2, name);
            ps.setDouble(3, Double.parseDouble(price));
            ps.setDouble(4, Double.parseDouble(discount));
            ps.setInt(5, Integer.parseInt(quantity));
            ps.setInt(6, Integer.parseInt(cateID));
            ps.executeUpdate();
            return;
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
    }
}
