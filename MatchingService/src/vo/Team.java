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

   private int team_Id;   //team table 주키
   private String team_Name;   //팀 이름
   private String team_Leader;   //팀장(회원아이디fk)
   private int team_Score;   //팀 승점
   private int team_Manner;   //매너점수
   private String team_GameType;   //경기종목
   private int team_TotalGame;   //총 경기수
   private int team_WinGame;   //이긴 경기수
   private int team_Draw;   //무승부 경기 수
   private boolean team_Open;   //팀원 모집중인지 여부
   
   public Team() {
      // TODO Auto-generated constructor stub
   }

   public int getTeam_Id() {
      return team_Id;
   }

   public void setTeam_Id(int team_Id) {
      this.team_Id = team_Id;
   }

   public String getTeam_Name() {
      return team_Name;
   }

   public void setTeam_Name(String team_Name) {
      this.team_Name = team_Name;
   }

   public String getTeam_Leader() {
      return team_Leader;
   }

   public void setTeam_Leader(String team_Leader) {
      this.team_Leader = team_Leader;
   }

   public int getTeam_Score() {
      return team_Score;
   }

   public void setTeam_Score(int team_Score) {
      this.team_Score = team_Score;
   }

   public int getTeam_Manner() {
      return team_Manner;
   }

   public void setTeam_Manner(int team_Manner) {
      this.team_Manner = team_Manner;
   }

   public String getTeam_GameType() {
      return team_GameType;
   }

   public void setTeam_GameType(String team_GameType) {
      this.team_GameType = team_GameType;
   }

   public int getTeam_TotalGame() {
      return team_TotalGame;
   }

   public void setTeam_TotalGame(int team_TotalGame) {
      this.team_TotalGame = team_TotalGame;
   }

   public int getTeam_WinGame() {
      return team_WinGame;
   }

   public void setTeam_WinGame(int team_WinGame) {
      this.team_WinGame = team_WinGame;
   }

   public int getTeam_Draw() {
      return team_Draw;
   }

   public void setTeam_Draw(int team_Draw) {
      this.team_Draw = team_Draw;
   }

   public boolean isTeam_Open() {
      return team_Open;
   }

   public void setTeam_Open(boolean team_Open) {
      this.team_Open = team_Open;
   }

   @Override
   public String toString() {
      return "Team [team_Id=" + team_Id + ", team_Name=" + team_Name + ", team_Leader=" + team_Leader
            + ", team_Score=" + team_Score + ", team_Manner=" + team_Manner + ", team_GameType=" + team_GameType
            + ", team_TotalGame=" + team_TotalGame + ", team_WinGame=" + team_WinGame + ", team_Draw=" + team_Draw
            + ", team_Open=" + team_Open + "]";
   }
}