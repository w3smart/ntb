package models;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import tool.Tools;

/**
 *
 * @author huongtt
 */
public class BaseDA {
    private ResultSet rs;
    private Connection cnn;
    private CallableStatement cs;
    /**
     * Delete an object from a table
     * @param object
     * @param id
     * @return 
     */
    public boolean remove(String object, int id){
        
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call deleteObject(?,?)}");  //13 params
            cs.setString(1, object);
            cs.setInt(2, id);
                    
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