/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.user.model;

/**
 *
 * @author ASUS
 */
public class ImageDTO {
    private int roomId;
    private int picId;

    public ImageDTO() {
    }

    public ImageDTO(int roomId, int picId) {
        this.roomId = roomId;
        this.picId = picId;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public int getPicId() {
        return picId;
    }

    public void setPicId(int picId) {
        this.picId = picId;
    }

    @Override
    public String toString() {
        return "ImageDTO{" + "roomId=" + roomId + ", picId=" + picId + '}';
    }
    
}
