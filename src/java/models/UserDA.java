package models;

import entity.User;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import tool.Tools;

/**
 *
 * @author tannt
 */
public class UserDA {
    
    private ResultSet rs;
    private Connection cnn;
    private CallableStatement cs;
    
    public List<User> get(){
        List<User> lu = new ArrayList<User>();
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call getUser}");

            rs = cs.executeQuery();
            while (rs.next()) {
                User p = new User();

                p.setId(rs.getInt(1));
                p.setUsername(rs.getString(2));
                p.setPassword(rs.getString(3));
                p.setRole(rs.getString(4));
                p.setEmail(rs.getString(5));
                p.setDateCreated(rs.getString(6));
                p.setDateModified(rs.getString(7));
                p.setAddress(rs.getString(8));
                p.setPhone(rs.getString(9));
                
                lu.add(p);
            }
            return lu;
        } catch (Exception e) {
            return null;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
        
    }
    
    public User get(int id){
        
       if(id<=0){return null;}
        
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call getUser(?)}");
            cs.setInt(1, id);
                    
            rs = cs.executeQuery();
            while (rs.next()) {
                
                User u = new User();
                u.setId(rs.getInt(1));
                u.setUsername(rs.getString(2));
                u.setPassword(rs.getString(3));
                u.setRole(rs.getString(4));
                u.setEmail(rs.getString(5));
                u.setDateCreated(rs.getString(6));
                u.setDateModified(rs.getString(7));
                u.setAddress(rs.getString(8));
                u.setPhone(rs.getString(9));
                
                return u;
            }
        } catch (Exception e) {
            return null;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
        return null;
    }
    
    public User get(String username, String password){
        
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call getUser(?,?,?)}");
            cs.setInt(1, 0);
            
            username = ( username.equalsIgnoreCase("") ) ? null : username;
            password = ( password.equalsIgnoreCase("") ) ? null : password;
            cs.setString(2, username);
            cs.setString(3, password);
            
            rs = cs.executeQuery();
            while (rs.next()) {
                
                User u = new User();
                u.setId(rs.getInt(1));
                u.setUsername(rs.getString(2));
                u.setPassword(rs.getString(3));
                u.setRole(rs.getString(4));
                u.setEmail(rs.getString(5));
                u.setDateCreated(rs.getString(6));
                u.setDateModified(rs.getString(7));
                u.setAddress(rs.getString(8));
                u.setPhone(rs.getString(9));
                
                return u;
            }
        } catch (Exception e) {
            return null;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
        return null;
    }
   
    
    public boolean remove(int id){
        return new BaseDA().remove("Users", id);
    }
    
    public int add(User u){
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call insertUser(?,?,?,?,?,?,?)}");  //13 params
            cs.setString(1, u.username);
            cs.setString(2, u.password);
            cs.setString(3, u.role);
            cs.setString(4, u.email);
            cs.setString(5, u.address);
            cs.setString(6, u.phone);
            cs.registerOutParameter(7, Types.INTEGER);
            boolean res = (cs.executeUpdate()) > 0 ? true : false;
            int id = res == true ? cs.getInt(7) : 0;
            return id;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
    }
    
    public boolean update(User u){
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call UpdateUser(?,?,?,?,?,?,?)}");  //13 params
            cs.setInt(1, u.id);
            cs.setString(2, u.username);
            cs.setString(3, u.password);
            cs.setString(4, u.role);
            cs.setString(5, u.email);
            cs.setString(6, u.address);
            cs.setString(7, u.phone);
            boolean res = (cs.executeUpdate()) > 0 ? true : false;
            return res;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
    }
}
