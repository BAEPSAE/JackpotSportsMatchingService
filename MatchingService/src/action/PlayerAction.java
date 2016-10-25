
package action;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import dao.PlayerDAO;
import vo.Events;
import vo.Grounds;
import vo.Matching;
import vo.Player;
import vo.Record;

public class PlayerAction extends ActionSupport implements SessionAware {
	Player player;
	Record record;
	Grounds grounds;
	Map<String, Object> session;
	PlayerDAO dao=new PlayerDAO();
	File save;
	String saveFileName;
	List<Matching> schedule;
	List<Events> events;
	String sports;
	
	int sports;	//축구==1, 야구==2, 탁구==3, 볼링==4
	String loginId;	//session 확인용
	String message;	//에러 메세지 전송용
	
	//각 종목별 승률
	int winSC, winBS, winTB, winBW, aver;
	

	//종목별 그라운드
	Grounds SCGrounds, BSGrounds, TBGrounds, BWGrounds;
	
	public String join() throws Exception {
		System.out.println();
		File copy = new File("C://Users//Mac//git//JackpotSportsMatchingService//MatchingService//WebContent//img//" + saveFileName);
		FileUtils.copyFile(save, copy);
		player.setSaveFileName(saveFileName);
		dao.insertUser(player);
		return SUCCESS;
	}
	
	public String login() throws Exception {
		
		System.out.println(player);
		player = dao.getUser(player);
		if(player == null) {
			return INPUT;
		} else {
			session.put("id", player.getUser_Id());
			session.put("name", player.getUser_Name());
			session.put("profile", player.getSaveFileName());
			return SUCCESS;
		}
		
	}
	
	public String logout() throws Exception {
		session.clear();
		
		
		return SUCCESS;
	}
	
	//매칭 스케줄 리스트 받아오기
	public String getScheduler() throws Exception{
		Player plr = new Player();
		plr.setUser_Id("aaa"); //session.loginid로 바꿔야함.
		schedule = dao.getMatchingList(plr);
		events = new ArrayList<Events>();
		
		for(Matching m : schedule){
			String type = m.getLocation() + "\n"+ "VS - FC사우나";
			String date = m.getGame_Date();
			Events eve = new Events();
			eve.setTitle(type);
			eve.setStart(date);
			
			events.add(eve);
		}
		return SUCCESS;
	}
	
	
	//get, set
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
	public List<Events> getEvents() {
		return events;
	}

	public void setEvents(List<Events> events) {
		this.events = events;
	}
	public List<Matching> getSchedule() {
		return schedule;
	}

	public void setSchedule(List<Matching> schedule) {
		this.schedule = schedule;
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
	public int getAver() {
		return aver;
	}
	public void setAver(int aver) {
		this.aver = aver;
	}

	
	//method
	//화면 가져오기
	public String mypagev() {
		//개인정보 가져오기
		player=dao.getUserInfo("TEST");
		System.out.println("1. 개인정보: "+player.toString());
		
		//종목별 전적 가져오기
		record=dao.getUserRecord("TEST");
		winSC=(record.getFb_Win()%record.getFb_Total());
		winBS=(record.getBb_Win()%record.getBb_Total());
		winTB=(record.getPp_Win()%record.getPp_Total());
		winBW=(record.getBl_Win()%record.getBl_Total());
		aver=(winSC+winBS+winTB+winBW)/4;
		System.out.println("2. 종목별 승률: "+winSC+", "+winBS+", "+winTB+", "+winBW+", 평균: "+aver);
		
		//종목별 경기장 정보 가져오기
		//축구
		for(sports=1; sports<=4; sports++) {
			dao=new PlayerDAO();
			if(sports==1) SCGrounds=dao.getUserGround("TEST", sports);
			else if(sports==2) BSGrounds=dao.getUserGround("TEST", sports);
			else if(sports==3) TBGrounds=dao.getUserGround("TEST", sports);
			else BWGrounds=dao.getUserGround("TEST", sports);
		}
		return SUCCESS;
	}
	
	//개인정보 가져오기
	public String getUserInfo() {
	/*	player.setuser_Id((String)session.get("loginId"));
		System.out.println(">> "+player.getuser_Id()+"로 개인정보 가져옵니다.");
		player=dao.getUserInfo(player.getuser_Id());*/
		/*player=dao.getUserInfo("TEST");*/
		System.out.println(">> 정보 불러오기 완료!");
		return SUCCESS;
	}
	
	
	//종목별 전적 가져오기
	public String getUserRecord() {
		/*player.setuser_Id((String)session.get("loginId"));
		System.out.println(">> "+player.getuser_Id()+"로 종목별 전적 가져옵니다.");
		record=dao.getUserRecord(player.getuser_Id());*/
		/*record=dao.getUserRecord("TEST");*/
		System.out.println(">> 정보 불러오기 완료!");
		return SUCCESS;
	}
	
	//종목별 경기장 정보 가져오기
	public String getUserGround() {
		/*player.setuser_Id((String)session.get("loginId"));
		System.out.println(">> "+player.getuser_Id()+"로 종목별 경기장 정보 가져옵니다.");
		grounds=dao.getUserGround(player.getuser_Id());*/
		/*grounds=dao.getUserGround("TEST");*/
		System.out.println(">> 정보 불러오기 완료!");
		return SUCCESS;
	}
	
	
	//session
	@Override
	public void setSession(Map<String, Object> arg0) {
		session=arg0;
	}
}