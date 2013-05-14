/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import entity.Room;
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
public class RoomDA{
    
    private ResultSet rs;
    private Connection cnn;
    private CallableStatement cs;
    
    public List<Room> getRoom(String type, String status, double priceMin, double priceMax, int parentId){
     List<Room> lb = new ArrayList<Room>();
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call AdvancedGetProducts(?,?,?,?,?,?,?)}");
            cs.setInt(1, 0);
            cs.setString(2, null);
            cs.setString(3, null);
            cs.setString(4, type);
            cs.setInt(5, 0);
            cs.setInt(6, 0);
            parentId = (parentId==0) ? -1 : parentId;
            cs.setInt(7, parentId);
            
            rs = cs.executeQuery();
            while (rs.next()) {
                Room p = new Room();

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
                p.setParentId(rs.getInt(11));
                p.setType(rs.getString(12));
                p.setThumbnail(rs.getString(13));
                
                lb.add(p);
            }
            return lb;
        } catch (Exception e) {
            return null;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
    }
    
    public Room getRoom(int id){
        Room p = new Room();
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call AdvancedGetProducts(?)}");
            cs.setInt(1, id);
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
                p.setParentId(rs.getInt(11));
                p.setType(rs.getString(12));
                p.setThumbnail(rs.getString(13));
                return p;
            }
            return null;
        } catch (Exception e) {
            return null;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
    }
}
