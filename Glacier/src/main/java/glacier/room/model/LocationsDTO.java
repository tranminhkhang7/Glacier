/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.room.model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author KHANG
 */
public class LocationsDTO {

    public static List<ArrayList<String>> locations;

    public LocationsDTO() {
        List<ArrayList<String>> listOfLists = new ArrayList<ArrayList<String>>();
        ArrayList<String> cityWithDistrict;
        cityWithDistrict = new ArrayList<String>();
        
        cityWithDistrict.add("TPHCM");
        cityWithDistrict.add("Quan 1");
        cityWithDistrict.add("Quan 2");
        cityWithDistrict.add("Quan 3");
        listOfLists.add(cityWithDistrict);
        
        cityWithDistrict = new ArrayList<String>();
        cityWithDistrict.add("Ha Noi");
        cityWithDistrict.add("Ba Dinh");
        cityWithDistrict.add("Cau Giay");
        listOfLists.add(cityWithDistrict);
        
        
        LocationsDTO.locations = listOfLists;
    }
    
}
