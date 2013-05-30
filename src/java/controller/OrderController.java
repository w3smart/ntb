/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Order;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.OrderDA;

/**
 *
 * @author fpoly
 */
public class OrderController {

    protected void createOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {

            int userId = 1;
            int productId = Integer.parseInt(request.getParameter("inputProductId"));
            String paymentType = request.getParameter("inputPaymentType");

            boolean res = new OrderDA().insert(userId, productId, "pending", paymentType);
            if (res == true) {
                out.println(paymentType + "Success!");
            } else {
                out.println("Error!");
            }

        } finally {
            out.close();
        }
    }
    
    protected void updateOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {

            int id = Integer.parseInt(request.getParameter("inputId"));
            String status = request.getParameter("inputStatus");
            Order o = new Order();
            o.setId(id);
            o.setStatus(status);
            boolean res = new OrderDA().update(o);
            
            if (res == true) {
                response.sendRedirect("admin/order.jsp?id="+id+"&status=edit-success");
            } else {
                response.sendRedirect("admin/order.jsp?id="+id+"&status=edit-error");
            }

        } finally {
            out.close();
        }
    }
    
    protected void deleteOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            boolean res = new OrderDA().delete(id);

            if (res == true) {
                response.sendRedirect("admin/orders.jsp?status=delete-success");

            } else {
                response.sendRedirect("admin/orders.jsp?status=delete-error");
            }

        } finally {
            out.close();
        }
    }
}
