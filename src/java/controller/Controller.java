/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Diary;
import entity.Technician;
import imp.PrinterData;
import java.beans.Encoder;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.DiaryDA;
import models.TechnicianDA;
import models.ViewModelDA;
import org.apache.jasper.tagplugins.jstl.core.Redirect;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.json.JSONArray;
import org.json.JSONObject;
import viewModel.ComplaintDetailViewModel;

/**
 *
 * @author Hoanvd
 */
@WebServlet(name = "Controller", urlPatterns = {"/con"})
public class Controller extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * 
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            boolean isMultiPart = ServletFileUpload.isMultipartContent(request);
            if (isMultiPart) {
                new ComplaintController().addComplaint(request, response);
                return;
            } else {
                String action = request.getParameter("action");
                // login
                if ("Order".equals(action)) {
                    new OrderController().createOrder(request, response);
                    return;
                }
                
                if ("logoutSubmit".equals(action)) {
                    new AccountController().logoutUser(request, response);
                    return;
                }
                
                if ("loginSubmit".equals(action)) {
                    AccountController accCon = new AccountController();
                    accCon.validateUser(request, response);
                    return;
                }
                if ("logoutSubmit".equals(action)) {
                    new AccountController().logoutUser(request, response);
                    return;
                }
                // eng login

                if ("isUser".equals(action)) {
                    EmployeeController empCon = new EmployeeController();
                    empCon.isUser(request, response);

                    return;
                }
                if ("ajaxAddEmployee".equals(action)) {
                    EmployeeController empCon = new EmployeeController();
                    empCon.insertEmployee(request, response);
                    return;
                }
                if ("getDepartmentList".equals(action)) {
                    out.print(new PrinterData().getDllTechnician());
                }




                if ("userList".equals(action)) {
                    String content = new PrinterData().put();
                    out.print(content);
                    return;
                }
                //COMPLAINT 
                if ("viewComplaint".equals(action)) {
                    String paramContentId = request.getParameter("compId");
                    int contentId = Integer.parseInt(paramContentId);
                    request.setAttribute("contentId", contentId);
                    request.getRequestDispatcher(response.encodeRedirectURL("complaintDetail.jsp")).forward(request, response);
                }

                if ("ajaxViewComplaintBy".equals(action)) {
                    new DiaryController().ajaxViewComplaintByStatus(request, response);
                    return;
                }
                //END COMPLAINT

                if ("ajaxGetPriority".equals(action)) {
                    int contentId = Integer.parseInt(request.getParameter("contentId"));
                    Diary diary = new DiaryDA().getDiary(contentId);
                    if (diary == null) {
                        return;
                    } else {
                        JSONObject o = new JSONObject();
                        o.put("priority", diary.getPriority());
                        o.put("technician", diary.getPersonId());
                        out.print(o.toString());
                        return;
                    }
                }

                //Complaint Detail
                if ("updateComplaintDetail".equals(action)) {
                    out.println("updateComplaintDetail");
                    return;
                }
                if ("solvedComplaint".equals(action)) {
                    String paramContentId = request.getParameter("hdContentId");
                    int contentId = Integer.parseInt(paramContentId);
                    ComplaintDetailViewModel compDt = new ViewModelDA().getComplaintDetail(contentId);
                    request.setAttribute("compDt", compDt);
                    request.getRequestDispatcher("solveComplaint.jsp").forward(request, response);
                    return;
                }

                if ("solvedComplaintRd".equals(action)) {
                    request.setAttribute("errorType", "diaryBlock");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                    return;
                }

                //End Complaint Detail
                if ("approve".equals(action)) {
                    int contentId = Integer.parseInt(request.getParameter("hdContentId"));
                    out.println(contentId);
                    request.setAttribute("contentId", contentId);
                    request.getRequestDispatcher("approveComp.jsp").forward(request, response);
                }

                if ("updateDiary".equals(action)) {
                    new DiaryController().updateDiary(request, response);
                }

                if ("insetDiary".equals(action)) {
                    new DiaryController().insertDiary(request, response);
                }
            }
        } finally {
            out.close();
        }
    }

    protected void fillDropDownListTechnician(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            List<Technician> list = new TechnicianDA().getTechnicians();
            JSONArray jsArray = new JSONArray();
            int key = 222;

            for (Technician tech : list) {
                JSONObject oj = new JSONObject();
                oj.put(String.valueOf(tech.getPersonId()), tech.getUserName());
                jsArray.put(oj);
            }
            JSONObject jsList = new JSONObject();
            jsList.put("list", jsArray.toString());
            out.print(jsList);
        } finally {
            out.close();
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
