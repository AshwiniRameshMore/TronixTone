/*  More, Ashwini  Account: jadrn018
                   CS645, Spring 2016
                   Project #3
*/

package ashwini;


public class Cart implements java.io.Serializable{

private String sku;
private String desc;
private String image;
private String retail;
private String quantity;
private String onhand;
private String msg;


public Cart(){}

public Cart(String sku, String desc, String image, String retail, String quantity, String onhand, String msg){
this.sku = sku;
this.desc = desc;
this.retail = retail;
this.image = image;
this.quantity = quantity;
this.onhand=onhand;
this.msg=msg;
}

public void setSku(String sku) { this.sku = sku; }
public String getSku() { return sku; }

public void setDesc(String desc) { this.desc = desc; }
public String getDesc() { return desc; }

public void setRetail(String retail) { this.retail = retail; }
public String getRetail() { return retail; }

public void setImage(String image) { this.image = image; }
public String getImage() { return image; }

public void setQuantity(String quantity) { this.quantity = quantity; }
public String getQuantity() { return quantity; }

public void setOnhand(String onhand) { this.onhand = onhand; }
public String getOnhand() { return onhand; }

public void setMsg(String msg) { this.msg=msg; }
public String getMsg() { return msg; }

}

