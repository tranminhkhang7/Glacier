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
import static glacier.room.model.SingleRoomView.sortByValueCount;
import glacier.user.model.Landlord;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ReportedSingleRoomController", urlPatterns = {"/ReportedSingleRoomController"})
public class ReportedSingleRoomController extends HttpServlet {
    
    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "reported-single-room.jsp";
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
                int id = Integer.parseInt(request.getParameter("id"));              // get room id to view
                // GET ROOM
                RoomDAO dao = new RoomDAO();
                Room room = dao.getRoomById(id);
                ArrayList<String> ImgList = dao.getRoomImgById(id);

                //GET ROOM FEATURE
                ArrayList<String> f = dao.getRoomFeature(id);

                //GET LANDLORD INFO
                RoomManager manager = new RoomManager();
                Landlord l = manager.getLandLordInfoInSingleRoom(id);

                //GET ROOM IDS WITH ADDRESS                   
                List<Integer> roomIdsWithAddress = manager.getRoomsByAddress(room.getAddress(), room.getRoomID());

                //GET FEATURE IDS OF THE ROOM WITH SAME ADDRESS
                List<List<Integer>> featureLists = new ArrayList<>();
                for (Integer roomId : roomIdsWithAddress) {
                    featureLists.add(manager.getRoomFeatureIds(roomId));
                }
                //MAP OF ROOM ID AND FEATURE ID
                Map<Integer, List<Integer>> roomMap = new HashMap<>();
                for (int i = 0; i < roomIdsWithAddress.size(); i++) {
                    roomMap.put(roomIdsWithAddress.get(i), featureLists.get(i));
                }
                //RETAIN THE SIMILAR FEATURES
                for (int i = 0; i < roomIdsWithAddress.size(); i++) {
                    roomMap.get(roomIdsWithAddress.get(i)).retainAll(manager.getRoomFeatureIds(room.getRoomID()));
                }
                //SORT BY THE SIMILAR OF FEATURES
                Map<Integer, List<Integer>> roomMapSorted = sortByValueCount(roomMap);
                List<Room> roomsByFeature = new ArrayList<>();
                for (Integer roomId : roomMapSorted.keySet()) {
                    roomsByFeature.add(dao.getRoomById(roomId));
                }
                //FINSIH
                url = SUCCESS;
                request.setAttribute("ROOM_BY_FEATURE", roomsByFeature);
                request.setAttribute("room", room);
                request.setAttribute("f", f);
                request.setAttribute("ImgList", ImgList);
                request.setAttribute("Landlord", l);
                FeatureDAO mng = new FeatureDAO();
                List<FeatureDTO> listFeature = mng.loadFeature();
                request.setAttribute("listFeature", listFeature);
                
        } catch (Exception e) {
            e.printStackTrace();
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
