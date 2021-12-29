package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Md5Encrypt;
import dao.AccountDAO;
import model.User;

@WebServlet("/HomeController")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HomeController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action != null && action.equals("login")) {
			request.getRequestDispatcher("/view/login.jsp").forward(request, response);
			request.getSession().removeAttribute("loginerror");
		} else if (action != null && action.equals("logout")) {
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect(request.getContextPath()+"/LandingPageController");
		} else if (action != null && action.equals("register")) {
			request.getRequestDispatcher("/view/user/register.jsp").forward(request, response);
		} else if (action != null && action.equals("change")) {
			request.getRequestDispatcher("/view/user/change-password.jsp").forward(request, response);
		} else if (action != null && action.equals("reset")) {
			request.getRequestDispatcher("/view/reset-password.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("/LandingPageController").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession(true).invalidate();
		String action = request.getParameter("action");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String rem = request.getParameter("remember");

		// check remmember
		if (rem != null && rem.equals("yes")) {
			Cookie cookie_email = new Cookie("cookie_email", email);
			Cookie cookie_pwd = new Cookie("cookie_pwd", password);
			response.addCookie(cookie_email);
			response.addCookie(cookie_pwd);
		}

		HttpSession session = request.getSession();
		if (action != null && action.equals("login")) {
			AccountDAO dao = new AccountDAO();
			Md5Encrypt encrypt = new Md5Encrypt();
			try {
				User user = dao.getUserForLogin(email, encrypt.getMd5Encrypt(password));
				if (user != null) {
					session.setAttribute("userlogging", user);
					// check role
					if (user.getAdmin() == 1) {
						response.sendRedirect(request.getContextPath() + "/dash-home");
					} else if (user.getAdmin() == 0) {
						response.sendRedirect(request.getContextPath() + "/HomeController");
					}
				} else {
					session.setAttribute("loginerror", "Email hoặc mật khẩu không đúng!");
					response.sendRedirect(request.getContextPath() + "/HomeController?action=login");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
