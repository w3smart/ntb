/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

/**
 *
 * @author Hoanvd
 */
import entity.Article;
import entity.Complaint;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import tool.*;

public class ArticleDA {

    private Connection cnn;
    private ResultSet rs;
    private CallableStatement cs;

    // done
    public int insert(String title, String content,
            String imgSrc, int personId) {
        try {
            Date submitedDate = new Date();
            cnn = tool.Tools.getConnection();
            cs = cnn.prepareCall("{call sp_InsertContent(?,?,?,?,?,?,?,?,?,?)}");  //10 prams
            cs.setString(1, title);
            cs.setString(2, content);
            cs.setInt(3, java.sql.Types.NULL);
            cs.setString(4, imgSrc);
            cs.setDate(5, new java.sql.Date(submitedDate.getTime()));
            cs.setInt(6, personId);
            cs.setString(7, null);
            cs.setString(8, null);
            cs.setString(9, tool.Discriminator.ARTICLE);
            cs.registerOutParameter(10, Types.INTEGER);
            boolean res = (cs.executeUpdate()) > 0 ? true : false;
            int contentId = res == true ? cs.getInt(10) : 0;
            return contentId;
        } catch (Exception e) {
            String ee = e.getMessage();
            System.out.println(e.getMessage());
            return 0;
        } finally {
            Tools.closeAllConnection(cnn, rs, cs);
        }
    }

     public List<Article> getArticles() {
        List<Article> list = new ArrayList<Article>();
        try {
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call sp_GetContent(?)}");
            cs.setString(1, Discriminator.ARTICLE);
            rs = cs.executeQuery();
            while (rs.next()) {
                Article comp = new Article();
                comp.setContentId(rs.getInt(1));
                comp.setTitle(rs.getString(2));
                comp.setContent(rs.getString(3));
                comp.setImgSrc(rs.getString(4));
                comp.setSubmitedDate(rs.getDate(5));
                comp.setPersonId(rs.getInt(6));
                list.add(comp);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }
    
    
    public Article getArticle(int contentId) {
        try {
            Article comp = new Article();
            cnn = Tools.getConnection();
            cs = cnn.prepareCall("{call sp_GetArticleById(?)}");
            cs.setInt(1, contentId);
            rs = cs.executeQuery();
            while (rs.next()) {
                comp.setContentId(rs.getInt(1));
                comp.setTitle(rs.getString(2));
                comp.setContent(rs.getString(3));
                comp.setImgSrc(rs.getString(4));
                comp.setSubmitedDate(rs.getDate(5));
                comp.setPersonId(rs.getInt(6));
                return comp;
            }
        } catch (Exception e) {
            return null;
        }
        return null;
    }
}
