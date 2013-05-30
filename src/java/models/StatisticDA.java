package models;

import entity.Statistic;
import entity.User;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import tool.Tools;

/**
 *
 * @author tannt
 */
public class StatisticDA {
    
    private ResultSet rs;
    private Connection cnn;
    private CallableStatement cs;
    
    public List<Statistic> getStatisticProductStatus(String fromDate, String toDate){
        List<Statistic> ls = new ArrayList<Statistic>();
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call getStatisticProductStatus(?,?)}");
            fromDate = ( fromDate.equalsIgnoreCase("") ) ? null : fromDate;
            toDate = ( toDate.equalsIgnoreCase("") ) ? null : toDate;
            
            cs.setString(1, fromDate);
            cs.setString(2, toDate);
            
            rs = cs.executeQuery();
            while (rs.next()) {
                ls.add(new Statistic(rs.getString(1), rs.getString(2)));
            }
            return ls;
        } catch (Exception e) {
            return null;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
    }
    
   public List<Statistic> getStatisticProductType(String fromDate, String toDate){
        List<Statistic> ls = new ArrayList<Statistic>();
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call getStatisticProductType(?,?)}");
            fromDate = ( fromDate.equalsIgnoreCase("") ) ? null : fromDate;
            toDate = ( toDate.equalsIgnoreCase("") ) ? null : toDate;
            
            cs.setString(1, fromDate);
            cs.setString(2, toDate);
            
            rs = cs.executeQuery();
            while (rs.next()) {
                ls.add(new Statistic(rs.getString(1), rs.getString(2)));
            }
            return ls;
        } catch (Exception e) {
            return null;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
    }
   
   public List<Statistic> getStatisticOrderStatus(String fromDate, String toDate){
        List<Statistic> ls = new ArrayList<Statistic>();
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call getStatisticOrderStatus(?,?)}");
            fromDate = ( fromDate.equalsIgnoreCase("") ) ? null : fromDate;
            toDate = ( toDate.equalsIgnoreCase("") ) ? null : toDate;
            
            cs.setString(1, fromDate);
            cs.setString(2, toDate);
            
            rs = cs.executeQuery();
            while (rs.next()) {
                ls.add(new Statistic(rs.getString(1), rs.getString(2)));
            }
            return ls;
        } catch (Exception e) {
            return null;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
    }
   
      public Statistic getTotalMoney(String fromDate, String toDate){
        List<Statistic> ls = new ArrayList<Statistic>();
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call getTotalMoney(?,?)}");
            fromDate = ( fromDate.equalsIgnoreCase("") ) ? null : fromDate;
            toDate = ( toDate.equalsIgnoreCase("") ) ? null : toDate;
            
            cs.setString(1, fromDate);
            cs.setString(2, toDate);
            
            rs = cs.executeQuery();
            while (rs.next()) {
                ls.add(new Statistic(rs.getString(1), rs.getString(2)));
            }
            return ls.get(0);
        } catch (Exception e) {
            return null;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
    }
      
       public Statistic getTotalCustomer(String fromDate, String toDate){
        List<Statistic> ls = new ArrayList<Statistic>();
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call getTotalCustomer(?,?)}");
            fromDate = ( fromDate.equalsIgnoreCase("") ) ? null : fromDate;
            toDate = ( toDate.equalsIgnoreCase("") ) ? null : toDate;
            
            cs.setString(1, fromDate);
            cs.setString(2, toDate);
            
            rs = cs.executeQuery();
            while (rs.next()) {
                ls.add(new Statistic(rs.getString(1), rs.getString(2)));
            }
            return ls.get(0);
        } catch (Exception e) {
            return null;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
    }
}