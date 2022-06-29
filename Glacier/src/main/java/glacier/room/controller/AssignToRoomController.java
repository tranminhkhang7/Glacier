/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.room.controller;

import glacier.landlord.dbmanager.LandlordManager;
import glacier.notification.model.NotificationDAO;
import glacier.room.dbmanager.RoomManager;
import glacier.room.model.Room;
import glacier.user.controller.UserManager;
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
@WebServlet(name = "AssignToRoomController", urlPatterns = {"/assign"})
public class AssignToRoomController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String SUCCESS = "assign-tenant-successful.jsp";
    private static final String ERROR = "error.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession ss = request.getSession();
            UserManager userManager = new UserManager();
            RoomManager manager = new RoomManager();
            LandlordManager landlordManager = new LandlordManager();
            NotificationDAO dao = new NotificationDAO();
                       
            Account acc = (Account) ss.getAttribute("LOGIN_USER");
            String landlordEmail = acc.getEmail();
            String role = acc.getRole();
            String tenantKey = request.getParameter("tenant_key");
            String landlordKey = request.getParameter("landlord_key");
            if (!"landlord".equals(role)) {
                url = ERROR;
            } else {
                Room room = manager.getRoomWhenAssign(tenantKey, landlordKey);
                if (room != null && "active".equals(room.getQrStatus().trim()) && "pending".equals(room.getStatus().trim())) {
                    boolean checkOwnerShip = landlordManager.checkOwnership(landlordEmail, room.getRoomID());
                    if (checkOwnerShip) {
                        url = SUCCESS;
                        boolean check = userManager.acceptDeposit(room.getRoomID(), "unavailable");
//                        if (check) {
//                            String notiSender = String.format("Yêu cầu của bạn cho phòng %s đã được chấp thuận", room.getName());
//                            dao.landlordNotify(room.getRoomID(), acc.getEmail(), "Vui lòng xem lại các thông tin về phòng ở phần thông báo", notiSender);
//                            url = SUCCESS;
//                        }
                    }
                }
            }

        } catch (Exception e) {
            log("Error at AssignToRoomController: " + e.toString());
        }finally{
            //response.sendRedirect(url);
            request.getRequestDispatcher(url).forward(request, response);
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
