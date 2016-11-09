package action;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.SessionAware;
import com.opensymphony.xwork2.ActionSupport;
import dao.PlayerDAO;
import dao.TeamDAO;
import vo.Events;
import vo.Games;
import vo.Grounds;
import vo.Matching;
import vo.Player;
import vo.Record;
import vo.Team;
import dao.NoticeDAO;
import vo.Notice;

public class PlayerAction extends ActionSupport implements SessionAware {
	Player player;
	Record record;
	Grounds grounds;
	Map<String, Object> session;
	PlayerDAO dao = new PlayerDAO();
	File save;
	String saveFileName;
	List<Matching> schedule;
	List<Games> prevgamelist;
	List<Games> gamelist;
	List<Player> playerlist;
	List<Team> teamlist;
	SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Calendar cal1;
	Calendar cal2;
	Games game;
	Matching matching;
	ArrayList<Notice> notices;
	
	int sports; // 축구==1, 야구==2, 탁구==3, 볼링==4
	String loginId; // session 확인용
	String message; // 에러 메세지 전송용
	// 각 종목별 승률
	int winSC, winBS, winTB, winBW, aver;
	// 종목별 그라운드
	Grounds SCGrounds, BSGrounds, TBGrounds, BWGrounds;

	// method
	// 화면 가져오기
	
	
	
	public String mypagev() {
		// 개인정보 가져오기
		String user_Id = (String) session.get("user_Id");
		player = dao.getUserInfo(user_Id);
		System.out.println("1. 개인정보: " + player.toString());

		// 종목별 전적 가져오기

		// 다시dao
		dao = new PlayerDAO();
		record = dao.getUserRecord(user_Id);
		try {
			winSC = (record.getFb_Win() % record.getFb_Total());
			winBS = (record.getBb_Win() % record.getBb_Total());
			winTB = (record.getPp_Win() % record.getPp_Total());
			winBW = (record.getBl_Win() % record.getBl_Total());
		} catch (Exception e) {
			System.out.println("계산에러");
		}
		aver = (winSC + winBS + winTB + winBW) / 4;
		System.out.println("2. 종목별 승률: " + winSC + ", " + winBS + ", " + winTB + ", " + winBW + ", 평균: " + aver);

		// 종목별 경기장 정보 가져오기
		for(sports=1; sports<=4; sports++) {
			dao=new PlayerDAO();
			System.out.println(sports);
			System.out.println("경기장 정보!!!");
			if(sports==1) SCGrounds=dao.getUserGround(user_Id, sports); else
			if(sports==2) BSGrounds=dao.getUserGround(user_Id, sports); else
			if(sports==3) TBGrounds=dao.getUserGround(user_Id, sports); else
			BWGrounds=dao.getUserGround(user_Id, sports);
		}
		

		NoticeDAO ndao = new NoticeDAO();
		notices = (ArrayList<Notice>) ndao.getNotices((String) session.get("user_Id"));
		
		dao = new PlayerDAO();
		System.out.println(player);
		prevgamelist = dao.prevgamelist(player);
		System.out.println(notices);
		System.out.println(prevgamelist);
		return SUCCESS;
	}

	public String checkNotices() throws Exception {
		try {
			NoticeDAO ndao = new NoticeDAO();
			notices = (ArrayList<Notice>) ndao.getNotices((String) session.get("user_Id"));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String join() throws Exception {
		System.out.println();
		File copy = new File(
				"C://Users//Mac//git//JackpotSportsMatchingService//MatchingService//WebContent//img//" + saveFileName);
		FileUtils.copyFile(save, copy);
		player.setSaveFileName(saveFileName);
		dao.insertUser(player);
		return SUCCESS;
	}

	public String login() throws Exception {
		System.out.println(player);
		player = dao.getUser(player);
		if (player == null) {
			return INPUT;
		} else {
			//매칭할때 팀장인지 아닌지 거르는 정보 필요해서 추가합니다
			
			session.put("user_Id", player.getUser_Id());
			session.put("user_Name", player.getUser_Name());
			session.put("profile", player.getSaveFileName());
			
			
			TeamDAO tdao = new TeamDAO();
			int team1_id = player.getTeam1();
			if(team1_id>0){
				Team team1 = tdao.getTeam(team1_id);
				if(team1!=null){
					if(team1.getTeam_Leader().equals(player.getUser_Id())) session.put("isSCLeader", "true");
					else session.put("isSCLeader", "false");
				}else{
					session.put("isSCLeader", "false");
				}
			}
			int team2_id = player.getTeam2();
			if(team2_id>0){
				Team team2 = tdao.getTeam(team2_id);
				if(team2!=null){
					if(team2.getTeam_Leader().equals(player.getUser_Id())) session.put("isBBLeader", "true");
					else session.put("isBBLeader", "false");
				}else{
					session.put("isBBLeader", "false");
				}
			}
			
			
			return SUCCESS;
		}
	}

	public String logout() throws Exception {
		session.clear();
		return SUCCESS;
	}

	// 매칭 스케줄 리스트 받아오기
	public String getScheduler() throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat();
		SimpleDateFormat sdf2 = new SimpleDateFormat();

		sdf.applyPattern("yyyy-MM-dd HH:mm:ss");
		sdf2.applyPattern("yyyy-MM-dd");
		
		Player plr = new Player();
		plr.setUser_Id((String) session.get("user_Id"));
		plr = dao.getUserInfo(plr.getUser_Id());

		schedule = dao.getMatchingList(plr);

		/*for (Matching m : schedule) {
			cal1 = new GregorianCalendar();
			Date to = transFormat.parse(m.getMatching_Time());
			cal1.setTime(to);
			cal1.add(Calendar.DAY_OF_YEAR, 1);
			cal2 = new GregorianCalendar();
			int i = cal1.compareTo(cal2);
			m.setOnoff(i);
			m.setMatching_End(sdf.format(cal1.getTime()));
			Date dd = transFormat.parse(m.getGame_Date());
			m.setGame_Date(sdf2.format(dd));
		}*/
		for (Matching m : schedule) {
	         cal1 = new GregorianCalendar();
	         Date to = transFormat.parse(m.getMatching_Time());
	         cal1.setTime(to);
	         cal1.add(Calendar.DAY_OF_YEAR, -1);
	         
	         
	         cal2 = new GregorianCalendar();
	         cal2.add(Calendar.DAY_OF_YEAR, 1);
	         
	         int i = cal1.compareTo(cal2);
	         m.setOnoff(i);
	         
	         cal1.add(Calendar.DAY_OF_YEAR, 1);
	         m.setMatching_End(sdf.format(cal1.getTime()));
	         
	         Date dd = transFormat.parse(m.getGame_Date());
	         m.setGame_Date(sdf2.format(dd));
	      }
		return SUCCESS;
		
	}

	int noticenum;

	public String deleteNotice() throws Exception {
		NoticeDAO ndao = new NoticeDAO();
		ndao.deleteNotices(noticenum);
		return SUCCESS;
	}

	public int getNoticenum() {
		return noticenum;
	}

	public void setNoticenum(int noticenum) {
		this.noticenum = noticenum;
	}

	public String prevgamelist() throws Exception {
		Player plr = new Player();
		plr = dao.getUserInfo((String) session.get("user_Id"));
		prevgamelist = dao.prevgamelist(plr);
		return SUCCESS;
	}

	// 게임방 열기
	public String opengameroom() throws Exception {
		System.out.println(game);
		return SUCCESS;
	}

	// 매칭풀에 다시들어가기
	public String tobecontinue() throws Exception {
		System.out.println("123");
		int i = dao.tobecontinue(matching);
		return SUCCESS;
	}

	public String deletematching() throws Exception {
		dao.deletematching(matching);
		return SUCCESS;
	}

	// 개인정보 가져오기
	public String getUserInfo() {
		/*
		 * player.setuser_Id((String)session.get("loginId"));
		 * System.out.println(">> "+player.getuser_Id()+"로 개인정보 가져옵니다.");
		 * player=dao.getUserInfo(player.getuser_Id());
		 */
		/* player=dao.getUserInfo("TEST"); */
		System.out.println(">> 정보 불러오기 완료!");
		return SUCCESS;
	}

	// 종목별 전적 가져오기
	public String getUserRecord() {
		/*
		 * player.setuser_Id((String)session.get("loginId"));
		 * System.out.println(">> "+player.getuser_Id()+"로 종목별 전적 가져옵니다.");
		 * record=dao.getUserRecord(player.getuser_Id());
		 */
		/* record=dao.getUserRecord("TEST"); */
		System.out.println(">> 정보 불러오기 완료!");
		return SUCCESS;
	}

	// 종목별 경기장 정보 가져오기
	public String getUserGround() {
		/*
		 * player.setuser_Id((String)session.get("loginId"));
		 * System.out.println(">> "+player.getuser_Id()+"로 종목별 경기장 정보 가져옵니다.");
		 * grounds=dao.getUserGround(player.getuser_Id());
		 */
		/* grounds=dao.getUserGround("TEST"); */
		System.out.println(">> 정보 불러오기 완료!");
		return SUCCESS;
	}

	public String getpprankinglist() throws Exception {
		playerlist = dao.getpprankinglist();
		return SUCCESS;
	}

	public String ppranksearch() throws Exception {
		playerlist = dao.ppsearch(player);
		return SUCCESS;
	}

	public String getblrankinglist() throws Exception {
		playerlist = dao.getblrankinglist();
		return SUCCESS;
	}

	public String blranksearch() throws Exception {
		playerlist = dao.blsearch(player);
		return SUCCESS;
	}

	public String getscrankinglist() throws Exception {
		dao = new PlayerDAO();
		player = dao.getUserInfo((String) session.get("user_Id"));
		dao = new PlayerDAO();
		teamlist = dao.getscrankinglist();
		return SUCCESS;
	}

	public String getbarankinglist() throws Exception {
		dao = new PlayerDAO();
		player = dao.getUserInfo((String) session.get("user_Id"));
		dao = new PlayerDAO();
		teamlist = dao.getbarankinglist();
		return SUCCESS;
	}

	// session
	@Override
	public void setSession(Map<String, Object> arg0) {
		session = arg0;
	}

	// getter and setter

	public Player getPlayer() {
		return player;
	}

	public void setPlayer(Player player) {
		this.player = player;
	}

	public Record getRecord() {
		return record;
	}

	public void setRecord(Record record) {
		this.record = record;
	}

	public Grounds getGrounds() {
		return grounds;
	}

	public void setGrounds(Grounds grounds) {
		this.grounds = grounds;
	}

	public PlayerDAO getDao() {
		return dao;
	}

	public void setDao(PlayerDAO dao) {
		this.dao = dao;
	}

	public File getSave() {
		return save;
	}

	public void setSave(File save) {
		this.save = save;
	}

	public String getSaveFileName() {
		return saveFileName;
	}

	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}

	public List<Matching> getSchedule() {
		return schedule;
	}

	public void setSchedule(List<Matching> schedule) {
		this.schedule = schedule;
	}

	public List<Games> getPrevgamelist() {
		return prevgamelist;
	}

	public void setPrevgamelist(List<Games> prevgamelist) {
		this.prevgamelist = prevgamelist;
	}

	public List<Games> getGamelist() {
		return gamelist;
	}

	public void setGamelist(List<Games> gamelist) {
		this.gamelist = gamelist;
	}

	public SimpleDateFormat getTransFormat() {
		return transFormat;
	}

	public void setTransFormat(SimpleDateFormat transFormat) {
		this.transFormat = transFormat;
	}

	public Calendar getCal1() {
		return cal1;
	}

	public void setCal1(Calendar cal1) {
		this.cal1 = cal1;
	}

	public Calendar getCal2() {
		return cal2;
	}

	public void setCal2(Calendar cal2) {
		this.cal2 = cal2;
	}

	public Games getGame() {
		return game;
	}

	public void setGame(Games game) {
		this.game = game;
	}

	public Matching getMatching() {
		return matching;
	}

	public void setMatching(Matching matching) {
		this.matching = matching;
	}

	public ArrayList<Notice> getNotices() {
		return notices;
	}

	public void setNotices(ArrayList<Notice> notices) {
		this.notices = notices;
	}

	public int getSports() {
		return sports;
	}

	public void setSports(int sports) {
		this.sports = sports;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getWinSC() {
		return winSC;
	}

	public void setWinSC(int winSC) {
		this.winSC = winSC;
	}

	public int getWinBS() {
		return winBS;
	}

	public void setWinBS(int winBS) {
		this.winBS = winBS;
	}

	public int getWinTB() {
		return winTB;
	}

	public void setWinTB(int winTB) {
		this.winTB = winTB;
	}

	public int getWinBW() {
		return winBW;
	}

	public void setWinBW(int winBW) {
		this.winBW = winBW;
	}

	public int getAver() {
		return aver;
	}

	public void setAver(int aver) {
		this.aver = aver;
	}

	public Grounds getSCGrounds() {
		return SCGrounds;
	}

	public void setSCGrounds(Grounds sCGrounds) {
		SCGrounds = sCGrounds;
	}

	public Grounds getBSGrounds() {
		return BSGrounds;
	}

	public void setBSGrounds(Grounds bSGrounds) {
		BSGrounds = bSGrounds;
	}

	public Grounds getTBGrounds() {
		return TBGrounds;
	}

	public void setTBGrounds(Grounds tBGrounds) {
		TBGrounds = tBGrounds;
	}

	public Grounds getBWGrounds() {
		return BWGrounds;
	}

	public void setBWGrounds(Grounds bWGrounds) {
		BWGrounds = bWGrounds;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public List<Player> getPlayerlist() {
		return playerlist;
	}

	public void setPlayerlist(List<Player> playerlist) {
		this.playerlist = playerlist;
	}

	public List<Team> getTeamlist() {
		return teamlist;
	}

	public void setTeamlist(List<Team> teamlist) {
		this.teamlist = teamlist;
	}

}