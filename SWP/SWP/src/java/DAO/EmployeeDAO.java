/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DAO.DBContext;
import DTO.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import DTO.Employee;
import DTO.Product;
import Utils.DBUtils;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PC
 */
public class EmployeeDAO {

    private DBContext db;

    public EmployeeDAO() {
        db = new DBContext();
    }

    public EmployeeDAO(DBContext db) {
        this.db = db;
    }

    public DBContext getDb() {
        return db;
    }

    public void setDb(DBContext db) {
        this.db = db;
    }

//    public static void main(String[] args) {
//        try {
//            DAO dao = new DAO();
//            ArrayList<Employee> accList = new ArrayList<>();
//            accList = dao.getALl("", "");
////            Account acc = dao.checkLogin("vinh", "1234");
//            for (Account account : accList) {
//                System.out.println(account.toString());
//            }
//        } catch (Exception e) {
//        }
//    }
    public Employee detailsEmployee(String username, String password) {
        try {
            String sql = "SELECT * FROM Employee WHERE Username = ? and EmployeePassword = ?";
            PreparedStatement stmt = db.getConn().prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int EmployeeID = rs.getInt("EmployeeID");
                String EmployeeName = rs.getString("EmployeeName");
                String EmployeeAvatar = rs.getString("EmployeeAvatar");
                String Username = rs.getString("Username");
                String Birthday = rs.getString("Birthday");
                String EmployeeSex = rs.getString("EmployeeSex");
                String EmployeePassword = rs.getString("EmployeePassword");
                String EmployeeAddress = rs.getString("EmployeeAddress");
                String EmployeePhone = rs.getString("EmployeePhone");
                String EmpRole = rs.getString("EmpRole");
                Employee emp = new Employee(EmployeeID, EmployeeName, EmployeeAvatar, Username, Birthday, EmployeeSex, EmployeePassword, EmployeeAddress, EmployeePhone, EmpRole);
                return emp;
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public List<Employee> getAll() {
        List<Employee> list = new ArrayList<>();
        String sql = "Select EmployeeID,EmployeeName,EmployeeAvatar,EmployeeAddress,Birthday,EmployeeSex, EmployeePhone,EmpRole from Employee ";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {

            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Employee p = new Employee();
                p.setEmployeeID(rs.getInt(1));
                p.setEmployeename(rs.getString(2));
                p.setEmployeeavatar(rs.getString(3));
                p.setBirthday(rs.getString(4));
                p.setEmployeesex(rs.getString(5));
                p.setEmployeeaddress(rs.getString(6));
                p.setEmployeephone(rs.getString(7));
                p.setEmprole(rs.getString(8));
                if (!p.getEmployeeavatar().contains("http")) {
                    p.setEmployeeavatar("./upload/" + p.getEmployeeavatar());
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
                    Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return list;
    }
      public Employee getEmployeeByID(String id) {
          String sql = "Select EmployeeID,EmployeeName,EmployeeAvatar,EmployeeAddress,Birthday,EmployeeSex, EmployeePhone,EmpRole from Employee "
                  + "where EmployeeID = ?";

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            
                
                
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Employee p = new Employee();
                p.setEmployeeID(rs.getInt(1));
                p.setEmployeename(rs.getString(2));
                p.setEmployeeavatar(rs.getString(3));
                p.setBirthday(rs.getString(4));
                p.setEmployeesex(rs.getString(5));
                p.setEmployeeaddress(rs.getString(6));
                p.setEmployeephone(rs.getString(7));
                p.setEmprole(rs.getString(8));
                return p;
            }
        } catch (SQLException e) {
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }


    public static void main(String[] args) {
        try {
            EmployeeDAO dao = new EmployeeDAO();
            List<Employee> empList = dao.getAll(); 

            for (Employee emp : empList) {
                System.out.println(emp.toString());
            }
        } catch (Exception e) {
            e.printStackTrace(); // Printing the exception trace for debugging purposes.
        }

//        Employee e = dao.detailsEmployee("tuan","123");
//        System.out.println(e.getEmployeePassword());
    }
}
