/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import entity.Land;
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
public class LandDA {
    
    private ResultSet rs;
    private Connection cnn;
    private CallableStatement cs;
    
    public List<Land> getLand(String address, String status, double priceMin, double priceMax){
     List<Land> ll = new ArrayList<Land>();
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call AdvancedGetProducts(?,?,?,?,?,?)}");
            
            cs.setInt(1, 0);
            
            address = ( address.equalsIgnoreCase("") ) ? null : address;
            status = ( status.equalsIgnoreCase("") ) ? null : status;
            
            cs.setString(2, address);
            cs.setString(3, status);
            cs.setString(4, "land");
            
            cs.setDouble(5, 0);
            cs.setDouble(6, 0);
            
            rs = cs.executeQuery();
            while (rs.next()) {
                Land p = new Land();

                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setAddress(rs.getString(3));
                p.setPrice(rs.getDouble(4));
                p.setStatus(rs.getString(5));
                p.setArea(rs.getDouble(6));
                p.setCreator(rs.getInt(7));
                p.setDateCreated(rs.getString(8));
                p.setDateModified(rs.getString(9));
                p.setDescription(rs.getString(10));

                ll.add(p);
            }
            return ll;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
    }
    
    public Land getLand(int id){
        Land p = new Land();
        try {
            Connection cnn = Tools.getConnection();
            CallableStatement cs = cnn.prepareCall("{call AdvancedGetProducts(?,?,?,?,?,?)}");
            cs.setInt(1, id);
            cs.setString(4, "land");
            rs = cs.executeQuery();
            while (rs.next()) {
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setAddress(rs.getString(3));
                p.setPrice(rs.getDouble(4));
                p.setStatus(rs.getString(5));
                p.setArea(rs.getDouble(6));
                p.setCreator(rs.getInt(7));
                p.setDateCreated(rs.getString(8));
                p.setDateModified(rs.getString(9));
                p.setDescription(rs.getString(10));
            }
            return p;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
    }
}