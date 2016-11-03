package vo;

public class Item {
String ground_id;
String ground_name;
String ground_phone;
String ground_address;
String ground_longitude;
String ground_latitude;
int ground_type;   //1=축구 2=야구 3=볼링 4=탁구



public Item() {
}


public Item(String ground_id, String ground_name, String ground_phone, String ground_address, String ground_longitude,
      String ground_latitude, int ground_type) {
   super();
   this.ground_id = ground_id;
   this.ground_name = ground_name;
   this.ground_phone = ground_phone;
   this.ground_address = ground_address;
   this.ground_longitude = ground_longitude;
   this.ground_latitude = ground_latitude;
   this.ground_type = ground_type;
}


public String getGround_id() {
   return ground_id;
}
public void setGround_id(String ground_id) {
   this.ground_id = ground_id;
}
public String getGround_name() {
   return ground_name;
}
public void setGround_name(String ground_name) {
   this.ground_name = ground_name;
}
public String getGround_phone() {
   return ground_phone;
}
public void setGround_phone(String ground_phone) {
   this.ground_phone = ground_phone;
}
public String getGround_address() {
   return ground_address;
}
public void setGround_address(String ground_address) {
   this.ground_address = ground_address;
}
public String getGround_longitude() {
   return ground_longitude;
}
public void setGround_longitude(String ground_longitude) {
   this.ground_longitude = ground_longitude;
}
public String getGround_latitude() {
   return ground_latitude;
}
public void setGround_latitude(String ground_latitude) {
   this.ground_latitude = ground_latitude;
}
public int getGround_type() {
   return ground_type;
}
public void setGround_type(int ground_type) {
   this.ground_type = ground_type;
}
@Override
public String toString() {
   return "Item [ground_id=" + ground_id + ", ground_name=" + ground_name + ", ground_phone=" + ground_phone
         + ", ground_address=" + ground_address + ", ground_longitude=" + ground_longitude + ", ground_latitude="
         + ground_latitude + ", ground_type=" + ground_type + "]";
}

}