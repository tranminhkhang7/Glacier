/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.user.controller;

import glacier.notification.model.NotificationDAO;
import glacier.notification.model.NotificationDTO;
import glacier.user.model.Account;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author KHANG
 */
@WebServlet(name = "LandlordViewNotification", urlPatterns = {"/landlordnotification"})
public class LandlordViewNotification extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            HttpSession ss = request.getSession();
            Account user = (Account) ss.getAttribute("LOGIN_USER");

            String role = (user == null) ? "" : user.getRole().trim();

            if (!"landlord".equals(role)) {
                RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
                rd.forward(request, response);
            } else {
                String emailLandlord = user.getEmail().trim();

                NotificationDAO mng = new NotificationDAO();
                
                String indexPage = request.getParameter("index");
                if (indexPage == null) {
                    indexPage = "1";
                }
                int currentPage = Integer.parseInt(indexPage);

                int totalMatched = mng.countMatchedNotiLandlordReceived(emailLandlord);
                int endPage = totalMatched / 10;
                if (totalMatched % 10 != 0) {
                    endPage++;
                }
                System.out.println(currentPage + "hi" + endPage);
                if (currentPage > endPage) currentPage = endPage; 
                List<NotificationDTO> listResult = mng.view(emailLandlord, currentPage);
                
                request.setAttribute("endPage", endPage);
                request.setAttribute("currentPage", currentPage);
                request.setAttribute("list", listResult);
                RequestDispatcher rd = request.getRequestDispatcher("/landlord-notification.jsp");
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
