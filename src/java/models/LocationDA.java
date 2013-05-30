/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import entity.Location;
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
public class LocationDA {
    
    private ResultSet rs;
    private Connection cnn;
    private CallableStatement cs;

    public List<Location> getLocation() {
        List<Location> ll = new ArrayList<Location>();
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call getLocation}");
            rs = cs.executeQuery();
            while (rs.next()) {
                ll.add(new Location(rs.getInt(1), rs.getString(2)));
            }
            return ll;
        } catch (Exception e) {
            return null;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
    }
    
    public Location getLocation(int id){
        
        if(id<=0){return null;}
        
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call getLocation(?)}");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                return new Location(rs.getInt(1), rs.getString(2));
            }
        } catch (Exception e) {
            return null;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
        return null;
    }
    
    public boolean add(Location location){
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call insertLocation(?)}");  //13 params
            cs.setString(1, location.location);
            boolean res = (cs.executeUpdate()) > 0 ? true : false;
            return res;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
    }
    
    public boolean update(Location location){
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call updateLocation(?,?)}");  //13 params
            cs.setInt(1, location.id);
            cs.setString(2, location.location);
            boolean res = (cs.executeUpdate()) > 0 ? true : false;
            return res;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
    }
    
    
    public boolean remove(int id){
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call deleteLocation(?)}");  //13 params
            cs.setInt(1, id);
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