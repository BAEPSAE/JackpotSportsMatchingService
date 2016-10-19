package vo;

public class Maching {
	
	int maching_Id;		//primary key
	String player;		//유저 id or Team_id 자바에서 처리해서 저장
	int player_Score;	//유저 승점 유저테이블에서 받아오게.
	String game_Type;	//게임 타입 (축구,야구,볼링,당구)
	String game_Date;	//게임 날짜
	String ground_Hold;	//경기장 보유여부
	String location;	//지역
	String maching_StartTime;	//게임 시작시간
	
	public int getMaching_Id() {
		return maching_Id;
	}
	public void setMaching_Id(int maching_Id) {
		this.maching_Id = maching_Id;
	}
	public String getPlayer() {
		return player;
	}
	public int getPlayer_Score() {
		return player_Score;
	}
	public void setPlayer_Score(int player_Score) {
		this.player_Score = player_Score;
	}
	public String getGround_Hold() {
		return ground_Hold;
	}
	public void setGround_Hold(String ground_Hold) {
		this.ground_Hold = ground_Hold;
	}
	public String getMaching_StartTime() {
		return maching_StartTime;
	}
	public void setMaching_StartTime(String maching_StartTime) {
		this.maching_StartTime = maching_StartTime;
	}
	public void setPlayer(String player) {
		this.player = player;
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

	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getmaching_StartTime() {
		return maching_StartTime;
	}
	public void setmaching_StartTime(String maching_StartTime) {
		this.maching_StartTime = maching_StartTime;
	}

	@Override
	public String toString() {
		return "Maching [maching_Id=" + maching_Id + ", player=" + player + ", game_Type=" + game_Type + ", game_Date="
				+ game_Date + ", ground_hold=" + ground_Hold + ", location=" + location + ", maching_StartTime="
				+ maching_StartTime + "]";
	}
	
}
