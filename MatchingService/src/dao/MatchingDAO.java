package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.Games;
import vo.Matching;
import vo.Notice;

public class MatchingDAO {
	SqlSession sqlSession;

	// 매칭 풀에 등록하기
	public void insertMatching(Matching matching) {
		sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
		System.out.println("DAO: " + matching.toString());
		try{
		sqlSession.insert("mapper.MatchingMapper.insertMatching", matching);
		System.out.println("매칭 매퍼 읽음");
		sqlSession.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//대상이 이미 매칭 대기 상태인지 아닌지를 확인
	public Matching checkMatching(String user_Id, int sports) {
		Matching getMatching=new Matching();
		Map<String, Object> map = new HashMap<>();
		map.put("user_Id", user_Id);
		map.put("sports", sports);
		System.out.println("매칭중? "+user_Id+", "+sports);
		try {
			sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
			getMatching=sqlSession.selectOne("mapper.MatchingMapper.checkMatching", map);
			System.out.println("get: " + getMatching);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return getMatching;
	}
	
	// 취소할 경우 나옴

	// 매칭상대 찾기
	// 상대 찾기
	public Matching searchMatching(Matching matching, int type) {
		System.out.println("ddddddddddddddd");
		Matching result = null;
		// 변수 보내는 해시맵
		Map<String, Object> map = new HashMap<>();
		map.put("score", matching.getScore());
		map.put("latitude", matching.getLatitude());
		map.put("longitude", matching.getLongitude());
		map.put("game_date", matching.getGame_Date());
		map.put("game_type", matching.getGame_Type());
		map.put("game_time", matching.getGame_Time());
		map.put("hold", matching.getGround_Hold()); // 경기장보유여부

		// 점수 범위
		// 매칭 풀 넣기 전 선매칭(type==1):10
		// 시간다됐을때(type==2):30
		if (type == 1)
			map.put("s_range", 10);
		if (type == 2)
			map.put("s_range", 20);

		// 거리 범위
		if (matching.getGame_Type().equals("축구") || matching.getGame_Type().equals("야구")) {
			// 팀경기인경우 10km (마일표기)
			map.put("d_range", 6.21371);
		} else {
			// 개인경기 3km
			map.put("d_range", 1.86411);
		}
		try{
		sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
		result = sqlSession.selectOne("mapper.MatchingMapper.searchMatching", map);
		System.out.println(result);
		} catch(Exception e) {
			e.printStackTrace();
		}
		/*sqlSession.close();*/
		return result;
	}

	// 매칭타임 다된거 꺼내기
	public List<Matching> getTimeEnd() {
		List<Matching> result = null;
		sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
		result = sqlSession.selectList("mapper.MatchingMapper.getTimeEnd");
		sqlSession.close();
		return result;
	}

	public void deleteMatching(int matching_Id) {
		sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
		sqlSession.delete("mapper.MatchingMapper.deleteMatching", matching_Id);
		sqlSession.commit();
	}

	public void insertGame(Games game) {
		
		try {
			
			sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
			sqlSession.insert("mapper.MatchingMapper.insertGame", game);
			sqlSession.commit();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	// 매칭풀 감시하기

}
