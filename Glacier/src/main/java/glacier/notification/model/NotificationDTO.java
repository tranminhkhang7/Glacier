/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.notification.model;

import java.sql.Timestamp;
import java.util.Date;

/**
 *
 * @author KHANG
 */
public class NotificationDTO {
    public int id;
    public String emailTenant;
    public String emailLandlord;
    public int roomID;
    public String title;
    public String content;
    public Timestamp date;
    public String type;

    public NotificationDTO(String title, String content, Timestamp date) {
        this.title = title;
        this.content = content;
        this.date = date;
    }

    public NotificationDTO(int id, String emailTenant, String emailLandlord, String title, String content, Timestamp date) {
        this.id = id;
        this.emailTenant = emailTenant;
        this.emailLandlord = emailLandlord;
        this.title = title;
        this.content = content;
        this.date = date;
    }

    public NotificationDTO(int id, String emailTenant, String emailLandlord, int roomID, String title, String content, Timestamp date, String type) {
        this.id = id;
        this.emailTenant = emailTenant;
        this.emailLandlord = emailLandlord;
        this.roomID = roomID;
        this.title = title;
        this.content = content;
        this.date = date;
        this.type = type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "NotificationDTO{" + "id=" + id + ", emailTenant=" + emailTenant + ", emailLandlord=" + emailLandlord + ", roomID=" + roomID + ", title=" + title + ", content=" + content + ", date=" + date + ", type=" + type + '}';
    }
}
