package bean;

import entity.Atomic;
import java.util.List;
import models.AtomicDA;

/**
 *
 * @author manhnt
 */
public class AtomicBean {
    private int locationId;
    private String status = null;
    private String name = null;

    private List<Atomic> listLand;
    private Atomic land;
    private int landId;
    
    private List<Atomic> listBuilding;
    private Atomic building;
    private int buildingId;
    private int buildingParentId;
    
    private List<Atomic> listRoom;
    private Atomic room;
    private int roomId;
    private int roomParentId;
    
    
    public AtomicBean() {
    }

    public int getLocationId() {
        return locationId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getBuildingParentId() {
        return buildingParentId;
    }

    public void setBuildingParentId(int buildingParentId) {
        this.buildingParentId = buildingParentId;
    }

    public int getRoomParentId() {
        return roomParentId;
    }

    public void setRoomParentId(int roomParentId) {
        this.roomParentId = roomParentId;
    }

    public void setLocationId(int locationId) {
        this.locationId = locationId;
    }

    public List<Atomic> getListLand() {
        return new AtomicDA().get(this.locationId, this.status, "land", 0, 0, 0, this.name);
    }

    public void setListLand(List<Atomic> listLand) {
        this.listLand = listLand;
    }

    public Atomic getLand() {
        return new AtomicDA().get(landId);
    }

    public void setLand(Atomic land) {
        this.land = land;
    }

    public int getLandId() {
        return landId;
    }

    public void setLandId(int landId) {
        this.landId = landId;
    }

    public List<Atomic> getListBuilding() {
        this.buildingParentId = ( this.landId > 0 ) ? this.landId : -1;
        return new AtomicDA().get(this.locationId, this.status, "building", 0, 0, this.buildingParentId, this.name);
    }

    public void setListBuilding(List<Atomic> listBuilding) {
        this.listBuilding = listBuilding;
    }

    public Atomic getBuilding() {
        return new AtomicDA().get(this.buildingId);
    }

    public void setBuilding(Atomic building) {
        this.building = building;
    }

    public int getBuildingId() {
        return buildingId;
    }

    public void setBuildingId(int buildingId) {
        this.buildingId = buildingId;
    }

    public List<Atomic> getListRoom() {
        this.roomParentId = ( this.buildingId > 0 ) ? this.buildingId : -1;
        return new AtomicDA().get(this.locationId, this.status, "room", 0, 0, this.roomParentId, this.name);
    }

    public void setListRoom(List<Atomic> listRoom) {
        this.listRoom = listRoom;
    }

    public Atomic getRoom() {
        return new AtomicDA().get(this.roomId);
    }

    public void setRoom(Atomic room) {
        this.room = room;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

     public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
