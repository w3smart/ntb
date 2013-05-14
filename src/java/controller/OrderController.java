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
import javax.servlet.http.HttpSession;
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
            
//            String username = request.getParameter("username");
//            String password = request.getParameter("password");
//            String url = request.getParameter("url");
//            Account account = new AccountDA().getAccount(username, password);
//
//            if (account != null) {
//                HttpSession session = request.getSession();
//                session.setAttribute("account", account);
//                String target = (url == null) ? "index.jsp" : url;
//                response.sendRedirect(target);
//            } else {
//                String param = (url == null) ? null : url;
//                request.setAttribute("url", param);
//                request.setAttribute("res", "Login failed!!");
//                request.getRequestDispatcher("login.jsp").forward(request, response);
//            }
        } finally {
            out.close();
        }
    }

    
}
