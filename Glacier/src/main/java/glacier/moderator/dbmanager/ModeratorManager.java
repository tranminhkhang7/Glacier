/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.moderator.dbmanager;

import glacier.user.model.UserSession;
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

    private static final String GET_TENANT = "SELECT [email], [name], [gender], [phone] FROM Tenant WHERE [email] LIKE ? OR [name] LIKE ?";
    private static final String GET_LANDLORD = "SELECT [email], [name], [gender], [phone] FROM Landlord WHERE [email] LIKE ? OR [name] LIKE ?";

    public List<UserSession> getListUser(String search) throws SQLException {
        List<UserSession> listUser = new ArrayList<>();
        ModeratorManager dao = new ModeratorManager();
        try {
            listUser = dao.getListTenant(search);
            listUser.addAll(dao.getListLandlord(search));
        } catch (Exception e) {
            e.printStackTrace();
        }
       return listUser;
    }

    public List<UserSession> getListTenant(String search) throws SQLException {
        List<UserSession> listUser = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
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
                    listUser.add(new UserSession(email, name, "", "tenant", gender, phone, "", "", ""));
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

    public List<UserSession> getListLandlord(String search) throws SQLException {
        List<UserSession> listUser = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
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
                    listUser.add(new UserSession(email, name, "", "landlord", gender, phone, "", "", ""));
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

//    public static void main(String[] args) throws SQLException {
//        ModeratorManager dao = new ModeratorManager();
//        List<UserSession> list = dao.getListUser("a");
//        for (UserSession user : list) {
//            System.out.println(user);
//        }
//
//    }
}
