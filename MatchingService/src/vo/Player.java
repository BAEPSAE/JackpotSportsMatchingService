package vo;

public class Player {

	private String user_Id;	//유저아이디 (테이블 주키)
	private String user_Name;	//유저 이름
	private String user_Pw;	//패스워드
	private String user_Location;	//유저가 등록한 활동지역
	private String user_Phone;	//연락처
	private int record_Id;	//전적테이블ID(record테이블 fk)
	private int team1;	//소속 축구팀 id(fk)
	private int team1_Flag;	//승인여부(0:미승인/1:승인)
	private int team2;	//소속 농구팀 id(fk)
	private int team2_Flag;	//승인여부(0:미승인/1:승인)
	private double pp_Score;	//탁구 승점
	private double bl_Score;	//볼링 승점
	
		
	public Player() {
		// TODO Auto-generated constructor stub
	}


	public String getUser_Id() {
		return user_Id;
	}


	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}


	public String getUser_Name() {
		return user_Name;
	}


	public void setUser_Name(String user_Name) {
		this.user_Name = user_Name;
	}


	public String getUser_Pw() {
		return user_Pw;
	}


	public void setUser_Pw(String user_Pw) {
		this.user_Pw = user_Pw;
	}


	public String getUser_Location() {
		return user_Location;
	}


	public void setUser_Location(String user_Location) {
		this.user_Location = user_Location;
	}


	public String getUser_Phone() {
		return user_Phone;
	}


	public void setUser_Phone(String user_Phone) {
		this.user_Phone = user_Phone;
	}


	public int getRecord_Id() {
		return record_Id;
	}


	public void setRecord_Id(int record_Id) {
		this.record_Id = record_Id;
	}


	public int getTeam1() {
		return team1;
	}


	public void setTeam1(int team1) {
		this.team1 = team1;
	}


	public int getTeam1_Flag() {
		return team1_Flag;
	}


	public void setTeam1_Flag(int team1_Flag) {
		this.team1_Flag = team1_Flag;
	}


	public int getTeam2() {
		return team2;
	}


	public void setTeam2(int team2) {
		this.team2 = team2;
	}


	public int getTeam2_Flag() {
		return team2_Flag;
	}


	public void setTeam2_Flag(int team2_Flag) {
		this.team2_Flag = team2_Flag;
	}


	public double getPp_Score() {
		return pp_Score;
	}


	public void setPp_Score(double pp_Score) {
		this.pp_Score = pp_Score;
	}


	public double getBl_Score() {
		return bl_Score;
	}


	public void setBl_Score(double bl_Score) {
		this.bl_Score = bl_Score;
	}


	@Override
	public String toString() {
		return "Player [user_Id=" + user_Id + ", user_Name=" + user_Name + ", user_Pw=" + user_Pw + ", user_Location="
				+ user_Location + ", user_Phone=" + user_Phone + ", record_Id=" + record_Id + ", team1=" + team1
				+ ", team1_Flag=" + team1_Flag + ", team2=" + team2 + ", team2_Flag=" + team2_Flag + ", pp_Score="
				+ pp_Score + ", bl_Score=" + bl_Score + "]";
	}

	
	
	
	
}
