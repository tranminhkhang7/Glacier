/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.room.dbmanager;

import glacier.bill.model.Bill;
import glacier.bill.model.BillDetail;
import glacier.room.model.Room;
import glacier.room.model.RoomDAO;
import static glacier.room.model.SingleRoomView.sortByValueCount;
import glacier.user.model.Landlord;
import glacier.user.model.Notification_TL;
import glacier.utils.DBUtils;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 *
 * @author ASUS
 */
public class RoomManager {

    // This method is calculating the total number of rooms that matches the keyword
    public int countMatched(String searchText, List<Integer> listFeature, int minPrice, int maxPrice) { // searchText: the key words user typed; index: page number
        try {
            for (int i = 0; i < searchText.length(); i++) {
                if (searchText.charAt(i) == '\'') { // ki tu '
                    searchText = searchText.substring(0, i) + "'" + searchText.substring(i);
                    i++;
                }
            }
            String sql = "SELECT COUNT (*)\n"
                    + "FROM [Room] R JOIN [Landlord] L ON R.emailLandlord = L.email\n";

            if (searchText != null && !"".equals(searchText)) {
                sql += "INNER JOIN FREETEXTTABLE([Room], \n"
                        + "	([name],\n"
                        + "	 [description],\n"
                        + "	 [address],\n"
                        + "	 [detailAddress]),\n"
                        + "	N'" + searchText + "') AS KEY_TBL \n"
                        + "	ON R.[roomID] = KEY_TBL.[KEY]\n";
            }

            sql += "WHERE R.[status] = N'available'\n"
                    + "AND L.[status] = N'active'\n"
                    + "AND R.[price] >= " + minPrice + " AND R.[price] <= " + maxPrice + "\n";

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
    public List<Room> search(String searchText, List<Integer> listFeature, int minPrice, int maxPrice, int index) { // searchText: the key words user typed; index: page number
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

            String sql = "SELECT R.[roomID], LEFT(R.[name],42) as nameRoom, \n"
                    + "	R.[address], R.[price], \n"
                    + "	R.[avg_rating], R.[date_added], \n"
                    + "	L.[name] as nameLandlord, \n"
                    + "	LEFT(R.[description], 100) as cutDescription\n"
                    + "FROM [Room] R JOIN [Landlord] L ON R.emailLandlord = L.email\n";

            if (searchText != null && !"".equals(searchText)) {
                sql += "INNER JOIN FREETEXTTABLE([Room], \n"
                        + "	([name],\n"
                        + "	 [description],\n"
                        + "	 [address],\n"
                        + "	 [detailAddress]),\n"
                        + "	N'" + searchText + "') AS KEY_TBL \n"
                        + "	ON R.[roomID] = KEY_TBL.[KEY]\n";
            }

            sql += "WHERE R.[status] = N'available'\n"
                    + "AND L.[status] = N'active'\n"
                    + "AND R.[price] >= " + minPrice + " AND R.[price] <= " + maxPrice + "\n";

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
            if (searchText != null && !"".equals(searchText)) {
                sql += "ORDER BY RANK DESC \n";
            } else {
                sql += "ORDER BY [date_added] DESC \n";
            }
            sql += "OFFSET " + (index - 1) * 15 + " ROWS FETCH NEXT 15 ROWS ONLY";

            
            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            ArrayList<Room> list;
            list = new ArrayList<Room>();

            while (rs.next()) {
                int roomID = rs.getInt("roomID");
                String nameRoom = rs.getString("nameRoom").trim();
//                if (nameRoom.length() <= 40) {
                nameRoom += "...";
//                }
                String cutDescription = rs.getString("cutDescription");
                String address = rs.getString("address");
                String nameLandlord = rs.getString("nameLandlord");
                int price = rs.getInt("price");
                int avg_rating = (int) rs.getFloat("avg_rating");
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
                String sql = "SELECT [roomID], [name], [price], [address], [description], [rentStartDate], [status], [emailLandlord], [qr_image] FROM [Room] "
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
                    String landlordEmail = rs.getString("emailLandlord");
                    String qrImage = rs.getString("qr_image");
                    Date rentStartDate = rs.getDate("rentStartDate");
                    String status = rs.getString("status").trim();
                    list.add(new Room(roomId, name, des, address, price, rentStartDate, status, landlordEmail, qrImage));
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
    public int countAllBills(int roomId, String status) {
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
                String sql = " SELECT [billID], [roomID], [time], [status] "
                        + " FROM [Bill] "
                        + " WHERE [roomID]=? AND [status]=? "
                        + " ORDER BY [time] DESC ";
                st = conn.prepareStatement(sql);
                st.setInt(1, roomId);
                st.setString(2, billStatus);

                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    int billId = rs.getInt("billID");
//                    int amount = rs.getInt("amount");
//                    String purpose = rs.getString("purpose");
                    Timestamp time = rs.getTimestamp("time");
                    String status = rs.getString("status");
//                    list.add(new Bill(billId, roomId, amount, purpose, time, status));
                    list.add(new Bill(billId, roomId, time, status));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //GET BILL DETAILS
    public List<BillDetail> getBillsDetail(int roomId) {
        List<BillDetail> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement st = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT bd.[detailID], b.[billID], [purpose], [amount], [description] "
                        + " FROM [BillDetail] bd join [Bill] b on bd.[billID] = b.[billID] "
                        + " WHERE [roomID]=? "
                        + " ORDER BY [billID] ";
                st = conn.prepareStatement(sql);
                st.setInt(1, roomId);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    int billId = rs.getInt("billID");
                    int detailId = rs.getInt("detailID");
                    String purpose = rs.getString("purpose");
                    int amount = rs.getInt("amount");
                    String description = rs.getString("description");
//                    list.add(new Bill(billId, roomId, amount, purpose, time, status));
                    list.add(new BillDetail(billId, detailId, purpose, amount, description));
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
                String sql = "  select r.roomID,r.name,r.address,r.emailLandlord,r.status,r.price,r.deposit,r.detailAddress\n"
                        + "  from Room r\n"
                        + "  where (r.roomID = ?)";
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
                    room = new Room(roomId, roomName, emailTenant, rentStartDate, qrStatus, roomStatus);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return room;
    }

    public void updateRoomAfterDisconnect(int roomID, int notiID) {
        try {
            String sql = "UPDATE [Room]\n"
                    + "SET [status] = N'available', [emailTenant] = NULL\n"
                    + "WHERE [roomID] = " + roomID + "\n"
                    + "GO\n"
                    + "UPDATE [Notification_LT]\n"
                    + "SET [content] = N'Chúng tôi nhận được yêu cầu hủy thuê nhà từ Chủ nhà của bạn. Nếu bạn đang chuyển đi, vui lòng bấm Xác nhận. Nếu đây là một nhầm lẫn, vui lòng bỏ qua thông báo này. Chúng tôi ghi nhận bạn đã xác nhận rời khỏi phòng thuê.',\n"
                    + "[type] = N'text'\n"
                    + "WHERE [notificationID] = " + notiID;

            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean updateRoomQR(String tenantKey, String landlordKey, String QR_image, int roomID) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "update Room\n"
                        + "set Room.tenant_key=?, landlord_key=?, qr_status='active' , qr_image=?\n"
                        + "where roomID=?";
                st = conn.prepareStatement(sql);
                st.setString(1, tenantKey);
                st.setString(2, landlordKey);
                st.setString(3, QR_image);
                st.setInt(4, roomID);
                if (st.executeUpdate() == 1) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;

    }

    //METHOD THAT GET TOP 2 BILL
    //METHOD RETRIEVE ALL ROOM HAS THE SAME ADDRESS
    public List<Integer> getRoomsByAddress(String address, int currentRoomID) {
        List<Integer> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement st = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT [roomID] FROM Room WHERE [address]=? AND roomID != ?";
                st = conn.prepareStatement(sql);
                st.setNString(1, address);
                st.setInt(2, currentRoomID);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    list.add(rs.getInt(1));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Integer> getRoomFeatureIds(int roomID) {
        List<Integer> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement st = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT [featureID] FROM RoomFeature WHERE [roomID]=?";
                st = conn.prepareStatement(sql);
                st.setInt(1, roomID);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    list.add(rs.getInt(1));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static Map<Integer, List<Integer>> sortByValueCount(final Map<Integer, List<Integer>> homeListMap) {
        return homeListMap.entrySet()
                .stream()
                .sorted((e1, e2) -> Integer.compare(e2.getValue().size(), e1.getValue().size()))
                .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue, (e1, e2) -> e1, LinkedHashMap::new));
    }

    public static void main(String[] args) throws SQLException {
//        RoomManager manager = new RoomManager();
//        List<Integer> list = manager.getRoomsByAddress("Hoàn Kiếm, Hà Nội, Vietnam", 20);
//        for (Integer integer : list) {
//            System.out.println(integer);
//        }
//        List<List<Integer>> listInt = new ArrayList<>();
//        for (Integer integer : list) {
//            listInt.add(manager.getRoomFeatureIds(integer));
//        }
//        for (List<Integer> list1 : listInt) {
//            System.out.println(list1);
//        }
//        Map<Integer, List<Integer>> myMap = new HashMap<>();
//        for (int i = 0; i < list.size(); i++) {
//            myMap.put(list.get(i), listInt.get(i));
//        }
//        System.out.println("Before retain");
//        System.out.println(myMap.entrySet());
//        for (int i = 0; i < list.size(); i++) {
//            myMap.get(list.get(i)).retainAll(manager.getRoomFeatureIds(20));
//        }
//        System.out.println("after sort and retain");
//        Map<Integer, List<Integer>> roomMapSorted = sortByValueCount(myMap);
//        System.out.println(roomMapSorted.entrySet());
//        RoomDAO dao = new RoomDAO();
//        List<Room> roomsByFeature = new ArrayList<>();
//        for (Integer roomId : roomMapSorted.keySet()) {
//            roomsByFeature.add(dao.getRoomById(roomId));
//        }
//        for (Room room : roomsByFeature) {
//            System.out.println(room);
//        }
//        System.out.println(roomsByFeature.size());
//        List<Integer> featureIDs = manager.getRoomFeatureIds(20);
//        for (Integer integer : featureIDs) {
//            System.out.println(integer);
//        }

//        List<BillDetail> list = manager.getBillsDetail(22);
//        for (BillDetail billDetail : list) {
//            System.out.println(billDetail);
//        }
//        
////        Room room = manager.getRoomWhenAssign("123", "456");
////        System.out.println(room);
////        Landlord l = manager.getLandLordInfoInSingleRoom(10);
////        System.out.println(l);
////        List<Room> list = manager.getTenantRoomList("vuvannga@gmail.com", 1);
////        for (Room room : list) {
////            System.out.println(room);
////        }
//        List<Bill> list = manager.getPaidBillList(10,"paid",1);
//        for (Bill bill : list) {
//            System.out.println(bill);
//        }
////        Room room  = manager.getTenantRentedRoom(10);
////        System.out.println(room);
////        int count = manager.countTenantRooms("vuvannga@gmail.com");
////        System.out.println(count);
//
////        String newS = s.trim().replaceAll(" ", "");
////        String shortS = s.substring(0, Math.min(s.length(), 101));
////        int i = newS.length();
////        int j = s.length();
////        System.out.println(shortS);
    }

    public boolean isLandlordRoom(String email, int roomId) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "  select roomID from Room r join Landlord l on (r.emailLandlord=l.email)\n"
                        + "  where r.emailLandlord=? and r.roomID=?";
                st = conn.prepareStatement(sql);
                st.setString(1, email);
                st.setInt(2, roomId);
                rs = st.executeQuery();
                while (rs.next()) {
                    if (rs.getInt(1) > 0) {
                        check = true;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;

    }
}
