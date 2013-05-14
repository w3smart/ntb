/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.util.List;
import entity.Employee;
import java.util.ArrayList;
import models.EmployeeDA;
/**
 *
 * @author Hoanvd
 */
public class EmployeeBean {
    private List<Employee> list;

    public EmployeeBean() {
    }

    public List<Employee> getList() {
        return new EmployeeDA().getEmployees();
    }

    public void setList(List<Employee> list) {
        this.list = list;
    }
    
    
}
