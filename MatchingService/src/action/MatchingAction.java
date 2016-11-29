package action;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import dao.GroundDAO;
import dao.MatchingDAO;
import dao.MessageDAO;
import dao.NoticeDAO;
import dao.PlayerDAO;
import dao.TeamDAO;
import vo.Games;
import vo.Ground_Review;
import vo.Grounds;
import vo.Item;
import vo.Matching;
import vo.Message;
import vo.Notice;
import vo.Player;
import vo.Team;

public class MatchingAction extends ActionSupport implements SessionAware {
	/*
	 * 고친 이름들
	 * 1. setGame -> openGameRoom
	 * 2. getMsg -> arrivedMsg
	 */
	Matching matching;
	MatchingDAO dao = new MatchingDAO();
	PlayerDAO playerDao = new PlayerDAO();  //개인 스코어
	TeamDAO teamDao = new TeamDAO(); 		//팀 스코어
	GroundDAO groundsDao = new GroundDAO();	//그라운드 정보
	MessageDAO dao1 = new MessageDAO();		//채팅용 메세지를 가지고 온다.

	String user_Id;			//로그인 아이디
	Map<String, Object> session;
	
	int sports; 		// 축구==1, 야구==2, 탁구==3, 볼링==4: jsp에서 가지고 온다.
	String cutDate; 	// 데이터 자르기 용: jsp에서 가지고 옴
	String validGame;   //게임 신청 가능한지 안한지..
	
	Player player;
	Team team;
	Grounds getGround;
	
	//message
	private Message message;
	private List<Message> list;
	
	//grounds
	private Item item;
	private Games games;
	private String ground_Id;
	private List<Ground_Review> groundList;
	private Ground_Review gr;
	private ArrayList<Item> item_list;
	private int ground_Id1;
		private ArrayList<Item> home_list=new ArrayList<>();
	    private ArrayList<Item> away_list=new ArrayList<>();
	
	String key;		//game resultKey
	String ground_name; // Hold가 1일 경우 그라운드 이름으로 위도 경도를 검색

	
	// get, set
	public String getGround_name() {
		return ground_name;
	}
	public void setGround_name(String ground_name) {
		this.ground_name = ground_name;
	}
	public Grounds getGetGround() {
		return getGround;
	}
	public void setGetGround(Grounds getGround) {
		this.getGround = getGround;
	}
	public Matching getMatching() {
		return matching;
	}
	public void setMatching(Matching matching) {
		this.matching = matching;
	}
	public String getUser_Id() {
		return user_Id;
	}
	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}
	public int getSports() {
		return sports;
	}
	public void setSports(int sports) {
		this.sports = sports;
	}
	public Player getPlayer() {
		return player;
	}
	public void setPlayer(Player player) {
		this.player = player;
	}
	public Team getTeam() {
		return team;
	}
	public void setTeam(Team team) {
		this.team = team;
	}
	public String getCutDate() {
		return cutDate;
	}
	public void setCutDate(String cutDate) {
		this.cutDate = cutDate;
	}
	public Message getMessage() {
		return message;
	}
	public void setMessage(Message message) {
		this.message = message;
	}
	public List<Message> getList() {
		return list;
	}
	public void setList(List<Message> list) {
		this.list = list;
	}
	public List<Ground_Review> getGroundList() {
		return groundList;
	}
	public void setGroundList(List<Ground_Review> groundList) {
		this.groundList = groundList;
	}
	public String getGround_Id() {
		return ground_Id;
	}
	public void setGround_Id(String ground_Id) {
		this.ground_Id = ground_Id;
	}
	public Ground_Review getGr() {
		return gr;
	}
	public void setGr(Ground_Review gr) {
		this.gr = gr;
	}
	public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
	}
	public ArrayList<Item> getItem_list() {
		return item_list;
	}
	public void setItem_list(ArrayList<Item> item_list) {
		this.item_list = item_list;
	}
	public Games getGames() {
		return games;
	}
	public void setGames(Games games) {
		this.games = games;
	}
	public int getGround_Id1() {
		return ground_Id1;
	}
	public void setGround_Id1(int ground_Id1) {
		this.ground_Id1 = ground_Id1;
	}
	public String getValidGame() {
		return validGame;
	}
	public void setValidGame(String validGame) {
		this.validGame = validGame;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public ArrayList<Item> getHome_list() {
		return home_list;
	}
	public void setHome_list(ArrayList<Item> home_list) {
		this.home_list = home_list;
	}
	public ArrayList<Item> getAway_list() {
		return away_list;
	}
	public void setAway_list(ArrayList<Item> away_list) {
		this.away_list = away_list;
	}

	
	//method
	public String gameResultv(){
		games = new Games();
		games.setGame_Id(Integer.parseInt(ground_Id));
		MessageDAO mdao = new MessageDAO();
		Games g1 = mdao.searchGame(games);
		if(session.get("user_Id").equals(g1.getPlayer1())){
			key = g1.getPlayer1_Key();
		}else{
			key = g1.getPlayer2_Key();
		}
		return SUCCESS;
	}
	
	// 인덱스 분기를 위한 메소드
	public String index_matching() {
		session.put("sports", sports);
		return SUCCESS;
	}
	
	//Matching 버튼을 눌렀을 때 인원수, 리더 여부 등을 검사함
	public String checkMatching() throws Exception{
		user_Id=(String)session.get("user_Id");
		if(sports==1){
			if(session.get("isSCLeader").equals("true")){
				//팀멤버수 가져와서 모자라면 게임안됨
				PlayerDAO pdao = new PlayerDAO();
				Player player = pdao.getUserInfo(user_Id);
				int memberCount = new TeamDAO().getMemberCount(1, player.getTeam1());
				if(memberCount<11){
					validGame = "notEnoughMember";
					return SUCCESS;
				} 
			}else{
				validGame = "notLeader";
				return SUCCESS;
			}
		}
		if(sports==2){
			if(session.get("isBBLeader").equals("true")){
				PlayerDAO pdao = new PlayerDAO();
				Player player = pdao.getUserInfo(user_Id);
				int memberCount = new TeamDAO().getMemberCount(2, player.getTeam2());
				if(memberCount<9){
					validGame = "notEnoughMember";
					return SUCCESS;
				} 
			}else{
				validGame = "notLeader";
				return SUCCESS;
			}
		}
		
		Matching tmpMatching=dao.checkMatching(user_Id, sports);
		if(tmpMatching == null) {
			validGame="goMatch";
			return SUCCESS;
		}else{
			validGame="stopMatch";
			return SUCCESS;
		} 
	}
	
	//Matching풀에 희망 경기를 등록한다.
	public String insertMatching() throws Exception{
		user_Id = (String) session.get("user_Id"); // session을 검사함
		matching.setPlayer(user_Id); // 1. 매칭풀에 들어갈 player을 설정

		// TODO: 팀일 경우 리더가 아니면 return
		// 2, 3. [Score] 개인인지 팀인지를 구분함
		playerDao = new PlayerDAO();
		teamDao = new TeamDAO();
		player = playerDao.getUserInfo(user_Id);
		switch (sports) { // 1, 2==팀, 3, 4==개인
		case 1: { // 축구
			team = teamDao.getTeam(player.getTeam1());
			if (team == null)
				System.out.println("null!!!");
			matching.setScore(team.getTeam_Score()); // 스코어 세팅
			matching.setGame_Type("축구"); // 종목 세팅
			break;
		}
		case 2: { // 야구
			team = teamDao.getTeam(player.getTeam2());
			matching.setScore(team.getTeam_Score());
			matching.setGame_Type("야구");
			break;
		}
		case 3: { // 탁구
			matching.setScore((int) player.getPp_Score());
			matching.setGame_Type("탁구");
			break;
		}
		case 4: { // 볼링
			matching.setScore((int) player.getBl_Score());
			matching.setGame_Type("볼링");
			break;
		}
		}
		// 4. 날짜와 시간을 정한다.
		String date = cutDate.split(" ")[0];
		String time = cutDate.split(" ")[1];
		String turn = cutDate.split(" ")[2];

		// date
		String day = date.split("/")[0];
		String month = date.split("/")[1];
		String year = date.split("/")[2];

		// time
		String stF = time.split(" ")[0];
		String tmpTime = stF.split(":")[0];

		// AM일 경우 원래대로, PM일 경우 +12시간
		if (turn.equals("AM"))
			time = tmpTime;
		// 24시간 time 변환
		else {
			int tmpCal = Integer.parseInt(tmpTime) + 12;
			time = String.valueOf(tmpCal);
		}
		date = year + "/" + day + "/" + month;

		// time 분기
		// 6/1, 9/2, 12/3, 15/4, 18/5
		if (Integer.parseInt(time) < 9)
			time = "1";
		else if (Integer.parseInt(time) < 12)
			time = "2";
		else if (Integer.parseInt(time) < 15)
			time = "3";
		else if (Integer.parseInt(time) < 18)
			time = "4";
		else
			time = "5";
		matching.setGame_Date(date);
		matching.setGame_Time(Integer.parseInt(time));
		// 경기장 확인
		if (matching.getGround_Hold() == 1) {
			groundsDao = new GroundDAO();
			getGround = groundsDao.getLaLo(ground_name);
			matching.setLatitude(getGround.getGround_Latitude());
			matching.setLongitude(getGround.getGround_Longitude());
		}

		// 풀에 넣기전에 검사하기
		Matching rival = searchMatching(matching, 1);
		if (rival != null) {
			System.out.println("!!!매칭됨!!!");
			openGameRoom(matching, rival);
		} else {
			// Matching으로 이동
			System.out.println("!!!매칭실패!!!");
			dao = new MatchingDAO();
			dao.insertMatching(matching);
			System.out.println("!!!등록 완료!!!");
		}
		return SUCCESS;
	}

	// 매칭 상대 찾는 메소드
	public Matching searchMatching(Matching matching, int type) {
		// type 1은 매칭풀에 들어오기 전에 검사함(기준 스코어+-10)
		// type 2는 매칭 시간 다됐을때 검사 스코어+-20, 직선거리 10km이내(팀), 개인은 3km이내
		Matching result = null;
		MatchingDAO mdao = new MatchingDAO();
		result = mdao.searchMatching(matching, type);
		return result;
	}

	// 매칭 연결됐을때 매칭풀에서 삭제하고 게임까지 넣고 메세지 알림
	public void openGameRoom(Matching match1, Matching match2) {
		// 새 게임 객체 세팅
		Games game = new Games();
		game.setPlayer1(match1.getPlayer());
		game.setPlayer2(match2.getPlayer());
		game.setGame_Type(match1.getGame_Type());

		if (match1.getGround_Hold() == 1) {
			// 그라운드에서 검색해오는지요..?
			int ground_Id = 1;
			game.setGround_Id(ground_Id);
		} else if (match2.getGround_Hold() == 1) {
			int ground_Id = 2;
			game.setGround_Id(ground_Id);
		} else {
			game.setP1_latitude(match1.getLatitude());
			game.setP1_longitude(match1.getLongitude());
			game.setP2_latitude(match2.getLatitude());
			game.setP2_longitude(match2.getLongitude());
		}

		String key = (int) Math.floor(Math.random() * 899999) + 100000 + "";

		String player1 = key.substring(0, 3);
		String player2 = key.substring(3, 6);

		game.setPlayer1_Key(player1);
		game.setPlayer2_Key(player2);
		
		// DB입력
		MatchingDAO mdao = new MatchingDAO();
		mdao.insertGame(game);
		mdao.deleteMatching(match1.getMatching_Id());
		mdao.deleteMatching(match2.getMatching_Id());
		NoticeDAO ndao = new NoticeDAO();
		ndao.insertNotice(new Notice(match1.getPlayer(), 1));
		ndao.insertNotice(new Notice(match2.getPlayer(), 1));
	}

	//채팅용
	//XXX: 
	public String sendMsg() throws Exception {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date d = new Date();
		String date = format.format(d);
		message.setUser_Id((String)session.get("user_Id")); // 나중에 세션 아이디로 고쳐야함
		message.setInputDate(date);
		// message.setGame_Id("1"); // TODO: 나중에 제대로 고쳐야함
		dao1.insertMsg(message);
		return SUCCESS;
	}
	
	public String arrivedMsg() throws Exception {
		list = dao1.selectMsg(ground_Id1); // parameter game_id 로 바꿔야함
		return SUCCESS;
	}

	// 게임 매칭 실패했을때
	public void failSetGame(Matching matching) {
		// 실패했다는 메세지 저장하고 보류
		NoticeDAO ndao = new NoticeDAO();
		ndao.insertNotice(new Notice(matching.getPlayer(), 2));

	}
	
	//
	public String select_Ground() throws Exception {
		games = dao1.searchGame(games);
		int type=0;
		if (games.getGround_Id() == 0) {
			
			if( games.getGame_Type().equals("축구"))
			  {
				  type=1;
			  }else if( games.getGame_Type().equals("야구"))
			  {
				  type=2;
			  }else if( games.getGame_Type().equals("볼링"))
			  {
				  type=3;
			  }else
				  type=4;
			  
			  item_list = dao1.selectItem(1);
		         
		       //    double lat2=Double.parseDouble(games.getP1_latitude());//game 테이블에 있는 위도 받아서 더블형으로 변환.
		       //    double lon2=Double.parseDouble(games.getP1_longitude());//플레이어 1부터 계산한후에 플레이어 2도 똑같이 계산해야함.어떻게 부르지.
		      home_list=compare_sort(item_list,Double.parseDouble(games.getP1_latitude()), Double.parseDouble(games.getP1_longitude()));  
		      away_list=compare_sort(item_list, Double.parseDouble(games.getP2_latitude()), Double.parseDouble(games.getP2_longitude()));  
		} else {
			item = dao1.ground(games.getGround_Id());
		}
		return SUCCESS;
	}

	//
	public double distance(double lat1, double lon1,double lat2,double lon2) {

	      // double   lat2=Double.parseDouble(games.getP1_latitude());
	      // double lon2=Double.parseDouble(games.getP1_longitude());
	          
	         double theta = lon1 - lon2;
	         double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2))
	               + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));

	         dist = Math.acos(dist);
	         dist = rad2deg(dist);
	         dist = dist * 60 * 1.1515;
	         dist = dist * 1.609344; // 킬로미터로 변환

	         return (dist);
	      }
	
	 // This function converts decimal degrees to radians
    private static double deg2rad(double deg) {
        return (deg * Math.PI / 180.0);
    }
     
    // This function converts radians to decimal degrees
    private static double rad2deg(double rad) {
        return (rad * 180 / Math.PI);
    }


	public String insert_Ground() throws Exception {
		if (item.getGround_name().contains("축구")) {
			item.setGround_type(1); // 1=축구 2=야구 3==볼링 4==탁구
		} else if (item.getGround_name().contains("야구")) {
			item.setGround_type(2); // 1=축구 2=야구 3==볼링 4==탁구
		} else if (item.getGround_name().contains("볼링")) {
			item.setGround_type(3); // 1=축구 2=야구 3==볼링 4==탁구
		} else
			item.setGround_type(4);

		dao1.insertGround(item);

		return SUCCESS;
	}

	//경기장 리뷰
	public String review() throws Exception {
		groundList = dao1.selectReview(Integer.parseInt(ground_Id));
		item = dao1.ground(Integer.parseInt(ground_Id));

		return SUCCESS;
	}
	public String comment() throws Exception {
		gr.setGround_Id(Integer.parseInt(ground_Id));
		gr.setUser_Id((String)session.get("user_Id")); // 나중에 세션으로 고쳐야함
		dao1.comment(gr);

		return SUCCESS;
	}
	
	//
	public String select() throws Exception {
		System.out.println(games);
		dao1.select(games);

		return SUCCESS;
	}
	
	//result 입력
	//승리
	public String win() throws Exception {
		item.setGround_address((String)session.get("user_Id")); // 나중에 세션으로 고쳐야함
		boolean result = dao1.key(item);
		if (!result) {
			sports = 2;
			return INPUT;
		}
		sports = 1;
		return SUCCESS;

	}
	
	//비김
	public String draw() throws Exception {
		item.setGround_address((String)session.get("user_Id"));
		boolean result = dao1.key2(item);
		if (!result) {
			sports = 2;
			return INPUT;
		}
		sports = 1;
		return SUCCESS;
	}
	
	//경기장 추천
	 public  ArrayList<Item> compare_sort(ArrayList<Item> list  ,double p_lat,double p_lon) {//거리 계산후 최저기리 세개 경기장만 뽑아주는 메소드
	      ArrayList<Item> result=new ArrayList<>();
	      for(int j=list.size();j>0;j--){   //버블정렬로 아이템 리스트 순서 바꿈
	    	  for(int i=0;i<j-1;i++){
	    		  double lat1=Double.parseDouble(list.get(i).getGround_latitude());
	    		  double lon1=Double.parseDouble(list.get(i).getGround_longitude());
	    		  double dist1=distance(lat1, lon1,p_lat,p_lon);
	    		  double lat2=Double.parseDouble(list.get(i+1).getGround_latitude());
	    		  double lon2=Double.parseDouble(list.get(i+1).getGround_longitude());
	    		  double dist2=distance(lat2, lon2,p_lat,p_lon);
	    		  if(dist1>dist2){
	    			  Item temp=list.get(i);
	    			  list.set(i, list.get(i+1));
	    			  list.set(i+1, temp);
	    		  }
	    	  }
	      }

	   for(int i=0;i<3;i++){   //세개까지만 슉슉뽑을꺼얌
	         result.add(item_list.get(i));
	      }
	   return result;
	   }
	 
 	// session
	@Override
	public void setSession(Map<String, Object> arg0) {
		session = arg0;
	}
}//class


