package controller;

import entity.Atomic;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.AtomicDA;

/**
 *
 * @author fpoly
 */
public class AtomicController {

    protected void createAtomic(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        try {

            // The parameter to redirect
            String control = request.getParameter("control");
            String page = request.getParameter("page");
            String land_id = request.getParameter("land_id");
            String room_id = request.getParameter("room_id");
            String building_id = request.getParameter("building_id");

            int id;

            String name = request.getParameter("inputName");
            int location = Integer.parseInt(request.getParameter("inputLocation"));
            double price = Double.parseDouble(request.getParameter("inputPrice"));
            String status = request.getParameter("inputStatus");
            double area = Double.parseDouble(request.getParameter("inputArea"));

            //int creator = Integer.parseInt(request.getParameter("inputCreator"));
            User c = (User) request.getSession().getAttribute("user");
            int creator = c.getId();

            String description = request.getParameter("inputDescription");
            int parentId = Integer.parseInt(request.getParameter("parentId"));
            String type = request.getParameter("inputType");
            String thumbnail = request.getParameter("inputThumbnail");
            int numOfFloor = Integer.parseInt(request.getParameter("inputNumOfFloor"));
            int floorNumber = Integer.parseInt(request.getParameter("inputFloorNumber"));
            int roomEachFloor = Integer.parseInt(request.getParameter("inputRoomEachFloor"));

            Atomic atomic = new Atomic();
            atomic.setName(name);
            atomic.setLocation(location);
            atomic.setPrice(price);
            atomic.setStatus(status);
            atomic.setArea(area);
            atomic.setCreator(creator);
            atomic.setDescription(description);
            atomic.setParentId(parentId);
            atomic.setType(type);
            atomic.setThumbnail(thumbnail);
            atomic.setNumOfFloor(numOfFloor);
            atomic.setFloorNumber(floorNumber);
            atomic.setRoomEachFloor(roomEachFloor);

            boolean res;

            if (control.equalsIgnoreCase("addLand")) {
                id = new AtomicDA().add(atomic);
                if (id > 0) {
                    response.sendRedirect("admin/land.jsp?action=edit&id=" + id + "&status=add-success");
                } else {
                    response.sendRedirect("admin/lands.jsp&status=add-error");
                }
            }

            if (control.equalsIgnoreCase("addBuilding")) {
                id = new AtomicDA().add(atomic);
                if (id > 0) {
                    response.sendRedirect("admin/building.jsp?action=edit&id=" + id + "&land_id=" + land_id + "&status=add-success");
                } else {
                    response.sendRedirect("admin/building.jsp&status=add-error");
                }
            }

            if (control.equalsIgnoreCase("addRoom")) {
                id = new AtomicDA().add(atomic);
                if (id > 0) {
                    response.sendRedirect("admin/room.jsp?action=edit&id=" + id + "&land_id=" + land_id + "&building_id=" + building_id + "&status=add-success");
                } else {
                    response.sendRedirect("admin/room.jsp&status=add-error");
                }
            }

            if (control.equalsIgnoreCase("editLand")) {
                id = Integer.parseInt(request.getParameter("inputId"));
                atomic.setId(id);
                res = new AtomicDA().update(atomic);
                if (res == true) {
                    response.sendRedirect("admin/land.jsp?action=edit&id=" + id + "&status=edit-success");
                } else {
                    response.sendRedirect("admin/land.jsp?action=edit&id=" + id + "&status=edit-error");
                }
            }

            if (control.equalsIgnoreCase("editBuilding")) {
                id = Integer.parseInt(request.getParameter("inputId"));
                atomic.setId(id);
                res = new AtomicDA().update(atomic);
                if (res == true) {
                    response.sendRedirect("admin/building.jsp?action=edit&id=" + id + "&land_id=" + land_id + "&status=edit-success");
                } else {
                    response.sendRedirect("admin/building.jsp?action=edit&id=" + id + "&land_id=" + land_id + "&status=edit-error");
                }
            }

            if (control.equalsIgnoreCase("editRoom")) {
                id = Integer.parseInt(request.getParameter("inputId"));
                atomic.setId(id);
                res = new AtomicDA().update(atomic);
                if (res == true) {
                    response.sendRedirect("admin/room.jsp?action=edit&id=" + id + "&land_id=" + land_id + "&building_id=" + building_id + "&status=edit-success");
                } else {
                    response.sendRedirect("admin/room.jsp?action=edit&id=" + id + "&land_id=" + land_id + "&building_id=" + building_id + "&status=edit-error");
                }
            }

        } finally {
            out.close();
        }
    }

    protected void deleteAtomic(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String land_id = request.getParameter("land_id");
            String building_id = request.getParameter("building_id");
            String object = request.getParameter("object");

            boolean res = new AtomicDA().remove(id);

            if (object.equals("land")) {
                if (res == true) {
                    response.sendRedirect("admin/lands.jsp?status=delete-success");
                } else {
                    response.sendRedirect("admin/lands.jsp?status=delete-error");
                }
            }

            if (object.equals("building")) {
                if (res == true) {
                    response.sendRedirect("admin/land.jsp?action=edit&id=" + land_id + "&status=delete-success");
                } else {
                    response.sendRedirect("admin/land.jsp?action=edit&id=" + land_id + "&status=delete-error");
                }
            }

            if (object.equals("room")) {
                if (res == true) {
                    response.sendRedirect("admin/building.jsp?action=edit&land_id="+land_id+"&id=" + building_id + "&status=delete-success");
                } else {
                    response.sendRedirect("admin/building.jsp?action=edit&land_id="+land_id+"&id=" + building_id + "&status=delete-error");
                }
            }
            
        } finally {
            out.close();
        }
    }
}
