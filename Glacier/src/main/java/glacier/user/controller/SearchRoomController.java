/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.user.controller;

import glacier.room.dbmanager.RoomManager;
import glacier.room.model.Room;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author KHANG
 */
@WebServlet(name = "SearchRoomController", urlPatterns = {"/search"})
public class SearchRoomController extends HttpServlet {

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
            
            String indexPage = request.getParameter("index");
            if (indexPage == null) {
                indexPage = "1";
            }
            int currentPage = Integer.parseInt(indexPage);

            String searchText = (String) request.getParameter("keyword");
            System.out.println(searchText);
            if (searchText == null) {
                searchText = "";
            }
//            String genres = (String) request.getParameter("genres");
//            String rating = (String) request.getParameter("rating");
//            String sortBy = (String) request.getParameter("sortBy");

            RoomManager manager = new RoomManager();
            List<Room> listResult = manager.search(searchText, currentPage);
            
//System.out.println("hello iam there");

            int totalMatched = manager.countMatched(searchText);
            int endPage = totalMatched / 16;
            if (totalMatched % 16 != 0) {
                endPage++;
            }
            
//            List<String> allTag = manager.findAllTags();

            request.setAttribute("searchText", searchText);
//            request.setAttribute("genres", genres);
//            request.setAttribute("rating", rating);
//            request.setAttribute("sortBy", sortBy);
            request.setAttribute("endPage", endPage);
            request.setAttribute("currentPage", currentPage);
//            request.setAttribute("allTag", allTag);
            request.setAttribute("list", listResult);
            RequestDispatcher rd = request.getRequestDispatcher("/searchpage.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            log("Error search room " + e.toString());
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
