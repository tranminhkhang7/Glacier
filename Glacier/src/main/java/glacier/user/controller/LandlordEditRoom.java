/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.user.controller;

import glacier.landlord.dbmanager.LandlordManager;
import glacier.model.feature.FeatureDAO;
import glacier.model.feature.FeatureDTO;
import glacier.room.model.Room;
import glacier.room.model.RoomDAO;
import glacier.user.model.Account;
import glacier.user.model.Landlord;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
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

            HttpSession ss = request.getSession();
            Account user = (Account) ss.getAttribute("LOGIN_USER");

            String role = (user == null) ? "" : user.getRole().trim();
            if ("landlord".equals(role)) {
                Landlord landlord = (Landlord) ss.getAttribute("USER_DETAIL");
                String emailLandlord = landlord.getEmail();

                int roomID = Integer.parseInt(request.getParameter("id"));

                LandlordManager landlordMng = new LandlordManager();
                // Load room information except for features
                RoomDAO roomMng = new RoomDAO();
                Room room = roomMng.getRoomById(roomID);
                if (landlordMng.checkOwnership(emailLandlord, roomID)) { // is the owner
                    if (room.getStatus().trim().equals("available")) { // the room is available
                        if (request.getParameter("name") == null) { // not submitted yet

                            request.setAttribute("room", room);

                            // Split address to city and district (the whole address saved in dtb is these both combination
                            String address = room.getAddress().trim();
                            String[] parts = address.split(", ");
                            String city = parts[0];
                            String district = parts[1];
                            request.setAttribute("city", city);
                            request.setAttribute("district", district);

                            //Load number of Picture
                            request.setAttribute("picNum", roomMng.getImageCount(roomID));

                            // Load features of the room with id
                            FeatureDAO featureMng = new FeatureDAO();
                            List<FeatureDTO> listRoomFeature = featureMng.getFeature(roomID);
                            request.setAttribute("listRoomFeature", listRoomFeature);

                            RequestDispatcher rd = request.getRequestDispatcher("/editroom.jsp");
                            rd.forward(request, response);
                        } else { // submitted
                            String name = request.getParameter("name");
                            String description = request.getParameter("details");
                            String city = request.getParameter("city");
                            String district = request.getParameter("district");
                            String address = district + ", " + city; // Combine district and city as addredd, and saved
                            String detailAddress = request.getParameter("location");
                            int price = Integer.parseInt(request.getParameter("price"));
                            int deposit = Integer.parseInt(request.getParameter("deposit"));
                            float area = Float.parseFloat(request.getParameter("area"));

                            List<Integer> listFeature;
                            listFeature = new ArrayList<>();
                            for (int i = 1; i <= 50; i++) {
                                String feature = (String) request.getParameter("room_features" + i);
                                if (feature != null) {
                                    listFeature.add(i);
                                }
                            }

                            LandlordManager mng = new LandlordManager();
                            mng.updateRoom(roomID, name, description, address, detailAddress, price, deposit, area, listFeature);

                            ss.setAttribute("notify", "updateSuccess");

                            response.sendRedirect("roomlist");
                        }
                    } else { // the room is not available. this could be pending, verifying, or unavailable
                        RequestDispatcher rd = request.getRequestDispatcher("/temporary-block-edit-room.jsp");
                        rd.forward(request, response);

                    }
                } else { // the person who operate is not the owner
                    response.sendRedirect("roomlist");
                }
            } else {
                response.sendRedirect("login");
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
        try {
            request.setCharacterEncoding("UTF-8");
            HttpSession ss = request.getSession();
            int roomID = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String description = request.getParameter("details");
            String city = request.getParameter("city");
            String district = request.getParameter("district");
            String address = district + ", " + city; // Combine district and city as addredd, and saved
            String detailAddress = request.getParameter("location");
            int price = Integer.parseInt(request.getParameter("price"));
            int deposit = Integer.parseInt(request.getParameter("deposit"));
            float area = Float.parseFloat(request.getParameter("area"));
            List<Integer> listFeature;
            listFeature = new ArrayList<>();
            for (int i = 1; i <= 50; i++) {
                String feature = (String) request.getParameter("room_features" + i);
                if (feature != null) {
                    listFeature.add(i);
                }
            }
            LandlordManager mng = new LandlordManager();
            mng.updateRoom(roomID, name, description, address, detailAddress, price, deposit, area, listFeature);
            ss.setAttribute("notify", "updateSuccess");
            response.sendRedirect("roomlist");
        } catch (Exception e) {
            e.printStackTrace();
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
