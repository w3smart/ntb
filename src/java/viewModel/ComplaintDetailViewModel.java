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
public class ComplaintDetailViewModel extends ComplaintViewModel{
    private String detailOfProblem;
    private String imgSrc;
    private String severity;
    private String remoteSupport;
    private String note;
    private Date solvedDate;
    private String rate;

    public String getDetailOfProblem() {
        return detailOfProblem;
    }

    public void setDetailOfProblem(String detailOfProblem) {
        this.detailOfProblem = detailOfProblem;
    }

    public String getImgSrc() {
        return imgSrc;
    }

    public void setImgSrc(String imgSrc) {
        this.imgSrc = imgSrc;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getRate() {
        return rate;
    }

    public void setRate(String rate) {
        this.rate = rate;
    }

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

    public Date getSolvedDate() {
        return solvedDate;
    }

    public void setSolvedDate(Date solvedDate) {
        this.solvedDate = solvedDate;
    }

}
