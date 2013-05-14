/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author fpoly
 */
public class Land extends Products{

    public Land(int id, String name, String address, double price, String status, double area, int creator, String dateCreated, String dateModified, String description) {
        super(id, name, address, price, status, area, creator, dateCreated, dateModified, description);
    }

    public Land(String name, String address, double price, String status, double area, int creator, String dateCreated, String dateModified, String description) {
        super(name, address, price, status, area, creator, dateCreated, dateModified, description);
    }

    public Land() {
    }
    
}
