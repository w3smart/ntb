/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import entity.Atomic;
import java.util.List;
import models.AtomicDA;

/**
 *
 * @author fpoly
 */
public class UserOrderBean {
    public List<Atomic> list;
    public int userId;
    public Atomic atomic;

    public UserOrderBean() {
    }

    public List<Atomic> getList() {
        return new AtomicDA().getOrderItem(5);
    }

    public void setList(List<Atomic> list) {
        this.list = list;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Atomic getAtomic() {
        return new AtomicDA().getOrderItem(userId).get(0);
    }

    public void setAtomic(Atomic atomic) {
        this.atomic = atomic;
    }
    
}
