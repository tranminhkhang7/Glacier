/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package glacier.room.model;

import glacier.room.dbmanager.CommentManager;
import glacier.room.dbmanager.FavouriteManager;
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
    private static final int TEST = 10;
    private static final Account TESTACC = new Account("dinhxuantung@gmail.com","", "tenant");
    
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");   
        String url = ERROR;
        try {   
            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("acc");
            acc = TESTACC;                                                              // this set default access delete this when merging
//            if (acc.getRole().equals("landlord")){                                    // set privillage only tenant can see other room details 
//                url = ERROR;
//                request.setAttribute("ERROR", "WRONG PRIVILLAGE");
//            }
//            if (acc.getRole().equals("tenant")) {
                    String indexPage = request.getParameter("index");
                    if (indexPage == null){
                        indexPage="1";
                    }
                    int currentPage=Integer.parseInt(indexPage);
                    int id = Integer.parseInt(request.getParameter("id"));      // get room id to view
                    // GET ROOM
                    RoomDAO dao = new RoomDAO();
                    Room room = dao.getRoomById(id);                     
                    ArrayList<String> ImgList = dao.getRoomImgById(id);
                    
                    //GET COMMENT AND PAGING
                    CommentManager cm = new CommentManager();
                    ArrayList<Comment> Reviews = cm.getAllComment(id,currentPage);
                    int totalReviews=cm.getNumberOfComment(id);
                    int endPage = totalReviews/5;
                    if (totalReviews % 5!=0){
                        endPage++;
                    }
                    
                    //GET FAVOURITE STATUS
                    FavouriteManager FM = new FavouriteManager();
                    boolean FStatus = FM.getFStatus(id, acc.getEmail());
                    
                    //FINSIH
                    url=SUCCESS;        
                    request.setAttribute("room", room);
                    request.setAttribute("ImgList", ImgList);
                    request.setAttribute("FStatus", FStatus);
                    request.setAttribute("Reviews", Reviews);
                    request.setAttribute("endPage",endPage);
                    request.setAttribute("currentPage",currentPage);
//            }
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
