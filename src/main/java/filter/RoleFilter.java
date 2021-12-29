package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;

public class RoleFilter implements Filter {

	@SuppressWarnings("unused")
	private ServletContext context;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.context = filterConfig.getServletContext();
	}
	
	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response =  (HttpServletResponse) servletResponse;
		HttpSession session = request.getSession(true);
		
		String url = request.getRequestURI();
		User user = (User) session.getAttribute("userlogging");
		if(url.contains("dash")||url.contains("User")||url.contains("Campaign")) {
			if(user!=null&&user.getAdmin()==1) {
				filterChain.doFilter(request, response);
			}else if(user!=null&&user.getAdmin()==0) {
				response.sendRedirect(request.getContextPath()+"/HomeController?action=login");
			}else {
				response.sendRedirect(request.getContextPath()+"/HomeController?action=login");
			}
		}else if(url.contains("user")||url.contains("History")) {
			if(user!=null&&user.getAdmin()==0) {
				filterChain.doFilter(request, response);
			}else {
				response.sendRedirect(request.getContextPath()+"/HomeController?action=login");
			}
		}else {
			filterChain.doFilter(request, response);
		}
	}
	@Override
	public void destroy() {
		Filter.super.destroy();
	}
}


