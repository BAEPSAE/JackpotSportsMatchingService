package vo;

public class Grounds {
	
	private int ground_Id;	//경기장 고유번호(pk)-sequence
	private String ground_Name;	//경기장이름
	private String ground_Phone;	//경기장 연락처
	private String ground_Address;	//경기장 주소
	private String ground_Latitude;
	private String ground_Longitude;
	private int ground_Type;
	public Grounds(int ground_Id, String ground_Name, String ground_Phone, String ground_Address,
			String ground_Latitude, String ground_Longitude, int ground_Type) {
		super();
		this.ground_Id = ground_Id;
		this.ground_Name = ground_Name;
		this.ground_Phone = ground_Phone;
		this.ground_Address = ground_Address;
		this.ground_Latitude = ground_Latitude;
		this.ground_Longitude = ground_Longitude;
		this.ground_Type = ground_Type;
	}
	public Grounds() {
		super();
	}
	public int getGround_Id() {
		return ground_Id;
	}
	public void setGround_Id(int ground_Id) {
		this.ground_Id = ground_Id;
	}
	public String getGround_Name() {
		return ground_Name;
	}
	public void setGround_Name(String ground_Name) {
		this.ground_Name = ground_Name;
	}
	public String getGround_Phone() {
		return ground_Phone;
	}
	public void setGround_Phone(String ground_Phone) {
		this.ground_Phone = ground_Phone;
	}
	public String getGround_Address() {
		return ground_Address;
	}
	public void setGround_Address(String ground_Address) {
		this.ground_Address = ground_Address;
	}
	public String getGround_Latitude() {
		return ground_Latitude;
	}
	public void setGround_Latitude(String ground_Latitude) {
		this.ground_Latitude = ground_Latitude;
	}
	public String getGround_Longitude() {
		return ground_Longitude;
	}
	public void setGround_Longitude(String ground_Longitude) {
		this.ground_Longitude = ground_Longitude;
	}
	public int getGround_Type() {
		return ground_Type;
	}
	public void setGround_Type(int ground_Type) {
		this.ground_Type = ground_Type;
	}
	@Override
	public String toString() {
		return "Grounds [ground_Id=" + ground_Id + ", ground_Name=" + ground_Name + ", ground_Phone=" + ground_Phone
				+ ", ground_Address=" + ground_Address + ", ground_Latitude=" + ground_Latitude + ", ground_Longitude="
				+ ground_Longitude + ", ground_Type=" + ground_Type + "]";
	}
}
	