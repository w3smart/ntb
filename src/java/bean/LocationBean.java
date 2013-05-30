/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import entity.Location;
import java.util.List;
import models.LocationDA;

/**
 *
 * @author tannt
 */
public class LocationBean {
    private List<Location> list;
    private int id;
    private Location location;

    public LocationBean() {
    }

    public List<Location> getList() {
         return new LocationDA().getLocation();
    }

    public void setList(List<Location> list) {
        this.list = list;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Location getLocation() {
        return new LocationDA().getLocation(id);
    }

    public void setLocation(Location location) {
        this.location = location;
    }
    
}