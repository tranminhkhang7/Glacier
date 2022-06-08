/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.user.controller;

import glacier.moderator.dbmanager.ModeratorManager;
import glacier.user.model.Reported;
import glacier.user.model.UserSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ReportedController", urlPatterns = {"/ReportedController"})
public class ReportedController extends HttpServlet {
    private static final String ERROR = "reported.jsp";
    private static final String SUCCESS = "reported.jsp";
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
        String url = ERROR;
        try {
            int currentPage = Integer.parseInt(request.getParameter("index"));
            String type = request.getParameter("type");
            ModeratorManager dao = new ModeratorManager();
            List<Reported> listReported = null;
            int totalMatched = dao.countMatched2(type);
            int endPage = totalMatched / 10;
            if (totalMatched % 10 != 0) {
                endPage++;
            }
            if (type.equals("all")) {
                listReported = dao.getListReported(currentPage);
            } else {
                if (type.equals("room")) {
                    listReported = dao.getListRPRoom(currentPage);
                } else {
                    listReported = dao.getListRPComment(currentPage);
                }
            }
            request.setAttribute("END_PAGE", endPage);
            request.setAttribute("CURRENT_PAGE", currentPage);
            request.setAttribute("LIST_REPORTED", listReported);
            url = SUCCESS;
        } catch (Exception e) {
            log("Error at SearchController: " + e.toString());
        } finally {
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
