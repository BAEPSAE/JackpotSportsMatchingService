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
	public List<Player> getPlayerList(int selector, int team_Id) {
		// 팀소속 멤버 갖고오기
		Map<String, Integer> map=new HashMap<>();
		map.put("selector", selector);
		map.put("team_Id", team_Id);
		
		List<Player> result = new ArrayList<>();
		result=sqlSession.selectList("mapper.PlayerMapper.getPlayerList", map);
		sqlSession.close();
		return result;
	}
}
