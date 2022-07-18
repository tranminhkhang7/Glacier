/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.user.controller;

import glacier.user.model.Account;
import glacier.user.model.Landlord;
import glacier.user.model.Tenant;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

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
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String remember = request.getParameter("remember");
            if ("1".equals(remember)) {
                Cookie u = new Cookie("userid", email);
                Cookie p = new Cookie("pass", password);
                u.setMaxAge(60);
                p.setMaxAge(60);
                response.addCookie(u);
                response.addCookie(p);
            }
            UserManager manager = new UserManager();
            Account acc = manager.checkLogin(email.trim(), password);
            HttpSession ss = request.getSession();
            if (acc != null) {
                String role = acc.getRole();
                if ("tenant".equals(role)) {
                    Tenant t = manager.getTenantInfo(email);
                    if (t != null) {
                        if (!"disabled".equals(t.getStatus().trim())) {
                            ss.setAttribute("LOGIN_USER", acc);
                            ss.setAttribute("USER_DETAIL", t);
                            response.sendRedirect("./home");
                            return;
                        }
                    }
                } else if ("landlord".equals(role)) {
                    Landlord l = manager.getLandlordInfo(email);
                    if (l != null) {
                        if (!"disabled".equals(l.getStatus().trim())) {
                            ss.setAttribute("LOGIN_USER", acc);
                            ss.setAttribute("USER_DETAIL", l);
                            response.sendRedirect("./roomlist");
                            return;
                        }
                    }

                } else if ("admin".equals(role)) {
                    ss.setAttribute("LOGIN_USER", acc);
                    response.sendRedirect("./manage");
                    return;
                }

            } else {
                request.setAttribute("ERROR_MSG", "Invalid email or password");
                request.getRequestDispatcher("access/login.jsp").forward(request, response);
                return;
            }
        } catch (Exception e) {
            log("Error at LoginController: " + e.toString());
        }
        request.getRequestDispatcher("access/login.jsp").forward(request, response);
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
