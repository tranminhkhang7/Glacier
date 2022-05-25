/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.user.controller;

import glacier.user.model.Account;
import glacier.user.model.Landlord;
import glacier.user.model.Tenant;
import glacier.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
                    l.setStatus(rs.getString("status"));
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

    public boolean insertUser(Tenant t, Landlord l) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement st = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " INSERT INTO Tenant(email,name,status,gender,phone) "
                        + " VALUES(?,?,?,?,?) ";
                if (t == null) {
                     sql = " INSERT INTO Landlord(email,name,gender,phone) "
                            + " VALUES(?,?,?,?) ";
                st = conn.prepareStatement(sql);
                st.setString(1, l.getEmail());
                st.setString(2, l.getName());
                //st.setString(3, l.getStatus());
                st.setString(3, l.getGender());
                st.setString(4, l.getPhone());
                }else{
                st = conn.prepareStatement(sql);
                st.setString(1, t.getEmail());
                st.setString(2, t.getName());
                st.setString(3, t.getStatus());
                st.setString(4, t.getGender());
                st.setString(5, t.getPhone());
                }
                check = st.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }
    public static void main(String[] args) {
        UserManager user = new UserManager();
        Account acc = user.checkLogin("dangvungocan@gmail.com", "123456789");
        System.out.println(acc);
    }
}
