/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author fpoly
 */
public class Location {
    public int id;
    public String location;

    public Location(int id, String location) {
        this.id = id;
        this.location = location;
    }

    public Location() {
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
    
    
}
