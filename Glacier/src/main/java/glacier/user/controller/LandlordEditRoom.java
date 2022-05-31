/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.user.controller;

import glacier.landlord.dbmanager.LandlordManager;
import glacier.room.model.Room;
import glacier.room.model.RoomDAO;
import glacier.user.model.Landlord;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Date;
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
@WebServlet(name = "LandlordEditRoom", urlPatterns = {"/editroom"})
public class LandlordEditRoom extends HttpServlet {

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

            HttpSession session = request.getSession(false);

            if (session == null) {
                RequestDispatcher rd = request.getRequestDispatcher("/login");
                rd.forward(request, response);
            } else {
                Landlord landlord = (Landlord) session.getAttribute("USER_DETAIL");
                String emailLandlord = landlord.getEmail();

                int roomID = Integer.parseInt(request.getParameter("id"));

                LandlordManager landlordMng = new LandlordManager();
                if (landlordMng.checkOwnership(emailLandlord, roomID)) {

                    if (request.getParameter("name") == null) {
                        RoomDAO mng = new RoomDAO();
                        Room room = mng.getRoomById(roomID);

                        request.setAttribute("room", room);

                        RequestDispatcher rd = request.getRequestDispatcher("/editroom.jsp");
                        rd.forward(request, response);
                    } else {

                        String name = request.getParameter("name");
                        String description = request.getParameter("details");
                        String city = request.getParameter("city");
                        String district = request.getParameter("district");
                        String address = district + ", " + city;
                        String detailAddress = request.getParameter("location");
                        int price = Integer.parseInt(request.getParameter("price"));

                        int deposit = Integer.parseInt(request.getParameter("deposit"));
                        System.out.println("hi there");
                        float area = Float.parseFloat(request.getParameter("area"));

                        LandlordManager mng = new LandlordManager();
                        mng.updateRoom(roomID, name, description, address, detailAddress, price, deposit, area);

                        RequestDispatcher rd = request.getRequestDispatcher("/success.jsp");
                        rd.forward(request, response);
                    }
                } else {
                    RequestDispatcher rd = request.getRequestDispatcher("/index.html");
                    rd.forward(request, response);
                }
            }
        } catch (Exception e) {
            System.out.println("Error at Landlord Edit Room List" + e);
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
