/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import entity.Category;
import entity.Department;
import entity.Diary;
import entity.Technician;
import java.util.ArrayList;
import java.util.List;
import models.CategoryDA;
import models.DepartmentDA;
import models.DiaryDA;
import models.TechnicianDA;

/**
 *
 * @author Hoanvd
 */
public class ComponentBean {

    private Department department;
    private int departmentId;
    private List<Category> listCategory;
    private List<Department> listDepartment;
    private List<Technician> listTechnician;
    private Diary diary;
    private int contentId;

    public Department getDepartment() {
        return new DepartmentDA().getDepartment(departmentId);
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }

    public int getContentId() {
        return contentId;
    }

    public void setContentId(int contentId) {
        this.contentId = contentId;
    }

    public Diary getDiary() {
        return new DiaryDA().getDiary(contentId);
    }

    public void setDiary(Diary diary) {
        this.diary = diary;
    }

    public List<Technician> getListTechnician() {
        return new TechnicianDA().getTechnicians();
    }

    public void setListTechnician(List<Technician> listTechnician) {
        this.listTechnician = listTechnician;
    }

    public ComponentBean() {
    }

    public List<Category> getListCategory() {
        return new CategoryDA().getCagetories();
    }

    public void setListCategory(List<Category> listCategory) {
        this.listCategory = listCategory;
    }

    public List<Department> getListDepartment() {
        return new DepartmentDA().getDepartments();
    }

    public void setListDepartment(List<Department> listDepartment) {
        this.listDepartment = listDepartment;
    }
}
