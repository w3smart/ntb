/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import entity.Complaint;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import tool.*;

/**
 *
 * @author Hoanvd
 */
public class ComplaintDA {

    private Connection cnn;
    private ResultSet rs;
    private CallableStatement cs;

    // done
    public int insertComplaint(String title, String content,
            int category, String imgSrc, int personId, String severity, String rmtSupport) {
        try {
            Date submitedDate = new Date();
            cnn = tool.Tools.getConnection();
            cs = cnn.prepareCall("{call sp_InsertContent(?,?,?,?,?,?,?,?,?,?)}");  //9 prams
            cs.setString(1, title);
            cs.setString(2, content);
            cs.setInt(3, category);
            cs.setString(4, imgSrc);
            cs.setDate(5, new java.sql.Date(submitedDate.getTime()));
            cs.setInt(6, personId);
            cs.setString(7, severity);
            cs.setString(8, rmtSupport);
            cs.setString(9, tool.Discriminator.COMPLAINT);
            cs.registerOutParameter(10, Types.INTEGER);
            boolean res = (cs.executeUpdate()) > 0 ? true : false;
            int contentId = res == true ? cs.getInt(10) : 0;
            return contentId;
        } catch (Exception e) {
            return 0;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
    }

    // done
public List<Complaint> getComplaints() {
    List<Complaint> list = new ArrayList<Complaint>();
    try {
        cnn = Tools.getConnection();
        cs = cnn.prepareCall("{call sp_GetContent(?)}");
        cs.setString(1, Discriminator.COMPLAINT);
        rs = cs.executeQuery();
        while (rs.next()) {
            Complaint comp = new Complaint();
            comp.setContentId(rs.getInt(1));
            comp.setTitle(rs.getString(2));
            comp.setContent(rs.getString(3));
            comp.setCategoryId(rs.getInt(4));
            comp.setSubmitedDate(rs.getDate(5));
            comp.setPersonId(rs.getInt(6));
            //comp.setImgSrc(r);
            list.add(comp);
        }
        return list;
    } catch (Exception e) {
    }
    return null;
}

    public List<Complaint> getComplaints(int personId) {
        List<Complaint> list = new ArrayList<Complaint>();
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call sp_GetCompByPersonId(?)}");
            cs.setInt(1, personId);
            rs = cs.executeQuery();
            while (rs.next()) {
                Complaint comp = new Complaint();
                comp.setContentId(rs.getInt(1));
                comp.setTitle(rs.getString(2));
                comp.setContent(rs.getString(3));
                comp.setImgSrc(rs.getString(4));
                comp.setCategoryId(rs.getInt(5));
                comp.setSubmitedDate(rs.getDate(6));
                comp.setPersonId(rs.getInt(7));
                comp.setSeverity(rs.getString(8));
                comp.setRemoteSupport(rs.getString(9));
                list.add(comp);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }
}
