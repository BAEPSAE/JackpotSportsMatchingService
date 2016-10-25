package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import vo.Grounds;
import vo.Player;
import vo.Record;

public class PlayerDAO {
	SqlSession sqlSession=null;
	
	//개인정보 가져오기
	public Player getUserInfo(String user_Id) {
		sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
		Player getInfo=new Player();
		getInfo = sqlSession.selectOne("mapper.PlayerMapper.getUserInfo", user_Id);
		sqlSession.close();
		return getInfo;
	}
		
	//종목별 전적 가져오기
	public Record getUserRecord(String user_Id) {
		sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
		Record getRecord=new Record();
		getRecord=sqlSession.selectOne("mapper.PlayerMapper.getUserRecord", user_Id);
		sqlSession.close();
		return getRecord;
	}
	
	//종목별 경기장 정보 가져오기
	public Grounds getUserGround(String user_Id, int sports) {
		sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
		Map<String, Object> map=new HashMap<>();
		map.put("user_Id", user_Id);
		map.put("sports", sports);	//축구==1, 야구==2, 탁구==3, 볼링==4
		Grounds getGrounds=new Grounds();
		getGrounds=sqlSession.selectOne("mapper.PlayerMapper.getUserGround", map);
		sqlSession.close();
		return getGrounds;
	}
	
	public List<Player> getPlayerList(int selector, int type, int team_Id) {
		sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
		// 팀소속 멤버 갖고오기
		Map<String, Object> map=new HashMap<>();
		map.put("selector", selector);
		map.put("type", type);	//1이면 정식 0이면 대기
		map.put("team_Id", team_Id);
		
		List<Player> result = new ArrayList<Player>();
		result = sqlSession.selectList("mapper.PlayerMapper.getPlayerList", map);
		sqlSession.close();
			
		return result;
	}
	
	//팀 정보수정
	public void updateTeam(int selector, int team, int team_flag, String user_Id){
		System.out.println("dao in");
		//파라미터
		Map<String, Object> map=new HashMap<>();
		map.put("user_Id", user_Id);
		map.put("selector", selector);
		map.put("team", team);
		map.put("team_flag", team_flag);
		if(team==-1) map.put("team", null);
		if(team_flag==-1) map.put("team_flag", null);
		try {
			sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
			sqlSession.update("mapper.PlayerMapper.changeTeam", map);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("updated");
		sqlSession.close();
	}
	
	//회원가입
	public void insertUser(Player player) {
		sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
		System.out.println("dao안player" + player);
		try {
			sqlSession.insert("mapper.PlayerMapper.insertRecord");
			sqlSession.insert("mapper.PlayerMapper.insertPlayer", player);
			sqlSession.commit();
			sqlSession.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Player getUser(Player player) {
		sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
		System.out.println("dao안" + player);
		Player p = null;
		try {
			p = sqlSession.selectOne("mapper.PlayerMapper.getUser", player);
			sqlSession.commit();
			sqlSession.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return p;
	}
}