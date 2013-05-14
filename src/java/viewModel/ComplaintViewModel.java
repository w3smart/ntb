/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package viewModel;

import java.util.Date;

/**
 *
 * @author Hoanvd
 */
public class ComplaintViewModel {
    private int contentId;
    private String status;
    private String title;
    private String submitedBy;
    private String department;
    private Date submitedDate;
    private String category;
    private String technician;
    private String priority;

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }
    
    public ComplaintViewModel(int contentId, String status, String title, String submitedBy, String department, Date submitedDate, String category, String technician) {
        this.contentId = contentId;
        this.status = status;
        this.title = title;
        this.submitedBy = submitedBy;
        this.department = department;
        this.submitedDate = submitedDate;
        this.category = category;
        this.technician = technician;
    }

    public ComplaintViewModel() {
    }

    
    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getContentId() {
        return contentId;
    }

    public void setContentId(int contentId) {
        this.contentId = contentId;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getSubmitedBy() {
        return submitedBy;
    }

    public void setSubmitedBy(String submitedBy) {
        this.submitedBy = submitedBy;
    }

    public Date getSubmitedDate() {
        return submitedDate;
    }

    public void setSubmitedDate(Date submitedDate) {
        this.submitedDate = submitedDate;
    }

    public String getTechnician() {
        return technician;
    }

    public void setTechnician(String technician) {
        this.technician = technician;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    
}
