package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author tannt
 */
@WebServlet(name = "Controller", urlPatterns = {"/con"})
public class Controller extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
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

            String action = request.getParameter("control");
            
            // Create new order
            if ("Order".equals(action)) {
                new OrderController().createOrder(request, response);
                return;
            }
            
            if ("updateOrder".equals(action)) {
                new OrderController().updateOrder(request, response);
                return;
            }
            
            
            if ("addLand".equals(action) || "editLand".equals(action) 
                || "addRoom".equals(action) || "editRoom".equals(action) 
                || "addBuilding".equals(action) || "editBuilding".equals(action)) {
                new AtomicController().createAtomic(request, response);
                return;
            }
            
            if ("deleteAtomic".equals(action)) {
                new AtomicController().deleteAtomic(request, response);
                return;
            }
            
            if ("deleteUser".equals(action)) {
                new UserController().deleteUser(request, response);
                return;
            }
            
            if ("addLocation".equals(action) || "editLocation".equals(action)) {
                new LocationController().createLocation(request, response);
                return;
            }
            
            if("deleteLocation".equals(action)){
                new LocationController().deleteLocation(request, response);
                return;
            }
            
            if("deleteOrder".equals(action)){
                new LocationController().deleteLocation(request, response);
                return;
            }
            
            if("addUser".equals(action) || "editUser".equals(action)){
                new UserController().createUser(request, response);
                return;
            }
            
            if("login".equals(action)){
                new UserController().login(request, response);
                return;
            }
            
            if("logOut".equals(action)){
                new UserController().logout(request, response);
                return;
            }
            
            if("register".equals(action)){
                new UserController().register(request, response);
                return;
            }

            if ("viewComplaint".equals(action)) {
                String paramContentId = request.getParameter("compId");
                int contentId = Integer.parseInt(paramContentId);
                request.setAttribute("contentId", contentId);
                request.getRequestDispatcher(response.encodeRedirectURL("complaintDetail.jsp")).forward(request, response);
            }


            //Complaint Detail
            if ("updateComplaintDetail".equals(action)) {
                out.println("updateComplaintDetail");
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
          
        } finally {
            out.close();
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
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
     * Handles the HTTP
     * <code>POST</code> method.
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
