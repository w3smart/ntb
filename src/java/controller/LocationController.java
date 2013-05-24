/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Location;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.LocationDA;

/**
 *
 * @author fpoly
 */
public class LocationController {

    protected void createLocation(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            String control = request.getParameter("control");

            String location = request.getParameter("inputLocation");
            Location l = new Location();
            l.setLocation(location);
            boolean res;

            if (control.equalsIgnoreCase("addLocation")) {
                res = new LocationDA().add(l);
                if (res == true) {
                    response.sendRedirect("admin/locations.jsp?status=add-success");
                } else {
                    response.sendRedirect("admin/locations.jsp?status=add-error");
                }
            }
            
            if (control.equalsIgnoreCase("editLocation")) {
                l.setId(Integer.parseInt(request.getParameter("inputId")));
                res = new LocationDA().update(l);
                if (res == true) {
                    response.sendRedirect("admin/locations.jsp?status=edit-success");
                } else {
                    response.sendRedirect("admin/locations.jsp?status=edit-error");
                }
            }

        } finally {
            out.close();
        }
    }
    
    protected void deleteLocation(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            boolean res = new LocationDA().remove(id);

            if (res == true) {
                response.sendRedirect("admin/locations.jsp?status=delete-success");

            } else {
                response.sendRedirect("admin/locations.jsp?status=delete-error");
            }
            
        } finally {
            out.close();
        }
    }
}
