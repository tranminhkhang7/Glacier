/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.room.controller;

import glacier.room.dbmanager.RoomManager;
import glacier.bill.model.Bill;
import glacier.room.model.Room;
import glacier.room.model.RoomDAO;
import glacier.user.model.Account;
import glacier.user.model.ImageDTO;
import glacier.user.model.Landlord;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "TenantSingleRoomController", urlPatterns = {"/your-rooms"})
public class TenantSingleRoomController extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String id = request.getParameter("id");
            HttpSession ss = request.getSession(false);
            Account acc = (Account) ss.getAttribute("LOGIN_USER");
            RoomManager manager = new RoomManager();
            RoomDAO dao = new RoomDAO();

            Room room = manager.getTenantRentedRoom(Integer.parseInt(id));
            if (acc.getEmail().equals(room.getEmailTenant().trim())) {
                ArrayList<String> f = dao.getRoomFeature(Integer.parseInt(id));
                Landlord l = manager.getLandLordInfoInSingleRoom(Integer.parseInt(id));
                //GET ROOM IMAGES BY ROOMID
                List<ImageDTO> imageList = dao.getRoomImages(Integer.parseInt(id));
//            List<Bill> listOfBill = manager.getBillList(Integer.parseInt(id));
//            request.setAttribute("BILL_LIST", listOfBill);
                request.setAttribute("f", f);
                request.setAttribute("Landlord", l);
                request.setAttribute("SINGLE_ROOM", room);
                request.setAttribute("ROOM_IMAGES", imageList);
                request.getRequestDispatcher("tenant-single-rented.jsp").forward(request, response);
                return;
            } else {
                response.sendRedirect("error.jsp");
                return;
            }
        } catch (Exception e) {
            log("Error at TenantSingleRoomController: " + e.toString());
        }
        response.sendRedirect("error.jsp");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(TenantSingleRoomController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(TenantSingleRoomController.class.getName()).log(Level.SEVERE, null, ex);
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
