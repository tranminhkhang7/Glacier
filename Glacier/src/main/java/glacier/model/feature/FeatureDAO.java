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
}
