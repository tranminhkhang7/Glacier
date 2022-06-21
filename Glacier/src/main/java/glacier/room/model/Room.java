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
    private int numberRating;
    private Date date_added;
    private Date rentStartDate;
    private float area;
    private String detailAddress;
    private String qrStatus;
    private String qrImage;

    public Room() {
    }

    // constructor cho singleRoomView
    public Room(int roomID, String name, String description, String address, String emailTenant, String emailLandlord, String status,
            int price, float deposit, float avgRating, int numberRating, Date date_added, Date rentStartDate, float area, String detailAddress) {
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
        this.numberRating = numberRating;
        this.date_added = date_added;
        this.rentStartDate = rentStartDate;
        this.area = area;
        this.detailAddress = detailAddress;
    }

    //This contruction is for Search function.
    //The emailLandlord does not contain email, it contains landlord's name instead.
    public Room(int roomID, String name, String description, String address, String emailLandlord, int price, float avgRating, Date date_added) {
        this.roomID = roomID;
        this.name = name;
        this.description = description;
        this.address = address;
        this.emailLandlord = emailLandlord;
        this.price = price;
        this.avgRating = avgRating;
        this.date_added = date_added;
    }
    
    public Room(int roomID, String name, String description, String address, String emailLandlord, int price, Date date_added) {
        this.roomID = roomID;
        this.name = name;
        this.description = description;
        this.address = address;
        this.emailLandlord = emailLandlord;
        this.price = price;
        this.date_added = date_added;
    }

    // this constructor is used to get room information to send email via RoomManager.getTenantPendingRoom
    public Room(int roomID, String name, String address, String emailLandlord, String status, int price,float deposit, String detailAddress) {
        this.roomID = roomID;
        this.name = name;
        this.address = address;
        this.emailLandlord = emailLandlord;
        this.status = status;
        this.price = price;
        this.deposit=deposit;
        this.detailAddress = detailAddress;
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

    public Room(int roomID, String name, String description, String address, int price, Date rentStartDate, String status, String emailLandlord) {
        this.roomID = roomID;
        this.name = name;
        this.description = description;
        this.address = address;
        this.price = price;
        this.rentStartDate = rentStartDate;
        this.status = status;
        this.emailLandlord = emailLandlord;
    }

    //Single Tenant room display
    public Room(int roomID, String name, String description, String address, String emailTenant, String emailLandlord, int price, Date date_added, Date rentStartDate, String detailAddress) {
        this.roomID = roomID;
        this.name = name;
        this.description = description;
        this.address = address;
        this.emailTenant = emailTenant;
        this.emailLandlord = emailLandlord;
        this.price = price;
        this.date_added = date_added;
        this.rentStartDate = rentStartDate;
        this.detailAddress = detailAddress;
    }

    //Landlord waiting room display
    public Room(int roomID, String name, String address, int price, String emailTenant) {
        this.roomID = roomID;
        this.name = name;
        this.address = address;
        this.price = price;
        this.emailTenant = emailTenant;
    }
       

    //CHECK ASSIGN ROOM
    public Room(int roomID, String name, String emailTenant, Date rentStartDate, String qrStatus, String status) {
        this.roomID = roomID;
        this.name = name;
        this.emailTenant = emailTenant;
        this.rentStartDate = rentStartDate;
        this.qrStatus = qrStatus;
        this.status = status;
    }

    public int getNumberRating() {
        return numberRating;
    }

    public void setNumberRating(int numberRating) {
        this.numberRating = numberRating;
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

    public Date getRentStartDate() {
        return rentStartDate;
    }

    public void setRentStartDate(Date rentStartDate) {
        this.rentStartDate = rentStartDate;
    }

    public String getQrStatus() {
        return qrStatus;
    }

    public void setQrStatus(String qrStatus) {
        this.qrStatus = qrStatus;
    }

    public String getQrImage() {
        return qrImage;
    }

    public void setQrImage(String qrImage) {
        this.qrImage = qrImage;
    }

    @Override
    public String toString() {
        return "Room{" + "roomID=" + roomID + ", name=" + name + ", description=" + description + ", address=" + address + ", emailTenant=" + emailTenant + ", emailLandlord=" + emailLandlord + ", status=" + status + ", price=" + price + ", deposit=" + deposit + ", avgRating=" + avgRating + ", numberRating=" + numberRating + ", date_added=" + date_added + ", rentStartDate=" + rentStartDate + ", area=" + area + ", detailAddress=" + detailAddress + ", qrStatus=" + qrStatus + ", qrImage=" + qrImage + '}';
    }
    
    



}
