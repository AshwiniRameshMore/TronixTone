/*  More, Ashwini  Account: jadrn018
                   CS645, Spring 2016
                   Project #3
*/
package ashwini;

public class Product implements java.io.Serializable{

private String sku;
private String catID;
private String venID;
private String vendorModel;
private String description;
private String features;
private String cost;
private String retail;
private String image;
private String quantity;

public Product(){}

public Product(String sku, String catID, String venID, String vendorModel, String description, String features, String cost, String retail, String image, String quantity){
this.sku = sku;
this.catID = catID;
this.venID = venID;
this.vendorModel = vendorModel;
this.description = description;
this.features = features;
this.cost = cost;
this.retail = retail;
this.image = image;
this.quantity = quantity;
}

public void setSku(String sku) { this.sku = sku; }
public String getSku() { return sku; }

public void setCatID(String catID) { this.catID = catID; }
public String getCatID() { return catID; }

public void setVenID(String venID) { this.venID = venID; }
public String getVenID() { return venID; }

public void setVendorModel(String vendorModel) { this.vendorModel = vendorModel; }
public String getVendorModel() { return vendorModel; }

public void setDescription(String description) { this.description = description; }
public String getDescription() { return description; }

public void setFeatures(String features) { this.features = features; }
public String getFeatures() { return features; }

public void setCost(String cost) { this.cost = cost; }
public String getCost() { return cost; }

public void setRetail(String retail) { this.retail = retail; }
public String getRetail() { return retail; }

public void setImage(String image) { this.image = image; }
public String getImage() { return image; }

public void setQuantity(String quantity) { this.quantity = quantity; }
public String getQuantity() { return quantity; }

}

