package vo;

public class Matching {
	
	int matching_Id;		//primary key
	String player;		//유저 id or Team_id 자바에서 처리해서 저장
	int Score;	//유저 승점 유저테이블에서 받아오게.
	String game_Type;	//게임 타입 (축구,야구,볼링,당구)
	String game_Date;	//게임 날짜
	String game_Time;
	String ground_Hold;	//경기장 보유여부
	String location;	//지역
	String matching_StartTime;	//게임 시작시간
	
	//geters and setters
		@Override
		public String toString() {
			return "Matching [matching_Id=" + matching_Id + ", player=" + player + ", Score=" + Score + ", game_Type="
					+ game_Type + ", game_Date=" + game_Date + ", game_Time=" + game_Time + ", ground_Hold=" + ground_Hold
					+ ", location=" + location + ", matching_StartTime=" + matching_StartTime + "]";
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
			return Score;
		}
		public void setScore(int score) {
			Score = score;
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
		public String getGame_Time() {
			return game_Time;
		}
		public void setGame_Time(String game_Time) {
			this.game_Time = game_Time;
		}
		public String getGround_Hold() {
			return ground_Hold;
		}
		public void setGround_Hold(String ground_Hold) {
			this.ground_Hold = ground_Hold;
		}
		public String getLocation() {
			return location;
		}
		public void setLocation(String location) {
			this.location = location;
		}
		public String getMatching_StartTime() {
			return matching_StartTime;
		}
		public void setMatching_StartTime(String matching_StartTime) {
			this.matching_StartTime = matching_StartTime;
		}
	
}
