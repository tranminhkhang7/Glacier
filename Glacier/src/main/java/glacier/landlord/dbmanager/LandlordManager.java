/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.landlord.dbmanager;

import glacier.model.feature.FeatureDAO;
import glacier.room.model.Room;
import glacier.user.model.Landlord;
import glacier.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
    
    public int getCurrentRoomID(){
        int ID=-1;
        String sql="SELECT MAX([RoomID]) as lastID FROM [Room]";
        try{
            Connection conn=DBUtils.getConnection();
            PreparedStatement pstm = conn.prepareStatement(sql);
            ResultSet rs =pstm.executeQuery();
            rs.next();
            ID = Integer.parseInt(rs.getString("lastID"));
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return ID;
    }
    
    // This method returns ID of the room which contains the bill with billID
    public int getRoomIDByBillID(int billID) { 
        try {
            String sql = "SELECT [roomID]\n"
                    + "FROM [Bill]\n"
                    + "WHERE [billID] = N'" + billID + "'";

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
    
    public boolean addRoom(String name, String description, String address, String detailAddress, String status, int price, int deposit, float avgRating, Date dateAdded, float area, String emailLandlord, List<Integer> listFeature) {
        boolean check=false;
        try {
            Connection con = DBUtils.getConnection();
//            PreparedStatement getID = con.prepareStatement("SELECT MAX([RoomID]) as lastID FROM [Room]");
//            ResultSet rs = getID.executeQuery();
//            rs.next();
//            int newID = Integer.parseInt(rs.getString("lastID")) + 1;
            int newID = getCurrentRoomID()+1;
            SimpleDateFormat simpDate = new SimpleDateFormat("yyyy-MM-dd");

            // Add information except for Room's feature
            String sql = "INSERT INTO [Room] ([roomID], [name], [description], [address], [detailAddress], [emailLandlord], [status], [price], [deposit], [avg_rating], [date_added], [area])\n"
                    + "VALUES (" + newID + ", N'" + name + "', N'" + description + "', N'" + address + "', N'"
                    + detailAddress + "', N'" + emailLandlord + "', N'"
                    + status + "', "
                    + price + ", " + deposit + ", "
                    + avgRating + ", N'"
                    + simpDate.format(dateAdded) + "', " + area + ")";

            PreparedStatement st = con.prepareStatement(sql);
            st.executeUpdate();
            
            // Add Room's feature
            sql = "";
            for (Integer i: listFeature) {
                sql += "INSERT INTO [RoomFeature] ([roomID], [featureID])\n" +
                      "VALUES (" + newID + ", " + i + ")\n";
            }
            
            st = con.prepareStatement(sql);
            st.executeUpdate();
            check=true;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return check;
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
                    + "ORDER BY [date_added] DESC\n"
                    + "OFFSET " + (index - 1) * 16 + " ROWS FETCH NEXT 16 ROWS ONLY";

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
    public void updateRoom(int roomID, String name, String description, String address, String detailAddress, int price, int deposit, float area, List<Integer> listFeature) {
        try {
            // Update information except for Room's features
            String sql = "UPDATE [Room]\n"
                    + "SET [name] = N'" + name + "', [description] = N'" + description + "', [address] = N'" + address + "', [detailAddress] = N'" + detailAddress + "', [price] = " + price + ", [deposit] = " + deposit + ", [area] = " + area + "\n"
                    + "WHERE [roomID] = " + roomID;

            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.executeUpdate();
            
            // Delete current features
            FeatureDAO mng = new FeatureDAO();
            mng.deleteFeatureOfARoom(roomID);
            
            // Update features
            sql = "";
            for (Integer i: listFeature) {
                sql += "INSERT INTO [RoomFeature] ([roomID], [featureID])\n" +
                      "VALUES (" + roomID + ", " + i + ")\n";
            }
            
            st = con.prepareStatement(sql);
            st.executeUpdate();

        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

    // This method is for Updating room based on its ID.
    public void deleteRoom(int roomID) {
        try {
            // Delete current features
            FeatureDAO mng = new FeatureDAO();
            mng.deleteFeatureOfARoom(roomID);
            
            // Delete the room
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

    public boolean deleteImageLink(int roomID){
        boolean check=false;
        try{
            String sql="delete from ImagesRoom\n" +
                        "where roomID=?";
            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, roomID);
            if(st.executeUpdate()>0) check=true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return check;
    }
    
    public boolean deleteImageLink(int roomID,int picID){
        boolean check=false;
        try{
            String sql="delete from ImagesRoom\n" +
                        "where roomID=?, picID=?";
            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, roomID);
            st.setInt(2, picID);
            if(st.executeUpdate()>0) check=true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return check;
    }
    
    public int getNextImgID(int roomID){
        int id=-1;
        try{
            String sql="  select top 1 picID from ImagesRoom\n" +
"  where roomID=?\n" +
"  order by picID DESC";
            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, roomID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                id=rs.getInt(1);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return id;
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
    
    private static String GET_LIST = "SELECT SUM(amount) as sum FROM BillDetail d JOIN Bill b ON d.billID = b.billID WHERE status LIKE '%paid%' AND roomID IN (SELECT roomID FROM Room WHERE emailLandlord LIKE ? ) AND YEAR(time) = ?" ;
    private static String GET_LIST_2 = GET_LIST + " AND MONTH(time) = ?" ;
    private static String GET_LIST2 = "SELECT SUM(amount) as sum FROM BillDetail WHERE billID IN (SELECT billID FROM Bill WHERE roomID LIKE ? AND YEAR(time) = ?" ;
    private static String GET_LIST2_2 = GET_LIST2 + " AND MONTH(time) = ? )";

    
    public int getResult(String temp, int year, String t) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int value = 0;
        String sql = null;
        if(t.equals("all")){
            sql = GET_LIST;
        } else sql = GET_LIST2 +")";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, "%" + temp + "%");
                ptm.setInt(2, year);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    value = rs.getInt("sum");
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return value;
    }
    
    public List getListAllTime(String temp, String t) throws SQLException {
        LandlordManager dao = new LandlordManager();
        List list = new ArrayList();
        for (int i = 2020; i <= 2022; i++) {
            list.add(dao.getResult(temp, i, t));
        }
        return list;
    }
    
    public int getResultByYear(String temp, int year, int month , String t) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int value = 0;
        String sql = null;
        if(t.equals("all")){
            sql = GET_LIST_2;
        } else sql = GET_LIST2_2;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, "%" + temp + "%");
                ptm.setInt(2, year);
                ptm.setInt(3, month);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    value = rs.getInt("sum");
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return value;
    }

    public List getListByYear(String temp,int year, String t) throws SQLException {
        LandlordManager dao = new LandlordManager();
        List list = new ArrayList();
        for (int i = 1; i <= 12; i++) {
            list.add(dao.getResultByYear(temp, year, i, t));
        }
        return list;
    }
    
    public List<String> getRoomId(String email) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<String> list = new ArrayList<>();
        String sql = "SELECT roomID FROM Room WHERE emailLandlord LIKE ?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, "%" + email + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("roomID");
                    list.add(id);
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return list;
    }
    
    public int getRentingTimes(String email) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int times = 0;
        String sql = "SELECT COUNT(detailID) as times FROM BillDetail WHERE purpose = 'rent' AND billID IN (SELECT billID FROM Room r JOIN Bill b ON r.roomID = b.roomID WHERE emailLandlord LIKE ?) ";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, "%" + email + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    times = rs.getInt("times");
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return times;
    }
    
    public String getMostRented(String email) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String name = null;
        String sql = "SELECT TOP 1 name FROM Room r JOIN Bill b ON r.roomID = b.roomID WHERE emailLandlord LIKE ? GROUP BY b.roomID, name ORDER BY COUNT(b.roomID) desc";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, "%" + email + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    name = rs.getString("name");
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return name;
    }
    public boolean saveRoomImage(int roomID,int picID){
        boolean check=false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String name = null;
        String sql =    "insert into ImagesRoom \n" +
                        "values (?,?)";
        try{
            conn = DBUtils.getConnection();
            if (conn != null){
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, roomID);
                ptm.setInt(2, picID);
                if (ptm.executeUpdate()>0) check=true;
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return check;
    }
    
    public static void main(String[] args) throws SQLException {
        LandlordManager manager = new LandlordManager();
        System.out.println(manager.getMostRented("nguyenhoangngan@gmail.com"));
//        int i = manager.countAllPendingRooms("dangngocduong@gmail.com");
//        System.out.println(i);
//        List<Room> list = manager.getLandlordPendingRooms("dangngocduong@gmail.com", 1);
//        for (Room room : list) {
//            System.out.println(room);
//        }
//        String s = manager.roomStatus(10);
//        System.out.println(s);
//        System.out.println(manager.getListAllTime("21", "21"));
//        System.out.println(manager.getListByYear("21", 2022, "21"));
//            System.out.println(manager.getRoomId("nguyenhoangngan@gmail.com"));
    }
}
