/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Account;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.ArticleDA;
import models.ComplaintDA;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Hoanvd
 */
public class ComplaintController {

    protected void addComplaint(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List items = null;
        try {
            items = upload.parseRequest(request);
        } catch (Exception e) {
        }
        Iterator iter = items.iterator();
        Hashtable params = new Hashtable();
        String fileName = null;
        while (iter.hasNext()) {
            FileItem item = (FileItem) iter.next();
            if (item.isFormField()) {
                params.put(item.getFieldName(), item.getString());
            }
        }
        String action = (String) params.get("action");
        if ("addComplaint".equals(action)) {
            String itemName = null;
            Iterator iter2 = items.iterator();
            boolean isUpload = false;
            while (iter2.hasNext()) {
                FileItem item = (FileItem) iter2.next();
                if (!item.isFormField()) {
                    try {
                        itemName = item.getName();
                        String fullPath = request.getServletContext().getRealPath("/"); // co the bi sai cho nay
                        String mainPath = fullPath.substring(0, fullPath.length() - 10);
                        String realPath = mainPath + "web\\Cimages\\" + itemName;
                        File savedFile = new File(realPath);
                        item.write(savedFile);
                        isUpload = true;
                    } catch (Exception ex) {
                        Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
                        isUpload = false;
                        out.println(ex.getMessage());
                    }
                }
            }

            String categoryId = (String) params.get("ddlCategory");

            String title = (String) params.get("subject"); //title
            String content = (String) params.get("dtOfProblem"); //content
            int categoryValue = Integer.parseInt(categoryId); //categoryId
            String imgSrc = isUpload == true ? ("Cimages/" + itemName) : null; //imgSrc
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("account");
            int personId = account.getPersonId();
            String severity = (String) params.get("severity"); //severity
            String rmtSupport = (String) params.get("rmtSupport"); //rmtSupport
            int contentId = new ComplaintDA().insertComplaint(title, content, categoryValue, imgSrc, personId, severity, rmtSupport);
            if (contentId > 0) {
//                out.print("success");
                request.setAttribute("contentId", contentId);
                request.getRequestDispatcher("complaintDetail.jsp").forward(request, response);
            } else {
                out.println("failed");
            }
        }
        if ("addBlog".equals(action)) {
            String itemName = null;
            Iterator iter2 = items.iterator();
            boolean isUpload = false;
            while (iter2.hasNext()) {
                FileItem item = (FileItem) iter2.next();
                if (!item.isFormField()) {
                    try {
                        itemName = item.getName();
                        String fullPath = request.getServletContext().getRealPath("/"); // co the bi sai cho nay
                        String mainPath = fullPath.substring(0, fullPath.length() - 10);
                        String realPath = mainPath + "web\\Cimages\\" + itemName;
                        File savedFile = new File(realPath);
                        item.write(savedFile);
                        isUpload = true;
                    } catch (Exception ex) {
                        Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
                        isUpload = false;
                        out.println(ex.getMessage());
                    }
                }
            }
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("account");
            String title = (String) params.get("title"); //title
            String content = (String) params.get("content"); //content
            String imgSrc = isUpload == true ? ("Cimages/" + itemName) : null; //imgSrc
            int personId = account.getPersonId(); //personId
            int contentId = new ArticleDA().insert(title, content, imgSrc, personId);
            if (contentId > 0) {
                request.setAttribute("contentId", contentId);
                request.getRequestDispatcher("blog.jsp").forward(request, response);
            } else {
            }
        }
    }
}
