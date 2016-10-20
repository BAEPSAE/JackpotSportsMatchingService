package action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import dao.PlayerDAO;
import vo.Player;
import vo.Team;

public class PlayerAction extends ActionSupport implements SessionAware {
	Player player;
	/*Team team;
	Matching matching;*/
	Map<String, Object> session;
	PlayerDAO dao=new PlayerDAO();
	
	String loginId;	//session 확인용
	String message;	//에러 메세지 전송용
	
	
	//get, set
	public Player getPlayer() {
		return player;
	}
	public void setPlayer(Player player) {
		this.player = player;
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
		loginId=(String)session.get("loginId");
		System.out.println(">> "+loginId+"로 정보를 가져옵니다.");
		return SUCCESS;
	}
	
	//종목별 전적 가져오기
	public String getUserRecord() {
		return SUCCESS;
	}
	
	//종목별 경기장 정보 가져오기
	public String getUserGround() {
		return SUCCESS;
	}
	
	//session
	@Override
	public void setSession(Map<String, Object> arg0) {
		session=arg0;
	}
	
}
