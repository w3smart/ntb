/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Date;

/**
 *
 * @author Hoanvd
 */
public class Diary {

    private int diaryId;
    private int contentId;
    private String status;
    private int personId; // person responsible
    private String note;
    private Date solvedDate;
    private String priority;
    private String rate;
    private boolean isActive;

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }
    
    public int getContentId() {
        return contentId;
    }

    public void setContentId(int contentId) {
        this.contentId = contentId;
    }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }

    public int getDiaryId() {
        return diaryId;
    }

    public void setDiaryId(int diaryId) {
        this.diaryId = diaryId;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getPersonId() {
        return personId;
    }

    public void setPersonId(int personId) {
        this.personId = personId;
    }

    public String getRate() {
        return rate;
    }

    public void setRate(String rate) {
        this.rate = rate;
    }

    public Date getSolvedDate() {
        return solvedDate;
    }

    public void setSolvedDate(Date solvedDate) {
        this.solvedDate = solvedDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Diary() {
    }

    public Diary(int diaryId, String status, String note, Date solvedDate, String rate, int personId) {
        this.diaryId = diaryId;
        this.status = status;
        this.note = note;
        this.solvedDate = solvedDate;
        this.rate = rate;
        this.personId = personId;
    }
}
