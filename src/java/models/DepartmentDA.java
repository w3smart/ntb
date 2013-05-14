/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import entity.Department;
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
public class DepartmentDA {

    private Connection cnn;
    private ResultSet rs;
    private CallableStatement cs;

    //done
    public List<Department> getDepartments() {
        List<Department> list = new ArrayList<Department>();
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call sp_GetDepartment}");
            rs = cs.executeQuery();
            while (rs.next()) {
                Department dep = new Department();
                dep.setDepartmentId(rs.getInt(1));
                dep.setName(rs.getString(2));
                list.add(dep);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }
    
    public Department getDepartment(int departmentId) {
        Department department = new Department();
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call sp_GetDepartmentName(?)}");
            cs.setInt(1,departmentId);
            rs = cs.executeQuery();
            while (rs.next()) {
                department.setDepartmentId(rs.getInt(1));
                department.setName(rs.getString(2));
            }
            return department;
        } catch (Exception e) {
        }
        return null;
    } 
}
