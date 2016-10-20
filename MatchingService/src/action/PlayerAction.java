package action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import dao.PlayerDAO;
import vo.Grounds;
import vo.Player;
import vo.Record;

public class PlayerAction extends ActionSupport implements SessionAware {
	Player player;
	Record record;
	Grounds grounds;
	Map<String, Object> session;
	PlayerDAO dao=new PlayerDAO();
	
	String sports;
	String loginId;	//session 확인용
	String message;	//에러 메세지 전송용
	
	
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
	public String getSports() {
		return sports;
	}
	public void setSports(String sports) {
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

	
	//method
	//개인정보 가져오기
	public String getUserInfo() {
	/*	player.setuser_Id((String)session.get("loginId"));
		System.out.println(">> "+player.getuser_Id()+"로 개인정보 가져옵니다.");
		player=dao.getUserInfo(player.getuser_Id());*/
		player=dao.getUserInfo("TEST");
		System.out.println(">> 정보 불러오기 완료!");
		return SUCCESS;
	}
	
	
	//종목별 전적 가져오기
	public String getUserRecord() {
		/*player.setuser_Id((String)session.get("loginId"));
		System.out.println(">> "+player.getuser_Id()+"로 종목별 전적 가져옵니다.");
		record=dao.getUserRecord(player.getuser_Id());*/
		record=dao.getUserRecord("TEST");
		System.out.println(">> 정보 불러오기 완료!");
		return SUCCESS;
	}
	
	//종목별 경기장 정보 가져오기
	public String getUserGround() {
		/*player.setuser_Id((String)session.get("loginId"));
		System.out.println(">> "+player.getuser_Id()+"로 종목별 경기장 정보 가져옵니다.");
		grounds=dao.getUserGround(player.getuser_Id());*/
		grounds=dao.getUserGround("TEST");
		System.out.println(">> 정보 불러오기 완료!");
		return SUCCESS;
	}
	
	
	//session
	@Override
	public void setSession(Map<String, Object> arg0) {
		session=arg0;
	}
}
