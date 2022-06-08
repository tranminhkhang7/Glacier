/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package glacier.room.model;

import glacier.user.model.Tenant;
import java.sql.Timestamp;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class Comment {
    private int id;
    private String name;
    private String profile_picture;
    private int roomId;
    private String content;
    private Date time;
    private int rating;
    private String email;
    private Timestamp date;

    public Comment() {
    }

    public Comment(int id, String name, String profile_picture, int roomId, String content, Date time, int rating) {
        this.id = id;
        this.name = name;
        this.profile_picture = profile_picture;
        this.roomId = roomId;
        this.content = content;
        this.time = time;
        this.rating = rating;
    }

    public Comment(int id, int roomId, String content, int rating, String email, Timestamp date) {
        this.id = id;
        this.roomId = roomId;
        this.content = content;
        this.rating = rating;
        this.email = email;
        this.date = date;
    }
    
    //Constructor for insert report comment, don't need id
    public Comment(String content, String email, Timestamp date) {
        this.content = content;
        this.email = email;
        this.date = date;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProfile_picture() {
        return profile_picture;
    }

    public void setProfile_picture(String profile_picture) {
        this.profile_picture = profile_picture;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Comment{" + "id=" + id + ", name=" + name + ", profile_picture=" + profile_picture + ", roomId=" + roomId + ", content=" + content + ", time=" + time + ", rating=" + rating + '}';
    }

}
