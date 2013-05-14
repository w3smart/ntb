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
            e.printStackTrace();
            return null;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
    }
    
    public Location getLocation(int id){
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call getLocation(?)}");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                return new Location(rs.getInt(1), rs.getString(2));
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
        return null;
    }
}
