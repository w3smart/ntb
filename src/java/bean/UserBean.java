package bean;

import entity.User;
import java.util.List;
import models.UserDA;

public class UserBean {
    public int id;
    public String username;
    public String password;
    public String role;
    
    public List<User> list;
    public User user;

    public UserBean() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<User> getList() {
        return new UserDA().get();
    }

    public void setList(List<User> list) {
        this.list = list;
    }

    public User getUser() {
        return new UserDA().get(this.id);
    }

    public void setUser(User user) {
        this.user = user;
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
    
}
