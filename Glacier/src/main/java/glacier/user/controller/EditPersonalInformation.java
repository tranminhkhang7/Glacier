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
@WebServlet(name = "EditPersonalInformation", urlPatterns = {"/account"})
public class EditPersonalInformation extends HttpServlet {

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
            String submit = request.getParameter("infor");
            if (submit == null) {
                response.sendRedirect("profile.jsp");
            } else {
                String newGender = request.getParameter("newGender");
                String newName = request.getParameter("newName");
                String newPhone = request.getParameter("newPhone");
                String newInstagram = request.getParameter("newInstagram");
                String newFacebook = request.getParameter("newFacebook");

                HttpSession ss = request.getSession();
                Account user = (Account) ss.getAttribute("LOGIN_USER");
                String role = user.getRole();
                String email = user.getEmail();
                boolean isTenant = false;
                if ("tenant".equals(role)) {
                    isTenant = true;
                }
                UserManager manager = new UserManager();
                boolean check = manager.updateAccount(email, newName, newGender, newPhone, newFacebook, newInstagram, isTenant);
                if (check) {
                    if ("tenant".equals(role)) {
                        Tenant t = (Tenant) ss.getAttribute("USER_DETAIL");
                        t.setGender(newGender);
                        t.setName(newName);
                        t.setPhone(newPhone);
                        t.setInstagramLink(newInstagram);
                        t.setFacebookLink(newFacebook);
                         response.sendRedirect("profile.jsp");
                    } else {
                        Landlord l = (Landlord) ss.getAttribute("USER_DETAIL");
                        l.setGender(newGender);
                        l.setName(newName);
                        l.setPhone(newPhone);
                        l.setInstagramLink(newInstagram);
                        l.setFacebookLink(newFacebook);
                         response.sendRedirect("profile.jsp");
                    }
                }
            }
        } catch (Exception e) {
            log("Error at EditPersonal: "+e.toString());
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
