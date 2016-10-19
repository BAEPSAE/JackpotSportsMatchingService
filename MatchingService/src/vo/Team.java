package vo;

/**
 * @author me
 *
 */
/**
 * @author me
 *
 */
public class Team {

	private int team_Id;	//team table 주키
	private String team_Name;	//팀 이름
	private String team_Leader;	//팀장(회원아이디fk)
	private int team_Score;	//팀 승점
	private int tema_Manner;	//매너점수
	private String team_GameType;	//경기종목
	private int team_TotalGame;	//총 경기수
	private int team_WinGame;	//이긴 경기수
	private int team_Draw;	//무승부 경기 수
	private boolean team_Open;	//팀원 모집중인지 여부
	
	public Team() {
		// TODO Auto-generated constructor stub
	}

	public int getteam_Id() {
		return team_Id;
	}

	public void setteam_Id(int team_Id) {
		this.team_Id = team_Id;
	}

	public String getteam_Name() {
		return team_Name;
	}

	public void setteam_Name(String team_Name) {
		this.team_Name = team_Name;
	}

	public String getteam_Leader() {
		return team_Leader;
	}

	public void setteam_Leader(String team_Leader) {
		this.team_Leader = team_Leader;
	}

	public int getTeam_gamepoint() {
		return team_Score;
	}

	public void setTeam_gamepoint(int team_gamepoint) {
		this.team_Score = team_gamepoint;
	}

	public int gettema_Manner() {
		return tema_Manner;
	}

	public void settema_Manner(int tema_Manner) {
		this.tema_Manner = tema_Manner;
	}

	public String getteam_GameType() {
		return team_GameType;
	}

	public void setteam_GameType(String team_GameType) {
		this.team_GameType = team_GameType;
	}

	public int getteam_TotalGame() {
		return team_TotalGame;
	}

	public void setteam_TotalGame(int team_TotalGame) {
		this.team_TotalGame = team_TotalGame;
	}

	public int getteam_WinGame() {
		return team_WinGame;
	}

	public void setteam_WinGame(int team_WinGame) {
		this.team_WinGame = team_WinGame;
	}

	public int getteam_Draw() {
		return team_Draw;
	}

	public void setteam_Draw(int team_Draw) {
		this.team_Draw = team_Draw;
	}

	public boolean isteam_Open() {
		return team_Open;
	}

	public void setteam_Open(boolean team_Open) {
		this.team_Open = team_Open;
	}

	@Override
	public String toString() {
		return "Team [team_Id=" + team_Id + ", team_Name=" + team_Name + ", team_Leader=" + team_Leader
				+ ", team_Score=" + team_Score + ", tema_Manner=" + tema_Manner + ", team_GameType=" + team_GameType
				+ ", team_TotalGame=" + team_TotalGame + ", team_WinGame=" + team_WinGame + ", team_Draw=" + team_Draw
				+ ", team_Open=" + team_Open + "]";
	}

	
	
}
