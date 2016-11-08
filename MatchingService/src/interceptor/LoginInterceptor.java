package interceptor;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor extends AbstractInterceptor{

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = invocation.getInvocationContext().getSession();
		String user_Id = (String) map.get("user_Id");
		if(user_Id==null){
			return Action.LOGIN;
		}
		
		return invocation.invoke();
	}
	
}
