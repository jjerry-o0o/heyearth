package admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class AdminInterceptor implements HandlerInterceptor{

	@Autowired
	@Qualifier("adminservice")
	AdminService adminservice = new AdminServiceImpl();
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		// Controller 실행 전에 수행되는 메소드
		// true면 진입/false면 진입하지 않음
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("session_id");
		//System.out.println("preHandle실행");
		List<String> adminid = adminservice.adminid();
		if(id == null) {
			response.sendRedirect(request.getContextPath()+"/");
			return false;
		}else {
			for(int i=0;i<adminid.size();i++) {
				if(id.equals(adminid.get(i))) {
					return true;
				}
			}
		}
		
		response.sendRedirect(request.getContextPath()+"/");
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// Controller 실행 후 View가 랜더링 되기 전에 실행
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// Controller 실행 후 View가 랜더링 된 후에 실행
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
	
}
