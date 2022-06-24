/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.user.controller;

import glacier.notification.model.NotificationDTO;
import glacier.user.model.Account;
import glacier.user.model.Landlord;
import glacier.user.model.Notification_LT;
import glacier.user.model.Notification_TL;
import glacier.user.model.Tenant;
import glacier.utils.DBUtils;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class UserManager {
    //Check for user login

    public Account checkLogin(String email, String password) {
        Account acc = null;
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT role "
                        + " FROM Account "
                        + " WHERE email=? AND [password] =? ";

                if (password == null) {
                    sql = " SELECT role "
                            + " FROM Account "
                            + " WHERE email=? AND [password] is null ";
                }
                st = conn.prepareStatement(sql);
                st.setString(1, email.trim());
                if (password != null) {
                    st.setString(2, password);
                }
                rs = st.executeQuery();
                if (rs.next()) {
                    String role = rs.getString("role").trim();
                    acc = new Account(email, password, role);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return acc;
    }

    //return full tenant infor
    public Tenant getTenantInfo(String email) {
        Tenant t = null;
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT * "
                        + " FROM Tenant "
                        + " WHERE email=? ";
                st = conn.prepareStatement(sql);
                st.setString(1, email);
                rs = st.executeQuery();
                if (rs.next()) {
                    t = new Tenant();
                    t.setEmail(email);
                    t.setName(rs.getString("name"));
                    t.setProfilePicture(rs.getString("profile_picture"));
                    t.setStatus(rs.getString("status"));
                    t.setGender(rs.getString("gender"));
                    t.setPhone(rs.getString("phone"));
                    t.setFacebookLink(rs.getString("facebook_link"));
                    t.setInstagramLink(rs.getString("instagram_link"));
                    
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return t;
    }

    //return full tenant infor
    public Landlord getLandlordInfo(String email) {
        Landlord l = null;
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT * "
                        + " FROM Landlord "
                        + " WHERE email=? ";
                st = conn.prepareStatement(sql);
                st.setString(1, email);
                rs = st.executeQuery();
                if (rs.next()) {
                    l = new Landlord();
                    l.setEmail(email);
                    l.setName(rs.getString("name"));
                    l.setProfilePicture(rs.getString("profile_picture"));
                    //l.setStatus(rs.getString("status"));
                    l.setGender(rs.getString("gender"));
                    l.setPhone(rs.getString("phone"));
                    l.setFacebookLink(rs.getString("facebook_link"));
                    l.setInstagramLink(rs.getString("instagram_link"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    //check duplicate for create user
    public boolean checkDuplicate(String email) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT email "
                        + " FROM Account "
                        + " WHERE email=? ";
                st = conn.prepareStatement(sql);
                st.setString(1, email);
                rs = st.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    //Insert an account into dto.[Account]
    public boolean insertAccount(Account acc) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement st = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " INSERT INTO Account(email,password,role) "
                        + " VALUES(?,?,?) ";
                st = conn.prepareStatement(sql);
                st.setString(1, acc.getEmail());
                st.setString(2, acc.getPassword());
                st.setString(3, acc.getRole());
                check = st.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    //Insert Tenant or Landlord into dtb
    public boolean insertUser(Tenant t, Landlord l) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement st = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " INSERT INTO Tenant(email,name,status,gender,phone,profile_picture) "
                        + " VALUES(?,?,?,?,?,?) ";
                if (t == null) {
                    sql = " INSERT INTO Landlord(email,name,gender,phone,profile_picture) "
                            + " VALUES(?,?,?,?,?) ";
                    st = conn.prepareStatement(sql);
                    st.setString(1, l.getEmail());
                    st.setString(2, l.getName());
                    //st.setString(3, l.getStatus());
                    st.setString(3, l.getGender());
                    st.setString(4, l.getPhone());
                    st.setString(5, l.getProfilePicture());
                } else {
                    st = conn.prepareStatement(sql);
                    st.setString(1, t.getEmail());
                    st.setString(2, t.getName());
                    st.setString(3, t.getStatus());
                    st.setString(4, t.getGender());
                    st.setString(5, t.getPhone());
                    st.setString(6, t.getProfilePicture());
                }
                check = st.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    //insert google user
    public boolean insertGoogleAccount(String email, String role) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement st = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " INSERT INTO Account(email,role) "
                        + " VALUES(?,?) ";
                st = conn.prepareStatement(sql);
                st.setString(1, email);
                st.setString(2, role);
                check = st.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean setRole(String email, String role) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement st = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE Account"
                        + " SET role=? "
                        + " WHERE role=? ";
                st = conn.prepareStatement(sql);
                st.setString(1, email);
                st.setString(2, role);
                check = st.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    //function to update a new information of user
    public boolean updateAccount(String email, String newName, String newGender, String newPhone, String newFacebook, String newInstagram, boolean isTenant) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement st = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE Landlord "
                        + " SET [name]=?, [gender]=?, [phone]=?, [facebook_link]=?, [instagram_link]=? "
                        + " WHERE email=? ";
                if (isTenant == true) {
                    sql = " UPDATE Tenant "
                            + " SET [name]=?, [gender]=?, [phone]=?, [facebook_link]=?, [instagram_link]=? "
                            + " WHERE email=? ";
                }
                st = conn.prepareStatement(sql);
                st.setString(1, newName);
                st.setString(2, newGender);
                st.setString(3, newPhone);
                st.setString(4, newFacebook);
                st.setString(5, newInstagram);
                st.setString(6, email);
                check = st.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean changeTenantPassword(String email, String newPassword) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement st = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE Account "
                        + " SET [password]=? "
                        + " WHERE [email]=? ";
                st = conn.prepareStatement(sql);
                st.setString(1, newPassword);
                st.setString(2, email);
                check = st.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    // This method is exacly the same as the changTenentPassword, but splitting them apart makes life way easier, believe me :v
    public boolean changeLandlordPassword(String email, String newPassword) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement st = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE [Account] "
                        + " SET [password]=? "
                        + " WHERE [email]=? ";
                st = conn.prepareStatement(sql);
                st.setString(1, newPassword);
                st.setString(2, email);
                check = st.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    // This method is processed when a tenant (with email) report a room (with id) a content. 
    public void reportRoom(int id, String email, String content) {
        try {
            Date date = new Date();
            String dateString = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS").format(date);
            String sql = "INSERT INTO [ReportRoom] ([roomID], [email], [content], [time])\n"
                    + "VALUES (" + id + ", N'" + email + "', N'" + content + "', N'" + dateString + "')";

            Connection con = DBUtils.getConnection();
            PreparedStatement getID = con.prepareStatement(sql);
            getID.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

    //Get all numbers off norifications
    public int getAllTenantNotifications(String email) {
        try {
            String sql = "SELECT COUNT(*)\n"
                    + "FROM [Notification_LT]\n"
                    + "WHERE [emailTenant] = ?";

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

    //Get all notifications of a specific user email
    public List<NotificationDTO> getAllTenantNotifications(String email, int index) {
        List<NotificationDTO> notiList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT [notificationID], [emailTenant], [emailLandlord], [roomID], [title], [content], [time], [type] FROM [Notification_LT] "
                        + " WHERE emailTenant=? "
                        + " ORDER BY [time] DESC "
                        + " OFFSET ? ROWS FETCH NEXT 8 ROWS ONLY ";
                st = conn.prepareStatement(sql);
                st.setString(1, email);
                st.setInt(2, (index - 1) * 4);
                rs = st.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("notificationID");
                    String emailTenant = rs.getString("emailTenant");
                    int roomID = rs.getInt("roomID");
                    String title = rs.getString("title");
                    String content = rs.getString("content");
                    Timestamp time = rs.getTimestamp("time");
                    String type = rs.getString("type").trim();
                    notiList.add(new NotificationDTO(id, emailTenant, "", roomID, title, content, time, type));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return notiList;
    }

    //RETURN A TENANT NOTIFICATIONS LIST WITH THE SEARCH CONTENT
    public List<NotificationDTO> searchNotificationsTenant(String search, int index) {
        List<NotificationDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT * FROM [Notification_LT] "
                        + " WHERE FREETEXT(title,?) OR FREETEXT(content,?) "
                        + " ORDER BY [notificationID] "
                        + " OFFSET ? ROWS FETCH NEXT 8 ROWS ONLY ";
                st = conn.prepareStatement(sql);
                st.setString(1, search);
                st.setString(2, search);
                st.setInt(3, (index - 1) * 4);
                rs = st.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("notificationID");
                    String emailTenant = rs.getString("emailTenant");
                    String title = rs.getString("title");
                    String content = rs.getString("content");
                    Timestamp time = rs.getTimestamp("time");
                    list.add(new NotificationDTO(id, emailTenant, "", title, content, time));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean acceptDeposit(int roomId, String state) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement st = null;
        long now = System.currentTimeMillis();
        Timestamp date = new Timestamp(now);
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE [Room] "
                        + " SET status=?, [rentStartDate]=?  "
                        + " WHERE [roomId]=? ";

                st = conn.prepareStatement(sql);

                st.setString(1, state);
                st.setTimestamp(2, date);
                st.setInt(3, roomId);

                check = st.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    // This method processed the deposit of the tenant with the room with roomID. This method changes the status of the room to "Pending" and update the email tenant.
    public void deposit(String emailTenant, int roomID) {
        try {
            String sql = "UPDATE [Room]\n"
                    + "SET [status] = N'pending', [emailTenant] = N'" + emailTenant + "'\n"
                    + "WHERE [roomID] = " + roomID;

            Connection con = DBUtils.getConnection();
            PreparedStatement getID = con.prepareStatement(sql);
            getID.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

    // This method returns tenant's email by the id of the room he/she is renting. This method is used for SingleRoomViewAsLandLord.java.
    public String getEmailTenantByRoomID(int id) {
        try {
            String sql = "SELECT [emailTenant]\n"
                    + "FROM [Room]\n"
                    + "WHERE [roomID] = " + id;

            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            String emailTenant = "";
            while (rs.next()) {
                emailTenant = rs.getString("emailTenant");
            }
            return emailTenant;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    // This method returns rentStartDate by the id. This method is used for SingleRoomViewAsLandLord.java.
    public String getStartRentDateByRoomID(int id) {
        try {
            String sql = "SELECT [rentStartDate]\n"
                    + "FROM [Room]\n"
                    + "WHERE [roomID] = " + id;

            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            String rentStartDate = "";
            while (rs.next()) {
                rentStartDate = rs.getString("rentStartDate");
            }
            return rentStartDate;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    //
    public boolean removeTenantFromRoom(int roomId) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement st = null;
        long now = System.currentTimeMillis();
        Timestamp date = new Timestamp(now);
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE [Room] "
                        + " SET [status] = 'available', [emailTenant] = NULL, [rentStartDate] = NULL  "
                        + " WHERE [roomId]=? ";

                st = conn.prepareStatement(sql);

                st.setInt(1, roomId);

                check = st.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public List<Integer> getRoomIDsOver2Days() {
        List<Integer> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT roomID, emailTenant, emailLandlord, price FROM  Room \n"
                        + "WHERE rentStartDate <= DATEADD(day,-2,GETDATE()) AND [status] = 'pending'";
                st = conn.prepareStatement(sql);

                rs = st.executeQuery();
                while (rs.next()) {
                    list.add(rs.getInt(1));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean freeRoomAfter2Days(int roomId) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement st = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE [Room] "
                        + " SET [rentStartDate] = NULL, [status]='available', [emailTenant] = NULL  "
                        + " WHERE [roomId]=? ";

                st = conn.prepareStatement(sql);

                st.setInt(1, roomId);

                check = st.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public static void main(String[] args) {

        UserManager user = new UserManager();
        List<Integer> list = user.getRoomIDsOver2Days();
        for (Integer integer : list) {
            System.out.println(integer);
        }
//        List<NotificationDTO> list = user.searchNotificationsTenant("I that banana", 1);
//        for (NotificationDTO notification_LT : list) {
//            System.out.println(notification_LT);
//        }
//        List<Notification_LT> list = user.getAllTenantNotifications("dinhxuantung@gmail.com", 1);
//        for (Notification_LT notification_LT : list) {
//            System.out.println(notification_LT);
//        }
//        int count = user.getAllTenantNotifications("dinhxuantung@gmail.com");
//        System.out.println(count);
//        Landlord l = user.getLandlordInfo("dangngocduong@gmail.com");
//        System.out.println(l);
//        boolean check = user.updateAccount("hehe@gmail.com", "Khoa Bui", "female", "1234567890", "fb.com/khoa.1313", "ig.com/khoa.1313", false );
//        System.out.println(check);
//        Account acc = user.checkLogin("dangvungocan@gmail.com", "123456789");
//        System.out.println(acc);
    }
}