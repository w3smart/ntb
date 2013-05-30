package entity;

/**
 *
 * @author huongtt
 */
public class Order {
    public int id;
    public int userId;
    public int productId;
    public String status;
    public String dateCreated;
    public String paymentType;
    public String username;
    public String productName;
    
    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public Order(int id, int userId, int productId, String status, String dateCreated) {
        this.id = id;
        this.userId = userId;
        this.productId = productId;
        this.status = status;
        this.dateCreated = dateCreated;
    }

    public Order() {
    }

    public Order(int userId, int productId, String status, String dateCreated) {
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(String dateCreated) {
        this.dateCreated = dateCreated;
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

}