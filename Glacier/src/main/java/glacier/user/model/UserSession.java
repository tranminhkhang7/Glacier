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
public class UserSession {
    private String email;
    private String name;
    private String password;
    private String role;
    private String gender;
    private String phone;
    private String status;
    private String id;
    private String key;

    public UserSession() {
    }

    public UserSession(String email, String name, String password, String role, String gender, String phone, String status, String id, String key) {
        this.email = email;
        this.name = name;
        this.password = password;
        this.role = role;
        this.gender = gender;
        this.phone = phone;
        this.status = status;
        this.id = id;
        this.key = key;
    }


    public UserSession(String email, String password, String id, String key) {
        this.email = email;
        this.password = password;
        this.id = id;
        this.key = key;
    }
    
    


    public String getId() {
        return id;
    }

    public String getKey() {
        return key;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "UserSession{" + "email=" + email + ", name=" + name + ", password=" + password + ", role=" + role + ", gender=" + gender + ", phone=" + phone + ", status=" + status + '}';
    }
    
}
