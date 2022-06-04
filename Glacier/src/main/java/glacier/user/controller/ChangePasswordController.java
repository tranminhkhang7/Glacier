/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.user.controller;

import glacier.user.model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "ChangePasswordController", urlPatterns = {"/changepassword"})
public class ChangePasswordController extends HttpServlet {

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
        try {
            HttpSession ss = request.getSession();
            Account user = (Account) ss.getAttribute("LOGIN_USER");
            String role = user.getRole();
            if ("tenant".equals(role.trim())) {
                String email = user.getEmail();
                String correctPassword = user.getPassword();
                String oldPassword = request.getParameter("current_password");
                String newPassword = request.getParameter("new_current_password");
                String confirmPassword = request.getParameter("repeat_new_current_password");
                UserManager manager = new UserManager();
                if (correctPassword == null || oldPassword == null || newPassword == null || confirmPassword == null) {
                    RequestDispatcher rd = request.getRequestDispatcher("change-password.jsp");
                    rd.forward(request, response);
                } else if (!correctPassword.equals(oldPassword) || !newPassword.equals(confirmPassword)) {
                    request.setAttribute("error", "Mật khẩu không đúng. Vui lòng thử lại.");
                    RequestDispatcher rd = request.getRequestDispatcher("change-password.jsp");
                    rd.forward(request, response);
                } else if (newPassword.trim().length() < 5 || newPassword.trim().length() > 30) {
                    request.setAttribute("error", "Sai ràng buộc mật khẩu. Mật khẩu phải có 6-30 ký tự.");
                    RequestDispatcher rd = request.getRequestDispatcher("change-password.jsp");
                    rd.forward(request, response);
                } else {
                    boolean check = manager.changeTenantPassword(email, newPassword);
                    if (check) {
                        request.setAttribute("success", "Đổi mật khẩu thành công.");
                        RequestDispatcher rd = request.getRequestDispatcher("change-password.jsp");
                        rd.forward(request, response);
                    }
                }
            } else if ("landlord".equals(role.trim())) {
                String email = user.getEmail();
                String correctPassword = user.getPassword();
                String oldPassword = request.getParameter("current_password");
                String newPassword = request.getParameter("new_current_password");
                String confirmPassword = request.getParameter("repeat_new_current_password");
                UserManager manager = new UserManager();
                if (correctPassword == null || oldPassword == null || newPassword == null || confirmPassword == null) {
                    RequestDispatcher rd = request.getRequestDispatcher("landlord-change-password.jsp");
                    rd.forward(request, response);
                } else if (!correctPassword.equals(oldPassword) || !newPassword.equals(confirmPassword)) {
                    request.setAttribute("error", "Mật khẩu không đúng. Vui lòng thử lại.");
                    RequestDispatcher rd = request.getRequestDispatcher("landlord-change-password.jsp");
                    rd.forward(request, response);
                } else if (newPassword.trim().length() < 5 || newPassword.trim().length() > 30) {
                    request.setAttribute("error", "Sai ràng buộc mật khẩu. Mật khẩu phải có 6-30 ký tự.");
                    RequestDispatcher rd = request.getRequestDispatcher("landlord-change-password.jsp");
                    rd.forward(request, response);
                } else {
                    boolean check = manager.changeLandlordPassword(email, newPassword);
                    if (check) {
                        request.setAttribute("success", "Đổi mật khẩu thành công.");
                        RequestDispatcher rd = request.getRequestDispatcher("landlord-change-password.jsp");
                        rd.forward(request, response);
                    }
                }
            }

        } catch (Exception e) {
            log("Error at ChangePasswordController: " + e.toString());
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
