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
    private boolean has_mayLanh;
    private boolean has_hamGuiXe;
    private boolean has_keBep;
    private boolean has_remCua;
    private boolean has_phongGiatDo;
    private boolean has_banCong;
    private boolean has_xeBuyt;
    private boolean has_khuDanCu;
    private boolean has_cuaSo;
    private boolean has_baoVe;
    
    public Room() {
    }

    // constructor cho singleRoomView

    public Room(int roomID, String name, String description, String address, String emailTenant, String emailLandlord, String status, int price, float deposit, float avgRating, int numberRating, Date date_added, Date rentStartDate, float area, String detailAddress, boolean has_mayLanh, boolean has_hamGuiXe, boolean has_keBep, boolean has_remCua, boolean has_phongGiatDo, boolean has_banCong, boolean has_xeBuyt, boolean has_khuDanCu, boolean has_cuaSo, boolean has_baoVe) {
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
        this.has_mayLanh = has_mayLanh;
        this.has_hamGuiXe = has_hamGuiXe;
        this.has_keBep = has_keBep;
        this.has_remCua = has_remCua;
        this.has_phongGiatDo = has_phongGiatDo;
        this.has_banCong = has_banCong;
        this.has_xeBuyt = has_xeBuyt;
        this.has_khuDanCu = has_khuDanCu;
        this.has_cuaSo = has_cuaSo;
        this.has_baoVe = has_baoVe;
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

    public Room(int roomID, String name, String description, String address, int price, Date rentStartDate, String status) {
        this.roomID = roomID;
        this.name = name;
        this.description = description;
        this.address = address;
        this.price = price;
        this.rentStartDate = rentStartDate;
        this.status = status;
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

    public boolean isHas_mayLanh() {
        return has_mayLanh;
    }

    public void setHas_mayLanh(boolean has_mayLanh) {
        this.has_mayLanh = has_mayLanh;
    }

    public boolean isHas_hamGuiXe() {
        return has_hamGuiXe;
    }

    public void setHas_hamGuiXe(boolean has_hamGuiXe) {
        this.has_hamGuiXe = has_hamGuiXe;
    }

    public boolean isHas_keBep() {
        return has_keBep;
    }

    public void setHas_keBep(boolean has_keBep) {
        this.has_keBep = has_keBep;
    }

    public boolean isHas_remCua() {
        return has_remCua;
    }

    public void setHas_remCua(boolean has_remCua) {
        this.has_remCua = has_remCua;
    }

    public boolean isHas_phongGiatDo() {
        return has_phongGiatDo;
    }

    public void setHas_phongGiatDo(boolean has_phongGiatDo) {
        this.has_phongGiatDo = has_phongGiatDo;
    }

    public boolean isHas_banCong() {
        return has_banCong;
    }

    public void setHas_banCong(boolean has_banCong) {
        this.has_banCong = has_banCong;
    }

    public boolean isHas_xeBuyt() {
        return has_xeBuyt;
    }

    public void setHas_xeBuyt(boolean has_xeBuyt) {
        this.has_xeBuyt = has_xeBuyt;
    }

    public boolean isHas_khuDanCu() {
        return has_khuDanCu;
    }

    public void setHas_khuDanCu(boolean has_khuDanCu) {
        this.has_khuDanCu = has_khuDanCu;
    }

    public boolean isHas_cuaSo() {
        return has_cuaSo;
    }

    public void setHas_cuaSo(boolean has_cuaSo) {
        this.has_cuaSo = has_cuaSo;
    }

    public boolean isHas_baoVe() {
        return has_baoVe;
    }

    public void setHas_baoVe(boolean has_baoVe) {
        this.has_baoVe = has_baoVe;
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
    

    @Override
    public String toString() {
        return "Room{" + "roomID=" + roomID + ", name=" + name + ", description=" + description + ", address=" + address + ", emailTenant=" + emailTenant + ", emailLandlord=" + emailLandlord + ", status=" + status + ", price=" + price + ", deposit=" + deposit + ", avgRating=" + avgRating + ", date_added=" + date_added + ", rentStartDate=" + rentStartDate + ", area=" + area + ", detailAddress=" + detailAddress + '}';
    }



    
    
}
