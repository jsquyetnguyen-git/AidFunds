package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.GetGoogleAcc;
import dao.AccountDAO;
import model.GoogleAcc;
import model.User;

@WebServlet("/GoogleLoginController")
public class GoogleLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GoogleLoginController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession(true).invalidate();
		String code = request.getParameter("code");
		if (code == null || code.isEmpty()) {
			request.getRequestDispatcher("/view/login.jsp").forward(request, response);
		} else {
			GetGoogleAcc getGoogleAcc = new GetGoogleAcc();
			String accessToken = getGoogleAcc.getToken(code);
			GoogleAcc googleAcc = getGoogleAcc.getUserInfo(accessToken);
			String email = googleAcc.getEmail();
			
			AccountDAO accountDAO = new AccountDAO();
			try {
				//check whether email exists in database
				if(accountDAO.emailCheck(email)) {
					HttpSession session = request.getSession();
					session.setAttribute("loginerror", "Không thể kết nối tới tài khoản Google này! Email" +email+" đã tồn tại trong hệ thống, mời nhập mật khẩu để đăng nhập.");
					Cookie cookie_email = new Cookie("cookie_email", email);
					response.addCookie(cookie_email);
					response.sendRedirect(request.getContextPath() + "/HomeController?action=login");
				}else {
					request.setAttribute("id", googleAcc.getId());
					request.setAttribute("avatar", googleAcc.getPicture());
					request.setAttribute("email", email);
					request.getRequestDispatcher("/view/connect-google.jsp").forward(request, response);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		request.getSession(true).invalidate();
		long now = System.currentTimeMillis();
		Date registerdate = new Date(now);
		String email = request.getParameter("email");
		String avatar = request.getParameter("avatar");
		String lastname = request.getParameter("lastname");
		String firstname = request.getParameter("firstname");
		String id = request.getParameter("id");
		
		//register new account with Google account
		AccountDAO dao = new AccountDAO();
		User user = new User(email, avatar, id, 0, null, lastname, firstname, null, registerdate, 1);
		try {
			dao.addUser(user);
			HttpSession session = request.getSession();
			session.setAttribute("userlogging", user);
			response.sendRedirect(request.getContextPath() + "/HomeController");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
