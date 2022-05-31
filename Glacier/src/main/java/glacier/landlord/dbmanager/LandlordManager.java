/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.landlord.dbmanager;

import glacier.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author KHANG
 */
public class LandlordManager {

    public void addRoom(String name, String description, String address, String detailAddress, String status, int price, int deposit, float avgRating, Date dateAdded, float area, String emailLandlord) {
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement getID = con.prepareStatement("SELECT MAX([RoomID]) as lastID FROM [Room]");
            ResultSet rs = getID.executeQuery();
            rs.next();
            int newID = Integer.parseInt(rs.getString("lastID")) + 1;

            SimpleDateFormat simpDate = new SimpleDateFormat("yyyy-MM-dd");
            
            String sql = "INSERT INTO [Room] ([roomID], [name], [description], [address], [detailAddress], [emailLandlord], [status], [price], [deposit], [avg_rating], [date_added], [area])\n"
                    + "VALUES (" + newID + ", N'" + name + "', N'" + description + "', N'" + address + "', N'" + 
                    detailAddress + "', N'" + emailLandlord + "', N'" + 
                    status + "', " + 
                    price + ", " + deposit + ", " + 
                            avgRating + ", N'" + 
                            simpDate.format(dateAdded) + "', " + area + ")";

            PreparedStatement st = con.prepareStatement(sql);
//            st.setInt(1, newID);
//            st.setString(2, name);
//            st.setString(3, description);
//            st.setString(4, address);
//            st.setString(5, detailAddress);
//            st.setString(6, emailLandlord);
//            st.setString(7, status);
//            st.setInt(8, price);
//            st.setInt(9, deposit);
//            st.setFloat(10, avgRating);
//            java.sql.Date sqlDate = new java.sql.Date(dateAdded.getTime());
//            st.setDate(11, sqlDate);
//            st.setFloat(12, area);
//            

            
            st.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }
}
