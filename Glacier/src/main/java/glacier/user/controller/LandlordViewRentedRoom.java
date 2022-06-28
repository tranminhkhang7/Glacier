/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.user.controller;

import glacier.bill.dbmanager.BillManager;
import glacier.bill.model.BillDetail;
import glacier.notification.model.NotificationDAO;
import glacier.room.dbmanager.CommentManager;
import glacier.room.model.Comment;
import glacier.user.model.Account;
import glacier.user.model.Tenant;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "LandlordViewRentedRoom", urlPatterns = {"/roomlist/room"})
public class LandlordViewRentedRoom extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession ss = request.getSession();
            Account user = (Account) ss.getAttribute("LOGIN_USER");

            String role = (user == null) ? "" : user.getRole().trim();

            if (!"landlord".equals(role)) {
                RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
                rd.forward(request, response);
            } else {
                int id = Integer.parseInt(request.getParameter("id"));
                request.setAttribute("id", id);
                
                UserManager mng = new UserManager();
                String emailTenant = mng.getEmailTenantByRoomID(id);
                String rentStartDate = mng.getStartRentDateByRoomID(id);
                Tenant tenant = mng.getTenantInfo(emailTenant);
                BillManager bm =new BillManager();
                int[] currentBillID=bm.getCurrent2BillIDByRoom(id);
                
                    ArrayList<BillDetail> bd1 = new ArrayList<>();
                    bd1=bm.getBillDetailByBillId(currentBillID[0]);
                    ArrayList<BillDetail> bd2 = new ArrayList<>();
                    bd2=bm.getBillDetailByBillId(currentBillID[1]);
                    request.setAttribute("bd1", bd1);
                    request.setAttribute("bd2", bd2);
                
                if ((bd1.size()==0)&&(bd2.size()==0)) request.setAttribute("bd0", "No bill created yet");
                
//                int currentBillID=bm.getNextBillID()-1;
//                if (currentBillID>=2){
//                    ArrayList<BillDetail> bd1 = new ArrayList<>();
//                    bd1=bm.getBillDetailByBillId(currentBillID);
//                    ArrayList<BillDetail> bd2 = new ArrayList<>();
//                    bd2=bm.getBillDetailByBillId(currentBillID-1);
//                    request.setAttribute("bd1", bd1);
//                    request.setAttribute("bd2", bd2);
//                }
//                if (currentBillID==1){
//                    ArrayList<BillDetail> bd1 = new ArrayList<>();
//                    bd1=bm.getBillDetailByBillId(currentBillID);
//                    request.setAttribute("bd1", bd1);
//                }
//                if (currentBillID<0){
//                    request.setAttribute("bd0", "No bill created yet");
//                }
                request.setAttribute("tenant", tenant);
                request.setAttribute("rentStartDate", rentStartDate);
                RequestDispatcher rd = request.getRequestDispatcher("/landlord-manage-single-room.jsp");
                rd.forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(LandlordViewRentedRoom.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (Exception ex) {
            Logger.getLogger(LandlordViewRentedRoom.class.getName()).log(Level.SEVERE, null, ex);
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
