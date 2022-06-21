/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.moderator.dbmanager;

/**
 *
 * @author Admin
 */
public class VerifyingRoom {
    private int roomID;
    private String name;
    private String address;
    private String emailLandlord;
    private String date_added;
    private String phone;

    public VerifyingRoom() {
    }

    public VerifyingRoom(int roomID, String name, String address, String emailLandlord, String date_added, String phone) {
        this.roomID = roomID;
        this.name = name;
        this.address = address;
        this.emailLandlord = emailLandlord;
        this.date_added = date_added;
        this.phone = phone;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmailLandlord() {
        return emailLandlord;
    }

    public void setEmailLandlord(String emailLandlord) {
        this.emailLandlord = emailLandlord;
    }

    public String getDate_added() {
        return date_added;
    }

    public void setDate_added(String date_added) {
        this.date_added = date_added;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    
    
    
    
    
}
