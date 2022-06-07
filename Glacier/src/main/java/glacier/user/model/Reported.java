/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.user.model;

/**
 *
 * @author Admin
 */
public class Reported {
    private String id;
    private String userEmail;
    private String detail;
    private String date;
    private String type;

    public Reported() {
    }

    public Reported(String id, String userEmail, String detail, String date, String type) {
        this.id = id;
        this.userEmail = userEmail;
        this.detail = detail;
        this.date = date;
        this.type = type;
    }


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return this.id + this.date + this.detail + this.userEmail + this.type;
    }
    
    
}
