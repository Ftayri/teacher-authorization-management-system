package tn.iit.teacher_authorization_management.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class AuthFilter
 */
@WebFilter(filterName = "AuthFilter", urlPatterns = "/*")
public class AuthFilter extends HttpFilter implements Filter {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpFilter#HttpFilter()
	 */
	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
	        throws IOException, ServletException {
	    HttpServletRequest httpRequest = (HttpServletRequest) request;
	    HttpServletResponse httpResponse = (HttpServletResponse) response;

	    // Check if the user is authenticated
	    HttpSession session = httpRequest.getSession(false);
	    boolean isLoggedIn = session != null && session.getAttribute("admin") != null;

	    // Get the requested URL
	    String requestedUrl = httpRequest.getRequestURI();

	    // Check if the user is trying to access the login page
	    boolean isLoginRequest = requestedUrl.contains("/login.jsp") || requestedUrl.contains("/LoginController");

	    if (isLoggedIn || isLoginRequest) {
	        // User is authenticated or accessing the login page, continue with the request
	        chain.doFilter(request, response);
	    } else {
	        // User is not authenticated, redirect to the login page
	        httpResponse.sendRedirect(httpRequest.getContextPath() + "/login.jsp");
	    }
	}


}
