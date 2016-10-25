package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import vo.Grounds;
import vo.Matching;
import vo.Player;
import vo.Record;

public class PlayerDAO {
	SqlSession sqlSession=MybatisConfig.getSqlSessionFactory().openSession();
	
	//개인정보 가져오기
	public Player getUserInfo(String user_Id) {
		Player getInfo=new Player();
		getInfo = sqlSession.selectOne("mapper.PlayerMapper.getUserInfo", user_Id);
		sqlSession.close();
		return getInfo;
	}
	
	//종목별 전적 가져오기
	public Record getUserRecord(String user_Id) {
		Record getRecord=new Record();
		getRecord=sqlSession.selectOne("mapper.PlayerMapper.getUserRecord", user_Id);
		return getRecord;
	}
	
	//종목별 경기장 정보 가져오기
	public Grounds getUserGround(String user_Id) {
		Grounds getGrounds=new Grounds();
		getGrounds=sqlSession.selectOne("mapper.PlayerMapper.getGrounds", user_Id);
		return getGrounds;
	}
	
	public List<Player> getPlayerList(int selector, int type, int team_Id) {
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
	
	//회원가입
	public void insertUser(Player player) {
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
	//개인의 매칭정보 리스트 가져오기
	public List<Matching> getMatchingList(Player player){
		List<Matching> result = new ArrayList<Matching>();
		result = sqlSession.selectList("mapper.PlayerMapper.getMatchingList", player);
		return result;
	}
}