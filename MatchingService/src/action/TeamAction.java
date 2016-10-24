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
	List<Player> applyList;

	List<Team> teamlist;
	double team_winrate;	//승률
	
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	public String teamPage() throws Exception{
		//세션에서 userId가져오기
		//String user_Id = (String) session.get("user_Id");
		
		System.out.println("in");
		
		String user_Id = "aaa";
		selector=1;
		PlayerDAO pdao = new PlayerDAO();
		player = pdao.getUserInfo(user_Id);
		if(selector==1){	//1이면 축구팀
			team_Id = player.getTeam1();
		}else if(selector==2){	//2면 야구팀
			team_Id = player.getTeam2();
		}
		if(team_Id==-1) return "noteam";	//팀 없을때?
		
		TeamDAO tdao = new TeamDAO();
		//팀 정보 가져오기
		//flag가 1일때만 <<이거아직안함
		team = tdao.getTeam(team_Id);
		team_winrate = Math.round(team.getTeam_WinGame()/(double)team.getTeam_TotalGame()*100/100);
		
		//팀원 목록 가져오기
		int type=1;	//1이면 정식 0이면 대기
		pdao = new PlayerDAO();//?????
		memberList = pdao.getPlayerList(selector, type, team_Id);
		System.out.println(memberList);
		pdao = new PlayerDAO();
		applyList = pdao.getPlayerList(selector, 0, team_Id);
		System.out.println(applyList);
		
		//팀장이면 session저장
		if(team.getTeam_Leader().equals(user_Id)) session.put("isLeader", 1);
		else session.remove("isLeader");
		
		return SUCCESS;
	}
	
	public String t_delete() throws Exception{
		//해체하기
		//한번 더 확인?
		//세션에서 가지고 있는 유저 아이디로 불러와서?
		
		team_Id=3;
		System.out.println(team_Id);
		/*TeamDAO tdao = new TeamDAO();
		tdao.deleteTeam(team_Id);*/

		return SUCCESS;
	}
	
	public String t_openChange() throws Exception{
		team_Id = 3;
		TeamDAO tdao = new TeamDAO();
		team = tdao.getTeam(team_Id);
		team.setTeam_Open(selector);
		tdao = new TeamDAO();
		tdao.updateTeam(team);
		return SUCCESS;
	}
	
	public String t_giveLeader() throws Exception{
		
		return SUCCESS;
	}
	
	public String getTeamList(){

	    teamlist = new TeamDAO().getTeamList(team);

	     // teamlist = new TeamDAO().getTeamList(team);

	      return SUCCESS;
	}
	   
	public String t_joinApply(){
	   String rst = SUCCESS;
		int result = new TeamDAO().t_joinApply(player);
	   if(result == 1){
		   rst = SUCCESS;   
	   }else{
		   rst = ERROR;
	   }
	   return rst;
	}
	
	public String t_waiting(){
		memberList = new TeamDAO().t_waiting(team);
		
		return SUCCESS;
	}
	
	public String t_joinAccept(){
		int result = new TeamDAO().t_joinAccept(player);
		if(result == 1){
			return SUCCESS;
		}else{
			return ERROR;
		}
	}
	public String t_joinDeny(){
		int result = new TeamDAO().t_joinDeny(player);
		if(result == 1){
			return SUCCESS;
		}else{
			return ERROR;
		}
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
		public List<Player> getApplyList() {
			return applyList;
		}

		public void setApplyList(List<Player> applyList) {
			this.applyList = applyList;
		}

}
