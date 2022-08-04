/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.room.controller;

import glacier.room.dbmanager.RoomManager;
import glacier.bill.model.Bill;
import glacier.bill.model.BillDetail;
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
@WebServlet(name = "TenantBillingController", urlPatterns = {"/bills"})
public class TenantBillingController extends HttpServlet {

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
            HttpSession ss = request.getSession(false);
            Account acc = (Account) ss.getAttribute("LOGIN_USER");
            String roomId = request.getParameter("id");
            RoomManager manager = new RoomManager();
            Room room = manager.getTenantRentedRoom(Integer.parseInt(roomId));
            if (acc.getEmail().equals(room.getEmailTenant().trim())) {
                List<Bill> paidBillList = manager.getPaidBillList(Integer.parseInt(roomId), "paid");
                List<Bill> unpaidBillList = manager.getPaidBillList(Integer.parseInt(roomId), "unpaid");

                List<BillDetail> billDetail = manager.getBillsDetail(Integer.parseInt(roomId));

                request.setAttribute("BILL_DETAILS", billDetail);
                request.setAttribute("PAID_BILLS", paidBillList);
                request.setAttribute("UNPAID_BILLS", unpaidBillList);
                request.getRequestDispatcher("tenant-room-bill.jsp").forward(request, response);
                return;
            } else {
                response.sendRedirect("error.jsp");
                return;
            }
        } catch (Exception e) {
            log("Error at TenantBillingController: " + e.toString());
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
