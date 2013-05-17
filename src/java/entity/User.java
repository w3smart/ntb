/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author fpoly
 */
public class User {
    public int id;
    public String email;
    public String password;
    public String role;
    public String bio;
    public String dateCreated;
    public String dateModified;
    public String address;
    public String phone;
    public String aliasName;

    public User(int id, String email, String password, String role, String bio, String dateCreated, String dateModified, String address, String phone, String aliasName) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.role = role;
        this.bio = bio;
        this.dateCreated = dateCreated;
        this.dateModified = dateModified;
        this.address = address;
        this.phone = phone;
        this.aliasName = aliasName;
    }

    public User(String email, String password, String role, String bio, String dateCreated, String dateModified, String address, String phone, String aliasName) {
        this.email = email;
        this.password = password;
        this.role = role;
        this.bio = bio;
        this.dateCreated = dateCreated;
        this.dateModified = dateModified;
        this.address = address;
        this.phone = phone;
        this.aliasName = aliasName;
    }

    public User() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public String getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(String dateCreated) {
        this.dateCreated = dateCreated;
    }

    public String getDateModified() {
        return dateModified;
    }

    public void setDateModified(String dateModified) {
        this.dateModified = dateModified;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAliasName() {
        return aliasName;
    }

    public void setAliasName(String aliasName) {
        this.aliasName = aliasName;
    }
    
    
}
