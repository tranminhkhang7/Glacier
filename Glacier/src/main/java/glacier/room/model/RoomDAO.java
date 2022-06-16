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
                String sql = "SELECT [roomID]\n" +
"      ,[status]\n" +
"      ,[name]\n" +
"      ,[description]\n" +
"      ,[address]\n" +
"      ,[detailAddress]\n" +
"      ,[emailTenant]\n" +
"      ,[emailLandlord]\n" +
"      ,[price]\n" +
"      ,[deposit]\n" +
"      ,[avg_rating]\n" +
"      ,[numberRating]\n" +
"      ,[date_added]\n" +
"      ,[area]\n" +
"      ,[rentStartDate]\n" +
"      ,[having_mayLanh]\n" +
"      ,[having_hamGuiXe]\n" +
"      ,[having_keBep]\n" +
"      ,[having_remCua]\n" +
"      ,[having_phongGiatDo]\n" +
"      ,[having_banCong]\n" +
"      ,[having_xeBuyt]\n" +
"      ,[having_khuDanCu]\n" +
"      ,[having_cuaSo]\n" +
"      ,[having_baoVe]\n" +
"  FROM [Glacier].[dbo].[Room]\n" +
"  where roomID=?";
                pstm = conn.prepareStatement(sql);
                pstm.setInt(1, roomID);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    int ID = rs.getInt("roomID");
                    String status = rs.getString("status");
                    String name = rs.getString("name");
                    String description = rs.getString("description");
                    String address = rs.getString("address");
                    String detailAddress = rs.getString("detailAddress");
                    String emailTenant = rs.getString("emailTenant");
                    String emailLandlord = rs.getString("emailLandlord");
                    int price = Math.round(rs.getFloat("price"));
                    float deposit = rs.getFloat("deposit");
                    float rating = rs.getFloat("avg_rating");
                    int numberRating = rs.getInt("numberRating");
                    Date date_added = rs.getDate("date_added");
                    float area = rs.getFloat("area");
                    Date rentStartDate=rs.getDate("rentStartDate");
                    boolean having_mayLanh = rs.getBoolean("having_mayLanh");
                    boolean having_hamGuiXe = rs.getBoolean("having_hamGuiXe");
                    boolean having_keBep = rs.getBoolean("having_keBep");
                    boolean having_remCua = rs.getBoolean("having_remCua");
                    boolean having_phongGiatDo = rs.getBoolean("having_phongGiatDo");
                    boolean having_banCong = rs.getBoolean("having_banCong");
                    boolean having_xeBuyt = rs.getBoolean("having_xeBuyt");
                    boolean having_khuDanCu = rs.getBoolean("having_khuDanCu");
                    boolean having_cuaSo = rs.getBoolean("having_cuaSo");
                    boolean having_baoVe = rs.getBoolean("having_baoVe");
                    room = new Room(roomID, name, description, address, emailTenant, 
                            emailLandlord, status, price, deposit, rating, 
                            numberRating, date_added, rentStartDate, area, 
                            detailAddress, having_mayLanh, having_hamGuiXe, 
                            having_keBep, having_remCua, having_phongGiatDo, 
                            having_banCong, having_xeBuyt, having_khuDanCu, having_cuaSo, 
                            having_baoVe);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
            return room;
        }
    }

    public ArrayList<String> getRoomImgById(int roomID) throws SQLException, Exception {
        ArrayList<String> ImgList = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            String sql = "select image_link\n"
                    + "from ImagesRoom join Room on ImagesRoom.roomID=Room.roomID\n"
                    + "where Room.roomID=?";
            if (conn != null) {
                pstm = conn.prepareStatement(sql);
                pstm.setInt(1, roomID);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    String url = rs.getString("image_link").trim();
                    ImgList.add(url);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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
