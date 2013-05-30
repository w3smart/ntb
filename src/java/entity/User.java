package entity;

import java.io.Serializable;

/**
 *
 * @author tannt
 */
public class User implements Serializable{
    public int id;
    public String username;
    public String password;
    public String role;
    public String email;
    public String dateCreated;
    public String dateModified;
    public String address;
    public String phone;

    public User(int id, String username, String password, String role, String email, String dateCreated, String dateModified, String address, String phone) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.role = role;
        this.email = email;
        this.dateCreated = dateCreated;
        this.dateModified = dateModified;
        this.address = address;
        this.phone = phone;
    }

    public User(String username, String password, String role, String email, String dateCreated, String dateModified, String address, String phone) {
        this.username = username;
        this.password = password;
        this.role = role;
        this.email = email;
        this.dateCreated = dateCreated;
        this.dateModified = dateModified;
        this.address = address;
        this.phone = phone;
    }

    public User() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", username=" + username + ", password=" + password + ", role=" + role + ", email=" + email + ", dateCreated=" + dateCreated + ", dateModified=" + dateModified + ", address=" + address + ", phone=" + phone + '}';
    }

}