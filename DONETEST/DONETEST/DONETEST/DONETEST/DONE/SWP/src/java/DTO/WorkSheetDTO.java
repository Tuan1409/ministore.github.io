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
import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author Vuong
 */
public class WorkSheetDTO {
  private int shiftid;
    private Time starttime;
    private Date startdate;
    private Time endtime;
    private Date enddate;
    private float coefsalary;
    private int employeerole;
    private WorkSheetEmployeeDTO  worksheetemployeedto;
    private int workstatus;
    
    private String roleemployeename;

public WorkSheetDTO() {
    }

    public WorkSheetDTO(int shiftid, Time starttime, Date startdate, Time endtime, Date enddate, float coefsalary, int employeerole, WorkSheetEmployeeDTO worksheetemployeedto, int workstatus, String roleemployeename) {
        this.shiftid = shiftid;
        this.starttime = starttime;
        this.startdate = startdate;
        this.endtime = endtime;
        this.enddate = enddate;
        this.coefsalary = coefsalary;
        this.employeerole = employeerole;
        this.worksheetemployeedto = worksheetemployeedto;
        this.workstatus = workstatus;
        this.roleemployeename = roleemployeename;
    }

    public int getShiftid() {
        return shiftid;
    }

    public void setShiftid(int shiftid) {
        this.shiftid = shiftid;
    }

    public Time getStarttime() {
        return starttime;
    }

    public void setStarttime(Time starttime) {
        this.starttime = starttime;
    }

    public Date getStartdate() {
        return startdate;
    }

    public void setStartdate(Date startdate) {
        this.startdate = startdate;
    }

    public Time getEndtime() {
        return endtime;
    }

    public void setEndtime(Time endtime) {
        this.endtime = endtime;
    }

    public Date getEnddate() {
        return enddate;
    }

    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }

    public float getCoefsalary() {
        return coefsalary;
    }

    public void setCoefsalary(float coefsalary) {
        this.coefsalary = coefsalary;
    }

    public int getEmployeerole() {
        return employeerole;
    }

    public void setEmployeerole(int employeerole) {
        this.employeerole = employeerole;
    }

    public WorkSheetEmployeeDTO getWorksheetemployeedto() {
        return worksheetemployeedto;
    }

    public void setWorksheetemployeedto(WorkSheetEmployeeDTO worksheetemployeedto) {
        this.worksheetemployeedto = worksheetemployeedto;
    }

    public int getWorkstatus() {
        return workstatus;
    }

    public void setWorkstatus(int workstatus) {
        this.workstatus = workstatus;
    }

    public String getRoleemployeename() {
        return roleemployeename;
    }

    public void setRoleemployeename(String roleemployeename) {
        this.roleemployeename = roleemployeename;
    }

    
    
}