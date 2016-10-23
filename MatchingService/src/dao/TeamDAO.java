package dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;

import vo.Player;
import vo.Team;
import org.apache.ibatis.session.SqlSession;

import vo.Team;

public class TeamDAO {
/*

팀만들기- insert() Team
팀해체 - delete() Team, 
팀 리더 변경- update() Team_Leader
팀 모집 오픈- update() Team_Open
팀 전적 띄우기- select() Team_Total,Team_WinGame,TeamDraw,등등
팀 가입대기 목록-split ('//') 등의 기호 이용해서 유저 이름 잘라오기.
팀에 가입한 유저목록표시- select() User 테이블에서 teamId 검색
user 테이블 전부 돌아서 해당 팀 id 가지고 있는 애들 목록 긁어오기로함-좀더 좋은방법있으면 개선가능.

*/
	
	SqlSession session = MybatisConfig.getSqlSessionFactory().openSession();
	List<Team> teamList;
	List<Player> playerlist;
	
	
	//승민
	public List<Team> getTeamList(Team team){
		teamList = session.selectList("mapper.TeamMapper.getTeamList", team.getTeam_Name());
		session.commit();
		session.close();
		
		return teamList;
	}
	public int t_joinApply(Player player){
		int result = 0;
		result = session.update("mapper.TeamMapper.t_joinApply", player);
		session.commit();
		session.close();
		
		return result;
	}
	public List<Player> t_waiting(Team team){
		playerlist = session.selectList("mapper.TeamMapper.t_waiting", team.getTeam_Id());
		session.commit();
		session.close();
		
		return playerlist;
	}
	public int t_joinAccept(Player player){
		int result = 0;
		result = session.update("mapper.TeamMapper.t_joinAccept", player);
		session.commit();
		session.close();
		
		return result;
	}
	
	
	
	//하연
	public Team getTeam(int team_Id){
		Team team = session.selectOne("mapper.TeamMapper.getTeam", team_Id);
	    session.close();
	    return team;
	}
	   
	public void updateTeam(Team team){
	    session.selectOne("mapper.TeamMapper.updateTeam", team);
	    session.close();
	}
	
}