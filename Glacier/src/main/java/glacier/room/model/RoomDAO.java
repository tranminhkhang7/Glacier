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
                String sql = "SELECT [roomID]\n"
                        + "      ,[status]\n"
                        + "      ,[name]\n"
                        + "      ,[description]\n"
                        + "      ,[address]\n"
                        + "      ,[detailAddress]\n"
                        + "      ,[emailTenant]\n"
                        + "      ,[emailLandlord]\n"
                        + "      ,[price]\n"
                        + "      ,[deposit]\n"
                        + "      ,[avg_rating]\n"
                        + "      ,[numberRating]\n"
                        + "      ,[date_added]\n"
                        + "      ,[area]\n"
                        + "      ,[rentStartDate]\n"
                        + "  FROM [Glacier].[dbo].[Room]\n"
                        + "  where roomID=?";
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
                    int deposit = rs.getInt("deposit");
                    float rating = rs.getFloat("avg_rating");
                    int numberRating = rs.getInt("numberRating");
                    Date date_added = rs.getDate("date_added");
                    float area = rs.getFloat("area");
                    Date rentStartDate = rs.getDate("rentStartDate");
                    room = new Room(roomID, name, description, address, emailTenant,
                            emailLandlord, status, price, deposit, rating,
                            numberRating, date_added, rentStartDate, area,
                            detailAddress);
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

    public ArrayList<String> getRoomFeature(int roomID) throws Exception {
        ArrayList<String> f = new ArrayList<>(10);
        try {
            conn = DBUtils.getConnection();
            String sql = "select f.name\n"
                    + "from Room r join RoomFeature rf on (r.roomID=rf.roomID) \n"
                    + "join Feature f on (rf.featureID=f.id)\n"
                    + "where r.roomID=?";
            if (conn != null) {
                pstm = conn.prepareStatement(sql);
                pstm.setInt(1, roomID);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    String feature = rs.getString("name").trim();
                    f.add(feature);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
            return f;
        }
    }

    public static void main(String[] args) throws SQLException, Exception {
        RoomDAO dao = new RoomDAO();
        ArrayList<String> f = dao.getRoomFeature(10);
        System.out.println(f);
    }
}
