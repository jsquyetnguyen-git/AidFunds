package controller;

import java.io.IOException;

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

@WebServlet("/ResetPasswordController")
public class ResetPasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ResetPasswordController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect(request.getContextPath()+"/HomeController?action=reset");
	}
	
	//reset by user
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		AccountDAO dao = new AccountDAO();
		String newPass = RandomStringUtils.randomAlphanumeric(8);

		try {
			if (dao.emailCheck(email)) {
				User user = dao.getUserBy("email", email);
				Md5Encrypt md = new Md5Encrypt();
				dao.passwordUpdate(String.valueOf(user.getAccountId()), md.getMd5Encrypt(newPass));

				SendEmail send = new SendEmail();
				send.sendResetPassword(user.getEmail(), user.getFirstName(), newPass);
				request.setAttribute("notice", "Mật khẩu mới đã được gửi đến email của bạn. Vui lòng kiểm tra.");
			} else {
				request.setAttribute("error", "Email bạn đã nhập không thuộc về tài khoản nào. Vui lòng xác nhận lại.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("view/reset-password.jsp").forward(request, response);

	}

}
