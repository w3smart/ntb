/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.ComponentBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.EmployeeDA;
import org.json.JSONObject;
import tool.Tools;

/**
 *
 * @author Hoanvd
 */
public class EmployeeController {

    protected void isUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            String username = request.getParameter("username");
            boolean res = new EmployeeDA().isUserExits(username);
            JSONObject jsonRes = new JSONObject();
            jsonRes.accumulate("res", res);
            out.println(jsonRes.toString());
        } finally {
            out.close();
        }
    }

    protected void insertEmployee(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            String username = request.getParameter("username");
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String birthOfDate = request.getParameter("birthOfDate");
            String address = request.getParameter("address");
            int departmentId = Integer.parseInt(request.getParameter("department"));
            SimpleDateFormat dateSimple = new SimpleDateFormat("MM-dd-yyyy");
            String joinedDate = dateSimple.format(new Date());
            boolean result = new EmployeeDA().insert(username, "123456", fullName, email, birthOfDate, joinedDate, address, departmentId);
            if (result) {
                String content = this.getRow(username, birthOfDate, joinedDate, address, departmentId);
                out.println(content);
                return;
            } else {
            }
//            String res = (result == true) ? "User is added into System" : "Update User failed!";
//            request.setAttribute("res", res);
//            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        } finally {
            out.close();
        }
    }

    private String getRow(String username, String birthOfDate, String joinedDate, String address, int departmentId) {
        StringBuilder sb = new StringBuilder();
        sb.append("<tr>");
        sb.append("<td>").append(username).append("</td>"); //username
        sb.append("<td>").append(birthOfDate).append("</td>"); //brith
        sb.append("<td>").append(joinedDate).append("</td>"); //join
        sb.append("<td>").append(address).append("</td>"); //addre
        ComponentBean compBean = new ComponentBean();
        compBean.setDepartmentId(departmentId);
        sb.append("<td>").append(compBean.getDepartment().getName()).append("</td>"); // dpermant
        sb.append("<td>");
        sb.append("<a href=''><img src='Images/edit.jpg' alt='Edit' /></a>");
        sb.append("<a href=''><img src='Images/cancel.jpg' alt='Delete' /></a>");
        sb.append("<a href=''><img src='Images/folder.png' alt='Detail' /></a>");
        sb.append("</td>");
        sb.append("</tr>");
        sb.trimToSize();
        return sb.toString();
    }
}
