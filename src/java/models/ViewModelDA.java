/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import viewModel.ComplaintViewModel;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import tool.*;
import viewModel.ComplaintDetailViewModel;

/**
 *
 * @author Hoanvd
 */
public class ViewModelDA {

    private Connection cnn;
    private ResultSet rs;
    private CallableStatement cs;

    public List<ComplaintViewModel> getComplaintModel() {
        List<ComplaintViewModel> list = new ArrayList<ComplaintViewModel>();
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call sp_ViewComplaint}");
            rs = cs.executeQuery();
            while (rs.next()) {
                ComplaintViewModel comp = new ComplaintViewModel();
                comp.setContentId(rs.getInt(1));
                comp.setStatus(rs.getString(2));
                comp.setTitle(rs.getString(3));
                comp.setSubmitedBy(rs.getString(4));
                comp.setDepartment(rs.getString(5));
                comp.setSubmitedDate(rs.getDate(6));
                comp.setCategory(rs.getString(7));
                comp.setTechnician(rs.getString(8));
                comp.setPriority(rs.getString(9));
                list.add(comp);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

   

    public List<ComplaintViewModel> getComplaintModel(String sortedKey, String searchKey) {
        List<ComplaintViewModel> list = new ArrayList<ComplaintViewModel>();
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call sp_ViewComplaintByStatus(?,?)}");
            cs.setString(1, sortedKey);
            cs.setString(2, searchKey);
            rs = cs.executeQuery();
            while (rs.next()) {
                ComplaintViewModel comp = new ComplaintViewModel();
                comp.setContentId(rs.getInt(1));
                comp.setStatus(rs.getString(2));
                comp.setTitle(rs.getString(3));
                comp.setSubmitedBy(rs.getString(4));
                comp.setDepartment(rs.getString(5));
                comp.setSubmitedDate(rs.getDate(6));
                comp.setCategory(rs.getString(7));
                comp.setTechnician(rs.getString(8));
                comp.setPriority(rs.getString(9));
                list.add(comp);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public ComplaintDetailViewModel getComplaintDetail(int contentId) {
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call sp_ViewComplaintDetail(?)}");
            cs.setInt(1, contentId);
            rs = cs.executeQuery();
            while (rs.next()) {
                ComplaintDetailViewModel compDt = new ComplaintDetailViewModel();
                compDt.setContentId(rs.getInt(1));
                compDt.setStatus(rs.getString(2));
                compDt.setTitle(rs.getString(3));
                compDt.setDetailOfProblem(rs.getString(4));
                compDt.setImgSrc(rs.getString(5));
                compDt.setSubmitedBy(rs.getString(6));
                compDt.setDepartment(rs.getString(7));
                compDt.setSubmitedDate(rs.getDate(8));//
                compDt.setSeverity(rs.getString(9));
                compDt.setRemoteSupport(rs.getString(10));
                compDt.setCategory(rs.getString(11));
                compDt.setTechnician(rs.getString(12));
                compDt.setPriority(rs.getString(13));
                compDt.setNote(rs.getString(14));
                compDt.setSolvedDate(rs.getDate(15));
                compDt.setRate(rs.getString(16));
                return compDt;
            }
            return null;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
}
