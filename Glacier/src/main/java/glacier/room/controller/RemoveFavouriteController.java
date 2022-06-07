/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package glacier.room.controller;

import glacier.room.dbmanager.FavouriteManager;
import glacier.room.model.FavouriteRoom;
import glacier.user.model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
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
@WebServlet(name = "RemoveFavouriteController", urlPatterns = {"/RemoveFavouriteController"})
public class RemoveFavouriteController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR = "SingleRoomView";               // change this after adding session
    private static final String SUCCESS = "SingleRoomView";
    private static final int TEST = 10;
    private static final Account TESTACC = new Account("dinhxuantung@gmail.com","", "tenant");  // THIS DEFAULT ACCOUNT EMAIL NEED TO BE SYNC WITH DEFAULT EMAIL IN SINGLEROOM.JSP
        

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        acc = TESTACC;
        int roomID =  Integer.parseInt(request.getParameter("id"));
        try{
                if (acc.getRole().trim().equals("tenant")){
                    String email = request.getParameter("email");
                    FavouriteRoom fr = new FavouriteRoom(email, roomID);
                    FavouriteManager FM = new FavouriteManager();
                    if (FM.removeFromFavourite(fr)){
                        response.sendRedirect(SUCCESS+"?id="+roomID);
                    }
                }
        }
        catch(Exception e){
            e.printStackTrace();
            response.sendRedirect(SUCCESS+"?id="+roomID);
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
