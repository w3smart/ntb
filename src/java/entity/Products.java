/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;

/**
 *
 * @author fpoly
 */
public class Products implements Serializable{
    
    public int id;
    public String name;
    public String address;
    public double price;
    public String status;
    public double area;
    public int creator;
    public String dateCreated;
    public String dateModified;
    public String description;

    public Products(int id, String name, String address, double price, String status, double area, int creator, String dateCreated, String dateModified, String description) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.price = price;
        this.status = status;
        this.area = area;
        this.creator = creator;
        this.dateCreated = dateCreated;
        this.dateModified = dateModified;
        this.description = description;
    }

    public Products(String name, String address, double price, String status, double area, int creator, String dateCreated, String dateModified, String description) {
        this.name = name;
        this.address = address;
        this.price = price;
        this.status = status;
        this.area = area;
        this.creator = creator;
        this.dateCreated = dateCreated;
        this.dateModified = dateModified;
        this.description = description;
    }

    public Products() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public int getCreator() {
        return creator;
    }

    public void setCreator(int creator) {
        this.creator = creator;
    }

    public String getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(String dateCreated) {
        this.dateCreated = dateCreated;
    }

    public String getDateModified() {
        return dateModified;
    }

    public void setDateModified(String dateModified) {
        this.dateModified = dateModified;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Products{" + "id=" + id + ", name=" + name + ", address=" + address + ", price=" + price + ", status=" + status + ", area=" + area + ", creator=" + creator + ", dateCreated=" + dateCreated + ", dateModified=" + dateModified + ", description=" + description + '}';
    }

    
}