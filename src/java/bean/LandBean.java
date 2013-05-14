/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import entity.Land;
import java.util.List;
import models.LandDA;

/**
 *
 * @author fpoly
 */
public class LandBean {
    
    private List<Land> listLand;
    private int id;
    private String location = null;
    private String status = null;
    private Land land;
    private double priceMin = 0;
    private double priceMax = 0;

    public LandBean() {
    }

    public List<Land> getListLand() {
        return new LandDA().getLand(location, status, priceMin, priceMax);
    }

    public void setListLand(List<Land> listLand) {
        this.listLand = listLand;
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

    public Land getLand() {
        return new LandDA().getLand(id);
    }

    public void setLand(Land land) {
        this.land = land;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getPriceMin() {
        return priceMin;
    }

    public void setPriceMin(double priceMin) {
        this.priceMin = priceMin;
    }

    public double getPriceMax() {
        return priceMax;
    }

    public void setPriceMax(double priceMax) {
        this.priceMax = priceMax;
    }
    
    
}
