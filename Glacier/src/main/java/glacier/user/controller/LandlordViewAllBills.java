/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package glacier.user.controller;

import glacier.bill.dbmanager.BillManager;
import glacier.bill.model.Bill;
import glacier.bill.model.BillDetail;
import glacier.room.dbmanager.RoomManager;
import glacier.user.model.Account;
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
 * @author Admin
 */
@WebServlet(name = "LandlordViewAllBills", urlPatterns = {"/AllBills"})

public class LandlordViewAllBills extends HttpServlet {
    private static final String SUCCESS ="landlord-all-bills.jsp";
    private static final String ERROR ="error.jsp";
    private static final int BILLS_PER_PAGE=10;
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
        HttpSession ss = request.getSession();
        Account user = (Account) ss.getAttribute("LOGIN_USER");
        String url = "";
        if ("landlord".equals(user.getRole())){
            int roomId = Integer.parseInt(request.getParameter("id"));
            RoomManager manager = new RoomManager();
            if (manager.isLandlordRoom(user.getEmail(),roomId)){
                BillManager bm =new BillManager();
                
               
                // PAGING
                String indexPage=request.getParameter("index");
                if (indexPage==null){
                    indexPage="1";
                }
                int currentPage=Integer.parseInt(indexPage);
                int totalReviews=bm.getNumberOfBills(roomId);
                    int endPage = totalReviews/6;
                    if (totalReviews % 6!=0){
                        endPage++;
                }
                request.setAttribute("endPage",endPage);
                request.setAttribute("currentPage", currentPage);
                
                
                // LOAD BILLS AND BILL DETAILS
                ArrayList<Bill> BillList = bm.getBills(roomId, currentPage);
                ArrayList<BillDetail> billDetail= new ArrayList<>();
                for (Bill b:BillList) billDetail.addAll(bm.getBillDetailByBillId(b.getId()));
                request.setAttribute("BILL_DETAILS", billDetail);
                request.setAttribute("BILLS",BillList);
                request.setAttribute("id", roomId);
                url=SUCCESS;
                
            }
        }
        else {
            url=ERROR;
            request.setAttribute("errCode",2);
        }
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
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
