/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Hoanvd
 */
public class Account extends Person {
    private String accountType;

    public String getAccountType() {
        return accountType;
    }

    public void setAccountType(String accountType) {
        this.accountType = accountType;
    }
    
}
