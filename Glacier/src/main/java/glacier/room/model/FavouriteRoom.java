/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package glacier.room.model;

import java.sql.Timestamp;

/**
 *
 * @author Admin
 */
public class FavouriteRoom {
    private String email;
    private int roomID;
    private Timestamp time;
    private String landLord;
    private Room room;
    
    public FavouriteRoom() {
    }

    
    public FavouriteRoom(String email, int roomID) {
        this.email = email;
        this.roomID = roomID;
    }

    public FavouriteRoom(String email, int roomID, Timestamp time) {
        this.email = email;
        this.roomID = roomID;
        this.time = time;
    }

    public FavouriteRoom(String email, String landLord, Room room) {
        this.email = email;
        this.landLord = landLord;
        this.room = room;
    }

    public String getLandLord() {
        return landLord;
    }

    public void setLandLord(String landLord) {
        this.landLord = landLord;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }
    
    

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "FavouriteRoom{" + "email=" + email + ", roomID=" + roomID + ", time=" + time + '}';
    }
    
}
