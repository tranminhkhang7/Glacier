/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package glacier.room.dbmanager;

import glacier.room.model.FavouriteRoom;
import glacier.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
}
