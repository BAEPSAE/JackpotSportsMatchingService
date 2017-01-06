package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.Games;
import vo.Ground_Review;
import vo.Item;
import vo.Message;
import vo.Player;
import vo.Team;

public class MessageDAO {
	SqlSession sqlSession = null;

	// msg 등록
	public void insertMsg(Message message) {
		sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
		try {
			sqlSession.insert("mapper.MatchingMapper.sendMsg", message);
			sqlSession.commit();

		} catch (Exception e) {
			e.printStackTrace();
		}
		sqlSession.close();
	}

	// msg 긁어오기
	public List<Message> selectMsg(int game_Id) {
		sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
		List<Message> list = new ArrayList<>();
		try {
			list = sqlSession.selectList("mapper.MatchingMapper.getMsg", game_Id);
			sqlSession.commit();

		} catch (Exception e) {
			e.printStackTrace();
		}
		sqlSession.close();
		return list;
	}

	public void insertGround(Item item) {
		sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
		try {
			sqlSession.insert("mapper.MatchingMapper.insertGround", item);
			sqlSession.commit();

		} catch (Exception e) {
			e.printStackTrace();
		}
		sqlSession.close();
	}

	public ArrayList<Item> selectItem(int type) {
		sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
		List<Item> list = null;
		try {
			list = sqlSession.selectList("mapper.MatchingMapper.getItem", type);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		sqlSession.close();
		return (ArrayList<Item>) list;
	}

	public List<Ground_Review> selectReview(int ground_Id) {
		sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
		List<Ground_Review> list = new ArrayList<>();
		try {
			list = sqlSession.selectList("mapper.MatchingMapper.review", ground_Id);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		sqlSession.close();
		return list;

	}

	public void comment(Ground_Review gr) {
		sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
		try {
			sqlSession.insert("mapper.MatchingMapper.comment", gr);
			sqlSession.commit();

		} catch (Exception e) {
			e.printStackTrace();
		}
		sqlSession.close();
	}

	public Item ground(int ground_Id) {
		sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
		Item gr = null;
		try {
			gr = sqlSession.selectOne("mapper.MatchingMapper.ground", ground_Id);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		sqlSession.close();
		return gr;
	}

	public void select(Games games) {
		sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
		try {
			sqlSession.update("mapper.MatchingMapper.select", games);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		sqlSession.close();
	}
	
	public void win(Item item) {
		sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
		try {
			sqlSession.update("mapper.MatchingMapper.select");
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		sqlSession.close();
	}
	
	public boolean key(Item item) {
		sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
		Games games = null;
		try {
			games = sqlSession.selectOne("mapper.MatchingMapper.key", item);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		String key1 = games.getPlayer1_Key();
		String key2 = games.getPlayer2_Key();
		if(item.getGround_id().equals(key1)) {
			if(item.getGround_name().equals(key2)) {
				winner(item, games);
				deleteChat(item);
				return true;
			}
		}
		
		if(item.getGround_id().equals(key2)) {
			if(item.getGround_name().equals(key1)) {
				winner(item, games);
				deleteChat(item);
				return true;
			}
		}
		sqlSession.close();
		return false;
	}
	
	public boolean key2(Item item) {
		sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
		Games games = null;
		try {
			games = sqlSession.selectOne("mapper.MatchingMapper.key", item);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		String key1 = games.getPlayer1_Key();
		String key2 = games.getPlayer2_Key();
		if(item.getGround_id().equals(key1)) {
			if(item.getGround_name().equals(key2)) {
				draw(item);
				deleteChat(item);
				return true;
			}
		}
		
		if(item.getGround_id().equals(key2)) {
			if(item.getGround_name().equals(key1)) {
				draw(item);
				deleteChat(item);
				return true;
			}
		}
		sqlSession.close();
		return false;
	}
	
	public void winner(Item item, Games games) {
		sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
		try {
			sqlSession.update("mapper.MatchingMapper.winner", item);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		score(games);
		sqlSession.close();
	}
	
	public void draw(Item item) {
		sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
		try {
			sqlSession.update("mapper.MatchingMapper.draw", item);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		sqlSession.close();
	}
	
	public void deleteChat(Item item) {
		sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
		try {
			sqlSession.delete("mapper.MatchingMapper.deleteChat", item);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		sqlSession.close();
	}
	
	public Games searchGame(Games games) {
		sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
		Games g = null;
		try {
			g = sqlSession.selectOne("mapper.MatchingMapper.searchGame", games);
			sqlSession.commit();

		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("dao 안 g : " + g);
		sqlSession.close();
		return g;
	}
	
	public void score(Games games) {
		
		//게임아이디만 받아와서 플레이어 빼서 팀 증감 점수 계산하고
		//아이디 들어가는 hashmap으로 바꿔서 넣기
		
		String winner = null;
		String loser = null;
		HashMap<String, Object> winset = new HashMap<>();
		HashMap<String, Object> loseset = new HashMap<>();
		
		sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
		
		winner = games.getWinner_Id();
		if(winner.equals(games.getPlayer1())){
			loser = games.getPlayer2();
		}else{
			loser = games.getPlayer1();
		}
		
		//둘 승점 가져오기
		
		Player winp = null;
		Player losep = null;
		
		winp = sqlSession.selectOne("mapper.PlayerMapper.getUserInfo", winner);
		losep = sqlSession.selectOne("mapper.PlayerMapper.getUserInfo", loser);
		
		if(games.getGame_Type().equals("축구")){
			
			//축구면 팀스코어 가져와야됨
			Team wint = null;
			Team loset = null;
			
			wint = sqlSession.selectOne("mapper.TeamMapper.getTeam", winp.getTeam1());
			loset = sqlSession.selectOne("mapper.TeamMapper.getTeam", losep.getTeam1());
			
			int wins = wint.getTeam_Score();
			int loses = loset.getTeam_Score();
			
			if(wins-loses<=0){
				//승점 더 낮은팀이 이겼으면 +-5
				winset.put("team_Id", wint.getTeam_Id());
				winset.put("score", wins+5);
				loseset.put("team_Id", loset.getTeam_Id());
				loseset.put("score", loses-5);
				
			}else{
				//걍 잘하는 팀이 이겼으면 +-3
				winset.put("team_Id", wint.getTeam_Id());
				winset.put("score", wins+3);
				loseset.put("team_Id", loset.getTeam_Id());
				loseset.put("score", loses-3);
			}
			
			
		}
		
		
		try {
			sqlSession.update("mapper.MatchingMapper.updateScore", winset);
			sqlSession.update("mapper.MatchingMapper.updateScore", loseset);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		sqlSession.close();
	}
	

}
