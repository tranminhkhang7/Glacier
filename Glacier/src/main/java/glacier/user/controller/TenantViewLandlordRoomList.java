/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.user.controller;

import glacier.landlord.dbmanager.LandlordManager;
import glacier.room.model.Room;
import glacier.user.model.Account;
import glacier.user.model.Landlord;
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
@WebServlet(name = "TenantViewLandlordRoomList", urlPatterns = {"/TenantViewLandlordRoomList"})
public class TenantViewLandlordRoomList extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            HttpSession ss = request.getSession();
            Account user = (Account) ss.getAttribute("LOGIN_USER");

            String role = (user == null) ? "" : user.getRole().trim();
            if ("tenant".equals(role) || "".equals(role)) {
                
                String emailLandlord = request.getParameter("email");
                
                String indexPage = request.getParameter("index");
                if (indexPage == null) {
                    indexPage = "1";
                }
                LandlordManager mng = new LandlordManager();
                int currentPage = Integer.parseInt(indexPage);
                
                // SEARCH ROOMS THAT OWNED BY A LANDLORD WHOSE EMAIL IS emailLandlord
                List<Room> listResult = mng.listRoom(emailLandlord, currentPage);

                // COUNT THE TOTAL OF ROOMS 
                int totalMatched = mng.countMatched(emailLandlord);
                int endPage = totalMatched / 16;
                if (totalMatched % 16 != 0) {
                    endPage++;
                }

                //GET LANDLORD INFO
                UserManager manager = new UserManager();
                Landlord l = manager.getLandlordInfo(emailLandlord);
                
                request.setAttribute("Landlord", l);
                request.setAttribute("endPage", endPage);
                request.setAttribute("currentPage", currentPage);
                request.setAttribute("list", listResult);

                RequestDispatcher rd = request.getRequestDispatcher("/show-landlord-room-list-as-tenant.jsp");
                rd.forward(request, response);
            } else {
                response.sendRedirect("login");
            }
        } catch (Exception e) {
            log("Error at Tenant View Landlord Room List: " + e.toString());
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
