/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.user.controller;

import glacier.landlord.dbmanager.LandlordManager;
import glacier.model.feature.FeatureDAO;
import glacier.model.feature.FeatureDTO;
import glacier.user.model.Account;
import glacier.user.model.Landlord;
import glacier.utils.GoogleCloudUtils;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.io.IOUtils;
import static glacier.utils.Constant.*;
import javax.servlet.annotation.MultipartConfig;
import java.util.Collection;
import javax.servlet.http.Part;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
/**
 *
 * @author KHANG
 */
@WebServlet(name = "LandlordAddRoom", urlPatterns = {"/addroom"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class LandlordAddRoom extends HttpServlet {
    private static String CLOUD_BASE_PICTURE_FOLDER = "Room_Pictures/";
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
            request.setCharacterEncoding("UTF-8");
            HttpSession ss = request.getSession();
            Account user = (Account) ss.getAttribute("LOGIN_USER");

            String role = (user == null) ? "" : user.getRole().trim();
            if ("landlord".equals(role)) {
                if (request.getParameter("name") != null) {
                    HttpSession session = request.getSession(false);
                    if (session != null) {
                        String name = request.getParameter("name");
//                        System.out.println(name);
                        String description = request.getParameter("details");
                        String city = request.getParameter("city");
                        String district = request.getParameter("district");
                        String address = district + ", " + city;
                        String detailAddress = request.getParameter("location");
                        String status = "verifying";
                        int price = Integer.parseInt(request.getParameter("price"));
                        int deposit = Integer.parseInt(request.getParameter("deposit"));
                        float avgRating = 0;
                        Date dateAdded = new Date();
                        float area = Float.parseFloat(request.getParameter("area"));

                        List<Integer> listFeature;
                        listFeature = new ArrayList<>();
                        for (int i = 1; i <= 50; i++) {
                            String feature = (String) request.getParameter("room_features" + i);
                            if (feature != null) {
                                listFeature.add(i);
                            }
                        }
                        LandlordManager mng = new LandlordManager();
                        Landlord landlord = (Landlord) session.getAttribute("USER_DETAIL");
                        String emailLandlord = landlord.getEmail();
                        if(mng.addRoom(name, description, address, detailAddress, status, price, deposit, avgRating, dateAdded, area, emailLandlord, listFeature)){
                            Collection<Part> fileParts = request.getParts();
                            int i = 1;
                            for (Part part : fileParts) {
                                if (part.getContentType() != null) {
                                    InputStream filecontent = part.getInputStream();
                                    byte[] fileAsByteArray = IOUtils.toByteArray(filecontent);
                                    String picDir = CLOUD_BASE_PICTURE_FOLDER + mng.getCurrentRoomID()+ "_" + i + ".PNG";
                                    //GoogleCloudUtils.uploadObjectFromMemory(GOOGLE_CLOUD_PROJECT_ID, GOOGLE_CLOUD_BUCKET_NAME, picDir, fileAsByteArray);
                                    if(!mng.saveRoomImage(mng.getCurrentRoomID(), picDir)) throw new ImageSaveException();
                                    i++;
                                }
                            }
                        } 
                        session.setAttribute("notify", "addSuccess");
                        response.sendRedirect("roomlist");
                    }
                } else {
                    FeatureDAO mng = new FeatureDAO();
                    List<FeatureDTO> listFeature = mng.loadFeature();
                    request.setAttribute("listFeature", listFeature);
                    RequestDispatcher rd = request.getRequestDispatcher("/addroom.jsp");
                    rd.forward(request, response);
                }
            } else {
                response.sendRedirect("login");
            }
        } 
        catch (ImageSaveException e){
            log("Error when uploading picture");
        }
        catch (Exception e) {
            log("Error at LandlordAddRoom: " + e.toString());
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

    private static class ImageSaveException extends ServletException{
    }

}
