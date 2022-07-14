/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.user.controller;

import glacier.notification.model.NotificationDAO;
import glacier.room.dbmanager.RoomManager;
import glacier.user.model.Account;
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
@WebServlet(name = "Disconnect", urlPatterns = {"/disconnect"})
public class Disconnect extends HttpServlet {

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
                String emailLandlord = user.getEmail().trim();
                int roomID = Integer.parseInt(request.getParameter("id"));
                    
                String title = "Bạn đang rời khỏi phòng đang thuê?";
                String content = "Chúng tôi nhận được yêu cầu hủy thuê nhà từ Chủ nhà của bạn. Nếu bạn đang chuyển đi, vui lòng bấm Xác nhận. Nếu đây là một nhầm lẫn, vui long bấm Hủy hoặc bỏ qua thông báo này.";

                NotificationDAO mng = new NotificationDAO();
                mng.landlordNotify(roomID, emailLandlord, title, content, "decide");

                request.setAttribute("notify", "notify success");
                RequestDispatcher rd = request.getRequestDispatcher("/roomlist/room?id=" + roomID);
                rd.forward(request, response);
             } else if ("tenant".equals(role)) {
                String action = request.getParameter("action").trim();
                int roomID = Integer.parseInt(request.getParameter("roomId"));
                int notiID = Integer.parseInt(request.getParameter("notiId"));
                if ("accept".equals(action)) {
                    // UPADTE status, emailTenant OF THE ROOM
                    RoomManager mng = new RoomManager();
                    mng.updateRoomAfterDisconnect(roomID, notiID);
                    RequestDispatcher rd = request.getRequestDispatcher("/notifications");
                    rd.forward(request, response);
                }
            } else {
                response.sendRedirect("login");
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
