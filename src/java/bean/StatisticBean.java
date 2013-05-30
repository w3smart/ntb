package bean;

import entity.Statistic;
import java.util.List;
import models.StatisticDA;

public class StatisticBean {
   
    public String fromDate;
    public String toDate;
    
    public List<Statistic> productStatusList;
    public List<Statistic> productTypeList;
    public List<Statistic> orderStatusList;
    
    public Statistic totalMoney;
    public Statistic totalCustomer;

    public List<Statistic> getOrderStatusList() {
        return new StatisticDA().getStatisticOrderStatus(fromDate, toDate);
    }

    public void setOrderStatusList(List<Statistic> orderStatusList) {
        this.orderStatusList = orderStatusList;
    }
    

    public Statistic getTotalCustomer() {
        return new StatisticDA().getTotalCustomer(fromDate, toDate);
    }

    public void setTotalCustomer(Statistic totalCustomer) {
        this.totalCustomer = totalCustomer;
    }
    
    public Statistic getTotalMoney() {
        return new StatisticDA().getTotalMoney(fromDate, toDate);
    }

    public void setTotalMoney(Statistic totalMoney) {
        this.totalMoney = totalMoney;
    }
    
    
    public List<Statistic> getProductTypeList() {
        return new StatisticDA().getStatisticProductType(fromDate, toDate);
    }

    public void setProductTypeList(List<Statistic> productTypeList) {
        this.productTypeList = productTypeList;
    }

    public StatisticBean() {
    }

    public String getFromDate() {
        return fromDate;
    }

    public void setFromDate(String fromDate) {
        this.fromDate = fromDate;
    }

    public String getToDate() {
        return toDate;
    }

    public void setToDate(String toDate) {
        this.toDate = toDate;
    }

    public List<Statistic> getProductStatusList() {
        return new StatisticDA().getStatisticProductStatus(fromDate, toDate);
    }

    public void setProductStatusList(List<Statistic> productStatusList) {
        this.productStatusList = productStatusList;
    }
    
}