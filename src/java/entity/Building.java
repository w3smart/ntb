/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author fpoly
 */
public class Building extends Products{
    
    public int parentId;
    public String type = "building";
    public String thumbnail;

    public Building(int parentId, String type, String thumbnail, int id, String name, String address, double price, String status, double area, int creator, String dateCreated, String dateModified, String description) {
        super(id, name, address, price, status, area, creator, dateCreated, dateModified, description);
        this.parentId = parentId;
        this.type = "building";
        this.thumbnail = thumbnail;
    }

    public Building(int parentId, String type, String thumbnail, String name, String address, double price, String status, double area, int creator, String dateCreated, String dateModified, String description) {
        super(name, address, price, status, area, creator, dateCreated, dateModified, description);
        this.parentId = parentId;
        this.type = "building";
        this.thumbnail = thumbnail;
    }

    public Building(int parentId, String type, String thumbnail) {
        this.parentId = parentId;
        this.type = "building";
        this.thumbnail = thumbnail;
    }
    
    public Building(){}

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public String getType() {
        return "building";
    }

    public void setType() {
        this.type = "building";
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }
    
}