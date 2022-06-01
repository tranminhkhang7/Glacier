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
}
