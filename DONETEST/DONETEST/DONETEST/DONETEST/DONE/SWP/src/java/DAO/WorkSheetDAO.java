/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.Employee;
import DTO.Role;
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
 * @author Vuong
 */

    import DTO.WorkSheetDTO;
import DTO.WorkSheetEmployeeDTO;
import Utils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Vuong
 */
public class WorkSheetDAO{

     public List<WorkSheetDTO> getAll() {
        List<WorkSheetDTO> list = new ArrayList<>();
        String sql =  "Select p.*,c.EmployeeName from Shifts p left join Employee c on p.EmployeeID = c.EmployeeID";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                WorkSheetDTO p = new WorkSheetDTO();
                p.setShiftid(rs.getInt(1));
                p.setStarttime(rs.getTime(2));
                p.setStartdate(rs.getDate(3));
                p.setEndtime(rs.getTime(4));
                p.setEnddate(rs.getDate(5));
                p.setCoefsalary(rs.getFloat(6));
                p.setEmployeerole(rs.getInt(7));
                p.setWorksheetemployeedto(new WorkSheetEmployeeDTO(rs.getInt(8), rs.getString(10)));
                p.setWorkstatus(rs.getInt(9));
                
                
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
   
        public List<WorkSheetDTO> getAll_forsalse (int id) {
        List<WorkSheetDTO> list = new ArrayList<>();
        String sql =  "Select p.*,c.EmployeeName from Shifts p left join Employee c on p.EmployeeID = c.EmployeeID WHERE P.EmployeeID = ?  ";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
           ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                WorkSheetDTO p = new WorkSheetDTO();
                p.setShiftid(rs.getInt(1));
                p.setStarttime(rs.getTime(2));
                p.setStartdate(rs.getDate(3));
                p.setEndtime(rs.getTime(4));
                p.setEnddate(rs.getDate(5));
                p.setCoefsalary(rs.getFloat(6));
                p.setEmployeerole(rs.getInt(7));
                p.setWorksheetemployeedto(new WorkSheetEmployeeDTO(rs.getInt(8), rs.getString(10)));
                p.setWorkstatus(rs.getInt(9));
                
                
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
   
         public List<WorkSheetDTO> getAll_forguard() {
        List<WorkSheetDTO> list = new ArrayList<>();
        String sql =  "Select p.*,c.EmployeeName from Shifts p left join Employee c on p.EmployeeID = c.EmployeeID WHERE EmployeeRole = 3 ";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                WorkSheetDTO p = new WorkSheetDTO();
                p.setShiftid(rs.getInt(1));
                p.setStarttime(rs.getTime(2));
                p.setStartdate(rs.getDate(3));
                p.setEndtime(rs.getTime(4));
                p.setEnddate(rs.getDate(5));
                p.setCoefsalary(rs.getFloat(6));
                p.setEmployeerole(rs.getInt(7));
                p.setWorksheetemployeedto(new WorkSheetEmployeeDTO(rs.getInt(8), rs.getString(10)));
                p.setWorkstatus(rs.getInt(9));
                
                
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

     
   public List<Employee> getEmployeeinfo(String id) {
       List<Employee> list = new ArrayList<>();
        String sql = "SELECT e.EmployeeID, e.EmployeeName, e.EmployeeAvatar, e.EmployeeAddress, e.Birthday, e.EmployeeSex, e.EmployeePhone, r.RoleName, e.EmployeeStatus FROM Employee e JOIN Roles r ON e.RoleId = r.RoleId WHERE EmployeeID = ? ";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Employee p = new Employee();
                p.setEmployeeID(rs.getInt(1));
                p.setEmployeename(rs.getString(2));
                p.setEmployeeavatar(rs.getString(3));
                p.setEmployeeaddress(rs.getString(4));
                p.setBirthday(rs.getDate(5));
                p.setEmployeesex(rs.getInt(6));
                p.setEmployeephone(rs.getString(7));
                p.setEmprole(new Role(-1, rs.getString(8))); // Assuming the Role class constructor takes (id, name) as parameters
                p.setEmployeestatus(rs.getBoolean(9));
                if (!p.getEmployeeavatar().contains("http")) {
                    p.setEmployeeavatar("./img/" + p.getEmployeeavatar());
                }
                list.add(p);
            }
            return list;
        } catch (SQLException e) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, e);
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

          public String checkemployeeid (String shiftid){
         String employeeId = null;
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    try {
        conn = DBUtils.getConnection();
        String sql = "SELECT EmployeeID FROM Shifts WHERE ShiftID = ? ";
        ps = conn.prepareStatement(sql);
        ps.setString(1, shiftid);
        rs = ps.executeQuery();
         if (rs.next()) {
             employeeId = rs.getString("EmployeeID");
        }
        
    } catch (SQLException e) {
        // Xử lý ngoại lệ
        e.printStackTrace();
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
    return employeeId;
    
  }
    
    public boolean Delete (String shiftid)
            throws SQLException, SQLException {
        Connection con = null;
        PreparedStatement stm = null; // phải = null
        boolean result = false;
        try {
            //1. Connect DB
            con = DBUtils.getConnection();
            if (con != null) {

                //2. Write SQL command
                String sql = "UPDATE Shifts SET EmployeeID = NULL, WorkStatus = 2  WHERE ShiftID = ?";
                //3. Create Statement Object
                stm = con.prepareStatement(sql); //Nạp tham số 1 lần cho Statement
                stm.setString(1, shiftid);
               
                
                //4. Execute Statement Object to get result
                int effectRow = stm.executeUpdate();
                //Nạp tham số 1 lần cho Statement
                //5. Process result
                if (effectRow > 0) {
                    result = true;
                }

            } //end connection has existed
        } catch (SQLException e) {
        } finally {

            if (stm != null) {
                stm.close();  // tạo sau nên đóng trước
            }
            if (con != null) {
                con.close();
            }
        }
        return result;

    }
    
      public boolean Create (
      String starttimeemf, String starttimeems, String starttimeemt, String starttimeguardf, String starttimeguards, String startdate, String enddate){
      Connection conn = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        PreparedStatement ps3 = null;
        PreparedStatement ps4 = null;
        PreparedStatement ps5 = null;
       
        ResultSet rs = null;
        boolean result = false;
        try {
            conn = DBUtils.getConnection();
            String sql1 = "INSERT INTO Shifts(StartTime, StartDate, EndTime, EndDate, CoefSalary, EmployeeRole, EmployeeID, WorkStatus) " +
                    "VALUES ( ?, ?, ?, ?, 1, 2, NULL, 2)";
            String sql2 = "INSERT INTO Shifts(StartTime, StartDate, EndTime, EndDate, CoefSalary, EmployeeRole, EmployeeID, WorkStatus) " +
                    "VALUES ( ?, ?, ?, ?, 1, 2, NULL, 2)";
            String sql3 = "INSERT INTO Shifts(StartTime, StartDate, EndTime, EndDate, CoefSalary, EmployeeRole, EmployeeID, WorkStatus) " +
                    "VALUES ( ?, ?, ?, ?, 1.5, 2, NULL, 2)";
            
            String sql4 = "INSERT INTO Shifts(StartTime, StartDate, EndTime, EndDate, CoefSalary, EmployeeRole, EmployeeID, WorkStatus) " +
                    "VALUES ( ?, ?, ?, ?, 1, 3, NULL, 2)";
            String sql5 = "INSERT INTO Shifts(StartTime, StartDate, EndTime, EndDate, CoefSalary, EmployeeRole, EmployeeID, WorkStatus) " +
                    "VALUES ( ?, ?, ?, ?, 1.5, 3, NULL, 2)";
      
                    
            ps1 = conn.prepareStatement(sql1);
            ps2 = conn.prepareStatement(sql2);
            ps3 = conn.prepareStatement(sql3);
             ps4 = conn.prepareStatement(sql4);
              ps5 = conn.prepareStatement(sql5);
              // nhân viên
                ps1.setString(1,starttimeemf);
                ps1.setString(2,startdate);
                ps1.setString(3,starttimeems);
                ps1.setString(4,startdate);
                
                 ps2.setString(1,starttimeems);
                  ps2.setString(2,startdate);
                   ps2.setString(3,starttimeemt);
                    ps2.setString(4,startdate);
                    
                    ps3.setString(1,starttimeemt);
                    ps3.setString(2,startdate);
                    ps3.setString(3,starttimeemf);
                    ps3.setString(4,enddate);
                    
                    // bảo vệ
                
                  ps4.setString(1,starttimeguardf);
                ps4.setString(2,startdate);
                ps4.setString(3,starttimeguards);
                ps4.setString(4,startdate);
                
                 ps5.setString(1,starttimeguards);
                  ps5.setString(2,startdate);
                   ps5.setString(3,starttimeguardf);
                    ps5.setString(4,enddate);
                
                
              ps1.executeUpdate();
             ps2.executeUpdate();
             ps3.executeUpdate();
               ps4.executeUpdate();
                 ps5.executeUpdate();
//            System.out.println("Ban da thuc thi" +sql1);
      
                result = true;
        } catch (SQLException e) {
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (ps1 != null) {
                try {
                    ps1.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
             if (ps2 != null) {
                try {
                    ps2.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
              if (ps3 != null) {
                try {
                    ps3.close();
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
        return result;
    }

public boolean Deleteall(String shiftid)
     throws SQLException, SQLException {
        Connection con = null;
        PreparedStatement stm = null; // phải = null
        boolean result = false;
        try {
            //1. Connect DB
            con = DBUtils.getConnection();
            if (con != null) {

                //2. Write SQL command
                String sql = "DELETE from Shifts WHERE ShiftID = ?";
                //3. Create Statement Object
                stm = con.prepareStatement(sql); //Nạp tham số 1 lần cho Statement
                stm.setString(1, shiftid);
               
                
                //4. Execute Statement Object to get result
                int effectRow = stm.executeUpdate();
                //Nạp tham số 1 lần cho Statement
                //5. Process result
                if (effectRow > 0) {
                    result = true;
                }

            } //end connection has existed
        } catch (SQLException e) {
        } finally {

            if (stm != null) {
                stm.close();  // tạo sau nên đóng trước
            }
            if (con != null) {
                con.close();
            }
        }
        return result;

    }
public List<Employee> getAllemployee(String employeerole) {
       List<Employee> list = new ArrayList<>();
        String sql = "SELECT e.EmployeeID, e.EmployeeName, e.EmployeeAvatar, e.EmployeeAddress, e.Birthday, e.EmployeeSex, e.EmployeePhone, r.RoleName, e.EmployeeStatus FROM Employee e JOIN Roles r ON e.RoleId = r.RoleId WHERE r.RoleId = ? ";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, employeerole);
            rs = ps.executeQuery();
            while (rs.next()) {
                Employee p = new Employee();
                p.setEmployeeID(rs.getInt(1));
                p.setEmployeename(rs.getString(2));
                p.setEmployeeavatar(rs.getString(3));
                p.setEmployeeaddress(rs.getString(4));
                p.setBirthday(rs.getDate(5));
                p.setEmployeesex(rs.getInt(6));
                p.setEmployeephone(rs.getString(7));
                p.setEmprole(new Role(-1, rs.getString(8))); // Assuming the Role class constructor takes (id, name) as parameters
                p.setEmployeestatus(rs.getBoolean(9));
                if (!p.getEmployeeavatar().contains("http")) {
                    p.setEmployeeavatar("./img/" + p.getEmployeeavatar());
                }
                list.add(p);
            }
            return list;
        } catch (SQLException e) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, e);
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


public boolean addEmployee(String employeeid, String shiftid){
   Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            conn = DBUtils.getConnection();
            String sql = "UPDATE Shifts SET EmployeeID = ?, WorkStatus = 1 WHERE ShiftID = ?";
            ps = conn.prepareStatement(sql);
           
              // nhân viên
                ps.setString(1,employeeid);
                ps.setString(2,shiftid);
                int rowsAffected = ps.executeUpdate();
        if (rowsAffected > 0) {
            result = true;
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
        return result;
    
}
public List<WorkSheetDTO> searchbydate(String startdate, String enddate){
    List<WorkSheetDTO> list = new ArrayList<>();
       
        String sql =  "Select p.*,c.EmployeeName from Shifts p left join Employee c on p.EmployeeID = c.EmployeeID WHERE  StartDate >= ? AND EndDate <= ? ";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, startdate);  // Gán giá trị cho tham số startdate
            ps.setString(2, enddate);  
            rs = ps.executeQuery();
            while (rs.next()) {
                WorkSheetDTO p = new WorkSheetDTO();
                p.setShiftid(rs.getInt(1));
                p.setStarttime(rs.getTime(2));
                p.setStartdate(rs.getDate(3));
                p.setEndtime(rs.getTime(4));
                p.setEnddate(rs.getDate(5));
                p.setCoefsalary(rs.getFloat(6));
                p.setEmployeerole(rs.getInt(7));
                p.setWorksheetemployeedto(new WorkSheetEmployeeDTO(rs.getInt(8), rs.getString(10)));
                p.setWorkstatus(rs.getInt(9));
                
                
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
public List<WorkSheetDTO> searchbydate_forsales (String startdate, String enddate, int id){
    List<WorkSheetDTO> list = new ArrayList<>();
       
        String sql =  "Select p.*,c.EmployeeName from Shifts p left join Employee c on p.EmployeeID = c.EmployeeID WHERE  StartDate >= ? AND EndDate <= ? AND p.EmployeeID = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, startdate);  // Gán giá trị cho tham số startdate
            ps.setString(2, enddate);  
            ps.setInt(3, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                WorkSheetDTO p = new WorkSheetDTO();
                p.setShiftid(rs.getInt(1));
                p.setStarttime(rs.getTime(2));
                p.setStartdate(rs.getDate(3));
                p.setEndtime(rs.getTime(4));
                p.setEnddate(rs.getDate(5));
                p.setCoefsalary(rs.getFloat(6));
                p.setEmployeerole(rs.getInt(7));
                p.setWorksheetemployeedto(new WorkSheetEmployeeDTO(rs.getInt(8), rs.getString(10)));
                p.setWorkstatus(rs.getInt(9));
                
                
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

public WorkSheetDTO getbyid(String id) {
        String sql = "SELECT ShiftID, StartTime, StartDate, EndTime, EndDate, CoefSalary FROM Shifts Where ShiftID = ? ";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                WorkSheetDTO p = new WorkSheetDTO();
              p.setShiftid(rs.getInt(1));
              p.setStarttime(rs.getTime(2));
              p.setStartdate(rs.getDate(3));
              p.setEndtime(rs.getTime(4));
              p.setEnddate(rs.getDate(5));
              p.setCoefsalary((rs.getFloat(6)));
               
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

 public void update (String shiftid, String starttime, String startdate, String endtime, String enddate, String coefsalary) {
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
       String sql = "UPDATE Shifts SET StartTime = ?, StartDate = ? , EndTime = ? ,EndDate = ?, CoefSalary = ?  WHERE ShiftID = ?";
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
          
            ps.setString(1, starttime);
            ps.setString(2, startdate);
            ps.setString(3, endtime);
            ps.setString(4, enddate);
            ps.setString(5, coefsalary);
            ps.setString(6, shiftid);
            
          
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
   public boolean isDuplicateDate(String startdate, String enddate) {
    boolean isDuplicate = false;
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    try {
        conn = DBUtils.getConnection();
        String sql = "SELECT COUNT(*) FROM Shifts WHERE StartDate = ? AND EndDate = ? ";
        ps = conn.prepareStatement(sql);
        ps.setString(1, startdate);
        ps.setString(2, enddate);
        rs = ps.executeQuery();
        if (rs.next()) {
            int count = rs.getInt(1);
            if (count > 0) {
                isDuplicate = true;
            }
        }
    } catch (SQLException e) {
        // Xử lý ngoại lệ
        e.printStackTrace();
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
    return isDuplicate;
}
   }
   public boolean RemoveUserFromShifts (String employeeid)
            throws SQLException, SQLException {
       
        Connection con = null;
        PreparedStatement stm = null; // phải = null
        boolean result = false;
        try {
            //1. Connect DB
            con = DBUtils.getConnection();
            if (con != null) {

                //2. Write SQL command
                String sql = "UPDATE Shifts SET EmployeeID = NULL, WorkStatus = 2  WHERE EmployeeID = ? AND WorkStatus = 1 ";
                //3. Create Statement Object
                stm = con.prepareStatement(sql); //Nạp tham số 1 lần cho Statement
                stm.setString(1, employeeid);
               
                
                //4. Execute Statement Object to get result
                int effectRow = stm.executeUpdate();
                //Nạp tham số 1 lần cho Statement
                //5. Process result
                if (effectRow > 0) {
            result = true;
}
                  } //end connection has existed
        } catch (SQLException e) {
        } finally {

            if (stm != null) {
                stm.close();  // tạo sau nên đóng trước
            }
            if (con != null) {
                con.close();
            }
        }
        return result;

    }
}





