/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import entity.Room;
import models.RoomDA;
import java.util.List;

/**
 *
 * @author fpoly
 */
public class RoomBean {
    
    private List<Room> listRoom;
    private int id = 0;
    private String location = null;
    private String status = null;
    private int parentId = 999;
    private Room room;
    private String atomicType;

    public RoomBean() {
    }

    public List<Room> getListRoom() {
        return new RoomDA().getRoom(this.atomicType, this.status, 0, 0, this.parentId);
    }

    public void setListRoom(List<Room> listRoom) {
        this.listRoom = listRoom;
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

    public Room getRoom() {
        return new RoomDA().getRoom(id);
    }

    public void setRoom(Room room) {
        this.room = room;
    }
    
}
