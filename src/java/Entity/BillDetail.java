/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author DUY HUYNH
 */
public class BillDetail {
    int detail_id;
    int bill_id;
    Product product ;
    int quality;
    String size;
    String color;
    Float price;
    
    public BillDetail(){
        
    }

    public BillDetail(int detail_id, int bill_id, Product product, int quality, String size, String color) {
        this.detail_id = detail_id;
        this.bill_id = bill_id;
        this.product = product;
        this.quality = quality;
        this.size = size;
        this.color = color;
    }

    public BillDetail(int detail_id, Product product, int quality, String size, String color, Float price) {
        this.detail_id = detail_id;
        this.product = product;
        this.quality = quality;
        this.size = size;
        this.color = color;
        this.price = price;
    }

    public int getDetail_id() {
        return detail_id;
    }

    public void setDetail_id(int detail_id) {
        this.detail_id = detail_id;
    }

    public int getBill_id() {
        return bill_id;
    }

    public void setBill_id(int bill_id) {
        this.bill_id = bill_id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuality() {
        return quality;
    }

    public void setQuality(int quality) {
        this.quality = quality;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }
    
    
           
}
