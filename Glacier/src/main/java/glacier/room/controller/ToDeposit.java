/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package glacier.room.controller;

import glacier.landlord.dbmanager.LandlordManager;
import glacier.room.model.Room;
import glacier.room.model.RoomDAO;
import glacier.user.model.Account;
import glacier.user.model.Landlord;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "ToDeposit", urlPatterns = {"/ToDeposit"})
public class ToDeposit extends HttpServlet {
    private static final String ERROR = "error.jsp";               // change this after adding session
    private static final String SUCCESS = "Deposit.jsp";
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
        String url = ERROR;
        try {
            HttpSession session = request.getSession(false);
            Account acc = (Account) session.getAttribute("LOGIN_USER");
            if (acc.getRole().equals("tenant")){
                int id = Integer.parseInt(request.getParameter("id"));
                RoomDAO dao = new RoomDAO();
                Room room = dao.getRoomById(id);
                ArrayList<String> ImgList = dao.getRoomImgById(id);
                LandlordManager lm = new LandlordManager();
                Landlord l = lm.getLandLordInfo(id);
                request.setAttribute("landlord", l);
                request.setAttribute("id", id);
                request.setAttribute("room", room);
                url = SUCCESS;
            }
            else {
                if ((acc.getRole().trim().equals("landlord"))) {                                    // set privillage only tenant can see other room details 
                    url = ERROR;
                    request.setAttribute("errCode", 1);
                    request.setAttribute("ERROR", "WRONG PRIVILLAGE");
                } else if ((acc.getRole().trim().equals("admin"))) {
                    url = ERROR;
                    request.setAttribute("errCode", 2);
                    request.setAttribute("ERROR", "WRONG PRIVILLAGE");
                }
            }
        }
        catch (Exception e){
            System.out.println("Exception at ToDeposit");
            e.printStackTrace();
            url=ERROR;
        }
        finally{
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ToDeposit.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ToDeposit.class.getName()).log(Level.SEVERE, null, ex);
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
