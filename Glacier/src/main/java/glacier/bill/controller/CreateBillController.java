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
@WebServlet(name = "CreateBillController", urlPatterns = {"/roomlist/CreateBillController"})
public class CreateBillController extends HttpServlet {
    
    public static final String SUCCESS = "/Glacier/roomlist/room?id=";
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

        String url = FAILED;

        //INIT VAR AS STRING TO RECEIVE DATA FROM VIEW, WE WILL PARSE AMOUNT BACK TO INT WHEN USING
        String[] name = new String[4];
        String[] amount = new String[4];
        String[] des = new String[4];

        // assign value to all array 
        for (int i = 0; i <= 3; i++) {
            name[i] = "/";
            amount[i] = "/";
            des[i] = "/";
        }
        
        try {
            //get parameter
            int roomID = Integer.parseInt(request.getParameter("id"));
            name = request.getParameterValues("name");
            amount = request.getParameterValues("amount");
            des = request.getParameterValues("description");
//        System.out.println("NAME:");
//        for (int i=0;i<name.length;i++) {
//            if (!name[i].equals("/"))
//            System.out.println(name[i]);
//            else System.out.println("/");
//        }
//        System.out.println("AMOUNT:");
//        for (int i=0;i<amount.length;i++) {
//            if (!amount[i].equals("/"))
//            System.out.println(amount[i]);
//            else System.out.println("/");
//        }
//        System.out.println("DESCRIPTION:");
//        for (int i=0;i<des.length;i++) {
//            if (!des[i].equals("/"))
//            System.out.println(des[i]);
//            else System.out.println("/");
//        }
            // init values
            BillManager bm = new BillManager();
            ArrayList<BillDetail> bill = new ArrayList<>();

            //CREATE THE HOLE BILL       
            int BillID = bm.getNextBillID();
            int i = 0;
            while ((i < name.length) && (!name[i].equals("/"))) {
                BillDetail b = new BillDetail(BillID, i + 1, name[i], Integer.parseInt(amount[i]), des[i]);
//                System.out.println(b);
                bill.add(b); // GENERATE BILL AS AN ARRAY LIST
                i++;
            }

            // init current time to create bill
            Timestamp date = new Timestamp(System.currentTimeMillis());

            //MAIN CREATING FUNCTION
            if (bm.createBill(BillID, roomID, date, "unpaid")) { // CREATE BILL
                if (bm.createBillDetail(BillID, bill)) { // CREATE ALL BILL DETAIL IN BILL ARRAYLIST
                    url = SUCCESS+roomID;
                }
            }
        }
        catch (Exception e){
            e.printStackTrace();
            url=FAILED;
        }
        finally{
             response.sendRedirect(url);
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
