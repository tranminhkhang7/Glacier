/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.room.dbmanager;

import glacier.room.model.Bill;
import glacier.room.model.Room;
import glacier.user.model.Landlord;
import glacier.user.model.Notification_TL;
import glacier.utils.DBUtils;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class RoomManager {

    // This method is calculating the total number of rooms that matches the keyword
    public int countMatched(String searchText, List<Integer> listFeature) { // searchText: the key words user typed; index: page number
        try {
            for (int i = 0; i < searchText.length(); i++) {
                if (searchText.charAt(i) == '\'') { // ki tu '
                    searchText = searchText.substring(0, i) + "'" + searchText.substring(i);
                    i++;
                }
            }
            String sql = "SELECT COUNT(*)\n"
                    + "FROM [Room] R\n"
                    + "WHERE R.[status] = N'available'\n";

            if (searchText != null && !"".equals(searchText)) {
                sql += "AND FREETEXT((R.[name], R.[description], R.[detailAddress], R.[address]), N'" + searchText + "') \n";
            }

            boolean isFirst = true;
            for (Integer feature : listFeature) {
                if (isFirst) {
                    sql += "AND R.[roomID] IN\n"
                            + "	(SELECT DISTINCT [roomID]\n"
                            + "	FROM [RoomFeature]\n"
                            + "	WHERE [featureID] = " + feature + "\n";
                } else {
                    sql += "INTERSECT\n"
                            + "	SELECT DISTINCT [roomID]\n"
                            + "	FROM [RoomFeature]\n"
                            + "	WHERE [featureID] = " + feature + "\n";
                }
                isFirst = false;
            }
            if (!isFirst) {
                sql += ")\n";
            }
//            if (rating != null && !rating.equals("all")) {
//                sql += " AND avgRate >= " + rating + " ";
//            }
//            if (genres != null && !genres.equals("all")) {
//                sql += " AND [ISBN] IN\n"
//                        + "		(SELECT [ISBN]\n"
//                        + "		FROM [ProductTag]\n"
//                        + "		WHERE [tagName] = N'" + genres + "')\n";
//            }
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

    // This method returns the list of rooms that matches the searchText, on page index
    public List<Room> search(String searchText, List<Integer> listFeature, int index) { // searchText: the key words user typed; index: page number
        try {
            for (int i = 0; i < searchText.length(); i++) {
                if (searchText.charAt(i) == '\'') { // ki tu '
                    searchText = searchText.substring(0, i) + "'" + searchText.substring(i);
                    i++;
                }
            }
            if (index <= 0) {
                index = 1;
            }

            String sql = "SELECT R.[roomID], LEFT(R.[name],42) as nameRoom, R.[address], R.[price], R.[avg_rating], R.[date_added], L.[name] as nameLandlord, LEFT(R.[description], 100) as cutDescription\n"
                    + "FROM [Room] R JOIN [Landlord] L ON R.emailLandlord = L.email\n"
                    + "WHERE R.[status] = N'available'\n";

            if (searchText != null && !"".equals(searchText)) {
                sql += "AND FREETEXT((R.[name], R.[description], R.[detailAddress], R.[address]), N'" + searchText + "') \n";
            }

            boolean isFirst = true;
            for (Integer feature : listFeature) {
                if (isFirst) {
                    sql += "AND R.[roomID] IN\n"
                            + "	(SELECT DISTINCT [roomID]\n"
                            + "	FROM [RoomFeature]\n"
                            + "	WHERE [featureID] = " + feature + "\n";
                } else {
                    sql += "INTERSECT\n"
                            + "	SELECT DISTINCT [roomID]\n"
                            + "	FROM [RoomFeature]\n"
                            + "	WHERE [featureID] = " + feature + "\n";
                }
                isFirst = false;
            }
            if (!isFirst) {
                sql += ")\n";
            }

//            if (rating != null && !rating.equals("all")) {
//                sql += " AND avgRate >= " + rating + " ";
//            }
//            if (genres != null && !genres.equals("all")) {
//                sql += " AND [ISBN] IN\n"
//                        + "		(SELECT [ISBN]\n"
//                        + "		FROM [ProductTag]\n"
//                        + "		WHERE [tagName] = N'" + genres + "')\n";
//            }
//
//            if (sortBy != null && !sortBy.equals("")) {
//                if (sortBy.equals("Low - high price")) {
//                    sortBy = "ASC";
//                } else {
//                    sortBy = "DESC";
//                }
//                sql += "ORDER BY price " + sortBy + "\n";
//            } else {
//                sql += "ORDER BY [ISBN]\n";
//            }
            sql += "ORDER BY R.[roomID]\n";
            sql += "OFFSET " + (index - 1) * 16 + " ROWS FETCH NEXT 16 ROWS ONLY";

            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            ArrayList<Room> list;
            list = new ArrayList<Room>();

            while (rs.next()) {
                int roomID = rs.getInt("roomID");
                String nameRoom = rs.getString("nameRoom"); nameRoom += "...";
                String cutDescription = rs.getString("cutDescription");
                String address = rs.getString("address");
                String nameLandlord = rs.getString("nameLandlord");
                int price = rs.getInt("price");
                int avg_rating = (int)rs.getFloat("avg_rating");
                Date dateAdded = rs.getDate("date_added");

                Room matchedRoom = new Room(roomID, nameRoom, cutDescription, address, nameLandlord, price, avg_rating, dateAdded);
                list.add(matchedRoom);
            }
            return list;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    public List<Room> getTenantRoomList(String email, int index) {
        List<Room> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT [roomID], [name], [price], [address], [description], [rentStartDate], [status] FROM [Room] "
                        + " WHERE emailTenant=? "
                        + " ORDER BY [RoomID] "
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
                    String des = rs.getString("description").trim().substring(0, Math.min(rs.getString("description").length(), 101));

                    Date rentStartDate = rs.getDate("rentStartDate");
                    String status = rs.getString("status").trim();
                    list.add(new Room(roomId, name, des, address, price, rentStartDate, status));

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public int countTenantRooms(String emailTenant) { // searchText: the key words user typed; index: page number
        try {
            String sql = "SELECT COUNT(*)\n"
                    + "FROM [Room]\n"
                    + "WHERE [emailTenant] = ?";

            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, emailTenant);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return 0;
    }

    //Function for tenant to sent notification to landlord
    public boolean insertNotificationTL(Notification_TL noti) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement st = null;
        long now = System.currentTimeMillis();
        Timestamp date = new Timestamp(now);

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                PreparedStatement getID = conn.prepareStatement("SELECT MAX([NotificationID]) as lastID FROM [Notification_TL]");
                ResultSet rs = getID.executeQuery();
                rs.next();
                int newID = Integer.parseInt(rs.getString("lastID")) + 1;
                String sql = " INSERT INTO Notification_TL(notificationID,emailTenant,emailLandlord,title,content,time) "
                        + " VALUES(?,?,?,?,?,?) ";
                st = conn.prepareStatement(sql);
                st.setInt(1, newID);
                st.setString(2, noti.getEmailTenant());
                st.setString(3, noti.getEmailLandlord());
                st.setString(4, noti.getTitle());
                st.setString(5, noti.getContent());
                st.setTimestamp(6, date);
                check = st.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }
    
    //METHOD TO HOW MANY BILLS
    public int countAllBills(int roomId, String status){
        try {
            String sql = "SELECT COUNT(*)\n"
                    + "FROM [Bill]\n"
                    + "WHERE [roomID] = ? AND [status]=?";

            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, roomId);
            st.setString(2, status);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return 0;
    }
    
    //Function to get a list of bill for tenant in a specific room
    public List<Bill> getPaidBillList(int roomId, String billStatus) {
        List<Bill> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement st = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT [billID], [roomID], [amount], [purpose], [time], [status] "
                        + " FROM [Bill] "
                        + " WHERE [roomID]=? AND [status]=? "
                        + " ORDER BY [time] DESC "
                        ;
                st = conn.prepareStatement(sql);
                st.setInt(1, roomId);
                st.setString(2, billStatus);
                
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    int billId = rs.getInt("billID");

                    int amount = rs.getInt("amount");
                    String purpose = rs.getString("purpose");
                    Timestamp time = rs.getTimestamp("time");
                    String status = rs.getString("status");
                    list.add(new Bill(billId, roomId, amount, purpose, time, status));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Room getTenantRentedRoom(int id) {
        Room room = null;
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT [roomID], [name], [description], [address], [detailAddress], [emailTenant], [emailLandlord], [price], [date_added], [rentStartDate]  "
                        + " FROM [Room] "
                        + " WHERE roomID=? ";

                st = conn.prepareStatement(sql);
                st.setInt(1, id);
                rs = st.executeQuery();
                if (rs.next()) {
                    int roomID = rs.getInt("roomID");
                    String name = rs.getString("name");
                    String description = rs.getString("description");
                    String address = rs.getString("address");
                    String detailAddress = rs.getString("detailAddress");
                    String emailTenant = rs.getString("emailTenant");
                    String emailLandlord = rs.getString("emailLandlord");
                    int price = rs.getInt("price");
                    Date date_added = rs.getDate("date_added");
                    Date rentStartDate = rs.getDate("rentStartDate");
                    room = new Room(roomID, name, description, address, emailTenant, emailLandlord, price, date_added, rentStartDate, detailAddress);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return room;
    }
    public Room getTenantPendingRoom(int id) {
        Room room = null;
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "  select r.roomID,r.name,r.address,r.emailLandlord,r.status,r.price,r.deposit,r.detailAddress\n" +
"  from Room r\n" +
"  where (r.roomID = ?)";
                st = conn.prepareStatement(sql);
                st.setInt(1, id);
                rs = st.executeQuery();
                if (rs.next()) {
                    int roomID = rs.getInt("roomID");
                    String name = rs.getString("name");
                    String address = rs.getString("address");
                    String emailLandlord = rs.getString("emailLandlord");
                    String status = rs.getString("status");
                    int price = rs.getInt("price");
                    float deposit = rs.getFloat("deposit");
                    String detailAddress = rs.getString("detailAddress");
                    room = new Room(roomID, name, address, emailLandlord, status, price, deposit, detailAddress);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return room;
    }

    public Landlord getLandLordInfoInSingleRoom(int roomId) {
        Landlord landlord = null;
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "  SELECT  l.[name], [email], [phone], [gender]  FROM Room r join Landlord l ON r.emailLandlord = l.email WHERE roomID = ?";
                st = conn.prepareStatement(sql);
                st.setInt(1, roomId);
                rs = st.executeQuery();
                if (rs.next()) {
                    String name = rs.getString("name").trim();
                    String email = rs.getString("email").trim();
                    String gender = rs.getString("gender").trim();
                    String phone = rs.getString("phone").trim();
                    landlord = new Landlord(email, name, gender, phone);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return landlord;
    }

    public boolean updateRoomRating(int roomId, int rating) {
        boolean status = false;
        Connection conn = null;
        PreparedStatement st = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "update Room\n"
                        + "  set avg_rating=((avg_rating*numberRating)+?)/(numberRating+1),numberRating=numberRating+1\n"
                        + "  where roomID=?";
                st = conn.prepareStatement(sql);
                st.setInt(1, rating);
                st.setInt(2, roomId);
                if (st.executeUpdate() == 1) {
                    status = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }


    public List<String> loadFeature() {
        try {
            String sql = "SELECT *\n"
                    + "FROM [Feature]";
            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            List<String> listResult = new ArrayList<>();
            while (rs.next()) {
                listResult.add(rs.getString("name").trim());
            }
            return listResult;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    //THIS METHOD RETURN A ROOM IF TENANT KEY AND LANDLORD KEY ARE MATCH
    public Room getRoomWhenAssign(String tenantKey, String landlordKey) {
        Room room = null;
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "  SELECT [roomID],[name],[emailTenant],[rentStartDate],[qr_status],[status] FROM [Room] WHERE [tenant_key] = ? AND [landlord_key] = ?";
                st = conn.prepareStatement(sql);
                st.setString(1, tenantKey);
                st.setString(2, landlordKey);
                rs = st.executeQuery();
                if (rs.next()) {
                    int roomId = rs.getInt("roomID");
                    String roomName = rs.getString("name");
                    String emailTenant = rs.getString("emailTenant");
                    Date rentStartDate = rs.getDate("rentStartDate");
                    String qrStatus = rs.getString("qr_status");
                    String roomStatus = rs.getString("status");
                    room = new Room(roomId, roomName, emailTenant, rentStartDate,qrStatus,roomStatus);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return room;
    }

    public static void main(String[] args) {
        RoomManager manager = new RoomManager();
        
//        Room room = manager.getRoomWhenAssign("123", "456");
//        System.out.println(room);
//        Landlord l = manager.getLandLordInfoInSingleRoom(10);
//        System.out.println(l);
//        List<Room> list = manager.getTenantRoomList("vuvannga@gmail.com", 1);
//        for (Room room : list) {
//            System.out.println(room);
//        }
//        List<Bill> list = manager.getPaidBillList(10,"paid",1);
//        for (Bill bill : list) {
//            System.out.println(bill);
//        }
//        Room room  = manager.getTenantRentedRoom(10);
//        System.out.println(room);
//        int count = manager.countTenantRooms("vuvannga@gmail.com");
//        System.out.println(count);

//        String newS = s.trim().replaceAll(" ", "");
//        String shortS = s.substring(0, Math.min(s.length(), 101));
//        int i = newS.length();
//        int j = s.length();
//        System.out.println(shortS);
    }
}
