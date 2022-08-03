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
import java.text.SimpleDateFormat;
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
            String sql = "SELECT COUNT (*)\n"
                    + "FROM [Notification_LT]\n"
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
    
    // This method returns a number of notification that the lanlord have received.
    public int countMatchedNotiLandlordReceived(String emailLandlord) { 
        try {
            String sql = "SELECT COUNT (*)\n"
                    + "FROM [Notification_TL]\n"
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
    

    // This method returns a list of notifications that the landlord have created.
    public List<NotificationDTO> view(String emailLandlord, int index) {
        try {
            String sql = "SELECT [title], [content], [time]\n"
                    + "FROM [Notification_TL]\n"
                    + "WHERE [emailLandlord] = N'" + emailLandlord + "'\n"
                    + "ORDER BY [time] DESC\n"
                    + "OFFSET " + (index - 1) * 10 + " ROWS FETCH NEXT 10 ROWS ONLY";

            System.out.println(sql);
            
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

    // This method adds notification from landlords to tenants. Notice: this id is the id of the room (that the tenant is living in), not the notification's ID
    public void landlordNotify(int id, String landlordEmail, String title, String content, String type) {
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement getID = con.prepareStatement("SELECT MAX([notificationID]) as lastID FROM [Notification_LT]");
            ResultSet rs = getID.executeQuery();
            rs.next();
            int newID = Integer.parseInt(rs.getString("lastID")) + 1;

            String sql = "SELECT [emailTenant]\n"
                    + "FROM [Room]\n"
                    + "WHERE [roomID] = " + id;
            PreparedStatement getTenantEmail = con.prepareStatement(sql);
            rs = getTenantEmail.executeQuery();
            rs.next();
            String tenantEmail = rs.getString("emailTenant").trim();

            Date date = new Date();
            String dateString = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS").format(date);
            sql = "INSERT INTO [Notification_LT] ([notificationID], [emailLandlord], [emailTenant], [roomID], [title], [content], [time], [type])\n"
                    + "VALUES (" + newID + ", N'" + landlordEmail + "', N'" + tenantEmail + "', N'" + id + "', N'" + title + "', N'" + content + "', N'" + dateString + "', N'" + type + "')";
//            System.out.println(sql);
            PreparedStatement st = con.prepareStatement(sql);
            st.executeUpdate();

        } catch (Exception ex) {
            System.out.println(ex);
        }
    }
}
