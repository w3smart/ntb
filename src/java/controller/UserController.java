/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.UserDA;

/**
 *
 * @author fpoly
 */
public class UserController {

    protected void createUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        try {

            String control = request.getParameter("control");

            int id;

            String username = request.getParameter("inputUserName");
            String password = request.getParameter("inputUserPassword");
            String role = request.getParameter("inputRole");
            String email = request.getParameter("inputEmail");
            String address = request.getParameter("inputAddress");
            String phone = request.getParameter("inputPhone");
            
           
            User u = new User(username, password, role, email, null, null, address, phone);

            boolean res;

            if (control.equalsIgnoreCase("addUser")) {
                id = new UserDA().add(u);
                if (id > 0) {
                    response.sendRedirect("admin/user.jsp?action=edit&id=" + id + "&status=add-success");
                } else {
                    response.sendRedirect("admin/user.jsp&status=add-error");
                }
            }

            if (control.equalsIgnoreCase("editUser")) {
                id = Integer.parseInt(request.getParameter("inputId"));
                password = (password.equalsIgnoreCase("password")) ? u.password : password;
                u.setId(id);
                u.setPassword(password);
                res = new UserDA().update(u);
                if (res == true) {
                    response.sendRedirect("admin/user.jsp?action=edit&id=" + id + "&status=edit-success");
                } else {
                    response.sendRedirect("admin/user.jsp?action=edit&id=" + id + "&status=edit-error");
                }
            }

        } finally {
            out.close();
        }
    }

    protected void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            boolean res = new UserDA().remove(id);

            if (res == true) {
                response.sendRedirect("admin/users.jsp?status=delete-success");

            } else {
                response.sendRedirect("admin/users.jsp?status=delete-error");
            }

        } finally {
            out.close();
        }
    }

    protected void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            String username = request.getParameter("inputUsername");
            String password = request.getParameter("inputPassword");
            //String url = request.getParameter("url");
            User u = new UserDA().get(username, password);

            if (u != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", u);

                if (u.role.equals("admin") || u.role.equals("manager")) {
                    response.sendRedirect("admin/statistics.jsp");
                } else {
                    response.sendRedirect("index.jsp");
                }
            } else {
                response.sendRedirect("admin/index.jsp?status=error");
            }

        } finally {
            out.close();
        }
    }

    protected void register(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        try {
            int id;

            String username = request.getParameter("inputUserName");
            String password = request.getParameter("inputUserPassword");
            String role = "customer";
            String email = request.getParameter("inputEmail");
            String address = request.getParameter("inputAddress");
            String phone = request.getParameter("inputPhone");

            User u = new User(username, password, role, email, null, null, address, phone);
            boolean res;

            id = new UserDA().add(u);
            if (id > 0) {
                response.sendRedirect("404.jsp?status=register-success");
            } else {
                response.sendRedirect("register.jsp&status=register-error");
            }

        } finally {
            out.close();
        }
    }

    protected void print(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            out.println("Error!");

        } finally {
            out.close();
        }
    }
}
