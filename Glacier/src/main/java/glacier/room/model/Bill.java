/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.room.model;

import java.sql.Timestamp;

/**
 *
 * @author ASUS
 */
public class Bill {
    private int id;
    private int roomId;
    private int amount;
    private String purpose;
    private Timestamp time;
    private String status;

    public Bill() {
    }

    public Bill(int id, int roomId, int amount, String purpose, Timestamp time, String status) {
        this.id = id;    
        this.roomId = roomId;
        this.amount = amount;
        this.purpose = purpose;
        this.time = time;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Bill{" + "id=" + id + ", roomId=" + roomId + ", amount=" + amount + ", purpose=" + purpose + ", time=" + time + ", status=" + status + '}';
    }
}
