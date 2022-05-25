/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package glacier.room.model;

import glacier.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class RoomDAO {
    private Connection conn = null;
    private PreparedStatement pstm = null;
    private ResultSet rs = null;
    
    
    
    public void closeConnection() throws SQLException {
        if (rs != null) {
            rs.close();
        }
        if (pstm != null) {
            pstm.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    public Room getRoomById(int roomID) throws SQLException { 
        Room room = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select roomID,name,description,address,emailTenant,emailLandlord,status,price,deposit,avg_rating\n" +
",date_added,area,detailAddress from Room \n" +
"where roomID=?";
                pstm = conn.prepareStatement(sql);
                pstm.setInt(1, roomID);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    int ID = rs.getInt("roomID");
                    String name = rs.getString("name");
                    String description = rs.getString("description");
                    String address = rs.getString("address");
                    String emailTenant=rs.getString("emailTenant");
                    String emailLandlord = rs.getString("emailLandlord");
                    String status = rs.getString("status");
                    int price = Math.round(rs.getFloat("price"));
                    float deposit = rs.getFloat("deposit");
                    float rating = rs.getFloat("avg_rating");
                    Date date_added = rs.getDate("date_added");
                    float area = rs.getFloat("area");
                    String detailAddress = rs.getString("detailAddress");
                    room = new Room(ID, name, description, address, emailTenant, emailLandlord, status, price, deposit, rating, date_added, area, detailAddress);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
            return room;
        }
    }
    public ArrayList<String> getRoomImgById(int roomID) throws SQLException, Exception{
        ArrayList<String> ImgList = new ArrayList<>();
        try{
            conn = DBUtils.getConnection();
            String sql = "select image_link\n" +
            "from ImagesRoom join Room on ImagesRoom.roomID=Room.roomID\n" +
            "where Room.roomID=?";
            if (conn != null) {            
                pstm = conn.prepareStatement(sql);
                pstm.setInt(1, roomID);
                rs = pstm.executeQuery();
                while (rs.next()){
                   String url = rs.getString("image_link").trim();
                   ImgList.add(url);
                }
            }
        }
        catch (Exception e){
            e.printStackTrace();
        } 
        finally {
            closeConnection();
            return ImgList;
        }
    }
//    public static void main(String[] args) throws SQLException, Exception {
//        RoomDAO dao = new RoomDAO();
//        ArrayList<String> l = dao.getRoomImgById(10);
//        for (String i:l){
//            System.out.println(i);
//        }
//    }
}

