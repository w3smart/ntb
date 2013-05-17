/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import entity.User;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import tool.Tools;

/**
 *
 * @author fpoly
 */
public class UserDA {
    
    private ResultSet rs;
    private Connection cnn;
    private CallableStatement cs;
    
    public List<User> get(int id, String email, String password, String role){
        
        List<User> lu = new ArrayList<User>();
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call getUser(?,?,?,?)}");
            cs.setInt(1, id);
            
            email = ( email.equalsIgnoreCase("") ) ? null : email;
            password = ( password.equalsIgnoreCase("") ) ? null : password;
            role = ( role.equalsIgnoreCase("") ) ? null : role;
            
            cs.setString(2, email);
            cs.setString(3, password);
            cs.setString(4, role);
            
            rs = cs.executeQuery();
            while (rs.next()) {
                User p = new User();

                p.setId(rs.getInt(1));
                p.setEmail(rs.getString(2));
                p.setPassword(rs.getString(3));
                p.setRole(rs.getString(4));
                p.setBio(rs.getString(5));
                p.setDateCreated(rs.getString(6));
                p.setDateModified(rs.getString(7));
                p.setAddress(rs.getString(8));
                p.setPhone(rs.getString(9));
                p.setAliasName(rs.getString(10));
                
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
        return null;
    }
    
    public boolean remove(){
        return false;
    }
    
    public boolean add(User u){
        return false;
    }
}
