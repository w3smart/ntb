/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import entity.Employee;
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
public class EmployeeDA {

    private Connection cnn;
    private ResultSet rs;
    private CallableStatement cs;

    //done
    public boolean insert(String userName, String password,
            String fullName, String email, String birthDate,
            String joinedDate, String address, int departmentId) {
        try {

            cnn = tool.Tools.getConnection();
            cs = cnn.prepareCall("{call sp_InsertPerson(?,?,?,?,?,?,?,?,?)}");  //10 prams
            cs.setString(1, userName);
            cs.setString(2, password);
            cs.setString(3, fullName);
            cs.setString(4, email);
            cs.setDate(5, new java.sql.Date((Tools.getDate(Tools.STANDARD_MMDDYYYY, birthDate)).getTime()));
            cs.setDate(6, new java.sql.Date((Tools.getDate(Tools.STANDARD_MMDDYYYY, joinedDate)).getTime()));
            cs.setString(7, address);
            cs.setInt(8, departmentId);
            cs.setString(9, Discriminator.EMPLOYEE);
            boolean res = (cs.executeUpdate()) > 0 ? true : false;
            return res;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
    }

    public List<Employee> getEmployees() {
        List<Employee> list = new ArrayList<Employee>();
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call sp_GetPerson(?)}");
            cs.setString(1, Discriminator.EMPLOYEE);
            rs = cs.executeQuery();
            while (rs.next()) {
                Employee emp = new Employee();
                emp.setPersonId(rs.getInt(1));
                emp.setUserName(rs.getString(2));
                emp.setPassword(rs.getString(3));
                emp.setFullName(rs.getString(4));
                emp.setEmail(rs.getString(5));
                emp.setBirthDate(rs.getDate(6));
                emp.setJoinedDate(rs.getDate(7));
                emp.setAddress(rs.getString(8));
                emp.setDepartmentId(rs.getInt(9));
                list.add(emp);
            }
            return list;
        } catch (Exception e) {

            return null;
        }
    }

    public boolean isUserExits(String username) {
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call sp_UserIsExits(?)}");
            cs.setString(1, username);
            rs = cs.executeQuery();
            while (rs.next()) {
                // return rs.getString(1) == null ? true : false;
                return true;
            }
            return false;
        } catch (Exception e) {

            return false;
        }
    }
}
