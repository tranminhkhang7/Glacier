/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.user.controller;

import glacier.user.model.Account;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import static glacier.utils.Constant.*;
import java.io.InputStream;
import java.util.Collection;
import javax.servlet.http.Part;
import org.apache.commons.io.IOUtils;
import glacier.utils.GoogleCloudUtils;
import static glacier.utils.Constant.*;
/**
 *
 * @author ASUS
 */
@WebServlet(name = "AvatarChangeController", urlPatterns = {"/avatar"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class AvatarChangeController extends HttpServlet {
private final String PATH = "D:\\upload\\";
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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AvatarChangeController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AvatarChangeController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory());
        Part filePart = request.getPart("user_image");
        /*Nếu bạn muốn up nhiều file*/
        /**Collection<Part> fileParts = request.getParts();     
        /**int i = 1;
        /**for (Part part : fileParts) {          
        /**    InputStream filecontent = part.getInputStream();
        /**    byte[] fileAsByteArray = IOUtils.toByteArray(filecontent);
        /**    GoogleCloudUtils.uploadObjectFromMemory(GOOGLE_CLOUD_PROJECT_ID, GOOGLE_CLOUD_BUCKET_NAME, "TEST"+i+".PNG", fileAsByteArray);
        /**    i++;
        /**}
        
        */
        /*Nếu bạn muốn up 1 file*/
        InputStream filecontent = filePart.getInputStream();
        byte[] fileAsByteArray = IOUtils.toByteArray(filecontent);
//        for (byte b : fileAsByteArray) {
//            System.out.println(b);
//        }

        GoogleCloudUtils.uploadObjectFromMemory(GOOGLE_CLOUD_PROJECT_ID, GOOGLE_CLOUD_BUCKET_NAME, "TEST.PNG", fileAsByteArray);

        response.sendRedirect("success.jsp");
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
