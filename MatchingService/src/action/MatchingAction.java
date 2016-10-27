package action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import dao.MatchingDAO;
import vo.Matching;

public class MatchingAction extends ActionSupport implements SessionAware {
	Matching matching;
	MatchingDAO dao=new MatchingDAO();
	Map<String, Object> session;
	
	
	//get, set
	public Matching getMatching() {
		return matching;
	}
	public void setMatching(Matching matching) {
		this.matching = matching;
	}
	
	
	//method
	
	//session
	@Override
	public void setSession(Map<String, Object> arg0) {
		session=arg0;
	}
}
