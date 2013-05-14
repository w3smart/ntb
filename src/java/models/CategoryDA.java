/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import entity.Category;
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
public class CategoryDA {

    private Connection cnn;
    private ResultSet rs;
    private CallableStatement cs;

    public List<Category> getCagetories() {
        List<Category> list = new ArrayList<Category>();
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call sp_GetCategory}");
            rs = cs.executeQuery();
            while (rs.next()) {
                Category ca = new Category();
                ca.setCategoryId(rs.getInt(1));
                ca.setName(rs.getString(2));
                list.add(ca);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }
}
