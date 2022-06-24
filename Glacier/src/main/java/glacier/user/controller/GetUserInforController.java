/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.user.controller;

import glacier.user.model.Account;
import glacier.user.model.GoogleUser;
import glacier.user.model.Landlord;
import glacier.user.model.Tenant;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "GetUserInforController", urlPatterns = {"/information"})
public class GetUserInforController extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        try {
            
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            String gender = request.getParameter("gender");
            String role = request.getParameter("role").toLowerCase();
            String phone = request.getParameter("phone");
            
            String status = "active";
            boolean checkInsertUser = false;
            UserManager manager = new UserManager();
            HttpSession ss = request.getSession();
            GoogleUser user = (GoogleUser) ss.getAttribute("GOOGLE_USER");
            String image = user.getPicture();
            Account acc = new Account(email, null, role);
            boolean checkInsertAccount = manager.insertGoogleAccount(email, role);
            if (checkInsertAccount) {
                ss.removeAttribute("GOOGLE_USER");
                if ("tenant".equals(role)) {
                    Tenant t = new Tenant(email, name, status, gender, phone,image);
                    checkInsertUser = manager.insertUser(t, null);
                    if (checkInsertUser) {
                        ss.setAttribute("LOGIN_USER", acc);
                        ss.setAttribute("USER_DETAIL", t);
                        response.sendRedirect("home");
                        return;
                    }
                } else {
                    Landlord l = new Landlord(email, name, gender, phone,image);
                    checkInsertUser = manager.insertUser(null, l);
                    if (checkInsertUser) {
                        ss.setAttribute("LOGIN_USER", acc);
                        ss.setAttribute("USER_DETAIL", l);
                        response.sendRedirect("home");   
                        return;
                    }
                }
            }
        } catch (Exception e) {
            log("Error at GetUserInforController: "+e.toString());
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
