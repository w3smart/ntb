/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.util.List;
import models.ViewModelDA;
import viewModel.ComplaintDetailViewModel;
import viewModel.ComplaintViewModel;

/**
 *
 * @author Hoanvd
 */
public class ViewModelBean {

    private List<ComplaintViewModel> listComplaintViewModel;
    private ComplaintDetailViewModel complaintDetail;
    private int contentId;

    public ComplaintDetailViewModel getComplaintDetail() {
        return new ViewModelDA().getComplaintDetail(contentId);
    }

    public void setComplaintDetail(ComplaintDetailViewModel complaintDetail) {
        this.complaintDetail = complaintDetail;
    }

    public int getContentId() {
        return contentId;
    }

    public void setContentId(int contentId) {
        this.contentId = contentId;
    }

    public ViewModelBean() {
    }

    public List<ComplaintViewModel> getListComplaintViewModel() {
        return new ViewModelDA().getComplaintModel();
    }

    public void setListComplaintViewModel(List<ComplaintViewModel> listComplaintViewModel) {
        this.listComplaintViewModel = listComplaintViewModel;
    }
}
