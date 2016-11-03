package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.Games;
import vo.Ground_Review;
import vo.Item;
import vo.Message;

public class MessageDAO {
	SqlSession sqlSession = MybatisConfig.getSqlSessionFactory().openSession();

	// msg 등록
	public void insertMsg(Message message) {
		try {
			sqlSession.insert("mapper.MatchingMapper.sendMsg", message);
			sqlSession.commit();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// msg 긁어오기
	public List<Message> selectMsg(int game_Id) {
		List<Message> list = new ArrayList<>();
		try {
			list = sqlSession.selectList("mapper.MatchingMapper.getMsg", game_Id);
			sqlSession.commit();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public void insertGround(Item item) {
		try {
			sqlSession.insert("mapper.MatchingMapper.insertGround", item);
			sqlSession.commit();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Item> selectItem(int type) {
		List<Item> list = null;
		try {
			list = sqlSession.selectList("mapper.MatchingMapper.getItem", type);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return (ArrayList<Item>) list;
	}

	public List<Ground_Review> selectReview(int ground_Id) {
		List<Ground_Review> list = new ArrayList<>();
		try {
			list = sqlSession.selectList("mapper.MatchingMapper.review", ground_Id);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public void comment(Ground_Review gr) {
		try {
			sqlSession.insert("mapper.MatchingMapper.comment", gr);
			sqlSession.commit();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Item ground(int ground_Id) {
		Item gr = null;
		try {
			gr = sqlSession.selectOne("mapper.MatchingMapper.ground", ground_Id);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return gr;
	}

	public void select(Games games) {
		try {
			sqlSession.update("mapper.MatchingMapper.select", games);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void win(Item item) {
		try {
			sqlSession.update("mapper.MatchingMapper.select");
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public boolean key(Item item) {
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
		
		return false;
	}
	
	public boolean key2(Item item) {
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
		return false;
	}
	
	public void winner(Item item) {
		try {
			sqlSession.update("mapper.MatchingMapper.winner", item);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void draw(Item item) {
		try {
			sqlSession.update("mapper.MatchingMapper.draw", item);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteChat(Item item) {
		try {
			sqlSession.delete("mapper.MatchingMapper.deleteChat", item);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Games searchGame(Games games) {
		Games g = null;
		try {
			g = sqlSession.selectOne("mapper.MatchingMapper.searchGame", games);
			sqlSession.commit();

		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("dao 안 g : " + g);
		return g;
	}
	
	

}
