/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.user.controller;

import glacier.bill.dbmanager.BillManager;
import glacier.bill.model.Bill;
import glacier.bill.model.BillDetail;
import glacier.landlord.dbmanager.LandlordManager;
import glacier.room.model.Room;
import glacier.user.model.Landlord;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "LandlordViewRoomList", urlPatterns = {"/roomlist"})
public class LandlordViewRoomList extends HttpServlet {

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

                LandlordManager mng = new LandlordManager();

                String indexPage = request.getParameter("index");
                if (indexPage == null) {
                    indexPage = "1";
                }
                int currentPage = Integer.parseInt(indexPage);
                List<Room> listResult = mng.listRoom(emailLandlord, currentPage);

                int totalMatched = mng.countMatched(emailLandlord);
                int endPage = totalMatched / 10;
                if (totalMatched % 10 != 0) {
                    endPage++;
                }
                
                
                request.setAttribute("endPage", endPage);
                request.setAttribute("currentPage", currentPage);
                request.setAttribute("list", listResult);

                RequestDispatcher rd = request.getRequestDispatcher("/roomlist.jsp");
                rd.forward(request, response);
            }
        } catch (Exception e) {
            System.out.println("Error at Landlord View Room List" + e);
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
