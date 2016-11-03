package vo;

public class Games {

	int game_Id; //게임table primary key
	String game_Type; //게임 타입 결정
	int game_Time;
	String player1;	//유저1
	String p1_latitude;
	String p1_longitude;
	String player2; //유저2
	String p2_latitude;
	String p2_longitude;
	int ground_Id;	//그라운드 table의 주키 참조하는 외래키
	String winner_Id;	//승자아이디
	String game_Draw;	//무승부
	String game_Invalidity;	//게임 무효
	String player1_Key;	//승패입력시 필요한 10자리 키 ? 
	String player2_Key;	//승패입력시 필요한 10자리 키 ? 
	public int getGame_Id() {
		return game_Id;
	}
	public void setGame_Id(int game_Id) {
		this.game_Id = game_Id;
	}
	public String getGame_Type() {
		return game_Type;
	}
	public void setGame_Type(String game_Type) {
		this.game_Type = game_Type;
	}
	public int getGame_Time() {
		return game_Time;
	}
	public void setGame_Time(int game_Time) {
		this.game_Time = game_Time;
	}
	public String getPlayer1() {
		return player1;
	}
	public void setPlayer1(String player1) {
		this.player1 = player1;
	}
	public String getP1_latitude() {
		return p1_latitude;
	}
	public void setP1_latitude(String p1_latitude) {
		this.p1_latitude = p1_latitude;
	}
	public String getP1_longitude() {
		return p1_longitude;
	}
	public void setP1_longitude(String p1_longitude) {
		this.p1_longitude = p1_longitude;
	}
	public String getPlayer2() {
		return player2;
	}
	public void setPlayer2(String player2) {
		this.player2 = player2;
	}
	public String getP2_latitude() {
		return p2_latitude;
	}
	public void setP2_latitude(String p2_latitude) {
		this.p2_latitude = p2_latitude;
	}
	public String getP2_longitude() {
		return p2_longitude;
	}
	public void setP2_longitude(String p2_longitude) {
		this.p2_longitude = p2_longitude;
	}
	public int getGround_Id() {
		return ground_Id;
	}
	public void setGround_Id(int ground_Id) {
		this.ground_Id = ground_Id;
	}
	public String getWinner_Id() {
		return winner_Id;
	}
	public void setWinner_Id(String winner_Id) {
		this.winner_Id = winner_Id;
	}
	public String getGame_Draw() {
		return game_Draw;
	}
	public void setGame_Draw(String game_Draw) {
		this.game_Draw = game_Draw;
	}
	public String getGame_Invalidity() {
		return game_Invalidity;
	}
	public void setGame_Invalidity(String game_Invalidity) {
		this.game_Invalidity = game_Invalidity;
	}
	public String getPlayer1_Key() {
		return player1_Key;
	}
	public void setPlayer1_Key(String player1_Key) {
		this.player1_Key = player1_Key;
	}
	public String getPlayer2_Key() {
		return player2_Key;
	}
	public void setPlayer2_Key(String player2_Key) {
		this.player2_Key = player2_Key;
	}
	@Override
	public String toString() {
		return "Games [game_Id=" + game_Id + ", game_Type=" + game_Type + ", game_Time=" + game_Time + ", player1="
				+ player1 + ", p1_latitude=" + p1_latitude + ", p1_longitude=" + p1_longitude + ", player2=" + player2
				+ ", p2_latitude=" + p2_latitude + ", p2_longitude=" + p2_longitude + ", ground_Id=" + ground_Id
				+ ", winner_Id=" + winner_Id + ", game_Draw=" + game_Draw + ", game_Invalidity=" + game_Invalidity
				+ ", player1_Key=" + player1_Key + ", player2_Key=" + player2_Key + "]";
	}
	
	
	
}