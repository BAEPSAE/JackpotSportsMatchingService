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
	Player player;
	Team team;
	
	int team_Id;
	int selector;	//축구1, 야구2
	
	List<Player> memberList;	//멤버리스트
	List<Player> applyList;
	List<Team> teamlist;
	double team_winrate;	//승률
	
	String user_Id;			//session
	Map<String, Object> session;
	
	
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
		
	
	//method
	public String soccerteampage() throws Exception{
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
	      pdao = new PlayerDAO();
	      applyList = pdao.getPlayerList(1, 0, team_Id);
	      
	      //팀장이면 session저장
	  /*    if(team.getTeam_Leader().equals(user_Id)) session.put("isSCLeader", "true");
	      else session.put("isSCLeader", "false");*/
	      
	      session.put("t1Leader", team.getTeam_Leader());
	      return SUCCESS;
	   }
	
		//야구 페이지
	   public String baseballteampage() throws Exception{
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
	     /* if(team.getTeam_Leader().equals(user_Id)) session.put("isBBLeader", "true");
	      else session.put("isBBLeader", "false");
	      */
	      session.put("t2Leader", team.getTeam_Leader());
	      return SUCCESS;
	   }
	   
	   
	   //축구팀 만들기
	   public String makesoccerteam() throws Exception{   
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
	      teamlist = new TeamDAO().getmyteam((String)session.get("user_Id"));
	      for(Team t : teamlist){
	    	  if(t.getTeam_GameType().equals("축구")){
	    		  new TeamDAO().insertscleader(t);
	    	  }
	      }
	      return SUCCESS;
	   }
	   
	   //야구팀 만들기
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
	      teamlist = new TeamDAO().getmyteam((String)session.get("user_Id"));
	      for(Team t : teamlist){
	    	  if(t.getTeam_GameType().equals("야구")){
	    		  new TeamDAO().insertbaleader(t);
	    	  }
	      }
	      return SUCCESS;
	   }
	
	//팀 해체하기
	public String t_delete() throws Exception{
		//해체하기
		//한번 더 확인?
		//세션에서 가지고 있는 유저 아이디로 불러와서?
		//TODO: 
		team_Id=3;
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
	
	//리더넘기기
	public String t_giveLeader() throws Exception{
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
	
	//퇴출하기
	public String t_kick() throws Exception{
		PlayerDAO pdao = new PlayerDAO();
		player = pdao.getUserInfo(user_Id);
		selector=1;
		pdao.updateTeam(selector, -1, -1, user_Id);
		return SUCCESS;
	}
	
	//팀원 리스트
	public String getTeamList(){
	    teamlist = new TeamDAO().getTeamList(team);
	    player = new PlayerDAO().getUserInfo((String)session.get("user_Id"));
	    return SUCCESS;
	}
	
	//팀 가입 요청
	public String t_joinApply(){
	   String rst = SUCCESS;
	   player.setUser_Id((String)session.get("user_Id"));
	   int result = new TeamDAO().t_joinApply(player);
	   if(result == 1){
		   rst = SUCCESS;   
	   }else{
		   rst = ERROR;
	   }
	   return rst;
	}
	
	//요청 대기중
	public String t_waiting(){
		memberList = new TeamDAO().t_waiting(team);
		return SUCCESS;
	}
	
	//팀 요청 수락
	public String t_joinAccept(){
		int result = new TeamDAO().t_joinAccept(player);
		if(result == 1){
			return SUCCESS;
		}else{
			return ERROR;
		}
	}
	
	//팀 요청 거절
	public String t_joinDeny(){
		int result = new TeamDAO().t_joinDeny(player);
		if(result == 1){
			return SUCCESS;
		}else{
			return ERROR;
		}
	}   
		
	
	//session
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
}
