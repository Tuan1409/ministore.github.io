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
import java.sql.Date;
import java.sql.Time;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vuong
 */
public class WorkSheet_create extends HttpServlet {

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
            out.println("<title>Servlet WorkSheet_create</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet WorkSheet_create at " + request.getContextPath() + "</h1>");
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
        String starttimeemf = request.getParameter("txtStarttimeemf");
        String starttimeems = request.getParameter("txtStarttimeems");
        String starttimeemt = request.getParameter("txtStarttimeemt");
         String starttimeguardf = request.getParameter("txtStarttimeguardf");
        String starttimeguards = request.getParameter("txtStarttimeguards");
        String startdate = request.getParameter("txtStartdate");
        String enddate = request.getParameter("txtEnddate");
//        System.out.println(starttimeemf);
//        System.out.println(starttimeems);
//        System.out.println(starttimeemt);
//        System.out.println(starttimeguardf);
//        System.out.println(starttimeguards);
//        System.out.println(startdate);
//        System.out.println(enddate);
       





// kiểm tra date để trống
         if (startdate=="" || enddate ==""){
        request.setAttribute("messageerror", "Tạo thất bại, date không được để trống");
        request.getRequestDispatcher("WorkSheet_create.jsp").forward(request, response);
         }
        
        
        LocalDate startdater = LocalDate.parse(startdate);
LocalDate enddater = LocalDate.parse(enddate);
// kiểm tra hiệu giữa 2 ngày liên tiếp
long diffInDays = ChronoUnit.DAYS.between(startdater, enddater);
//System.out.println("Hiệu giữa hai ngày là: " + diffInDays + " ngày");


String hourString1 = starttimeemf.substring(0, 2);
String hourString2 = starttimeems.substring(0, 2);
String hourString3 = starttimeemt.substring(0, 2);
String hourString4 = starttimeguardf.substring(0, 2);
String hourString5 = starttimeguards.substring(0, 2);

int hour1 = Integer.parseInt(hourString1);
int hour2 = Integer.parseInt(hourString2);
int hour3 = Integer.parseInt(hourString3);
int hour4 = Integer.parseInt(hourString4);
int hour5 = Integer.parseInt(hourString5);

     // kiểm tra giờ tăng dần
if (hour1 >= hour2 || hour2 >= hour3 || hour1>=hour3 || hour4 >= hour5) {
             request.setAttribute("messageerror", "Tạo thất bại, vui lòng nhập thời gian tăng dần");
        request.getRequestDispatcher("WorkSheet_create.jsp").forward(request, response);
        } 
// check trùng lặp ngày đã tạo
         WorkSheetDAO dao = new WorkSheetDAO();
        boolean checkisduplicate = dao.isDuplicateDate(startdate, enddate);
        System.out.println(checkisduplicate);
        if (checkisduplicate){
             request.setAttribute("messageerror", "Tạo thất bại, ca làm việc này đã có sẵn");
        request.getRequestDispatcher("WorkSheet_create.jsp").forward(request, response);
        }else{
        // điều kiện hiệu 2 ngày liên tiếp = 1
        if (diffInDays==1){
            boolean result = dao.Create(starttimeemf,starttimeems,starttimeemt,starttimeguardf,starttimeguards,startdate,enddate);
                    if (result){
            request.setAttribute("message", "Đã tạo thành công");
        request.getRequestDispatcher("WorkSheet_create.jsp").forward(request, response);
         }
        }else{
             request.setAttribute("messageerror", "Tạo thất bại, vui lòng chỉ chọn 1 ngày liên tiếp");
        request.getRequestDispatcher("WorkSheet_create.jsp").forward(request, response);
        }
        }
    }
        
       
        
        

            
        
//        System.out.println(starttimeemf);
//        System.out.println(starttimeems);
//        System.out.println(starttimeemt);
//        System.out.println(starttimeguardf);
//        System.out.println(starttimeguards);
//        System.out.println(startdate);
//        System.out.println(enddate);
        
//        WorkSheetDAO dao = new WorkSheetDAO();
//        boolean result = dao.Create(starttimeemf,starttimeems,starttimeemt,starttimeguardf,starttimeguards,startdate,enddate);
//        if (result){
//            response.sendRedirect("WorkSheet_create.jsp");
        
       
        


//         request.getRequestDispatcher("WorkSheet.jsp").forward(request, response);
    

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
        processRequest(request, response);
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
