/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import entity.Atomic;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Types;
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
    
    public List<Atomic> get(int location, String status, String type, double priceMin, double priceMax, int parentId, String name){
        List<Atomic> ll = new ArrayList<Atomic>();
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call getProduct(?,?,?,?,?,?,?,?,?)}");
            
            cs.setInt(1, 0);
            status = ( status == null ) ? "" : status;
            type = ( status == null ) ? "" : type;
            name = ( name == null ) ? "" : name;
            cs.setInt(2, location);
            cs.setString(3, status);
            cs.setString(4, type);        
            cs.setDouble(5, priceMin);
            cs.setDouble(6, priceMax);
            cs.setInt(7, parentId);
            cs.setString(8, "*");
            cs.setString(9, name);

            rs = cs.executeQuery();
            while (rs.next()) {
                Atomic p = new Atomic();

                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setLocation(rs.getInt(3));
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
            return null;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
    }
    
    public Atomic get(int id){
        if (id <= 0){
            return null;
        }
        
        Atomic p = new Atomic();
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call getProduct(?)}");
            
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setLocation(rs.getInt(3));
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
            return null;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
    }
    
    public boolean remove(int id){
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call deleteProduct(?)}");
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
    
    public int add(Atomic atomic){
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call insertProduct(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");  //13 params
            cs.setString(1, atomic.name);
            cs.setInt(2, atomic.location);
            cs.setDouble(3, atomic.price);
            cs.setString(4, atomic.status);
            cs.setDouble(5, atomic.area);
            cs.setInt(6, atomic.creator);
            cs.setString(7, atomic.description);
            cs.setInt(8, atomic.parentId);
            cs.setString(9, atomic.type);
            cs.setString(10, atomic.thumbnail);
            cs.setInt(11, atomic.numOfFloor);
            cs.setInt(12, atomic.floorNumber);
            cs.setInt(13, atomic.roomEachFloor);
            //cs.setInt(14, 0);
            cs.registerOutParameter(14, Types.INTEGER);
            boolean res = (cs.executeUpdate()) > 0 ? true : false;
            int id = res == true ? cs.getInt(14) : 0;
            return id;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
    }
    
    public boolean update(Atomic atomic){
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call updateProduct(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");  //13 params
            cs.setInt(1, atomic.id);
            cs.setString(2, atomic.name);
            cs.setInt(3, atomic.location);
            cs.setDouble(4, atomic.price);
            cs.setString(5, atomic.status);
            cs.setDouble(6, atomic.area);
            cs.setInt(7, atomic.creator);
            cs.setString(8, atomic.description);
            cs.setInt(9, atomic.parentId);
            cs.setString(10, atomic.type);
            cs.setString(11, atomic.thumbnail);
            cs.setInt(12, atomic.numOfFloor);
            cs.setInt(13, atomic.floorNumber);
            cs.setInt(14, atomic.roomEachFloor);
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
