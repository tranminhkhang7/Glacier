/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package glacier.room.model;

import glacier.model.feature.FeatureDAO;
import glacier.model.feature.FeatureDTO;
import glacier.room.dbmanager.CommentManager;
import glacier.room.dbmanager.FavouriteManager;
import glacier.room.dbmanager.RoomManager;
import glacier.user.model.Account;
import glacier.user.model.ImageDTO;
import glacier.user.model.Landlord;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
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
    private static final String ERROR = "error.jsp";               // change this after adding session
    private static final String SUCCESS = "SingleRoom.jsp";
    private static final int TEST = 10;
    private static final Account TESTACC = new Account("dinhxuantung@gmail.com", "", "tenant");
    private static final Account GUEST = new Account("", "", "tenant");

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;

        try {
            HttpSession session = request.getSession(false);
            Account acc = (Account) session.getAttribute("LOGIN_USER");
//            acc = TESTACC;                                                            // this set default access delete this when merging
            if (acc == null) {
                acc = GUEST;
            }
            if ((acc.getRole().equals("tenant"))) {

                String indexPage = request.getParameter("index");
                if (indexPage == null) {
                    indexPage = "1";
                }
                int currentPage = Integer.parseInt(indexPage);
                int id = Integer.parseInt(request.getParameter("id"));              // get room id to view
                // GET ROOM
                RoomDAO dao = new RoomDAO();
                Room room = dao.getRoomById(id);
                if(!room.getStatus().trim().equalsIgnoreCase("available")){
                url = ERROR;
                request.setAttribute("errCode", 1);
                request.setAttribute("ERROR", "PHÒNG KHÔNG THỂ XEM");
                return;
                }
                ArrayList<String> ImgList = dao.getRoomImgById(id);

                //GET ROOM FEATURE
                ArrayList<String> f = dao.getRoomFeature(id);

                //GET COMMENT AND PAGING
                CommentManager cm = new CommentManager();
                ArrayList<Comment> Reviews = cm.getAllComment(id, currentPage);
                int totalReviews = cm.getNumberOfComment(id);
                int endPage = totalReviews / 5;
                if (totalReviews % 5 != 0) {
                    endPage++;
                }

                //GET FAVOURITE STATUS
                FavouriteManager FM = new FavouriteManager();
                boolean FStatus = FM.getFStatus(id, acc.getEmail());

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
                //GET ROOM IMAGES BY ROOMID
                List<ImageDTO> imageList = dao.getRoomImages(id);
                //FINSIH
                url = SUCCESS;
                request.setAttribute("ROOM_BY_FEATURE", roomsByFeature);
                request.setAttribute("ROOM_IMAGES", imageList);
                request.setAttribute("room", room);
                request.setAttribute("f", f);
                request.setAttribute("ImgList", ImgList);
                request.setAttribute("FStatus", FStatus);
                request.setAttribute("Reviews", Reviews);
                request.setAttribute("Landlord", l);
                request.setAttribute("endPage", endPage);
                request.setAttribute("currentPage", currentPage);
                
                FeatureDAO mng = new FeatureDAO();
                List<FeatureDTO> listFeature = mng.loadFeature();
                request.setAttribute("listFeature", listFeature);
                
            } else if ((acc.getRole().trim().equals("landlord"))) {                                    // set privillage only tenant can see other room details 
                url = ERROR;
                request.setAttribute("errCode", 1);
                request.setAttribute("ERROR", "WRONG PRIVILLAGE");
            } else if ((acc.getRole().trim().equals("admin"))) {
                url = ERROR;
                request.setAttribute("errCode", 2);
                request.setAttribute("ERROR", "WRONG PRIVILLAGE");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    public static Map<Integer, List<Integer>> sortByValueCount(final Map<Integer, List<Integer>> homeListMap) {
        return homeListMap.entrySet()
                .stream()
                .sorted((e1, e2) -> Integer.compare(e2.getValue().size(), e1.getValue().size()))
                .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue, (e1, e2) -> e1, LinkedHashMap::new));
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
