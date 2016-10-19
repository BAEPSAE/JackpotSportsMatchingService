package vo;

public class User {

	private String user_Id;	//���� ���̵�(��Ű)
	private String user_Name;	//���� �̸�
	private String user_Pw;	//���
	private String user_Location;	//���� ����������
	private String user_Phone;	//���� ����ó
	private int record_Id;	//���� ���� id(�ܷ�Ű)
	private String team1;	//�Ҽ� �౸��
	private int team1_Flag;	//�� ���� ���ο���(0:�̽���/1:����)
	private String team2;	//�Ҽ� ����
	private int team2_Flag;	//�� ���� ���ο���(0:�̽���/1:����)
	private double pp_Score;	//Ź�� ����
	private double bl_Score;	//���� ����
	
		
	public User() {
		// TODO Auto-generated constructor stub
	}

	public String getuser_Id() {
		return user_Id;
	}

	public void setuser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	public String getuser_Name() {
		return user_Name;
	}

	public void setuser_Name(String user_Name) {
		this.user_Name = user_Name;
	}

	public String getuser_Pw() {
		return user_Pw;
	}

	public void setuser_Pw(String user_Pw) {
		this.user_Pw = user_Pw;
	}

	public String getuser_Location() {
		return user_Location;
	}

	public void setuser_Location(String user_Location) {
		this.user_Location = user_Location;
	}

	public String getuser_Phone() {
		return user_Phone;
	}

	public void setuser_Phone(String user_Phone) {
		this.user_Phone = user_Phone;
	}

	public String getTeam1() {
		return team1;
	}

	public void setTeam1(String team1) {
		this.team1 = team1;
	}

	public int getteam1_Flag() {
		return team1_Flag;
	}

	public void setteam1_Flag(int team1_Flag) {
		this.team1_Flag = team1_Flag;
	}

	public String getTeam2() {
		return team2;
	}

	public void setTeam2(String team2) {
		this.team2 = team2;
	}

	public int getteam2_Flag() {
		return team2_Flag;
	}

	public void setteam2_Flag(int team2_Flag) {
		this.team2_Flag = team2_Flag;
	}

	public int getrecord_Id() {
		return record_Id;
	}

	public void setrecord_Id(int record_Id) {
		this.record_Id = record_Id;
	}

	public double getpp_Score() {
		return pp_Score;
	}

	public void setpp_Score(double pp_Score) {
		this.pp_Score = pp_Score;
	}

	public double getbl_Score() {
		return bl_Score;
	}

	public void setbl_Score(double bl_Score) {
		this.bl_Score = bl_Score;
	}

	@Override
	public String toString() {
		return "User [user_Id=" + user_Id + ", user_Name=" + user_Name + ", user_Pw=" + user_Pw + ", user_Location="
				+ user_Location + ", user_Phone=" + user_Phone + ", record_Id=" + record_Id + ", team1=" + team1
				+ ", team1_Flag=" + team1_Flag + ", team2=" + team2 + ", team2_Flag=" + team2_Flag + ", pp_Score="
				+ pp_Score + ", bl_Score=" + bl_Score + "]";
	}

	
	
}
