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
public class Notification_TL {
    private String notificationID;
    private String emailTenant;
    private String emailLandlord;
    private String title;
    private String content;
    private Timestamp time;

    public Notification_TL() {
    }

    public Notification_TL(String notificationID, String emailTenant, String emailLandlord, String title, String content, Timestamp time) {
        this.notificationID = notificationID;
        this.emailTenant = emailTenant;
        this.emailLandlord = emailLandlord;
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

    public String getEmailTenant() {
        return emailTenant;
    }

    public void setEmailTenant(String emailTenant) {
        this.emailTenant = emailTenant;
    }

    public String getEmailLandlord() {
        return emailLandlord;
    }

    public void setEmailLandlord(String emailLandlord) {
        this.emailLandlord = emailLandlord;
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
        return "Notification_TL{" + "notificationID=" + notificationID + ", emailTenant=" + emailTenant + ", emailLandlord=" + emailLandlord + ", title=" + title + ", content=" + content + ", time=" + time + '}';
    }
    
    
}
