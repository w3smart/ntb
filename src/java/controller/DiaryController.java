/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.AbstractDocument.Content;
import models.DiaryDA;
import models.ViewModelDA;
import viewModel.ComplaintViewModel;

/**
/**
 *
 * @author Hoanvd
 */
public class DiaryController {

    protected void insertDiary(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int contentId = Integer.parseInt(request.getParameter("hdContentId"));
            int technicianId = Integer.parseInt(request.getParameter("technician"));
            String priority = request.getParameter("priority");
            boolean res = new DiaryDA().setTech(contentId, technicianId, priority);
            if (res) {
                request.setAttribute("contentId", contentId);
                request.getRequestDispatcher("complaintDetail.jsp").forward(request, response);
                return;
            } else {

                return;
            }
        } catch (Exception e) {
        }
    }

    protected void updateDiary(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String rate = request.getParameter("rate");
            String status = request.getParameter("status");
            String solvedDate = request.getParameter("dateSolved");
            String note = request.getParameter("txtContent");
            int contentId = Integer.parseInt(request.getParameter("hdContentId"));
            boolean res = new DiaryDA().editDiary(contentId, status, note, solvedDate, rate);
            if (res) {
                request.setAttribute("contentId", contentId);
                request.getRequestDispatcher("complaintDetail.jsp").forward(request, response);
                return;
            } else {
                return;
            }
        } catch (Exception e) {
        }
    }

    protected void ajaxViewComplaintByStatus(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();
            String sortedKey = request.getParameter("sortedKey");
            String ss = request.getParameter("searchKey");
            String searchKey = request.getParameter("searchKey") != null ? request.getParameter("searchKey") : "";
           // out.println(searchKey);
            if ("ALL".equals(sortedKey)) {
                 List<ComplaintViewModel> cmv = new ViewModelDA().getComplaintModel("ALL", searchKey);
                String content = this.viewComplaintContent(cmv);
                out.println(content);
                return;
            }
            if ("PENDING".equals(sortedKey)) {
                List<ComplaintViewModel> cmv = new ViewModelDA().getComplaintModel("PENDING", searchKey);
                String content = this.viewComplaintContent(cmv);
                out.println(content);
                return;
            }
            if ("APPROVED".equals(sortedKey)) {
                List<ComplaintViewModel> cmv = new ViewModelDA().getComplaintModel("APPROVED", searchKey);
                String content = this.viewComplaintContent(cmv);
                out.println(content);
                return;
            }
        } catch (Exception e) {
        }
    }

    private String viewComplaintContent(List<ComplaintViewModel> list) {
        StringBuilder sb = new StringBuilder();
        sb.append("<tr>");
        sb.append("<th>Date</th>");
        sb.append("<th>Title</th>");
        sb.append("<th >Submitted</th>");
        sb.append("<th>Status</th>");
        sb.append("<th>Category</th>");
        sb.append("<th>Status</th>");
        sb.append("</tr>");


        for (ComplaintViewModel comp : list) {
            sb.append("<tr>");
            sb.append("<td class='tbl-submitedDate'>").append(comp.getSubmitedDate()).append("</td>");
            sb.append("<td class='tbl-title'><a href='../MantechSite/con?action=viewComplaint&AMP;compId=").append(comp.getContentId()).append("'>").append(comp.getTitle()).append("</a></td>");
            sb.append("<td class='tbl-submitedBy'>").append(comp.getSubmitedBy()).append("</td>");
            if (comp.getStatus() == null) {
                sb.append("<td > --- </td>");
            } else {
                sb.append("<td >Solving</td>");
            }
            sb.append("<td class='tbl-category'>").append(comp.getCategory()).append("</td>");
            if (comp.getTechnician() == null) {
                sb.append("<td class='tbl-status'><span><img src='Images/ico_hourglass.jpg' /> Pending</span></td>");
            } else {
                sb.append("<td class='tbl-status'><span class='approved'>Approved</span></td>");
            }
            sb.append("</tr>");
        }

        try {
            Thread.sleep(1000);
        } catch (Exception e) {
        }
        return sb.toString();
    }
}
