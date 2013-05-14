/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 *
 * @author Hoanvd
 */
public class MySessionListener implements HttpSessionListener, ServletContextListener {

    ServletContext servletContext;

    @Override
    public void sessionCreated(HttpSessionEvent se) {
       // HttpSession session = se.getSession();
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
//        HttpSession session = se.getSession();
//        session.setAttribute("user_name", null);
//        session.setAttribute("user_type", null);
//        long _start = session.getCreationTime();
//        long _end = session.getLastAccessedTime();
//        String _counter = (String) session.getAttribute("counter");
//         log("DESTROY, Session Duration:" 
//                   + (_end - _start) + "(ms) Counter:" + _counter, se);
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        servletContext = sce.getServletContext();
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
