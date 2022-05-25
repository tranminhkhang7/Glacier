/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.room.model;

import java.sql.Date;

/**
 *
 * @author ASUS
 */
public class Room {
    private String roomID;
    private String name;
    private String description;
    private String address;
    private String emailTenant;
    private String emailLandlord;
    private String status;
    private int price;
    private float deposit;
    private float avgRating;
    private String detailAddress;
    private float area;
    private Date dateAdded;

    public Room() {
    }

    public Room(String roomID, String name, String description, String address, String emailTenant, String emailLandlord, String status, int price, float deposit, float avgRating) {
        this.roomID = roomID;
        this.name = name;
        this.description = description;
        this.address = address;
        this.emailTenant = emailTenant;
        this.emailLandlord = emailLandlord;
        this.status = status;
        this.price = price;
        this.deposit = deposit;
        this.avgRating = avgRating;
    }

    //This contruction is for Search function.
    //The emailLandlord does not contain email, it contains landlord's name instead.
    public Room(String roomID, String name, String description, String address, String emailLandlord, int price, Date dateAdded) {
        this.roomID = roomID;
        this.name = name;
        this.description = description;
        this.address = address;
        this.emailLandlord = emailLandlord;
        this.price = price;
        this.dateAdded = dateAdded;
    }

    
    
    public String getRoomID() {
        return roomID;
    }

    public void setRoomID(String roomID) {
        this.roomID = roomID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public float getDeposit() {
        return deposit;
    }

    public void setDeposit(float deposit) {
        this.deposit = deposit;
    }

    public float getAvgRating() {
        return avgRating;
    }

    public void setAvgRating(float avgRating) {
        this.avgRating = avgRating;
    }

    public String getDetailAddress() {
        return detailAddress;
    }

    public void setDetailAddress(String detailAddress) {
        this.detailAddress = detailAddress;
    }

    public float getArea() {
        return area;
    }

    public void setArea(float area) {
        this.area = area;
    }

    public Date getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(Date dateAdded) {
        this.dateAdded = dateAdded;
    }

    
    
    
    @Override
    public String toString() {
        return "Room{" + "roomID=" + roomID + ", name=" + name + ", description=" + description + ", address=" + address + ", emailTenant=" + emailTenant + ", emailLandlord=" + emailLandlord + ", status=" + status + ", price=" + price + ", deposit=" + deposit + ", avgRating=" + avgRating + '}';
    }
    
}
