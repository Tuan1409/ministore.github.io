/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author DELL
 */
public class AttendanceDAO {

    public void TakeAttendance(String date, String time, String employeeID, String leaveShift, String button) {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null && button.equals("CHECK IN")) {
                ptm = conn.prepareStatement("INSERT INTO Attendance(CheckInDate, CheckInTime, EmployeeID, ShiftID) VALUES(?, ?, ?, ?)");
                ptm.setString(1, date);
                ptm.setString(2, time);
                ptm.setString(3, employeeID);
                ptm.setString(4, leaveShift);
                rs = ptm.executeQuery();
            }
            if (conn != null && button.equals("CHECK OUT")) {
                ptm = conn.prepareStatement("UPDATE Attendance SET CheckOutDate = ?, CheckOutTime = ? WHERE ShiftID = ?");
                ptm.setString(1, date);
                ptm.setString(2, time);
                ptm.setString(3, leaveShift);
                rs = ptm.executeQuery();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}