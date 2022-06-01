/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.user.controller;

import glacier.user.model.Account;
import glacier.user.model.Landlord;
import glacier.user.model.Tenant;
import glacier.user.model.UserSession;
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
@WebServlet(name = "UserVerify", urlPatterns = {"/verify"})
public class UserVerify extends HttpServlet {

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
            String action = request.getParameter("action");
            String id = request.getParameter("id");
            String key = request.getParameter("key");

            HttpSession ss = request.getSession();
            UserManager manager = new UserManager();
            UserSession user = (UserSession) ss.getAttribute("USER_SESSION");
            String email = user.getEmail();
            String name = user.getName();
            String phone = user.getPhone();
            String password = user.getPassword();
            String gender = user.getGender();
            String status = user.getStatus();
            String role = user.getRole().toLowerCase();

            String refId = user.getId();
            String refKey = user.getKey();

            boolean checkInsertUser = false;
            if (id.equals(refId) && key.equals(refKey)) {
                Account acc = new Account(email, password, role);
                boolean checkInsert = manager.insertAccount(acc);
                if (checkInsert) {
                    if ("tenant".equals(role)) {
                        Tenant t = new Tenant(email, name, status, gender, phone);
                        checkInsertUser = manager.insertUser(t, null);
                        if (checkInsertUser) {
                            ss.setAttribute("LOGIN_USER", acc);
                            ss.setAttribute("USER_DETAIL", t);
                            ss.removeAttribute("USER_SESSION");
                            response.sendRedirect("success.jsp");
                            return;
                        }
                    } else {
                        Landlord l = new Landlord(email, name, gender, phone);
                        checkInsertUser = manager.insertUser(null, l);
                        if (checkInsertUser) {
                            ss.setAttribute("LOGIN_USER", acc);
                            ss.setAttribute("USER_DETAIL", l);
                            ss.removeAttribute("USER_SESSION");
                            response.sendRedirect("success.jsp");
                            return;
                        }
                    }
                } else {
                    request.setAttribute("IS_VERIFIED", false);
                    //errors.put("ERROR_MSG", "Cannot insert");
                    request.setAttribute("ERROR_REGISTER", "Cannot insert");
                    request.getRequestDispatcher("verify.jsp").forward(request, response);
                    return;
                }
            } else {
                request.setAttribute("IS_VERIFIED", false);
                request.getRequestDispatcher("verify.jsp").forward(request, response);
                return;
            }

        } catch (Exception e) {
            log("Error at UserVerify: " + e.toString());
        }
        request.setAttribute("IS_VERIFIED", false);
        request.getRequestDispatcher("verify.jsp").forward(request, response);
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
