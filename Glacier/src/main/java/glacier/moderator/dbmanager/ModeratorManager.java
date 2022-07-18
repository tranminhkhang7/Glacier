/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.moderator.dbmanager;

import glacier.user.model.Reported;
import glacier.user.model.User;
import glacier.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class ModeratorManager {

    public List<User> getListUser(String search, int index) throws SQLException {
        List<User> listUser = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String GET_LISTUSER = "SELECT tl.[email], [name], [gender], [phone], [role], [status] "
                + "FROM [Account] a JOIN (SELECT [email], [name], [gender], [phone], [status] FROM [Landlord] UNION SELECT [email], [name], [gender], [phone], [status] FROM [Tenant]) tl ON a.[email] = tl.[email] "
                + "WHERE (a.[email] LIKE ? OR [name] LIKE ?)"
                + "ORDER BY [name] "
                + "OFFSET " + (index - 1) * 10 + " ROWS FETCH NEXT 10 ROWS ONLY";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_LISTUSER);
                ptm.setString(1, "%" + search + "%");
                ptm.setString(2, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String email = rs.getString("email");
                    String name = rs.getString("name");
                    String gender = rs.getString("gender");
                    String phone = rs.getString("phone");
                    String role = rs.getString("role");
                    String status = rs.getString("status");
                    listUser.add(new User(email, name, role, gender, phone, status));
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

        return listUser;
    }

    public List<User> getListTenant(String search, int index) throws SQLException {
        List<User> listUser = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String GET_TENANT = "SELECT [email], [name], [gender], [phone], [status] "
                + "FROM Tenant "
                + "WHERE ([email] LIKE ? OR [name] LIKE ?) "
                + "ORDER BY [name] "
                + "OFFSET " + (index - 1) * 10 + " ROWS FETCH NEXT 10 ROWS ONLY";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_TENANT);
                ptm.setString(1, "%" + search + "%");
                ptm.setString(2, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String email = rs.getString("email");
                    String name = rs.getString("name");
                    String gender = rs.getString("gender");
                    String phone = rs.getString("phone");
                    String status = rs.getString("status");
                    listUser.add(new User(email, name, "tenant", gender, phone, status));
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
        return listUser;
    }

    public List<User> getListLandlord(String search, int index) throws SQLException {
        List<User> listUser = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String GET_LANDLORD = "SELECT [email], [name], [gender], [phone], [status] "
                + "FROM Landlord "
                + "WHERE ([email] LIKE ? OR [name] LIKE ?) "
                + "ORDER BY [name] "
                + "OFFSET " + (index - 1) * 10 + " ROWS FETCH NEXT 10 ROWS ONLY";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_LANDLORD);
                ptm.setString(1, "%" + search + "%");
                ptm.setString(2, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String email = rs.getString("email");
                    String name = rs.getString("name");
                    String gender = rs.getString("gender");
                    String phone = rs.getString("phone");
                    String status = rs.getString("status");
                    listUser.add(new User(email, name, "landlord", gender, phone, status));
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
        return listUser;
    }

    public int countMatched(String search, String role) { // search: the key words user typed; index: page number
        try {

            String sql1 = "SELECT COUNT (*) FROM [Tenant] WHERE ([name] LIKE '%" + search + "%') OR ([email] LIKE '%" + search + "%')";
            String sql2 = "SELECT COUNT (*) FROM [Landlord] WHERE ([name] LIKE '%" + search + "%') OR ([email] LIKE '%" + search + "%') ";
            String sql3 = "Select COUNT (*) FROM (SELECT [email], [name] FROM [Tenant] UNION SELECT [email], [name] FROM [Landlord]) as total WHERE ([email] LIKE '%" + search + "%' OR [name] LIKE '%" + search + "%')";
            String sql = null;
            if (role.equals("all")) {
                sql = sql3;
            }
            if (role.equals("tenant")) {
                sql = sql1;
            }
            if (role.equals("landlord")) {
                sql = sql2;
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

    public boolean banUser(String userPhone, String role) { // search: the key words user typed; index: page number
        boolean check = false;
        try {
            String sql1 = "UPDATE Tenant SET status = 'disabled' WHERE phone LIKE '%" + userPhone + "%'";
            String sql2 = "UPDATE Landlord SET status = 'disabled' WHERE phone LIKE '%" + userPhone + "%'";
            String sql = null;
            if (role.equals("tenant")) {
                sql = sql1;
            }
            if (role.equals("landlord")) {
                sql = sql2;
            }
            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            check = st.executeUpdate() != 0;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return check;
    }

    public boolean unbanUser(String userPhone, String role) { // search: the key words user typed; index: page number
        boolean check = false;
        try {
            String sql1 = "UPDATE Tenant SET status = 'active' WHERE phone LIKE '%" + userPhone + "%'";
            String sql2 = "UPDATE Landlord SET status = 'active' WHERE phone LIKE '%" + userPhone + "%'";
            String sql = null;
            if (role.equals("tenant")) {
                sql = sql1;
            }
            if (role.equals("landlord")) {
                sql = sql2;
            }
            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            check = st.executeUpdate() != 0;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return check;
    }

    public List<Reported> getListRPRoom(int index) throws SQLException {
        List<Reported> listReported = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String GET_REPORTROOM = "SELECT [roomID], [email], [content], [time] FROM ReportRoom ORDER BY [roomID] OFFSET " + (index - 1) * 10 + " ROWS FETCH NEXT 10 ROWS ONLY";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_REPORTROOM);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("roomID");
                    String userEmail = rs.getString("email");
                    String detail = rs.getString("content");
                    String date = rs.getString("time");
                    listReported.add(new Reported(id, userEmail, detail, date, "room"));
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
        return listReported;
    }

    public List<Reported> getListRPComment(int index) throws SQLException {
        List<Reported> listReported = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String GET_REPORTCOMMENT = "SELECT [commentID], [email], [content], [time] FROM ReportComment ORDER BY [commentID] OFFSET " + (index - 1) * 10 + " ROWS FETCH NEXT 10 ROWS ONLY";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_REPORTCOMMENT);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("commentID");
                    String userEmail = rs.getString("email");
                    String detail = rs.getString("content");
                    String date = rs.getString("time");
                    listReported.add(new Reported(id, userEmail, detail, date, "comment"));
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
        return listReported;
    }

    public List<Reported> getListReported(int index) throws SQLException {
        List<Reported> listReported = new ArrayList<>();
        ModeratorManager dao = new ModeratorManager();
        try {
            listReported = dao.getListRPRoom(index);
            listReported.addAll(dao.getListRPComment(index));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listReported;
    }

    public int countMatched2(String type) { // search: the key words user typed; index: page number
        try {

            String sql1 = "SELECT COUNT (*) FROM [ReportRoom] ";
            String sql2 = "SELECT COUNT (*) FROM [ReportComment] ";
            String sql3 = "SELECT COUNT (*) FROM (SELECT * FROM ReportComment UNION SELECT * FROM ReportRoom) as new ";
            String sql = null;
            if (type.equals("all")) {
                sql = sql3;
            }
            if (type.equals("room")) {
                sql = sql1;
            }
            if (type.equals("comment")) {
                sql = sql2;
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

    public boolean removeReported(String id, String type) {
        boolean check = false;
        String sql1 = "DELETE FROM [ReportRoom] WHERE roomID = " + id;
        String sql2 = "DELETE FROM [ReportComment] WHERE commentID = " + id;
        String sql = null;
        try {
            if (type.equals("room")) {
                sql = sql1;
            }
            if (type.equals("comment")) {
                sql = sql2;
            }
            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            check = st.executeUpdate() != 0;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return check;
    }

    public boolean deleteReported(String id, String type) {
        boolean check = false;
        String sql1 = "DELETE FROM [Room] WHERE roomID = " + id;
        String sql2 = "DELETE FROM [Comment] WHERE commentID = " + id;
        String sql = null;
        ModeratorManager dao = new ModeratorManager();
        try {
            if (type.equals("room")) {
                sql = sql1;
            }
            if (type.equals("comment")) {
                sql = sql2;
            }
            dao.removeReported(id, type);
            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            check = st.executeUpdate() != 0;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return check;
    }

    public int newID() throws SQLException {
        String sql = "SELECT Max(id) as total From Feature";
        int id = 0;
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            ptm = con.prepareStatement(sql);
            rs = ptm.executeQuery();
            while (rs.next()) {
                id = rs.getInt("total");
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return id + 1;
    }

    public boolean addFeature(String feature) throws SQLException {
        boolean check = false;
        String sql = "INSERT INTO Feature(id,name) VALUES (?,?)";
        ModeratorManager dao = new ModeratorManager();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, dao.newID());
                ptm.setString(2, feature);
                check = ptm.executeUpdate() != 0;
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
        return check;
    }
    
    public boolean deleteFeature(String id) throws SQLException {
        boolean check = false;
        String sql = "DELETE FROM Feature WHERE" + id;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                check = ptm.executeUpdate() != 0;
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
        return check;
    }

    public List<Feature> listFeature() throws SQLException {
        String sql = "SELECT id, name FROM Feature";
        List<Feature> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("id");
                    String name = rs.getString("name");
                    list.add(new Feature(id, name));
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

    public List<VerifyingRoom> verifyingRoomList(int index) throws SQLException {
        String sql = "SELECT roomID, r.name, address, date_added, phone, emailLandlord "
                + "FROM Room r JOIN Landlord l ON r.emailLandlord = l.email "
                + "WHERE r.status LIKE '%verifying%' "
                + "ORDER BY roomID "
                + "OFFSET " + (index - 1) * 10 + " ROWS FETCH NEXT 10 ROWS ONLY";
        List<VerifyingRoom> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int roomID = rs.getInt("roomID");
                    String name = rs.getString("name");
                    String address = rs.getString("address");
                    String emailLandlord = rs.getString("emailLandlord");
                    String date_added = rs.getString("date_added");
                    String phone = rs.getString("phone");
                    list.add(new VerifyingRoom(roomID, name, address, emailLandlord, date_added, phone));
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

    public int countMatched3() { // search: the key words user typed; index: page number
        try {

            String sql = "SELECT COUNT (*) FROM Room where status LIKE '%verifying%'";
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

    public boolean verified(String id) {
        boolean check = false;
        String sql = "UPDATE Room SET status = 'available' WHERE roomID =" + id;
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            check = st.executeUpdate() != 0;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return check;
    }

    public boolean notVerified(String id) {
        boolean check = false;
        String sql = "UPDATE Room SET status = 'verifiedFail' WHERE roomID =" + id;
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            check = st.executeUpdate() != 0;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return check;
    }

    public static void main(String[] args) throws SQLException {
        ModeratorManager dao = new ModeratorManager();
        List list = new ArrayList<>();
//        System.out.println(dao.getListAllTime("nguyenhoangngan@gmail.com"));
//        System.out.println(dao.getListByYear("nguyenhoangngan@gmail.com", 2021));

    }
}
