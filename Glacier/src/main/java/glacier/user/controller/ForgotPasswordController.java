/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.user.controller;

import glacier.user.model.UserSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "ForgotPasswordController", urlPatterns = {"/forgot"})
public class ForgotPasswordController extends HttpServlet {

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
        String email = request.getParameter("email");

        Random rd = new Random();
        rd.nextInt(99999);

        String key = DigestUtils.md5Hex("" + rd);
        String id = DigestUtils.md5Hex(email);

        UserManager manager = new UserManager();
        HttpSession ss = request.getSession();

        boolean check = manager.checkDuplicate(email);
        if (check) {
            
            ss.setAttribute("ID", id);
            ss.setAttribute("KEY", key);
            ss.setAttribute("RESET_EMAIL", email);
            SendMailResetPassword sm = new SendMailResetPassword();

            //call the send email method
            boolean test = sm.sendEmail(id, key, email);
            if (test) {

                //session.setAttribute("authcode", user);
                request.setAttribute("IS_VERIFIED", true);
                request.getRequestDispatcher("verify.jsp").forward(request, response);
                return;
//                response.sendRedirect("verify.jsp");
            } else {
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
                //out.println("Failed to send verification email");
            }
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
