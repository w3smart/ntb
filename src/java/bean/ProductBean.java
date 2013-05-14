/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import entity.Products;
import java.util.List;
import models.ProductDA;

/**
 *
 * @author fpoly
 */
public class ProductBean {
    
    private List<Products> list;
    private int id;
    private int locationId = 0;
    private Products product;

    public ProductBean() {
    }

    public Products getProduct() {
        return new ProductDA().getProductById(id);
    }
    
    public void setProduct(Products p){
        this.product = p;
    }

    public int getProductId() {
        return id;
    }

    public void setProductId(int id) {
        this.id = id;
    }

    public List<Products> getList() {
        if(this.locationId == 0){
            return new ProductDA().getProducts();
        }
        else
        {
            return null;
        }
    }
    
    public void setList(List<Products> lp){
        this.list = lp;
    }
}
