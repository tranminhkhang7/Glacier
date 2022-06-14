/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package glacier.room.dbmanager;

import glacier.room.model.FavouriteRoom;
import glacier.room.model.Room;
import glacier.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class FavouriteManager {
    //Init global variable for class
    private Connection conn = null;
    private PreparedStatement pstm = null;
    private ResultSet rs = null;

    // Always remember to close connection
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
    public boolean addToFavourite(FavouriteRoom r) throws Exception{
        boolean check=false;
        conn=DBUtils.getConnection();
        if (conn!=null){
            String sql = "insert into Favourite (email,roomID,time)\n" +
                         "values (?,?,?)";
        pstm = conn.prepareStatement(sql);
        pstm.setString(1,r.getEmail());
        pstm.setInt(2, r.getRoomID());
        pstm.setTimestamp(3, r.getTime());
        pstm.executeUpdate();
        check=true;
        }
        return check;
    }

    public boolean getFStatus(int roomID,String email) throws Exception {
        boolean check = false;
        conn = DBUtils.getConnection();
        if (conn!=null){
            String sql = "select COUNT(*) from Favourite\n" +
                        "where email = ? AND roomID=?";
            pstm=conn.prepareStatement(sql);
            pstm.setString(1, email);
            pstm.setInt(2, roomID);
            rs=pstm.executeQuery();
            int i=-1;
            while (rs.next()){
                i = rs.getInt(1);
            }
            if (i==0) check = true;
        }
        return check;
    }

    public boolean removeFromFavourite(FavouriteRoom fr) throws Exception {
        boolean check=false;
        conn=DBUtils.getConnection();
        if (conn!=null){
            String sql = "delete from Favourite\n" +
                        "where email=? and roomID=?";
            pstm=conn.prepareStatement(sql);
            pstm.setString(1,fr.getEmail());
            pstm.setInt(2, fr.getRoomID());
            try {
                pstm.executeUpdate();
                check=true;
            }
            catch (Exception e){
                check=false;
                e.printStackTrace();
            }
        }
        return check;
    }
    
    public ArrayList<FavouriteRoom> getAllFRoom(String email,int indexPage) throws Exception{
        ArrayList<FavouriteRoom> FRL = new ArrayList<>();
        conn = DBUtils.getConnection();
        FavouriteRoom f = new FavouriteRoom();
        try{
            if (conn!=null){
                String sql =" select r.roomID,r.name,r.address,r.description,r.date_added,r.price,l.name,l.email\n" +
                            "  from Favourite f join Room r on (r.roomID=f.roomID) join Landlord l on (l.email=r.emailLandlord)\n" +
                            "  where (f.email=?)\n" +
                            "  order by r.roomID desc\n" +
                            "  OFFSET (?-1) * 6 row fetch next 6 rows only ";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1,email);
                pstm.setInt(2,indexPage);
                rs=pstm.executeQuery();
                while (rs.next()){
                    int roomID = rs.getInt(1);
                    String rName=rs.getString(2);
                    String address=rs.getString(3);
                    String description=rs.getString(4);
                    Timestamp date = rs.getTimestamp(5);
                    int price = rs.getInt(6);
                    String lName=rs.getString(7);
                    Room r = new Room(roomID, rName, description, address, email, price, date);
                    f = new FavouriteRoom(email, lName, r);
                    FRL.add(f);
                }
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        finally{
            closeConnection();
            return FRL;
        }
    }

    public int getNumberOfFRooms(String email) throws Exception {
        int i=-1;
        conn=DBUtils.getConnection();
        try{
            if (conn!=null){
                String sql = "  select count(*)\n" +
                                "  from Favourite\n" +
                                "  where email=?";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, email);
                rs=pstm.executeQuery();
                while (rs.next()){
                    i=rs.getInt(1);
                }
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return i;
    }
}
