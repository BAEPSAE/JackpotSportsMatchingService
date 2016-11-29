package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;

import vo.Games;
import vo.Grounds;
import vo.Matching;
import vo.Player;
import vo.Record;
import vo.Team;

public class PlayerDAO {
	SqlSession sqlSession=null;
	
	//개인정보 가져오기
	public Player getUserInfo(String user_Id) {
		Player getInfo=new Player();
		try{
		sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
		getInfo = sqlSession.selectOne("mapper.PlayerMapper.getUserInfo", user_Id);
		} catch (Exception e) {
			// TODO: handle exception
		e.printStackTrace();
		}
		sqlSession.close();
		return getInfo;
	}
		
	//종목별 전적 가져오기
	public Record getUserRecord(String user_Id) {
		Record getRecord=new Record();
		try {
			sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
			getRecord=sqlSession.selectOne("mapper.PlayerMapper.getUserRecord", user_Id);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		sqlSession.close();
		return getRecord;
	}
	
	//종목별 경기장 정보 가져오기
	public Grounds getUserGround(String user_Id, int sports) {
		Grounds getGrounds=new Grounds();
		try {
		sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
		Map<String, Object> map=new HashMap<>();
		map.put("user_Id", user_Id);
		map.put("sports", sports);	//축구==1, 야구==2, 탁구==3, 볼링==4
		getGrounds=sqlSession.selectOne("mapper.PlayerMapper.getUserGround", map);
		
		} catch(Exception e) {
			e.printStackTrace();
		}
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
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		sqlSession.close();
	}
	
	public Player getUser(Player player) {
		sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
		System.out.println("dao안" + player);
		Player p = null;
		try {
			p = sqlSession.selectOne("mapper.PlayerMapper.getUser", player);
			sqlSession.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		sqlSession.close();
		return p;
	}
	
	//개인의 매칭정보 리스트 가져오기
		public List<Matching> getMatchingList(Player player){
			sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
			List<Matching> result1 = new ArrayList<Matching>();
			List<Matching> result2 = new ArrayList<Matching>();
			List<Matching> result3 = new ArrayList<Matching>();
			System.out.println(player);
			
			result1 = sqlSession.selectList("mapper.PlayerMapper.getMatchingList1", player);
			
			if(player.getTeam1_Flag() == 1){
				result2 = sqlSession.selectList("mapper.PlayerMapper.getMatchingList2", ""+player.getTeam1());	
			}
			
			if(player.getTeam2_Flag() == 1){
				result3 = sqlSession.selectList("mapper.PlayerMapper.getMatchingList3", ""+player.getTeam2());	
			}
					
			for(Matching m : result2){
				result1.add(m);
			}
			for(Matching m : result3){
				result1.add(m);
			}
			return result1;
		}
		//지난경기리스트 가져오기
		public List<Games> prevgamelist(Player player){
			sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
			List<Games> result1 = new ArrayList<Games>();
			List<Games> result2 = new ArrayList<Games>();
			List<Games> result3 = new ArrayList<Games>();
			result1 = sqlSession.selectList("mapper.PlayerMapper.prevgamelist1", player);
			result2 = sqlSession.selectList("mapper.PlayerMapper.prevgamelist2", ""+player.getTeam1());
			result3 = sqlSession.selectList("mapper.PlayerMapper.prevgamelist3", ""+player.getTeam2());

			for(Games g : result2){
				result1.add(g);
			}for(Games g : result3){
				result1.add(g);
			}
			sqlSession.close();
			return result1;
		}

		//매칭시작시간을 현재시간으로 다시 넣기
		public int tobecontinue(Matching matching) throws Exception{
			int result = 0;
			System.out.println(matching);
			sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
			result = sqlSession.update("mapper.PlayerMapper.tobecontinue", matching);
			sqlSession.commit();
			sqlSession.close();
			
			return result;
		}
		public int deletematching(Matching matching){
	         int result = 0;
	         sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
	         result = sqlSession.delete("mapper.PlayerMapper.deletematching", matching);
	         sqlSession.commit();
	         sqlSession.close();
	         return result;
	      }
		
		public List<Player> getpprankinglist(){
	         sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
	         List<Player> plist = new ArrayList<>();
	         plist = sqlSession.selectList("mapper.PlayerMapper.getpprankinglist");
	         sqlSession.close();
	         return plist;
	      }
	      public List<Player> ppsearch(Player player){
	         sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
	         List<Player> plist = new ArrayList<>();
	         plist = sqlSession.selectList("mapper.PlayerMapper.ppsearch", player);
	         sqlSession.close();
	         return plist;
	      }
	      public List<Player> getblrankinglist(){
	         sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
	         List<Player> plist = new ArrayList<>();
	         plist = sqlSession.selectList("mapper.PlayerMapper.getblrankinglist");
	         sqlSession.close();
	         return plist;
	      }
	      public List<Player> blsearch(Player player){
	         sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
	         List<Player> plist = new ArrayList<>();
	         plist = sqlSession.selectList("mapper.PlayerMapper.blsearch", player);
	         sqlSession.close();
	         return plist;
	      }
	      public List<Team> getscrankinglist(){
	         sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
	         List<Team> tlist = new ArrayList<>();
	         tlist = sqlSession.selectList("mapper.PlayerMapper.getscrankinglist");
	         sqlSession.close();
	         return tlist;
	      }
	      public List<Team> getbarankinglist(){
	         sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
	         List<Team> tlist = new ArrayList<>();
	         tlist = sqlSession.selectList("mapper.PlayerMapper.getbarankinglist");
	         sqlSession.close();
	         return tlist;
	      }
}