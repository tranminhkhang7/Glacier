/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.user.controller;


import glacier.user.model.UserSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "RegisterController", urlPatterns = {"/register"})
public class RegisterController extends HttpServlet {

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
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            String rePass = request.getParameter("repeat_password");
            String gender = request.getParameter("gender");
            String role = request.getParameter("role").toLowerCase();
            String phone = request.getParameter("phone");
            String status = "active";
            String id = DigestUtils.md5Hex(email);
            String key = DigestUtils.md5Hex(password);    
            //boolean checkInsertUser = false;
            //HashMap<String,String> errors = new HashMap<String,String>();
            HttpSession ss = request.getSession();
            //Account acc = new Account(email, password, role);
            UserManager manager = new UserManager();
            boolean checkDuplicate = manager.checkDuplicate(email);
            if (checkDuplicate) {
                //errors.put("duplicate", "Email has existed");
                request.setAttribute("ERROR_REGISTER", "Email has existed");
            } else {
                UserSession userSession = new UserSession(email, name, password, role, gender, phone, status, id, key);
                ss.setAttribute("USER_SESSION", userSession);
                //create instance object of the SendEmail Class
                SendEmail sm = new SendEmail();
                            

                //craete new user using all information
                //User user = new User(name, email, code);
                //call the send email method
                boolean test = sm.sendEmail(id,key,email);

                //check if the email send successfully
                if (test) {
                    
                    //session.setAttribute("authcode", user);
                    request.setAttribute("IS_VERIFIED", true);
                    request.getRequestDispatcher("verify.jsp").forward(request, response);
                    return;
//                response.sendRedirect("verify.jsp");
                } else {
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                    return;
                    //out.println("Failed to send verification email");
                }
            }
        } catch (Exception e) {
            log("Error at RegisterController: " + e.toString());
        }
        request.getRequestDispatcher("access/register.jsp").forward(request, response);
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
