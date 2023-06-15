/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import DAO.WorkSheetDAO;
import DTO.WorkSheetDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vuong
 */
public class WorkSheet_update extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet WorkSheet_update</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet WorkSheet_update at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String shiftid = request.getParameter("shiftid");
        String starttime = request.getParameter("starttime");
        String startdate = request.getParameter("startdate");
        String endtime = request.getParameter("endtime");
        String enddate = request.getParameter("enddate");
        String coefsalary = request.getParameter("coefsalary");
       


LocalDate startDateObj = LocalDate.parse(startdate);
LocalDate endDateObj = LocalDate.parse(enddate);
LocalTime startTimeObj = LocalTime.parse(starttime);
LocalTime endTimeObj = LocalTime.parse(endtime);





 
if (startTimeObj.equals(endTimeObj) && startDateObj.equals(endDateObj) ) {
     

response.setContentType("text/html;charset=UTF-8");
PrintWriter out = response.getWriter();
out.println("<script>");

out.println("alert('Định dạng ngày giờ bị sai');");
out.println("window.history.back();");
out.println("</script>");
}

        
       else if (startDateObj.isAfter(endDateObj) ) {
     

response.setContentType("text/html;charset=UTF-8");
PrintWriter out = response.getWriter();
out.println("<script>");

out.println("alert('Định dạng ngày bị sai');");
out.println("window.history.back();");
out.println("</script>");


        
    
        }else{
 
//    
         WorkSheetDAO dao = new WorkSheetDAO();
        dao.update(shiftid,starttime,startdate,endtime,enddate,coefsalary);
         List<WorkSheetDTO> dto = dao.getAll();
        request.setAttribute("LIST",dto);
        request.getRequestDispatcher("WorkSheet.jsp").forward(request, response);

    }


    }


    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
