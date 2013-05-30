package models;

import entity.Order;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import tool.Tools;

/**
 *
 * @author tuannm
 */
public class OrderDA {

    private ResultSet rs;
    private Connection cnn;
    private CallableStatement cs;

    public boolean insert(int userId, int productId, String status, String paymentType) {
        try {
            cnn = tool.Tools.getConnection();
            cs = cnn.prepareCall("{call insertOrder(?,?,?,?)}");
            cs.setInt(1, userId);
            cs.setInt(2, productId);
            cs.setString(3, status);
            cs.setString(4, paymentType);
            
            boolean res = (cs.executeUpdate()) > 0 ? true : false;
            return res;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
    }
    
    public List<Order> get(int orderId, int userId, String username, int productId, String productName, String status, String paymentType, String dateCreateMin, String dateCreatedMax){
        List<Order> ll = new ArrayList<Order>();
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call getOrder(?,?,?,?,?,?,?,?,?)}");
            
            status = ( status == null ) ? "" : status;
            dateCreatedMax = ( dateCreatedMax == null ) ? "" : dateCreatedMax;
            dateCreateMin = ( dateCreateMin == null ) ? "" : dateCreateMin;
            
            cs.setInt(1, orderId);
            cs.setInt(2, userId);
            cs.setString(3, username);
            cs.setInt(4, productId);
            cs.setString(5, productName);
            cs.setString(6, status);
            cs.setString(7, paymentType);
            cs.setString(8, dateCreateMin);
            cs.setString(9, dateCreatedMax);
           
            rs = cs.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt(1));
                o.setUserId(userId);
                o.setProductId(productId);
                o.setProductName(rs.getString(7));
                o.setStatus(rs.getString(3));
                o.setDateCreated(rs.getString(4));
                o.setPaymentType(rs.getString(5));
                o.setUsername(rs.getString(6));
                ll.add(o);
            }
            return ll;
        } catch (Exception e) {
            return null;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
    }
    
    
    public Order get(int id){
        if(id<=0) {
            return null;
        }
        return this.get(id, 0, "", 0, "", "", "", "", "").get(0);
    }
    
    
    public boolean update(Order order){
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call updateOrder(?,?)}");  //13 params
            cs.setInt(1, order.id);
            cs.setString(2, order.status);
            boolean res = (cs.executeUpdate()) > 0 ? true : false;
            return res;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
    }
    
    public boolean delete(int id){
        return new BaseDA().remove("Orders", id);
    }
}