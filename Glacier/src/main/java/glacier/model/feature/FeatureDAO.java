/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.model.feature;

import glacier.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author KHANG
 */
public class FeatureDAO {

    public List<FeatureDTO> loadFeature() {
        try {
            String sql = "SELECT *\n"
                    + "FROM [Feature]";
            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            List<FeatureDTO> listResult = new ArrayList<>();
            while (rs.next()) {
                FeatureDTO feature = new FeatureDTO(rs.getInt("id"), rs.getString("name").trim());
                listResult.add(feature);
            }
            return listResult;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // This method returns a list of features of a room. This method is written by Khang and used for Edit rooms
    public List<FeatureDTO> getFeature(int roomID) {
        try {
            // Load the feature of the room
            String sql = "SELECT [featureID]\n"
                    + "FROM [RoomFeature]\n"
                    + "WHERE [roomID] = " + roomID + "\n"
                    + "ORDER BY [featureID] ASC";

            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            List<Integer> listFeatureID;
            listFeatureID = new ArrayList<Integer>();
            while (rs.next()) {
                listFeatureID.add(rs.getInt("featureID"));
            }

            // Return all the feature have features of the room checked
            sql = "SELECT *\n"
                    + "FROM [Feature]\n"
                    + "ORDER BY [id] ASC";
            System.out.println(sql);
            st = con.prepareStatement(sql);
            rs = st.executeQuery();

            List<FeatureDTO> listResult;
            listResult = new ArrayList<>();
            int i = 0;
            while (rs.next()) {
                int featureID = rs.getInt("id");
                String featureName = rs.getString("name").trim();

                FeatureDTO feature;
                if (listFeatureID != null && i < listFeatureID.size() && listFeatureID.get(i) == featureID) {
                    feature = new FeatureDTO(rs.getInt("id"), rs.getString("name").trim(), true);
                    i++;
                } else {
                    feature = new FeatureDTO(rs.getInt("id"), rs.getString("name").trim());
                }
                listResult.add(feature);
            }
            return listResult;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    // This method deletes all the features of a room
    public void deleteFeatureOfARoom(int roomID) {
        try {
            // Update information except for Room's features
            String sql = "DELETE\n"
                    + "FROM [RoomFeature]\n"
                    + "WHERE [RoomID] = " + roomID;

            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }
}