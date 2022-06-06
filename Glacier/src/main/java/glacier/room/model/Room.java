/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.room.model;

import java.util.Date;


public class Room {
    private int roomID;
    private String name;
    private String description;
    private String address;
    private String emailTenant;
    private String emailLandlord;
    private String status;
    private int price;
    private float deposit;
    private float avgRating;
    private Date date_added;
    private float area;
    private String detailAddress;

    public Room() {
    }


    public Room(int roomID, String name, String description, String address, String emailTenant, String emailLandlord, String status, int price, float deposit, float avgRating, Date date_added, float area, String detailAddress) {
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
        this.date_added = date_added;
        this.area = area;
        this.detailAddress = detailAddress;
    }

    //This contruction is for Search function.
    //The emailLandlord does not contain email, it contains landlord's name instead.
    public Room(int roomID, String name, String description, String address, String emailLandlord, int price, Date date_added) {
        this.roomID = roomID;
        this.name = name;
        this.description = description;
        this.address = address;
        this.emailLandlord = emailLandlord;
        this.price = price;
        this.date_added = date_added;
    }

    //This constructor is for Displaying Room List in Landlord's views.
    public Room(int roomID, String name, String description, String address, String status, int price, float avgRating, Date date_added, float area) {
        this.roomID = roomID;
        this.name = name;
        this.description = description;
        this.address = address;
        this.status = status;
        this.price = price;
        this.avgRating = avgRating;
        this.date_added = date_added;
        this.area = area;
    }

    public Room(int roomID, String name, String description, String address, int price) {
        this.roomID = roomID;
        this.name = name;
        this.description = description;
        this.address = address;
        this.price = price;
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

    public Date getDate_added() {
        return date_added;
    }

    public void setDate_added(Date date_added) {
        this.date_added = date_added;
    }

    public float getArea() {
        return area;
    }

    public void setArea(float area) {
        this.area = area;
    }

    public String getDetailAddress() {
        return detailAddress;
    }

    public void setDetailAddress(String detailAddress) {
        this.detailAddress = detailAddress;
    }

    @Override
    public String toString() {
        return "Room{" + "roomID=" + roomID + ", name=" + name + ", description=" + description + ", address=" + address + ", emailTenant=" + emailTenant + ", emailLandlord=" + emailLandlord + ", status=" + status + ", price=" + price + ", deposit=" + deposit + ", avgRating=" + avgRating + ", date_added=" + date_added + ", area=" + area + ", detailAddress=" + detailAddress + '}';
    }

    
    
}
