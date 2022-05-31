/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.room.dbmanager;

import glacier.room.model.Room; 
import glacier.utils.DBUtils;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class RoomManager {

    // This method is calculating the total number of rooms that matches the keyword
    public int countMatched(String searchText) { // searchText: the key words user typed; index: page number
        try {
            for (int i = 0; i < searchText.length(); i++) {
                if (searchText.charAt(i) == '\'') { // ki tu '
                    searchText = searchText.substring(0, i) + "'" + searchText.substring(i);
                    i++;
                }
            }
            //String sql = "SELECT [ISBN], [title], [image], [price] FROM [Book] WHERE [title] LIKE '%" + searchText + "%'"; // Kiem tra truong hop text co dau '
//            String sql = "SELECT COUNT (*)\n" +
//                        "FROM [Book]\n" +
//                        "WHERE [title] LIKE '%" + searchText + "%'";

            String sql = "SELECT COUNT (*)\n" +
                        "FROM [Room]\n" +
                        "WHERE ([name] LIKE '%" + searchText + "%') OR ([address] LIKE '%" + searchText + "%')";
                    
//            if (rating != null && !rating.equals("all")) {
//                sql += " AND avgRate >= " + rating + " ";
//            }
//            if (genres != null && !genres.equals("all")) {
//                sql += " AND [ISBN] IN\n"
//                        + "		(SELECT [ISBN]\n"
//                        + "		FROM [ProductTag]\n"
//                        + "		WHERE [tagName] = N'" + genres + "')\n";
//            }

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

    // This method returns the list of rooms that matches the searchText, on page index
    public List<Room> search(String searchText, int index) { // searchText: the key words user typed; index: page number
        try {
            for (int i = 0; i < searchText.length(); i++) {
                if (searchText.charAt(i) == '\'') { // ki tu '
                    searchText = searchText.substring(0, i) + "'" + searchText.substring(i);
                    i++;
                }
            }
            
            //String sql = "SELECT [ISBN], [title], [image], [price] FROM [Book] WHERE [title] LIKE '%" + searchText + "%'"; // Kiem tra truong hop text co dau '
//            String sql = "SELECT [ISBN], [title], [image], [price]\n" +
//                        "FROM [Book]\n" +
//                        "WHERE [title] LIKE '%" + searchText + "%'\n" +
//                        "ORDER BY [ISBN]\n" +
//                        "OFFSET " + (index - 1) * 9 + " ROWS FETCH NEXT 9 ROWS ONLY";

            String sql = "SELECT R.[roomID], R.[name] as nameRoom, R.[address], R.[price], R.[date_added], L.[name] as nameLandlord, LEFT(R.[description], 100) as cutDescription\n" +
                        "FROM [Room] R JOIN [Landlord] L ON R.emailLandlord = L.email\n" +
                        "WHERE (R.[name] LIKE '%" + searchText + "%') OR (R.[address] LIKE '%" + searchText + "%')\n";
                    
            
            
//            if (rating != null && !rating.equals("all")) {
//                sql += " AND avgRate >= " + rating + " ";
//            }
//            if (genres != null && !genres.equals("all")) {
//                sql += " AND [ISBN] IN\n"
//                        + "		(SELECT [ISBN]\n"
//                        + "		FROM [ProductTag]\n"
//                        + "		WHERE [tagName] = N'" + genres + "')\n";
//            }
//
//            if (sortBy != null && !sortBy.equals("")) {
//                if (sortBy.equals("Low - high price")) {
//                    sortBy = "ASC";
//                } else {
//                    sortBy = "DESC";
//                }
//                sql += "ORDER BY price " + sortBy + "\n";
//            } else {
//                sql += "ORDER BY [ISBN]\n";
//            }
            sql += "ORDER BY R.[roomID]\n";
            sql += "OFFSET " + (index - 1) * 16 + " ROWS FETCH NEXT 16 ROWS ONLY";
            
            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            
            ArrayList<Room> list;
            list = new ArrayList<Room>();

            while (rs.next()) {
                int roomID = rs.getInt("roomID");
                String nameRoom = rs.getString("nameRoom");
                String cutDescription = rs.getString("cutDescription");
                String address = rs.getString("address");
                String nameLandlord = rs.getString("nameLandlord");
                int price = rs.getInt("price");
                Date dateAdded = rs.getDate("date_added");
                
                Room matchedRoom = new Room(roomID, nameRoom, cutDescription, address, nameLandlord, price, dateAdded);
                list.add(matchedRoom);
            }
            return list;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }
}
