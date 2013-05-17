/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

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
            
            int userId = 999;
            int productId = Integer.parseInt(request.getParameter("id"));
            
            boolean res = new OrderDA().insert(userId, productId, "pending");
            if(res==true){
                out.println("Success!");
            }
            else
            {
                out.println("Error!");
            }
            
        } finally {
            out.close();
        }
    }

    
}
