/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author Vuong
 */
public class ShiftDTO {
      private int ShiftID;
    private String StartTime;
    private String EndTime;
    private String ShiftDate;
    private double CoefSalary;
    private String RoleEmployee;

 public ShiftDTO() {
    }

    public ShiftDTO(int ShiftID, String StartTime, String EndTime, String ShiftDate, double CoefSalary, String RoleEmployee) {
        this.ShiftID = ShiftID;
        this.StartTime = StartTime;
        this.EndTime = EndTime;
        this.ShiftDate = ShiftDate;
        this.CoefSalary = CoefSalary;
        this.RoleEmployee = RoleEmployee;
    }

    public int getShiftID() {
        return ShiftID;
    }

    public void setShiftID(int ShiftID) {
        this.ShiftID = ShiftID;
    }

    public String getStartTime() {
        return StartTime;
    }

    public void setStartTime(String StartTime) {
        this.StartTime = StartTime;
    }

    public String getEndTime() {
        return EndTime;
    }

    public void setEndTime(String EndTime) {
        this.EndTime = EndTime;
    }

    public String getShiftDate() {
        return ShiftDate;
    }

    public void setShiftDate(String ShiftDate) {
        this.ShiftDate = ShiftDate;
    }

    public double getCoefSalary() {
        return CoefSalary;
    }

    public void setCoefSalary(double CoefSalary) {
        this.CoefSalary = CoefSalary;
    }

    public String getRoleEmployee() {
        return RoleEmployee;
    }

    public void setRoleEmployee(String RoleEmployee) {
        this.RoleEmployee = RoleEmployee;
    }

}