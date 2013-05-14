/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import entity.Diary;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import tool.*;

/**
 *
 * @author Hoanvd
 */
public class DiaryDA {

    private Connection cnn;
    private ResultSet rs;
    private CallableStatement cs;

    //done
    public boolean insertDiary(int contentId, int personId,
            String status, String note, String solvedDate, String rate) {
        try {
            cnn = tool.Tools.getConnection();
            cs = cnn.prepareCall("{call sp_InsertDiary(?,?,?,?,?,?)}");  //6 prams
            cs.setInt(1, contentId);
            cs.setInt(2, personId);
            cs.setString(3, status);
            cs.setNull(4, java.sql.Types.NVARCHAR);
            cs.setNull(5, java.sql.Types.DATE);
            cs.setNull(6, java.sql.Types.NVARCHAR);
            boolean res = (cs.executeUpdate()) > 0 ? true : false;
            return res;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
    }

//done   sp_SetTech
    public boolean setTech(int contentId, int personId,
            String priority) {
        try {
            cnn = tool.Tools.getConnection();
            cs = cnn.prepareCall("{call sp_SetTech(?,?,?)}");  //3 prams
            cs.setInt(1, contentId);
            cs.setInt(2, personId);
            cs.setString(3, priority);
            boolean res = (cs.executeUpdate()) > 0 ? true : false;
            return res;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
    }

    public boolean editDiary(int diaryId, String status, String note, String solvedDate, String rate) {
        try {
            cnn = tool.Tools.getConnection();
            cs = cnn.prepareCall("{call sp_EditDiary(?,?,?,?,?)}");  //5 prams
            cs.setInt(1, diaryId);
            cs.setString(2, status);
            cs.setString(3, note);
            cs.setDate(4, new java.sql.Date((Tools.getDate(Tools.STANDARD_YYYYMMDD, solvedDate)).getTime()));
            cs.setString(5, rate);
            boolean res = (cs.executeUpdate()) > 0 ? true : false;
            return res;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
    }

    public Diary getDiary(int contentId) {
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call sp_GetDiaryByContentId(?)}");
            cs.setInt(1, contentId);
            rs = cs.executeQuery();
            while (rs.next()) {
                Diary diary = new Diary();
                diary.setPersonId(rs.getInt(1));
                diary.setPriority(rs.getString(2));
                diary.setIsActive(rs.getBoolean(3));
                return diary;
            }
            return null;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
}
