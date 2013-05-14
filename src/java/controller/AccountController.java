/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.AccountDA;

/**
 *
 * @author Hoanvd
 */
public class AccountController {

    protected void validateUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String url = request.getParameter("url");
            Account account = new AccountDA().getAccount(username, password);

            if (account != null) {
                HttpSession session = request.getSession();
                session.setAttribute("account", account);
                String target = (url == null) ? "index.jsp" : url;
                response.sendRedirect(target);
            } else {
                String param = (url == null) ? null : url;
                request.setAttribute("url", param);
                request.setAttribute("res", "Login failed!!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } finally {
            out.close();
        }
    }

    protected void logoutUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("account");
        response.sendRedirect("index.jsp");
    }
}
