/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control;

import DAO.CategoryDAO;
import DAO.EmployeeDAO;
import DAO.ProductDAO;
import DAO.RoleDAO;
import DTO.Category;
import DTO.Employee;
import DTO.Product;
import DTO.Role;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author kienb
 */
public class LoadUserbyID extends HttpServlet {

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
            String id = request.getParameter("id");
            EmployeeDAO pdo = new EmployeeDAO();
            Employee e = pdo.getEmployeeByID(id);
            RoleDAO cdo = new RoleDAO();
            List<Role> role = cdo.getAll();
          
            /* TODO output your page here. You may use following sample code. */
             out.print("<form action=\"updateuser\" method=\"POST\" id=\"updateusers\">\n"
                        + "                            <div class=\"row\">\n"
                        + "                                <div class=\"form-group col-md-6\">\n"
                        + "                                    <label class=\"control-label\">ID Nhân viên </label>\n"
                        + "                                    <input readonly=\"true\" class=\"form-control\" type=\"text\" name=\"id\" value=\"" + e.getEmployeeID() + "\" >\n"
                        + "                                </div>\n"
                        + "                                <div class=\"form-group col-md-6\">\n"
                        + "                                    <label class=\"control-label\">Tên nhân viên</label>\n"
                        + "                                    <input class=\"form-control\" type=\"text\" required name=\"name\" value=\"" + e.getEmployeename() + "\" >\n"
                        + "                                </div>\n"
                        + "                                <div class=\"form-group col-md-6\">\n"
                        + "                                    <label class=\"control-label\">Địa chỉ</label>\n"
                        + "                                    <input class=\"form-control\" type=\"text\" name=\"address\" value=\"" + e.getEmployeeaddress() + "\" >\n"
                        + "                                </div>\n"
                        + "                                   <div class=\"form-group col-md-6\">\n"
                        + "                                    <label class=\"control-label\">Ngày Sinh </label>\n"
                        + "                                    <input  class=\"form-control\" type=\"date\" name=\"birthday\" value=\"" + e.getBirthday() + "\" >\n"
                        + "                                </div>\n"
                        + "                                <div class=\"form-group col-md-6\">\n"
                        + "                                    <label class=\"control-label\">Giới tính(1:Nam 2: Nữ)</label>\n"
                        + "                                    <input class=\"form-control\" type=\"number\" name=\"sex\" value=\"" + e.getEmployeesex() + "\" >\n"
                        + "                                </div>\n"
                        + "                                <div class=\"form-group col-md-6\">\n"
                        + "                                    <label class=\"control-label\">SĐT</label>\n"
                        + "                                    <input class=\"form-control\" type=\"number\" name=\"phone\" value=\"" + e.getEmployeephone() + "\" >\n"
                        + "                                </div>\n"
                       + "                                <div class=\"form-group col-md-6\">\n"
                    + "                                    <label for=\"exampleSelect1\" class=\"control-label\">Chức vụ</label>\n"
                    + "                                    <select class=\"form-control\" name=\"role\">\n");
            for (Role i : role) {
                if (i.getId() == e.getEmprole().getId()) {
                    out.println("<option selected value=\"" + i.getId() + "\">" + i.getName() + "</option>");
                } else {
                    out.println("<option value=\"" + i.getId() + "\">" + i.getName() + "</option>");
                }
            }
            out.println("                                    </select>\n");
            out.println("                                </div>\n"
                        + "                            </div>\n"
                        + "                            <BR>\n"
                        + "                            <BR>\n"
                        + "                            <BR>\n"
                        + "                            <button class=\"btn btn-save\" type=\"submit\">Lưu lại</button>\n"
                        + "                            <a class=\"btn btn-cancel\" data-dismiss=\"modal\" href=\"#\">Hủy bỏ</a>\n"
                        + "                            <BR>\n"
                        + "                        </form>");
          
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
