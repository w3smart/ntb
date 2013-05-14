/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author huongtt
 */
public class Order {
    public int id;
    public int userId;
    public int productId;
    public int status;
    public String dateCreated;

    public Order(int id, int userId, int productId, int status, String dateCreated) {
        this.id = id;
        this.userId = userId;
        this.productId = productId;
        this.status = status;
        this.dateCreated = dateCreated;
    }

    public Order() {
    }

    public Order(int userId, int productId, int status, String dateCreated) {
        this.userId = userId;
        this.productId = productId;
        this.status = status;
        this.dateCreated = dateCreated;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(String dateCreated) {
        this.dateCreated = dateCreated;
    }
    
}