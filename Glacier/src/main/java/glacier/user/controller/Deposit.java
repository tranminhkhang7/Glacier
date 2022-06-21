/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.user.controller;

import com.google.zxing.WriterException;
import glacier.user.model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import glacier.utils.Utils;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.codec.digest.DigestUtils;
/**
 *
 * @author KHANG
 */
@WebServlet(name = "Deposit", urlPatterns = {"/deposit"})
public class Deposit extends HttpServlet {

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
            throws ServletException, IOException, WriterException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession ss = request.getSession();
            Account user = (Account) ss.getAttribute("LOGIN_USER");
            String role = (user == null) ? "" : user.getRole().trim();
            if (!"tenant".equals(role)) {
                RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
                rd.forward(request, response);
            } else {
                String emailTenant = user.getEmail().trim();
                int roomID = Integer.parseInt(request.getParameter("id"));

                String emailLandlord = request.getParameter("landlordEmail").trim();
                UserManager mng = new UserManager();
                mng.deposit(emailTenant, roomID);
                
                //CREATE QR CODE //email + ngay + 1 so ngau nhien
                //ipv4:8080/Glacier/qrscan?tenant_key=abc
                String tenatKey = DigestUtils.md5Hex(emailTenant);
                String landlordKey = DigestUtils.md5Hex(emailLandlord);
                String content = "http://192.168.1.7:8080/Glacier/qrscan?tenant_key="+tenatKey+"&landlord_key="+landlordKey;
                //room-id.jpg
                String imageName = "room-"+roomID+".png";
                Utils.createQR(content, imageName);
                
                //UP HÌNH LÊN CLOUD
                //LẤY CÁI SIGNED URL, UPDATE CÁI qr_image TRONG ROOM    
                
//                mng.deposit(emailTenant, roomID);
                SendEmail se = new SendEmail();
                if (se.SendDepositConfirm(emailTenant,roomID)){
                    System.out.println("Deposit confirm mail sent to "+ emailTenant);
                } else {
                    System.out.println("Failed to send deposit confirm mail to "+emailTenant);
                }

                RequestDispatcher rd = request.getRequestDispatcher("success-deposit.jsp");
                rd.forward(request, response);
            }
        }catch(Exception e){
            log("Error at Deposit: "+e.toString());
            
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
        } catch (WriterException ex) {
            Logger.getLogger(Deposit.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (WriterException ex) {
            Logger.getLogger(Deposit.class.getName()).log(Level.SEVERE, null, ex);
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
