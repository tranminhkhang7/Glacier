/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package glacier.room.controller;

import glacier.room.dbmanager.CommentManager;
import glacier.room.dbmanager.FavouriteManager;
import glacier.room.model.Comment;
import glacier.room.model.FavouriteRoom;
import glacier.user.model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
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
@WebServlet(name = "FavouriteRoomViewController", urlPatterns = {"/Favourite"})
public class FavouriteRoomViewController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    private static final String ERROR = "error.jsp";               // change this after adding session
    private static final String SUCCESS = "FavouriteRooms.jsp";
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url=ERROR;
        try{      
            HttpSession session = request.getSession(false);
            Account a = (Account)session.getAttribute("LOGIN_USER");
            if (a==null){
                request.setAttribute("errCode",null);
                url=ERROR;
            }
            else if (a.getRole().equals("tenant")){
                String indexPage=request.getParameter("index");
                if (indexPage==null){
                    indexPage="1";
                }
                int currentPage=Integer.parseInt(indexPage);
                
                FavouriteManager FM = new FavouriteManager();
                ArrayList<FavouriteRoom> FRL = FM.getAllFRoom(a.getEmail(), currentPage);
                int totalReviews=FM.getNumberOfFRooms(a.getEmail());
                    int endPage = totalReviews/6;
                    if (totalReviews % 6!=0){
                        endPage++;
                }
                    url=SUCCESS;
                    request.setAttribute("FRL",FRL);
                    request.setAttribute("endPage",endPage);
                    request.setAttribute("currentPage", currentPage);
            }
                else 
                    if (a.getRole().trim().equals("landlord")){
                    request.setAttribute("errCode",1);
                    url=ERROR;
                    }
                else 
                    if (a.getRole().trim().equals("admin")){
                    request.setAttribute("errCode",2);
                    url=ERROR;
                    }
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        finally {
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
