/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tool;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author tannt
 */
public class Tools {
    private static final String USER = "sa";
    private static final String PASSWORD = "123456";
    private static final String CONNECTSTRING = "jdbc:sqlserver://localhost\\HO_TANNT\\SQL2008:1444;databaseName=NTB";
    public static final SimpleDateFormat STANDARD_YYYYMMDD = new SimpleDateFormat("yyyy-MM-dd");
    public static final SimpleDateFormat STANDARD_MMDDYYYY = new SimpleDateFormat("MM-dd-yyyy");
    
    public static Date getDate(SimpleDateFormat dateFormat, String date) {
        try {
            return dateFormat.parse(date);
        } catch (ParseException ex) {
            Logger.getLogger(Tools.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public static Connection getConnection() {
        Connection cnn = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            cnn = DriverManager.getConnection(CONNECTSTRING, USER, PASSWORD);
            return cnn;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Tools.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Tools.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cnn;
    }

    

    public static void closeAllConnection(Connection cnn,ResultSet rs, CallableStatement cs) {
        try {
            if(cnn != null)
                cnn.close();
            if (rs != null) 
                rs.close();
             if(cs != null)
                cs.close();
        } catch (SQLException ex) {
            Logger.getLogger(Tools.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
