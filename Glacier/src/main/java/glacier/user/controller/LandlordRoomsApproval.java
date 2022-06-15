/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.user.controller;

import glacier.landlord.dbmanager.LandlordManager;
import glacier.room.model.Room;
import glacier.user.model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "LandlordRoomsApproval", urlPatterns = {"/roomsqueue"})
public class LandlordRoomsApproval extends HttpServlet {

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
            Account acc = (Account) ss.getAttribute("LOGIN_USER");
            LandlordManager manager = new LandlordManager();
            String landlordEmail = acc.getEmail();
            String indexPage = request.getParameter("index");
            if (indexPage == null) {
                indexPage = "1";
            }
            int currentPage = Integer.parseInt(indexPage);
            int countTenantRooms = manager.countAllPendingRooms(landlordEmail);

            int endPage = countTenantRooms / 4;
            if (countTenantRooms % 4 != 0) {
                endPage++;
            }

            List<Room> roomList = manager.getLandlordPendingRooms(landlordEmail, currentPage);
            request.setAttribute("endPage", endPage);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("list", roomList);
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            request.getRequestDispatcher("new-tenant.jsp").forward(request, response);
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
