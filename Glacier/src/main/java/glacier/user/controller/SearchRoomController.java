/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.user.controller;

import glacier.model.feature.FeatureDAO;
import glacier.model.feature.FeatureDTO;
import glacier.room.dbmanager.RoomManager;
import glacier.room.model.Room;
import glacier.room.model.RoomDAO;
import glacier.user.model.ImageDTO;
import java.io.IOException;
import java.util.ArrayList;
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
            RoomDAO dao = new RoomDAO();
            // FIRST VALIDATIONS
            String indexPage = request.getParameter("index");
            if (indexPage == null) {
                indexPage = "1";
            }
            int currentPage = Integer.parseInt(indexPage);
            request.setAttribute("currentPage", currentPage);

            String searchText = (String) request.getParameter("keyword");
            if (searchText == null) {
                searchText = "";
            }
            request.setAttribute("searchText", searchText);

            int minPrice, maxPrice;
            if (request.getParameter("min_price") == null || request.getParameter("min_price").equals("")) {
                minPrice = 1;
            } else {
                minPrice = Integer.parseInt(request.getParameter("min_price"));
                request.setAttribute("minPrice", minPrice);
            }
            if (request.getParameter("max_price") == null || request.getParameter("max_price").equals("")) {
                maxPrice = 100000000;
            } else {
                maxPrice = Integer.parseInt(request.getParameter("max_price"));
                request.setAttribute("maxPrice", maxPrice);
            }

            // LOAD FEATURE ID FOR QUERYING
            // Yes mates, I know that who writes like this worth going to hell.
            // But compare to the solution of counting how many features there are in the database,
            // this solution is way more productive.
            List<Integer> listFeature;
            listFeature = new ArrayList<>();
            for (int i = 1; i <= 50; i++) {
                String feature = (String) request.getParameter(Integer.toString(i));
                if (feature != null) {
                    listFeature.add(i);
                }
            }
            // LOAD ALL THE FEATURES WITH THE CHOSEN ONES GOT CHECKED
            FeatureDAO mng = new FeatureDAO();
            List<FeatureDTO> listFeatureGotChecked = mng.loadFeatureGotChecked(listFeature);
//            List<ImageDTO> imageList = dao.getRoomImages(id);
            request.setAttribute("listFeatureGotChecked", listFeatureGotChecked);

            // COUNT HOW MANY MATCHES THERE ARE
            RoomManager manager = new RoomManager();
            int totalMatched = manager.countMatched(searchText, listFeature, minPrice, maxPrice);
            int endPage = totalMatched / 15;
            if (totalMatched % 15 != 0) {
                endPage++;
            }
            if (currentPage > endPage) {
                currentPage = endPage;
            }
            request.setAttribute("endPage", endPage);

            // SEARCH MATCHED ROOMS
            List<Room> listResult = manager.search(searchText, listFeature, minPrice, maxPrice, currentPage);
            request.setAttribute("list", listResult);
            
            // MOUNT ALL THE SELECTED FEATURE IDs INTO A SET OF PARAMETERS
            String featureParameterSet = "";
            for (Integer featureID : listFeature) {
                featureParameterSet += "&" + featureID + "=on";
            }
            request.setAttribute("featureParameterSet", featureParameterSet);

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
