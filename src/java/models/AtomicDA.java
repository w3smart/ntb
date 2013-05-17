/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import entity.Atomic;
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
public class AtomicDA {
    
    private ResultSet rs;
    private Connection cnn;
    private CallableStatement cs;
    
    public List<Atomic> get(int address, String status, String type, double priceMin, double priceMax, int parentId){
        List<Atomic> ll = new ArrayList<Atomic>();
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call getProduct(?,?,?,?,?,?,?)}");
            
            cs.setInt(1, 0);
            status = ( status.equalsIgnoreCase("") ) ? null : status;
            type = ( type.equalsIgnoreCase("") ) ? null : type;
            
            cs.setInt(2, address);
            cs.setString(3, status);
            cs.setString(4, type);        
            cs.setDouble(5, priceMin);
            cs.setDouble(6, priceMax);
            cs.setInt(7, parentId);
            
            rs = cs.executeQuery();
            while (rs.next()) {
                Atomic p = new Atomic();

                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setAddress(rs.getInt(3));
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
                p.setNumOfFloor(rs.getInt(14));
                p.setFloorNumber(rs.getInt(15));
                p.setRoomEachFloor(rs.getInt(16));

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
    
    public Atomic get(int id){
        Atomic p = new Atomic();
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call getProduct(?)}");
            
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setAddress(rs.getInt(3));
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
                p.setNumOfFloor(rs.getInt(14));
                p.setFloorNumber(rs.getInt(15));
                p.setRoomEachFloor(rs.getInt(16));
            }
            return p;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
    }
    
    public boolean remove(int id){
        return false;
    }
    
    public boolean add(Atomic atomic){
        return false;
    }
}
