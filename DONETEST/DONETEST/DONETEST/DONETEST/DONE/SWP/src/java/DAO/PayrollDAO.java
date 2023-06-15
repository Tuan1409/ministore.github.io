/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.Application;
import DTO.Payroll;
import Utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DELL
 */
public class PayrollDAO {

    public List<Payroll> ShowPayroll() throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<Payroll> list = new ArrayList<>();

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement("UPDATE Attendance\n"
                        + "SET LateTime = DATEDIFF(MINUTE, CONVERT(DATETIME, T1.CheckInTime), CONVERT(DATETIME, T2.StartTime))\n"
                        + "FROM Attendance T1\n"
                        + "JOIN Shifts T2 ON T1.ShiftID = T2.ShiftID\n"
                        + "\n"
                        + "UPDATE Attendance\n"
                        + "SET SoonTime = DATEDIFF(MINUTE, CONVERT(DATETIME, T2.EndTime), CONVERT(DATETIME, T1.CheckOutTime))\n"
                        + "FROM Attendance T1\n"
                        + "JOIN Shifts T2 ON T1.ShiftID = T2.ShiftID");
                rs = ptm.executeQuery();

                ptm = conn.prepareStatement("UPDATE Attendance\n"
                        + "SET Attendance.ShiftComplete = 1\n"
                        + "FROM Attendance\n"
                        + "JOIN Shifts ON Attendance.ShiftID = Shifts.ShiftID AND Attendance.CheckInDate = Shifts.StartDate\n"
                        + "WHERE Attendance.LateTime > -10\n"
                        + "AND Attendance.SoonTime > -10");
                rs = ptm.executeQuery();

                ptm = conn.prepareStatement("UPDATE Payroll\n"
                        + "SET Salary = (\n"
                        + "    SELECT CAST(SUM(CAST(s.CoefSalary AS float)) AS float)\n"
                        + "    FROM Attendance a\n"
                        + "    INNER JOIN Shifts s ON a.ShiftID = s.ShiftID\n"
                        + "    WHERE a.ShiftComplete = 1\n"
                        + "      AND a.EmployeeID = Payroll.EmployeeID\n"
                        + ")");
                rs = ptm.executeQuery();

                ptm = conn.prepareStatement("SELECT A.EmployeeID, A.EmployeeName, B.Salary\n"
                        + "FROM Employee A\n"
                        + "JOIN Payroll B ON A.EmployeeID = B.EmployeeID");
                rs = ptm.executeQuery();

                while (rs.next()) {
                    int e = rs.getInt("EmployeeID");
                    String f = rs.getString("EmployeeName");
                    int g = rs.getInt("Salary");
                    list.add(new Payroll(e, f, g));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            };
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
}