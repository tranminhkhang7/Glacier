/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.model.feature;

/**
 *
 * @author KHANG
 */
public class FeatureDTO {
    private int id;
    private String name;
    private boolean checked;

    public FeatureDTO(int id, String name) {
        this.id = id;
        this.name = name;
        this.checked = false;
    }

    public FeatureDTO(int id, String name, boolean checked) {
        this.id = id;
        this.name = name;
        this.checked = checked;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    @Override
    public String toString() {
        return "FeatureDTO{" + "id=" + id + ", name=" + name + ", checked=" + checked + '}';
    }
}
