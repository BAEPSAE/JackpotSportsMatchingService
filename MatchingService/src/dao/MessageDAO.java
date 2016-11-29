package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.Games;
import vo.Ground_Review;
import vo.Item;
import vo.Message;

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
				winner(item);
				deleteChat(item);
				return true;
			}
		}
		
		if(item.getGround_id().equals(key2)) {
			if(item.getGround_name().equals(key1)) {
				winner(item);
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
	
	public void winner(Item item) {
		sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
		try {
			sqlSession.update("mapper.MatchingMapper.winner", item);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		score();
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
	
	public void score() {
		sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
		try {
			sqlSession.update("mapper.MatchingMapper.score1");
			sqlSession.update("mapper.MatchingMapper.score2");
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		sqlSession.close();
	}
	

}
