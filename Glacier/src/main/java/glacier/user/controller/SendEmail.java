/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.user.controller;

/**
 *
 * @author ASUS
 */
import glacier.room.dbmanager.RoomManager;
import glacier.room.model.Room;
import glacier.user.model.Tenant;
import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {

    //generate vrification code
    public String getRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }

    //send email to the user email
    public boolean sendEmail(String id, String key, String email) {
        boolean test = false;

        String toEmail = email;
        final String fromEmail = "glacier.hostel@gmail.com";
        final String password = "bagqavudvkeacwvo";
        Properties theProperties = new Properties();

        theProperties.put("mail.smtp.auth", "true");
        theProperties.put("mail.smtp.starttls.enable", "true");
        theProperties.put("mail.smtp.host", "smtp.gmail.com");
        theProperties.put("mail.smtp.port", "587");

        Session session = Session.getDefaultInstance(theProperties, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });
        
        //Link for redirect to verify
        String link = "http://localhost:8080/Glacier/verify?id=" + id + "&key="+key ;
        
        //html form for mail
        try {
            String content = "  <div><img style=\"width:5%; border-radius: 50%;display: block;margin-left: auto; margin-right: auto;\" id=\"verify-image\" src=\"https://thumbs.dreamstime.com/b/beautiful-meticulously-designed-email-open-mail-new-email-icon-well-organized-fully-editable-vector-icon-email-open-mail-new-158557376.jpg\" alt=\"verify\"></div>\n"
                    + "  <h2 style=\"text-align: center;\">Hello, please verify your email</h2>\n"
                    + "  <a style=\"text-decoration: none;font-size: 150%;color: white;margin-left: 42%;max-width: 300px; background-color: #4997d0; border-radius: 2px; padding: 5px;\" href="+link+">Verify Email Address</a>\n"
                    + "  <p style=\"text-align: center; margin-top: 20px;\">\n"
                    + "    You have entered "+toEmail+" as the email address for your account.<br>\n"
                    + "    please verify this email address by clicking the button\n"
                    + "  </p>";
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            message.setSubject("Email Verification Link");
            message.setContent(content, "text/html");
            //message.setText("Registered successfully.Please verify your account using this code: " + user.getCode());

//            message.setText("Click this link to confirm your email address and complete setup for your account."
 //                   + "\n\nVerification Link: " + "http://localhost:8080/EmailVerification/ActivateAccount?key1=" + toEmail + "&key2=" + "");
            Transport.send(message);

            System.out.println("Successfully sent Verification Link");
            test = true;
        } catch (Exception e) {
            System.out.println("Error at SendingEmail.java: " + e);
        }


        return test;
    }
    public boolean SendDepositConfirm(String email,int roomID) {
        boolean test = false;
        String toEmail = email;
        final String fromEmail = "glacier.hostel@gmail.com";
        final String password = "bagqavudvkeacwvo";
        Properties theProperties = new Properties();
        theProperties.put("mail.smtp.auth", "true");
        theProperties.put("mail.smtp.starttls.enable", "true");
        theProperties.put("mail.smtp.host", "smtp.gmail.com");
        theProperties.put("mail.smtp.port", "587");
        
        Session session = Session.getDefaultInstance(theProperties, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });
        
        RoomManager rm = new RoomManager();
        Room r = rm.getTenantPendingRoom(roomID);
        
        UserManager um = new UserManager();
        Tenant t = um.getTenantInfo(toEmail);
        //html form for mail
        try {
            String content = "<body style=\"font-family:Arial,Helvetica,sans-serif ; margin: 1rem 1rem 1rem 1rem\">\n" +
"    <div style=\"flex: auto; background-color: #fff; width: 100%; margin-bottom: 2rem;\">\n" +
"        <div style=\"text-align: center; font-size:30px; font-weight: bold;\">Đặt cọc phòng \""+r.getName()+"\"</div>\n" + 
"        <br>\n" +
"      <div style=\"text-align:left\">\n" +
"        <strong>"+t.getName()+",</strong>\n" +
"        <p>Cám ơn bạn đã đặt cọc cho phòng \""+r.getName()+"\", chúng tôi đang chuẩn bị mọi thứ cho bạn.</p>\n" +
"        <p>Phòng của bạn đang được đưa vào trạng thái chờ chủ trọ xác nhận</p>\n" +
"        <p>Dưới đây là chi tiết đặt cọc của bạn:</p>\n" +
"      </div>\n" +
"        <table style=\"width: 100%; border-collapse: collapse;\">\n" +
"            <tr>\n" +
"                <th style=\"border: 0.5px solid\">STT</th>\n" +
"                <th style=\"border: 0.5px solid\">Tên mục trả tiền</th>\n" +
"                <th style=\"border: 0.5px solid\">Mô tả</th>\n" +
"                <th style=\"border: 0.5px solid\">Số tiền</th>\n" +
"                <th style=\"border: 0.5px solid\">Đơn vị tính</th>\n" +
"            </tr>\n" +
"\n" +
"            <tr style=\"\">\n" +
"                <td style=\"border: 0.5px solid; margin-left: 5rem;\">1</td>\n" +
"                <td style=\"border: 0.5px solid; margin-left: 5rem;\">Tiền đặt cọc cho phòng "+r.getName()+"</td>\n" +
"                <td style=\"border: 0.5px solid; margin-left: 5rem;\">Tiền đặt cọc giữ chờ xử lí</td>\n" +
"                <td style=\"border: 0.5px solid; margin-left: 5rem;\">"+r.getDeposit()+"</td>\n" +
"                <td style=\"border: 0.5px solid; margin-left: 5rem;\">VNĐ</td>\n" +
"            </tr>\n" +
"        </table>\n" +
"        <div style=\"float: right; margin-top: 0.5rem;\">\n" +
"            <div style=\"text-align: center;border-top: 0.5px solid; margin-top: 1rem; padding: 0.5rem;\">Tổng tiền: "+r.getDeposit()+" VNĐ</div>        \n" +
"        </div>\n" +
"        <div style=\"clear: both;\"></div>        \n" +
"    </div>\n" +
"    <div class=\"footer\">\n" +
"        <strong>Glacier hostel</strong>\n" +
"    </div>\n" +
"</body>";
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            message.setSubject("Bạn đã đặt phòng ở Glacier.co","UTF-8");
            message.setContent(content,"text/html;charset=UTF-8");
            Transport.send(message);
            System.out.println("Deposit mail sent");
            test = true;
        } catch (Exception e) {
            System.out.println("Error at SendingEmail.java: " + e);
        }


        return test;
    }
}
