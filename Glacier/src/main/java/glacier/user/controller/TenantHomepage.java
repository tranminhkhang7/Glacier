/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.user.controller;

import glacier.model.feature.FeatureDAO;
import glacier.model.feature.FeatureDTO;
import glacier.room.dbmanager.RoomManager;
import glacier.room.model.Room;
import glacier.user.model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "TenantHomepage", urlPatterns = {"/home"})
public class TenantHomepage extends HttpServlet {

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
            RoomManager manager = new RoomManager();
            String role = (user == null) ? "" : user.getRole().trim();
            
            if ("tenant".equals(role) || "".equals(role)) {
                FeatureDAO mng = new FeatureDAO();
                List<FeatureDTO> listFeature = mng.loadFeature();
                List<Room> listRoomOrderByDate = manager.get4LatestRooms();
                List<Room> listRoomOrderByRating = manager.get4HighestRateRooms();
                request.setAttribute("listFeature", listFeature);
                request.setAttribute("LIST_ROOMS_ORDER_BY_DATE", listRoomOrderByDate);
                request.setAttribute("LIST_ROOMS_ORDER_BY_RATING", listRoomOrderByRating);
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            } else if ("landlord".equals(role)) {
                response.sendRedirect("roomlist");
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
