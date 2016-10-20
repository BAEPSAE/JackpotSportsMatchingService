package dao;

import java.util.HashMap;
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
		sqlSession.selectOne("mapper.PlayerMapper.getUserInfo", user_Id);
		return getInfo;
	}
	
	//종목별 전적 가져오기
	public Record getUserRecord(String user_Id, String sports) {
		Map<String, String> map=new HashMap<>();
		map.put("user_Id", user_Id);
		map.put("sports", sports);
		
		Record getRecord=new Record();
		getRecord=sqlSession.selectOne("mapper.PlayerMapper.getUserRecord", map);
		return getRecord;
	}
	
	//종목별 경기장 정보 가져오기
	public Grounds getUserGround(String user_Id, String sports) {
		Map<String, String> map=new HashMap<>();
		map.put("user_Id", user_Id);
		map.put("sports", sports);
		
		Grounds getGrounds=new Grounds();
		getGrounds=sqlSession.selectOne("mapper.PlayerMapper.getGrounds", map);
		return getGrounds;
	}
}
