/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.user.model;

import java.sql.Timestamp;

/**
 *
 * @author ASUS
 */
public class Notification_LT {

    private String notificationID;
    private String emailLandlord;
    private String emailTenant;    
    private String title;
    private String content;
    private Timestamp time;

    public Notification_LT() {
    }

    public Notification_LT(String notificationID, String emailLandlord, String emailTenant, String title, String content, Timestamp time) {
        this.notificationID = notificationID;
        this.emailLandlord = emailLandlord;
        this.emailTenant = emailTenant;
        this.title = title;
        this.content = content;
        this.time = time;
    }

    public String getNotificationID() {
        return notificationID;
    }

    public void setNotificationID(String notificationID) {
        this.notificationID = notificationID;
    }

    public String getEmailLandlord() {
        return emailLandlord;
    }

    public void setEmailLandlord(String emailLandlord) {
        this.emailLandlord = emailLandlord;
    }

    public String getEmailTenant() {
        return emailTenant;
    }

    public void setEmailTenant(String emailTenant) {
        this.emailTenant = emailTenant;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Notification_LT{" + "notificationID=" + notificationID + ", emailLandlord=" + emailLandlord + ", emailTenant=" + emailTenant + ", title=" + title + ", content=" + content + ", time=" + time + '}';
    }
    
}
