/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.user.controller;

import glacier.landlord.dbmanager.LandlordManager;
import glacier.user.model.Account;
import glacier.user.model.Landlord;
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
 * @author KHANG
 */
@WebServlet(name = "LandlordDeleteRoom", urlPatterns = {"/deleteroom"})
public class LandlordDeleteRoom extends HttpServlet {

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

            HttpSession ss = request.getSession();
            Account user = (Account) ss.getAttribute("LOGIN_USER");

            String role = (user == null) ? "" : user.getRole().trim();
            if ("landlord".equals(role)) {
                Landlord landlord = (Landlord) ss.getAttribute("USER_DETAIL");
                String emailLandlord = landlord.getEmail();

                int roomID = Integer.parseInt(request.getParameter("id"));

                LandlordManager mng = new LandlordManager();
                if (mng.checkOwnership(emailLandlord, roomID)) {
                    mng.deleteImageLink(roomID);
                    mng.deleteRoom(roomID);
                    ss.setAttribute("notify", "deleteSuccess");
                    
                    response.sendRedirect("roomlist");
                } else {
                    response.sendRedirect("roomlist");
                }
            } else {
                response.sendRedirect("login");
            }
        } catch (Exception e) {
            log("Error at Landlord Delete Room: " + e.toString());
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
