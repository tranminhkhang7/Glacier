/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.landlord.dbmanager;

import glacier.room.model.Room;
import glacier.user.model.Landlord;
import glacier.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author KHANG
 */
public class LandlordManager {
    
    public Landlord getLandLordInfo(int roomID){
         Landlord l = new Landlord();
        try {

            Connection conn = DBUtils.getConnection();
            String sql = " select l.email,l.name,l.status,l.profile_picture,l.gender,l.phone,l.facebook_link,l.instagram_link \n"
                    + "  from Landlord l join Room r on (l.email=r.emailLandlord)\n"
                    + "  where r.roomID = ?";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1, roomID);
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                String email = rs.getString("email");
                String name = rs.getString("name");
                String status = rs.getString("status");
                String profile_picture = rs.getString("profile_picture");
                String gender = rs.getString("gender");
                String phone = rs.getString("phone");
                String facebook=rs.getString("facebook_link");
                String instagram=rs.getString("instagram_link");
                l = new Landlord(email, name, profile_picture, status, gender, phone,facebook,instagram);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }
    
    public void addRoom(String name, String description, String address, String detailAddress, String status, int price, int deposit, float avgRating, Date dateAdded, float area, String emailLandlord) {
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement getID = con.prepareStatement("SELECT MAX([RoomID]) as lastID FROM [Room]");
            ResultSet rs = getID.executeQuery();
            rs.next();
            int newID = Integer.parseInt(rs.getString("lastID")) + 1;

            SimpleDateFormat simpDate = new SimpleDateFormat("yyyy-MM-dd");

            String sql = "INSERT INTO [Room] ([roomID], [name], [description], [address], [detailAddress], [emailLandlord], [status], [price], [deposit], [avg_rating], [date_added], [area])\n"
                    + "VALUES (" + newID + ", N'" + name + "', N'" + description + "', N'" + address + "', N'"
                    + detailAddress + "', N'" + emailLandlord + "', N'"
                    + status + "', "
                    + price + ", " + deposit + ", "
                    + avgRating + ", N'"
                    + simpDate.format(dateAdded) + "', " + area + ")";

            PreparedStatement st = con.prepareStatement(sql);

            st.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

    // This method is calculating the total number of rooms that owned by a landlord whose email is emailLandlord
    public int countMatched(String emailLandlord) { // searchText: the key words user typed; index: page number
        try {
            String sql = "SELECT COUNT(*)\n"
                    + "FROM [Room]\n"
                    + "WHERE [emailLandlord] = N'" + emailLandlord + "'";

            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return 0;
    }

    // This method returns a list of rooms that owned by the person whose email is emailLandlord.
    public List<Room> listRoom(String emailLandlord, int index) {
        try {
            String sql = "SELECT [roomID], [name], [status], [address], [area], [avg_rating], [date_added], [description], [price]\n"
                    + "FROM [Room]\n"
                    + "WHERE [emailLandlord] = N'" + emailLandlord + "'\n"
                    + "ORDER BY [roomID]\n"
                    + "OFFSET " + (index - 1) * 4 + " ROWS FETCH NEXT 4 ROWS ONLY";

            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            ArrayList<Room> list;
            list = new ArrayList<Room>();

            while (rs.next()) {
                int id = rs.getInt("roomID");
                String name = rs.getString("name");
                String status = rs.getString("status");
                String address = rs.getString("address");
                float area = rs.getFloat("area");
                int avgRating = rs.getInt("avg_rating");
                Date dateAdded = rs.getDate("date_added");
                String description = rs.getString("description");
                int price = rs.getInt("price");

                Room matchedRoom = new Room(id, name, description, address, status, price, avgRating, dateAdded, area);
                list.add(matchedRoom);
            }
            return list;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    // This method checks if the one whose email is emailLandlord is the owner of the room which has the ID is roomID.
    public boolean checkOwnership(String emailLandlord, int roomID) {
        try {
            String sql = "SELECT [emailLandlord]\n"
                    + "FROM [Room]\n"
                    + "WHERE [roomID] = " + roomID;

            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            String roomOwner = null;
            while (rs.next()) {
                roomOwner = rs.getString(1);
            }

            if (roomOwner.trim().equals(emailLandlord.trim())) {
                return true;
            }
            return false;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return false;
    }

    // This method is for Updating room based on its ID.
    public void updateRoom(int roomID, String name, String description, String address, String detailAddress, int price, int deposit, float area) {
        try {
            String sql = "UPDATE [Room]\n"
                    + "SET [name] = N'" + name + "', [description] = N'" + description + "', [address] = N'" + address + "', [detailAddress] = N'" + detailAddress + "', [price] = " + price + ", [deposit] = " + deposit + ", [area] = " + area + "\n"
                    + "WHERE [roomID] = " + roomID;

            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.executeUpdate();

        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

    // This method is for Updating room based on its ID.
    public void deleteRoom(int roomID) {
        try {
            String sql = "DELETE\n"
                    + "FROM [Room]\n"
                    + "WHERE [roomID] = " + roomID;

            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.executeUpdate();

        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

    //METHOD RETURNS A STATUS OF A ROOM
    public String roomStatus(int id) {
        String status = "";
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT [status]  "
                        + " FROM [Room] "
                        + " WHERE roomID=? ";

                st = conn.prepareStatement(sql);
                st.setInt(1, id);
                rs = st.executeQuery();
                if (rs.next()) {
                    status = rs.getString("status");
                }
            }
        } catch (Exception e) {
        }
        return status;
    }
    
    
    public int countAllPendingRooms(String email){
        try {
            String sql = "SELECT COUNT(*)\n"
                    + "FROM [Room]\n"
                    + "WHERE [emailLandlord] = ? AND status='pending'";

            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return 0;
    }
    
    //RETURNS LIST OF SPECIFIC LANDLORD ROOMS WHICH IS PENDING
    public List<Room> getLandlordPendingRooms(String email, int index) {
        List<Room> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT [roomID], r.[name], r.[emailTenant], r.[price], r.[address], t.[name] "
                        + " FROM [Room] r join [Tenant] t on r.[emailTenant] = t.[email] "
                        + " WHERE emailLandlord=? AND r.[status]='pending' "
                        + " ORDER BY [roomID] "
                        + " OFFSET ? ROWS FETCH NEXT 4 ROWS ONLY ";
                st = conn.prepareStatement(sql);
                st.setString(1, email);
                st.setInt(2, (index - 1) * 4);
                rs = st.executeQuery();
                while (rs.next()) {
                    int roomId = rs.getInt("roomID");
                    String name = rs.getString("name").trim();
                    int price = rs.getInt("price");
                    String address = rs.getString("address").trim();
                    String emailTenant = rs.getString("emailTenant");
                    
                    list.add(new Room(roomId, name, address, price, emailTenant));

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // This method updates the status of a bill
    public void confirmRentPayment (int billID) {
        try {
            String sql = "UPDATE [Bill]\n" +
                        "SET [status] = N'paid'\n" +
                        "WHERE [billID] = " + billID;

            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }
    
    public static void main(String[] args) {
        LandlordManager manager = new LandlordManager();
//        int i = manager.countAllPendingRooms("dangngocduong@gmail.com");
//        System.out.println(i);
        List<Room> list = manager.getLandlordPendingRooms("dangngocduong@gmail.com", 1);
        for (Room room : list) {
            System.out.println(room);
        }
//        String s = manager.roomStatus(10);
//        System.out.println(s);
    }
}
