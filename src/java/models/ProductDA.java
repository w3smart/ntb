/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import entity.Products;
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
public class ProductDA {

    private ResultSet rs;
    private Connection cnn;
    private CallableStatement cs;

    public List<Products> getProducts() {
        List<Products> lp = new ArrayList<Products>();
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call sp_getProduct}");
            rs = cs.executeQuery();
            while (rs.next()) {
                Products p = new Products();

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

                lp.add(p);
            }
            return lp;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
    }

    public List<Products> getProducts(String type, String status) {
        List<Products> lp = new ArrayList<Products>();
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call sp_getProduct(?, ?)}");
            cs.setString(1, status);
            cs.setString(2, type);
            rs = cs.executeQuery();
            while (rs.next()) {
                Products p = new Products();

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

                lp.add(p);
            }
            return lp;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
    }
    
    public List<Products> getProducts(String type, String status, String location) {
        List<Products> lp = new ArrayList<Products>();
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call AdvancedGetProducts(?,?,?,?)}");
            cs.setInt(1, 0);
            cs.setString(2, location);
            cs.setString(3, status);
            cs.setString(4, type);
            
            rs = cs.executeQuery();
            while (rs.next()) {
                Products p = new Products();

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

                lp.add(p);
            }
            return lp;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
    }

    public Products getProductById(int id) {
        Products p = new Products();
        try {
            Connection cnn = Tools.getConnection();
            CallableStatement cs = cnn.prepareCall("{call sp_getProduct(?)}");
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
            }
            return p;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
    }

    public boolean delete(int id) {

        return true;
    }
}
