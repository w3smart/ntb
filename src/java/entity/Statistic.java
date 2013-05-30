package entity;

/**
 *
 * @author tuannm
 */
public class Statistic {
    
    public String key;
    public String value;

    public Statistic(String key, String value) {
        this.key = key;
        this.value = value;
    }

    public Statistic() {
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
    
}