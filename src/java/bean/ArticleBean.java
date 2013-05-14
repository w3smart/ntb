/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import entity.Article;
import java.util.List;
import models.ArticleDA;

/**
 *
 * @author Hoanvd
 */
public class ArticleBean {
    
    private List<Article> list;
    private int contentId;
    private Article article;

    public ArticleBean() {
    }

    public Article getArticle() {
        return new ArticleDA().getArticle(contentId);
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public int getContentId() {
        return contentId;
    }

    public void setContentId(int contentId) {
        this.contentId = contentId;
    }

    public List<Article> getList() {
        return new ArticleDA().getArticles();
    }

    public void setList(List<Article> list) {
        this.list = list;
    }
    
}
