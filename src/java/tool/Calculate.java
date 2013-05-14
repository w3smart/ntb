/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tool;

import entity.Products;

/**
 *
 * @author fpoly
 */
public class Calculate {
    
    public static double calculate(Products p, String plan){
        double percent = 0, price = 0;
        
        if(plan.equalsIgnoreCase("monthly")){
            percent = 5;
        }
        if(plan.equalsIgnoreCase("yearly")){
            percent = 3;
        }
        
        if(plan.equalsIgnoreCase("one")){
            price = (p.area * p.price);
        }
        else
        {
            price = (p.area * p.price) + (p.area * p.price * percent / 100);
        }
        
        return price;
    }
}
