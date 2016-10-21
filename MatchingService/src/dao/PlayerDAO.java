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
}
