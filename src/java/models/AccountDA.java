/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import entity.Account;
import entity.Department;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import tool.*;

/**
 *
 * @author Hoanvd
 */
public class AccountDA {

    private Connection cnn;
    private ResultSet rs;
    private CallableStatement cs;

    public Account getAccount(String username, String password) {
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call sp_Login(?,?)}");
            cs.setString(1, username);
            cs.setString(2, password);
            rs = cs.executeQuery();
            while (rs.next()) {
                Account account = new Account();
//                account.setPersonId(rs.getInt(1));
//                account.setUserName(rs.getString(2));
//                account.setPassword(rs.getString(3));
//                account.setFullName(rs.getString(4));
//                account.setEmail(rs.getString(5));
//                account.setBirthDate(rs.getDate(6));
//                account.setJoinedDate(rs.getDate(7));
//                account.setAddress(rs.getString(8));
//                account.setDepartmentId(rs.getInt(9));
//                account.setAccountType(rs.getString(10));
                return account;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
        return null;
    }
    
    public List<Account> getAccount(){
        List<Account> la = new ArrayList<Account>();
        
        return la;
    }
    
    public Account getAccountById(){
        return null;
    }
    
}
