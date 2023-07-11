/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DUY HUYNH
 */
public class Cart {

    List<Item> items;

    public Cart() {
        items = new ArrayList<>();

    }

    public Cart(List<Item> items) {
        this.items = items;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    //số lượng 1 sản phẩm  - khách sẽ mua 
    public int getQuantityById(String id) {
        return getItemById(id).getQuantity();

    }
//tìm item qua cái id

    private Item getItemById(String id) {
        for (Item i : items) {
            if (i.getProduct().getProduct_id().equals(id)) {
                return i;
            }

        }
        return null;
    }

    private Item checkItem(String id, String color, String size) {
        for (Item i : items) {
            if (i.getProduct().getProduct_id().equals(id) && i.size.equals(size) && i.color.endsWith(color)) {
                return i;
            }

        }
        return null;
    }
        // add 1 sản phẩm vào giỏ, nếu có rồi thì tăng số lượng
    public void addItem(Item t){
        if(getItemById(t.getProduct().getProduct_id())!=null && checkItem(t.getProduct().getProduct_id(), t.color, t.size) != null ){
            Item m = getItemById(t.getProduct().getProduct_id());
            m.setQuantity(m.getQuantity()+t.getQuantity());
        }else{
            items.add(t);
        }
    }
    //loai bo san pham khoi gio
    public void removeItem(String id){
        if(getItemById(id) != null){
            items.remove(getItemById(id));
        }
    }
    //tong tien cua ca gio hang-se add vao bang Order
    public double getTotalMoney(){
        double t = 0 ;
        for(Item i: items){
            t += (i.getQuantity()*i.getProduct().product_price);
        }return t;
    }
}
