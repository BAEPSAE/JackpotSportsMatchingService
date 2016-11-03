package interceptor;

import java.util.ArrayList;
import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

import dao.NoticeDAO;
import vo.Notice;

public class NoticeInterceptor extends AbstractInterceptor{

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		// TODO Auto-generated method stub
		
		Map<String, Object> session = invocation.getInvocationContext().getSession();
		session.put("notice1", false);
		session.put("notice2", false);
		
		NoticeDAO dao = new NoticeDAO();
		ArrayList<Notice> n = (ArrayList<Notice>) dao.getNotices((String)session.get("user_Id"));
		for (Notice notice : n) {
			if(notice.getN_Type()==1) session.put("notice1", true);
			if(notice.getN_Type()==2) session.put("notice1", true);
		}
		
		return invocation.invoke();
	}
	
}
