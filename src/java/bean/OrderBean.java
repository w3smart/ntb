package bean;

import entity.Order;
import java.util.List;
import models.OrderDA;

public class OrderBean {
   
    public int id;
    public String username;
    public String productName;
    public String dateCreatedMin;
    public String dateCreatedMax;
    public String status;
    public String paymentType;
    public int userId;
    public int productId;
    public List<Order> list;
    public Order order;

    public OrderBean() {
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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDateCreatedMin() {
        return dateCreatedMin;
    }

    public void setDateCreatedMin(String dateCreatedMin) {
        this.dateCreatedMin = dateCreatedMin;
    }

    public String getDateCreatedMax() {
        return dateCreatedMax;
    }

    public void setDateCreatedMax(String dateCreatedMax) {
        this.dateCreatedMax = dateCreatedMax;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public List<Order> getList() {
        return new OrderDA().get(id, userId, username, productId, productName, status, paymentType, dateCreatedMin, dateCreatedMax);
    }

    public void setList(List<Order> list) {
        this.list = list;
    }

    public Order getOrder() {
        return new OrderDA().get(id);
    }

    public void setOrder(Order order) {
        this.order = order;
    }
}