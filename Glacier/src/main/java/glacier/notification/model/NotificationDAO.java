/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.notification.model;

import glacier.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author KHANG
 */
public class NotificationDAO {
    
    // This method returns a number of notification that the lanlord have created,
    public int countMatched(String emailLandlord) { // searchText: the key words user typed; index: page number
        try {
            String sql = "SELECT COUNT (*)\n" +
                        "FROM [Notification_LT]\n" +
                        "WHERE [emailLandlord] = N'" + emailLandlord + "'";
            
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
    
    // This method returns a list of notifications that the landlord have created.
    public List<NotificationDTO> view (String emailLandlord, int index) {
        try {
            String sql = "SELECT [title], [content], [time]\n" +
                        "FROM [Notification_LT]\n" +
                        "WHERE [emailLandlord] = N'" + emailLandlord + "'\n" +
                        "ORDER BY [time] DESC\n" +
                        "OFFSET " + (index - 1) * 10 + " ROWS FETCH NEXT 10 ROWS ONLY";
            
            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            
            ArrayList<NotificationDTO> list;
            list = new ArrayList<NotificationDTO>();
            
            while (rs.next()) {
                String title = rs.getString("title");
                String content = rs.getString("content");
                Timestamp time = rs.getTimestamp("time");
                System.out.println(time);
                NotificationDTO notification = new NotificationDTO(title, content, time);
                list.add(notification);
            }
            return list;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }
}
