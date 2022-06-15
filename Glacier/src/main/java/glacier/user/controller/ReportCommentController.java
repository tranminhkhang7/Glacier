/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.user.controller;

import glacier.room.dbmanager.CommentManager;
import glacier.room.model.Comment;
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
 * @author ASUS
 */
@WebServlet(name = "ReportCommentController", urlPatterns = {"/reportcomment"})
public class ReportCommentController extends HttpServlet {

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
            HttpSession ss = request.getSession();
            Account acc = (Account) ss.getAttribute("LOGIN_USER");
            String commentId = request.getParameter("commentId");
            String roomId = request.getParameter("roomID");
            String email = acc.getEmail();
            String content = request.getParameter("content");
            long now = System.currentTimeMillis();
            Timestamp date = new Timestamp(now);
            
            Comment c = new Comment(Integer.parseInt(commentId), content, email, date);
            CommentManager manager = new CommentManager();
            
            boolean check = manager.reportComment(c);
            if (check) {
                request.setAttribute("notify", "report");
                response.sendRedirect("SingleRoomView?id=" + roomId);
                return;
            } else {
                response.sendRedirect("error.jsp");
                return;
            }
        } catch (Exception e) {
            log("Error at ReportCommentController: " + e.toString());
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
