/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.user.controller;

import glacier.room.dbmanager.RoomManager;
import glacier.user.model.Notification_TL;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "TenantSendNotificationController", urlPatterns = {"/tenantnotify"})

public class TenantSendNotificationController extends HttpServlet {

    private static final String SUCCESS = "your-rooms";
    private static final String ERROR = "your-rooms";

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
       String url = ERROR;
        try {
            String roomID = request.getParameter("roomID");
            String emailTenant = request.getParameter("emailTenant");
            String emailLandlord = request.getParameter("emailLandlord");
            String subject = request.getParameter("subject");
            String content = request.getParameter("content");
            Notification_TL noti = new Notification_TL(emailTenant, emailLandlord, subject, content);
            RoomManager manager = new RoomManager();
            boolean check = manager.insertNotificationTL(noti);
            if(check) url = SUCCESS+"?id="+roomID;
        } catch (Exception e) {
            log("Error at TenantSendNotificationController: " + e.toString());
        }finally{
            response.sendRedirect(url);
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
