/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.user.controller;

import com.google.zxing.WriterException;
import glacier.room.dbmanager.RoomManager;
import glacier.user.model.Account;
import glacier.utils.Constant;
import glacier.utils.GoogleCloudUtils;
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
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.codec.digest.DigestUtils;
/**
 *
 * @author KHANG
 */
@WebServlet(name = "Deposit", urlPatterns = {"/deposit"})
public class Deposit extends HttpServlet {
    public String getIpAddress(){
        String ip = "";
        try (final DatagramSocket socket = new DatagramSocket()) {
            socket.connect(InetAddress.getByName("8.8.8.8"), 10002);
            ip = socket.getLocalAddress().getHostAddress();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ip;
    }
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
                String tenantKey = DigestUtils.md5Hex(emailTenant+Math.random());
                String landlordKey = DigestUtils.md5Hex(emailLandlord+Math.random());
                String ip = getIpAddress();
                String content = "http://192.168.27.61:8080/Glacier/assign?tenant_key="+tenantKey+"&landlord_key="+landlordKey;
                //room-id.png
                String imageName = "room-"+roomID+".png";
                Utils.createQR(content, imageName);
                String QrLocalPath = "D:\\FPT\\SP2022\\PRJ301\\apache-tomcat-8.5.73\\bin\\Glacier\\QR\\"+imageName;
                
                //UP HÌNH LÊN CLOUD
                GoogleCloudUtils.uploadObject(Constant.GOOGLE_CLOUD_PROJECT_ID, Constant.GOOGLE_CLOUD_BUCKET_NAME, imageName,QrLocalPath);
                
                //UPDATE CÁI qr_image TRONG ROOM    
                String QRCloudPath = "https://storage.cloud.google.com/glacier-bucket/Room_QR/"+imageName;
                RoomManager rm = new RoomManager();
                if (rm.updateRoomQR(tenantKey, landlordKey,QRCloudPath, roomID)){
                    System.out.println("Successfully store data to db");
                } else System.out.println("Failed to store data to db");
                
                //GỬI MAIL NÈ
                SendEmail se = new SendEmail();
                if (se.SendDepositConfirm(emailTenant,roomID)){
                    System.out.println("Deposit confirm mail sent to "+ emailTenant);
                } else {
                    System.out.println("Failed to send deposit confirm mail to "+emailTenant);
                }
                
                request.setAttribute("QR_Image",QRCloudPath);
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
