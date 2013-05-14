/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import entity.Building;
import java.util.List;
import models.BuildingDA;

/**
 *
 * @author fpoly
 */
public class BuildingBean {
    
    private List<Building> listBuilding;
    private int id = 0;
    private String location = null;
    private String status = null;
    private int parentId = 999;
    private Building building;

    public BuildingBean() {
    }

    public List<Building> getListBuilding() {
        return new BuildingDA().getBuilding(this.location, this.status, 0, 0, this.parentId);
    }

    public void setListBuilding(List<Building> listBuilding) {
        this.listBuilding = listBuilding;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Building getBuilding() {
        return new BuildingDA().getBuilding(id);
    }

    public void setBuilding(Building building) {
        this.building = building;
    }
    
}
