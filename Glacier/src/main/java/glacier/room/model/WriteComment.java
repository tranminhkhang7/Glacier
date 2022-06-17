/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package glacier.room.model;

import glacier.room.dbmanager.CommentManager;
import glacier.room.dbmanager.RoomManager;
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
@WebServlet(name = "WriteComment", urlPatterns = {"/WriteComment"})
public class WriteComment extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR = "error.jsp";               
    private static final String SUCCESS = "SingleRoomView";
    private static final Account TEST= new Account("dinhxuantung@gmail.com","12345678","tenant");           // TEST ACCOUNT
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try{
            HttpSession session = request.getSession(false);
            Account a = (Account)session.getAttribute("LOGIN_USER");
            //a = TEST;                                                    // THIS IS FOR TESTING                           // Delete this when hook code
            if (a==null){
                request.setAttribute("errCode",null);
                request.getRequestDispatcher(ERROR).forward(request, response);
            }
            else if (a.getRole().equals("tenant")){
                CommentManager cm = new CommentManager();
                int commentID = cm.getNextCommentIndex();
                long now = System.currentTimeMillis();
                Timestamp date = new Timestamp(now);
                int roomID = Integer.parseInt(request.getParameter("roomID"));
                int rating = Integer.parseInt(request.getParameter("rating"));
                String content = request.getParameter("review");
                Comment c = new Comment(commentID, roomID, content, rating,a.getEmail(), date);
                if(!cm.createComment(c)){
                    System.err.println("ERROR CREATE COMMENT");
                }
                else {
                    RoomManager rm = new RoomManager();
                    if(rm.updateRoomRating(roomID, rating)) response.sendRedirect(SUCCESS+"?id="+roomID);
                    else {
                        request.setAttribute("errCode",null);
                        request.getRequestDispatcher(ERROR).forward(request, response);
                    }
                }
            }
                else 
                    if (a.getRole().trim().equals("landlord")){
                    request.setAttribute("errCode",1);
                    request.getRequestDispatcher(ERROR).forward(request, response);
                    }
                else 
                    if (a.getRole().trim().equals("admin")){
                    request.setAttribute("errCode",2);
                    request.getRequestDispatcher(ERROR).forward(request, response);
                    }
        }
        catch(Exception e){
            e.printStackTrace();
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
