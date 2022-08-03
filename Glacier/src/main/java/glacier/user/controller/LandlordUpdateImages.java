/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package glacier.user.controller;

import glacier.landlord.dbmanager.LandlordManager;
import static glacier.utils.Constant.GOOGLE_CLOUD_BUCKET_NAME;
import static glacier.utils.Constant.GOOGLE_CLOUD_PROJECT_ID;
import glacier.utils.GoogleCloudUtils;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

/**
 *
 * @author Admin
 */
@WebServlet(name = "LandlordUpdateImages", urlPatterns = {"/imgupdate"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class LandlordUpdateImages extends HttpServlet {
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
        try{
            HttpSession ss = request.getSession();
            LandlordManager mng = new LandlordManager();
            Collection<Part> fileParts = request.getParts();
            int i = 1;
            String roomID="";
            for (Part part : fileParts) {
                if ("roomID".equals(part.getName())){
                    StringWriter writer = new StringWriter();
                    IOUtils.copy(part.getInputStream(), writer, "UTF-8");
                    roomID= writer.toString();
                    mng.deleteImageLink(Integer.parseInt(roomID));
                }
            }
            for (Part part : fileParts) {
                if (part.getContentType() != null) {
                    InputStream filecontent = part.getInputStream();
                    byte[] fileAsByteArray = IOUtils.toByteArray(filecontent);
                    String picDir = CLOUD_BASE_PICTURE_FOLDER + roomID + "_" + i + ".PNG";
                    GoogleCloudUtils.uploadObjectFromMemory(GOOGLE_CLOUD_PROJECT_ID, GOOGLE_CLOUD_BUCKET_NAME, picDir, fileAsByteArray, "image/png");
                    if (!mng.saveRoomImage(mng.getCurrentRoomID(), i)) {
                        throw new ImageSaveException();
                    }
                    i++;
                }
            }
            ss.setAttribute("notify", "updateSuccess");
            response.sendRedirect("/Glacier/roomlist");
        } catch (ImageSaveException e) {
            log("Error when uploading picture");
        } catch (Exception e) {
            log("Error at LandlordUpdateImage: " + e.toString());
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
        private static class ImageSaveException extends ServletException{
    }
}
