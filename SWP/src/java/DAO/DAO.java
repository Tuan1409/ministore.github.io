/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.Employee;
import Utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DAO {

//    public ArrayList<Employee> EmployeeList(String accID, String searchKey) throws SQLException {
//        ArrayList<Employee> EmployeetList = new ArrayList<>();
//        String sql = "SELECT * FROM Employee";
//        Connection conn = null;
//        PreparedStatement ps = null;
//        ResultSet rs = null;
//        try {
//            conn = new DBUtils().getConnection();
//            if (accID != null) {
//                sql = "SELECT * FROM Employee where accountID = " + accID;;
//            }
//            if (searchKey != null) {
//                sql = "SELECT * FROM Employee WHERE accountID LIKE " + "'%" + searchKey + "%'";
//            }
//
//            ps = conn.prepareStatement(sql);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                String accountID = rs.getString("accountID");
//                String accountName = rs.getString("accountName");
//                String acpassword = rs.getString("acpassword");
//                int acSession = rs.getInt("acSession");
//                Employee employee = new Employee(accountID, accountName, acpassword, acSession);
//                EmployeetList.add(employee);
//
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            if (rs != null) {
//                rs.close();
//            }
//            if (ps != null) {
//                ps.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
//        return EmployeetList;
//    }

//    public Employee checkLogin(String username, String password) throws SQLException {
//        String sql = "SELECT EmployeeID,EmployeeName,EmployeePassword,EmpRole FROM Employee  WHERE EmployeeName = ? and EmployeePassword = ?";
//
//        Connection conn = null;
//        PreparedStatement ps = null;
//        ResultSet rs = null;
//        try {
//            conn = new DBUtils().getConnection();
//            ps = conn.prepareStatement(sql);
//            ps.setString(1, username);
//            ps.setString(2, password);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                String employeeID = rs.getString("EmployeeID");
//                String employeeName = rs.getString("EmployeeName");
//                String acpassword = rs.getString("EmployeePassword");
//                int acSession = rs.getInt("EmpRole");
//                Employee account = new Employee(employeeID, employeeName, acpassword, acSession);
//                return account;
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            if (rs != null) {
//                rs.close();
//            }
//            if (ps != null) {
//                ps.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
//        return null;
//
//    }

//    public Employee checkEmployee(String username) throws SQLException {
//        String sql = "SELECT EmployeeID,EmployeeName,Acpassword,AcSession FROM Employee WHERE EmployeeName = ?";
//        Connection conn = null;
//        PreparedStatement ps = null;
//        ResultSet rs = null;
//        try {
//            conn = new DBUtils().getConnection();
//            ps = conn.prepareStatement(sql);
//            ps.setString(1, username);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//               String accountID = rs.getString("accountID");
//                String accountName = rs.getString("accountName");
//                String acpassword = rs.getString("acpassword");
//                int acSession = rs.getInt("acSession");
//                Employee account = new Employee(accountID, accountName, acpassword, acSession);
//                return account;
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            if (rs != null) {
//                rs.close();
//            }
//            if (ps != null) {
//                ps.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
//        return null;
//
////    }
//    public static void main(String[] args) {
//        try {
//            DAO dao = new DAO();
//            ArrayList<Employee> accList = new ArrayList<>();
//            accList = dao.EmployeeList("", "");
//            Employee acc = dao.checkLogin("Tuand", "123");
//            if( acc == null){
//                System.out.println("false");
//            } else {
//                System.out.println(acc);
//            }
//            for (Employee account : accList) {
//                System.out.println(account.toString());
//            }
//        } catch (Exception e) {
//        }
//
//    }
}
