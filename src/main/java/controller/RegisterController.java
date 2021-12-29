package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.RandomStringUtils;

import common.Md5Encrypt;
import common.SendEmail;
import dao.AccountDAO;
import model.User;

@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect(request.getContextPath()+"/HomeController?action=register");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		long now = System.currentTimeMillis();
		Date registerdate = new Date(now);
		Md5Encrypt md = new Md5Encrypt();
		String error = null;
		String email = request.getParameter("email");
		String newPass = RandomStringUtils.randomAlphanumeric(8);
		String lastname = request.getParameter("lastname");
		String firstname = request.getParameter("firstname");
		String phoneNumber = request.getParameter("phonenumber");

		AccountDAO dao = new AccountDAO();

		try {
			if (!dao.emailCheck(email)) {
				User user = new User(email, null, md.getMd5Encrypt(newPass), 0, phoneNumber.replace("-", ""), lastname, firstname, null,
						registerdate, 0);
				dao.addUser(user);
				SendEmail mail = new SendEmail();
				mail.sendNewPassword(email, firstname, newPass);
				request.setAttribute("registernotice", "Đã đăng kí tài khoản thành công. Kiểm tra email để nhận mật khẩu và kích hoạt tài khoản.");
			} else {
				error = "Email này đã được sử dụng bởi tài khoản khác.";
			}
		} catch (Exception e) {
			error = "Đăng kí không thành công. Hãy thử lại.</h4>";
			e.printStackTrace();
		}

		request.setAttribute("registererror", error);
		request.getRequestDispatcher("/view/user/register.jsp").forward(request, response);
	}

}
