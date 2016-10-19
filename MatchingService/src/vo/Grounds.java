package vo;

public class Grounds {
	
	private int ground_Id;	//����� ����Ű(��Ű)-sequence
	private String location;	//����� ����
	private String ground_Name;	//����� �̸�
	private int ground_Own;	//���� ����?�ʵ�? ��
	private String ground_Phone;	//����ó
	private String ground_Address;
	public int getGround_Id() {
		return ground_Id;
	}
	public void setGround_Id(int ground_Id) {
		this.ground_Id = ground_Id;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getGround_Name() {
		return ground_Name;
	}
	public void setGround_Name(String ground_Name) {
		this.ground_Name = ground_Name;
	}
	public int getGround_Own() {
		return ground_Own;
	}
	public void setGround_Own(int ground_Own) {
		this.ground_Own = ground_Own;
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
	@Override
	public String toString() {
		return "Grounds [ground_Id=" + ground_Id + ", location=" + location + ", ground_Name=" + ground_Name
				+ ", ground_Own=" + ground_Own + ", ground_Phone=" + ground_Phone + ", ground_Address=" + ground_Address
				+ "]";
	}	//�ּ�
}
	