package models;

import entity.Order;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import tool.Discriminator;
import tool.Tools;

/**
 *
 * @author tuannm
 */
public class OrderDA {
    
    private ResultSet rs;
    private Connection cnn;
    private CallableStatement cs;
    
        public boolean insert(int userId, int productId, String status) {
        try {
            cnn = tool.Tools.getConnection();
            cs = cnn.prepareCall("{call insertOrder(?,?,?)}");
            cs.setInt(1, userId);
            cs.setInt(2, productId);
            cs.setString(3, status);
            boolean res = (cs.executeUpdate()) > 0 ? true : false;
            return res;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
    }
}