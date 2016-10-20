package action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import dao.PlayerDAO;
import dao.TeamDAO;
import vo.Player;
import vo.Team;

public class TeamAction extends ActionSupport implements SessionAware {
	
	Map<String, Object> session;
	Player player;	//유저..?
	int selector;	//축구팀인지 야구팀인지.. 축구1 야구2
	Team team;
	int team_Id;
	List<Player> memberList;	//멤버리스트
	List<Team> teamlist;
	double team_winrate;	//승률
	
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	public String teamPage() throws Exception{
		//세션에서 userId가져오기
		//String user_Id = (String) session.get("user_Id");
		String user_Id = "aaa";
		PlayerDAO pdao = new PlayerDAO();
		player = pdao.getUserInfo(user_Id);
		if(selector==1){	//1이면 축구팀
			team_Id = player.getTeam1();
		}else if(selector==2){	//2면 야구팀
			team_Id = player.getTeam2();
		}
		TeamDAO tdao = new TeamDAO();
		//팀 정보 가져오기
		//flag가 1일때만 <<이거아직안함
		team = tdao.getTeam(team_Id);
		team_winrate = Math.round(team.getTeam_WinGame()/(double)team.getTeam_TotalGame()*100/100);
		//팀원 목록 가져오기
		
		return SUCCESS;
	}
	
	public String t_delete() throws Exception{
		//해체하기
		//한번 더 확인?
		TeamDAO tdao = new TeamDAO();
		
		
		return SUCCESS;
	}
	public String t_open() throws Exception{
		TeamDAO tdao = new TeamDAO();
		team = tdao.getTeam(team_Id);
		tdao.updateTeam(team);
		return SUCCESS;
	}
	public String t_close() throws Exception{
		
		return SUCCESS;
	}
	public String t_giveLeader() throws Exception{
		
		return SUCCESS;
	}
	
	public String getTeamList(){
	     // teamlist = new TeamDAO().getTeamList(team);
	      return SUCCESS;
	   }
	   
	   public String t_joinApply(){
	      System.out.println(player);
	      //int result = new TeamDAO().t_joinApply(player, team);
	      return SUCCESS;
	   }
	   
	//getter&setter
	
	   
	   public Player getPlayer() {
		   return player;
	   }
	   
	   public void setPlayer(Player player) {
		   this.player = player;
	   }
	   
	   public int getSelector() {
		   return selector;
	   }
	   
	   public void setSelector(int selector) {
		   this.selector = selector;
	   }
	   
	   public Team getTeam() {
		   return team;
	   }
	   
	   public void setTeam(Team team) {
		   this.team = team;
	   }
	   
	   public int getTeam_Id() {
		   return team_Id;
	   }
	   
	   public void setTeam_Id(int team_Id) {
		   this.team_Id = team_Id;
	   }
	   
	   public List<Player> getMemberList() {
		   return memberList;
	   }
	   
	   public void setMemberList(List<Player> memberList) {
		   this.memberList = memberList;
	   }
	   
	   public List<Team> getTeamlist() {
		   return teamlist;
	   }
	   
	   public void setTeamlist(List<Team> teamlist) {
		   this.teamlist = teamlist;
	   }
	   
	   public double getTeam_winrate() {
		   return team_winrate;
	   }
	   
	   public void setTeam_winrate(double team_winrate) {
		   this.team_winrate = team_winrate;
	   }
	   
	   
	
	
	
}
