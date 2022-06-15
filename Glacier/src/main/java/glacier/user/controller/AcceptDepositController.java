/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.user.controller;

import glacier.landlord.dbmanager.LandlordManager;
import glacier.notification.model.NotificationDAO;
import glacier.user.model.Account;
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
@WebServlet(name = "AcceptDepositController", urlPatterns = {"/accept"})
public class AcceptDepositController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private final static String SUCCESS = "home";
    private final static String ERROR = "error.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession ss = request.getSession();
            Account acc = (Account) ss.getAttribute("LOGIN_USER");
            UserManager manager = new UserManager();
            NotificationDAO dao = new NotificationDAO();
            LandlordManager landManager = new LandlordManager();

            String action = request.getParameter("action");
            //String email = request.getParameter("email");
            String roomId = request.getParameter("roomId");

            boolean check = false;
            boolean isOwner = landManager.checkOwnership(acc.getEmail(), Integer.parseInt(roomId));
            String roomStatus = landManager.roomStatus(Integer.parseInt(roomId));
            
            if (isOwner && "pending".equals(roomStatus.trim())) {
                if ("accept".equals(action)) {
                    check = manager.acceptDeposit(Integer.parseInt(roomId));
                    if (check) {
                        dao.landlordNotify(Integer.parseInt(roomId), acc.getEmail(), "YOUR ROOM REQUEST HAS BEEN ACCEPT", "PLEASE GO CHECK YOUR ROOM MANAGEMENT");
                        url = SUCCESS;
                    }
                } else {
                    dao.landlordNotify(Integer.parseInt(roomId), acc.getEmail(), "YOUR ROOM REQUEST HAS BEEN DECLINE", "PLEASE GO CHECK YOUR ROOM MANAGEMENT");
                    url = SUCCESS;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            response.sendRedirect(url);
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
