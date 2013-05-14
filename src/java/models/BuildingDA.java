/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import entity.Building;
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
public class BuildingDA{
    
    private ResultSet rs;
    private Connection cnn;
    private CallableStatement cs;
    
    public List<Building> getBuilding(String address, String status, double priceMin, double priceMax, int parentId){
     List<Building> lb = new ArrayList<Building>();
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call AdvancedGetProducts(?,?,?,?,?,?,?)}");
            cs.setInt(1, 0);
            //address = ( address.equalsIgnoreCase("") ) ? null : address;
            //status = ( status.equalsIgnoreCase("") ) ? null : status;
            cs.setString(2, null);
            cs.setString(3, null);
            cs.setString(4, "building");
            cs.setInt(5, 0);
            cs.setInt(6, 0);
            parentId = (parentId==0) ? -1 : parentId;
            cs.setInt(7, parentId);
            
            rs = cs.executeQuery();
            while (rs.next()) {
                Building p = new Building();

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
                p.setType();
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
    
    public Building getBuilding(int id){
        Building p = new Building();
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call AdvancedGetProducts(?,?,?,?,?,?,?)}");
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
                p.setType();
                p.setThumbnail(rs.getString(13));
            }
            return p;
        } catch (Exception e) {
            return null;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
    }
}
