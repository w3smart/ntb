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
public class Atomic implements Serializable{
    
    public int id;
    public String name;
    public int address;
    public double price;
    public String status;
    public double area;
    public int creator;
    public String dateCreated;
    public String dateModified;
    public String description;
    public String type;
    public int parentId;
    public String thumbnail;
    public int numOfFloor;
    public int floorNumber;
    public int roomEachFloor;
    
    public Atomic(int id, String name, int address, double price, String status, double area, int creator, String dateCreated, String dateModified, String description) {
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

    public Atomic(String name, int address, double price, String status, double area, int creator, String dateCreated, String dateModified, String description) {
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

    public Atomic() {
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

    public int getAddress() {
        return address;
    }

    public void setAddress(int address) {
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public int getNumOfFloor() {
        return numOfFloor;
    }

    public void setNumOfFloor(int numOfFloor) {
        this.numOfFloor = numOfFloor;
    }

    public int getFloorNumber() {
        return floorNumber;
    }

    public void setFloorNumber(int floorNumber) {
        this.floorNumber = floorNumber;
    }

    public int getRoomEachFloor() {
        return roomEachFloor;
    }

    public void setRoomEachFloor(int roomEachFloor) {
        this.roomEachFloor = roomEachFloor;
    }

    
    @Override
    public String toString() {
        return "Products{" + "id=" + id + ", name=" + name + ", address=" + address + ", price=" + price + ", status=" + status + ", area=" + area + ", creator=" + creator + ", dateCreated=" + dateCreated + ", dateModified=" + dateModified + ", description=" + description + '}';
    }

}