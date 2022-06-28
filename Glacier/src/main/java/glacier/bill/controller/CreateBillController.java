/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package glacier.bill.controller;

import glacier.bill.dbmanager.BillManager;
import glacier.bill.model.BillDetail;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CreateBillController", urlPatterns = {"/CreateBillController"})
public class CreateBillController extends HttpServlet {
    
    public static final String SUCCESS = "landlord-manage-single-room.jsp";
    public static final String FAILED="error.jsp";
    
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
        
        String url=FAILED;
        
        //INIT VAR AS STRING TO RECEIVE DATA FROM VIEW, WE WILL PARSE AMOUNT BACK TO INT WHEN USING
        String[] name = new String[4];
        String[] amount = new String[4]; 
        String[] des= new String[4];
        
        //get parameter
        int roomID = Integer.parseInt(request.getParameter("roomID"));
        name=request.getParameterValues("name");
        amount = request.getParameterValues("amount");
        des=request.getParameterValues("des");   
        
        // init values
        BillManager bm= new BillManager();
        ArrayList<BillDetail> bill = new ArrayList<>();
                
                
        //CREATE THE HOLE BILL       
        int BillID = bm.getNextBillID();
        for (int i=0;i<=3;i++){ // loop in name
            for (int j=0;i<=3;j++){ // loop in amount
                for (int k=0;k<=3;k++){ // loop in des
                    if ((i==j)&&(j==k)){
                        BillDetail b = new BillDetail(BillID,i+1, name[i], Integer.parseInt(amount[j]), des[k]);
                        bill.add(b); // GENERATE BILL AS AN ARRAY LIST
                    }
                }
            }
        }
        
        
        //////TEST DATA
//        int BillID=3;
//        int roomID=10;
//        BillDetail b1 = new BillDetail(BillID, 1, "Tiền điện", 10000, "");
//        BillDetail b2 = new BillDetail(BillID, 2, "Tiền nước", 10000, "");
//        BillDetail b3 = new BillDetail(BillID, 3, "Tiền nhà", 10000, "");
//        BillDetail b4 = new BillDetail(BillID, 4, "Tiền khác", 10000, "");
//        bill.add(b1);
//        bill.add(b2);
//        bill.add(b3);
//        bill.add(b4);



        // init current time to create bill
        Timestamp date = new Timestamp(System.currentTimeMillis());
        
        //MAIN CREATING FUNCTION
        if (bm.createBill(BillID, roomID, date, "unpaid")){ // CREATE BILL
            if(bm.createBillDetail(BillID, bill)) { // CREATE ALL BILL DETAIL IN BILL ARRAYLIST
                url = SUCCESS;
            }
        }
        request.getRequestDispatcher(url).forward(request, response);
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
