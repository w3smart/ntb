/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import entity.Technician;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import tool.Discriminator;
import tool.Tools;

/**
 *
 * @author Hoanvd
 */
public class TechnicianDA {

    private Connection cnn;
    private ResultSet rs;
    private CallableStatement cs;

    //done
    public boolean insert(String userName, String password,
            String fullName, String email, int age,
            String birthDate, String joinedDate, String address, int departmentId) {
        try {
            cnn = tool.Tools.getConnection();
            cs = cnn.prepareCall("{call sp_InsertPerson(?,?,?,?,?,?,?,?,?,?)}");  //10 prams
            cs.setString(1, userName);
            cs.setString(2, password);
            cs.setString(3, fullName);
            cs.setString(4, email);
            cs.setInt(5, age);
            cs.setDate(6, new java.sql.Date((Tools.getDate(Tools.STANDARD_YYYYMMDD, birthDate)).getTime()));
            cs.setDate(7, new java.sql.Date((Tools.getDate(Tools.STANDARD_YYYYMMDD, joinedDate)).getTime()));
            cs.setString(8, address);
            cs.setNull(9, java.sql.Types.INTEGER);
            cs.setString(10, Discriminator.TECHNICIAN);
            boolean res = (cs.executeUpdate()) > 0 ? true : false;
            return res;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
    }

    public List<Technician> getTechnicians() {
        List<Technician> list = new ArrayList<Technician>();
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call sp_GetPerson(?)}");
            cs.setString(1, Discriminator.TECHNICIAN);
            rs = cs.executeQuery();
            while (rs.next()) {
                Technician tech = new Technician();
                tech.setPersonId(rs.getInt(1));
                tech.setUserName(rs.getString(2));
                tech.setFullName(rs.getString(4));
                list.add(tech);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }
}
