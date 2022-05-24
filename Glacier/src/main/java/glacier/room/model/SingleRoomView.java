/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package glacier.room.model;

import glacier.user.model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class SingleRoomView extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    
    private static final String ERROR = "SingleRoom.jsp";               // change this after adding session
    private static final String SUCCESS = "SingleRoom.jsp";
    private static final int TEST = 10;                                 // test value, delete this when merging
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
//            HttpSession session = request.getSession();
//            Account role = (Account) session.getAttribute("role");
            String role = "tenant";                                     // this set default access delete this when merging
            if (!role.equals("tenant")){                                // set privillage only tenant can see other room details 
                url = ERROR;
                request.setAttribute("ERROR", "WRONG PRIVILLAGE");
            }
            if (role.equals("tenant")) {
//                int id = Integer.parseInt(request.getParameter("id"));  // get room id to view
                RoomDAO dao = new RoomDAO();
                Room room = dao.getRoomById(TEST);                      // replace TEST with id when merging
                ArrayList<String> ImgList = dao.getRoomImgById(TEST);
                request.setAttribute("room", room);
                request.setAttribute("ImgList", ImgList);
                url=SUCCESS;
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        finally {
            request.getRequestDispatcher(url).forward(request,response);
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
