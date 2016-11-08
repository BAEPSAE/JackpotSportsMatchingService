package vo;

public class Matching {
	
	int matching_Id;		//primary key
	String player;		//유저 id or Team_id 자바에서 처리해서 저장
	int score;	//유저 승점 유저테이블에서 받아오게.
	String game_Type;	//게임 타입 (축구,야구,볼링,당구)
	String game_Date;	//게임 날짜
	int game_Time;
	int ground_Hold;	//경기장 보유여부
	String latitude;	//위도
	String longitude;	//경도
	String matching_Time;	//게임 시작시간
	int onoff;
	String matching_End;
	
	public String getMatching_End() {
		return matching_End;
	}
	public void setMatching_End(String matching_End) {
		this.matching_End = matching_End;
	}
	public int getOnoff() {
		return onoff;
	}
	public void setOnoff(int onoff) {
		this.onoff = onoff;
	}
	public Matching() {
		super();
	}
	public int getMatching_Id() {
		return matching_Id;
	}
	public void setMatching_Id(int matching_Id) {
		this.matching_Id = matching_Id;
	}
	public String getPlayer() {
		return player;
	}
	public void setPlayer(String player) {
		this.player = player;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getGame_Type() {
		return game_Type;
	}
	public void setGame_Type(String game_Type) {
		this.game_Type = game_Type;
	}
	public String getGame_Date() {
		return game_Date;
	}
	public void setGame_Date(String game_Date) {
		this.game_Date = game_Date;
	}
	public int getGame_Time() {
		return game_Time;
	}
	public void setGame_Time(int game_Time) {
		this.game_Time = game_Time;
	}
	public int getGround_Hold() {
		return ground_Hold;
	}
	public void setGround_Hold(int ground_Hold) {
		this.ground_Hold = ground_Hold;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getMatching_Time() {
		return matching_Time;
	}
	public void setMatching_Time(String matching_Time) {
		this.matching_Time = matching_Time;
	}
	@Override
	public String toString() {
		return "Matching [matching_Id=" + matching_Id + ", player=" + player + ", score=" + score + ", game_Type="
				+ game_Type + ", game_Date=" + game_Date + ", game_Time=" + game_Time + ", ground_Hold=" + ground_Hold
				+ ", latitude=" + latitude + ", longitude=" + longitude + ", matching_Time=" + matching_Time
				+ ", onoff=" + onoff + ", matching_End=" + matching_End + "]";
	}
	
}
