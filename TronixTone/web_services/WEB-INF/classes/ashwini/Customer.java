/*  More, Ashwini  Account: jadrn018
                   CS645, Spring 2016
                   Project #3
*/
package ashwini;

public class Customer implements java.io.Serializable{

private String dname;
private String dzip;
private String daddress;
private String dlandmark;
private String dcity;
private String dstate;
private String dcountry;
private String dphone;
private String bname;
private String bzip;
private String baddress;
private String blandmark;
private String bcity;
private String bstate;
private String bcountry;
private String bphone;

public Customer(){}

public Customer(String dname,String dzip,String daddress,String dlandmark,String dcity,String dstate,String dcountry,String dphone,String bname,String bzip,String baddress,String blandmark,String bcity,String bstate,String bcountry,String bphone
){
this.dname = dname;
this.dzip = dzip;
this.daddress = daddress;
this.dlandmark = dlandmark;
this.dcity = dcity;
this.dstate = dstate;
this.dcountry = dcountry;
this.dphone = dphone;
this.bname = bname;
this.bzip = bzip;
this.baddress = baddress;
this.blandmark = blandmark;
this.bcity = bcity;
this.bstate = bstate;
this.bcountry = bcountry;
this.bphone = bphone;
}

public void setDname(String dname) { this.dname = dname; }
public String getDname() { return dname; }
public void setBname(String bname) { this.bname = bname; }
public String getBname() { return bname; }

public void setDzip(String dzip) { this.dzip = dzip; }
public String getDzip() { return dzip; }
public void setBzip(String bzip) { this.bzip = bzip; }
public String getBzip() { return bzip; }

public void setDaddress(String daddress) { this.daddress = daddress; }
public String getDaddress() { return daddress;}
public void setBaddress(String baddress) { this.baddress = baddress; }
public String getBaddress() { return baddress; }

public void setDlandmark(String dlandmark) { this.dlandmark = dlandmark; }
public String getDlandmark() { return dlandmark;}
public void setBlandmark(String blandmark) { this.blandmark = blandmark; }
public String getBlandmark() { return blandmark; }

public void setDcity(String dcity) { this.dcity = dcity; }
public String getDcity() { return dcity;}
public void setBcity(String bcity) { this.bcity = bcity; }
public String getBcity() { return bcity; }

public void setDstate(String dstate) { this.dstate = dstate; }
public String getDstate() { return dstate;}
public void setBstate(String bstate) { this.bstate = bstate; }
public String getBstate() { return bstate; }

public void setDcountry(String dcountry) { this.dcountry = dcountry; }
public String getDcountry() { return dcountry;}
public void setBcountry(String bcountry) { this.bcountry = bcountry; }
public String getBcountry() { return bcountry; }

public void setDphone(String dphone) { this.dphone = dphone; }
public String getDphone() { return dphone;}
public void setBphone(String bphone) { this.bphone = bphone; }
public String getBphone() { return bphone; }


}
