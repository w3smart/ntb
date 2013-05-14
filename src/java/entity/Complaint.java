/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Hoanvd
 */
public class Complaint extends Contents {

    private int categoryId;
    private String severity;
    private String remoteSupport;

    public String getRemoteSupport() {
        return remoteSupport;
    }

    public void setRemoteSupport(String remoteSupport) {
        this.remoteSupport = remoteSupport;
    }

    public String getSeverity() {
        return severity;
    }

    public void setSeverity(String severity) {
        this.severity = severity;
    }
    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }
}
