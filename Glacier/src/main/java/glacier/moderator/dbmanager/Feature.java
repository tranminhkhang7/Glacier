/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.moderator.dbmanager;

/**
 *
 * @author Admin
 */
public class Feature {
    private String id;
    private String nameFeature;

    public Feature(String id, String nameFeature) {
        this.id = id;
        this.nameFeature = nameFeature;
    }

    public Feature() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNameFeature() {
        return nameFeature;
    }

    public void setNameFeature(String nameFeature) {
        this.nameFeature = nameFeature;
    }
    
    
}
