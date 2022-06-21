/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.user.model;

/**
 *
 * @author ASUS
 */
public class Tenant {
    private String email;
    private String name;
    private String profilePicture;
    private String status;
    private String gender;
    private String phone;
    private String facebookLink;
    private String instagramLink;

    public Tenant() {
    }

    public Tenant(String email, String name, String profilePicture, String status, String gender, String phone, String facebookLink, String instagramLink) {
        this.email = email;
        this.name = name;
        this.profilePicture = profilePicture;
        this.status = status;
        this.gender = gender;
        this.phone = phone;
        this.facebookLink = facebookLink;
        this.instagramLink = instagramLink;
    }

    public Tenant(String email, String name, String status, String gender, String phone, String profilePicture) {
        this.email = email;
        this.name = name;
        this.status = status;
        this.gender = gender;
        this.phone = phone;
        this.profilePicture = profilePicture;
    }

    public Tenant(String email, String name, String status, String gender, String phone) {
        this.email = email;
        this.name = name;
        this.status = status;
        this.gender = gender;
        this.phone = phone;
    }
    
    

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProfilePicture() {
        return profilePicture;
    }

    public void setProfilePicture(String profilePicture) {
        this.profilePicture = profilePicture;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFacebookLink() {
        return facebookLink;
    }

    public void setFacebookLink(String facebookLink) {
        this.facebookLink = facebookLink;
    }

    public String getInstagramLink() {
        return instagramLink;
    }

    public void setInstagramLink(String instagramLink) {
        this.instagramLink = instagramLink;
    }

    @Override
    public String toString() {
        return "Tenant{" + "email=" + email + ", name=" + name + ", profilePicture=" + profilePicture + ", status=" + status + ", gender=" + gender + ", phone=" + phone + ", facebookLink=" + facebookLink + ", instagramLink=" + instagramLink + '}';
    }
    
}
