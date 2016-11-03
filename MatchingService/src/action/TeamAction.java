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
	String user_Id;
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
	
	public String soccerteampage() throws Exception{
	      System.out.println("in");
	      
	      user_Id = (String) session.get("user_Id");
	      PlayerDAO pdao = new PlayerDAO();
	      player = pdao.getUserInfo(user_Id);
	      team_Id = player.getTeam1();
	      int flag = player.getTeam1_Flag();
	      if(team_Id==-1 || team_Id==0 || flag == 0) return "noteam";   //팀 없을때?
	      
	      TeamDAO tdao = new TeamDAO();
	      
	      team = tdao.getTeam(team_Id);
	      team_winrate = Math.ceil(team.getTeam_WinGame()/(double)team.getTeam_TotalGame()*100);
	      
	      
	      //팀원 목록 가져오기
	      int type=1;   //1이면 정식 0이면 대기
	      pdao = new PlayerDAO();//?????
	      memberList = pdao.getPlayerList(1, type, team_Id);
	      System.out.println("memberlist size: "+memberList.size());
	      pdao = new PlayerDAO();
	      applyList = pdao.getPlayerList(1, 0, team_Id);
	      
	      //팀장이면 session저장
	      if(team.getTeam_Leader().equals(user_Id)) session.put("isLeader", "true");
	      else session.put("isLeader", "false");
	      
	      session.put("t1Leader", team.getTeam_Leader());
	      
	      
	      return SUCCESS;
	   }
	   public String baseballteampage() throws Exception{
	      System.out.println("in");
	      
	      user_Id = (String) session.get("user_Id");
	      PlayerDAO pdao = new PlayerDAO();
	      player = pdao.getUserInfo(user_Id);
	      team_Id = player.getTeam2();
	      int flag = player.getTeam2_Flag();
	      if(team_Id==-1 || team_Id==0 || flag == 0) return "noteam";   //팀 없을때?
	      
	      TeamDAO tdao = new TeamDAO();
	      
	      team = tdao.getTeam(team_Id);
	      team_winrate = Math.ceil(team.getTeam_WinGame()/(double)team.getTeam_TotalGame()*100);
	      
	      
	      //팀원 목록 가져오기
	      int type=1;   //1이면 정식 0이면 대기
	      pdao = new PlayerDAO();//?????
	      memberList = pdao.getPlayerList(2, type, team_Id);
	      pdao = new PlayerDAO();
	      applyList = pdao.getPlayerList(2, 0, team_Id);
	      
	      //팀장이면 session저장
	      if(team.getTeam_Leader().equals(user_Id)) session.put("isLeader", "true");
	      else session.put("isLeader", "false");
	      
	      session.put("t1Leader", team.getTeam_Leader());
	      
	      
	      return SUCCESS;
	   }
	   
	   
	   public String makesoccerteam() throws Exception{   
		   System.out.println(team);
	      team.setTeam_Leader((String)session.get("user_Id"));
	      team.setTeam_GameType("축구");
	      if(team.getTeam_Score() == 1){
	         team.setTeam_Score(50);   
	      }else if(team.getTeam_Score() == 2){
	         team.setTeam_Score(100);   
	      }else if(team.getTeam_Score() == 3){
	         team.setTeam_Score(150);   
	      }else if(team.getTeam_Score() == 4){
	         team.setTeam_Score(200);   
	      }else if(team.getTeam_Score() == 5){
	         team.setTeam_Score(250);   
	      }
	      new TeamDAO().maketeam(team);
	      return SUCCESS;
	   }
	   public String makebaseballteam() throws Exception{      
	      team.setTeam_Leader((String)session.get("user_Id"));
	      team.setTeam_GameType("야구");
	      if(team.getTeam_Score() == 1){
	         team.setTeam_Score(50);   
	      }else if(team.getTeam_Score() == 2){
	         team.setTeam_Score(100);   
	      }else if(team.getTeam_Score() == 3){
	         team.setTeam_Score(150);   
	      }else if(team.getTeam_Score() == 4){
	         team.setTeam_Score(200);   
	      }else if(team.getTeam_Score() == 5){
	         team.setTeam_Score(250);   
	      }
	      new TeamDAO().maketeam(team);
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
		//리더넘기기
		System.out.println("leaddd");
		PlayerDAO pdao = new PlayerDAO();
		String sessionid="aaa";
		player = pdao.getUserInfo(sessionid);
		//축구팀이야 야구팀이야
		team_Id = player.getTeam1();
		TeamDAO tdao = new TeamDAO();
		team = tdao.getTeam(team_Id);
		team.setTeam_Leader(user_Id);
		tdao = new TeamDAO();
		tdao.updateTeam(team);
		return SUCCESS;
	}
	
	public String t_kick() throws Exception{
		System.out.println("kick");
		PlayerDAO pdao = new PlayerDAO();
		player = pdao.getUserInfo(user_Id);
		System.out.println("player"+player);
		selector=1;
		pdao.updateTeam(selector, -1, -1, user_Id);
		System.out.println("kick_success");
		return SUCCESS;
	}

	public String getTeamList(){
		System.out.println("/////////");
	    teamlist = new TeamDAO().getTeamList(team);
	    player = new PlayerDAO().getUserInfo((String)session.get("user_Id")); //session로그인아이디로 바꿔야함.
	    return SUCCESS;
	}
	   
	public String t_joinApply(){
	   String rst = SUCCESS;
	   System.out.println("123");
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

		public String getUser_Id() {
			return user_Id;
		}

		public void setUser_Id(String user_Id) {
			this.user_Id = user_Id;
		}
}
