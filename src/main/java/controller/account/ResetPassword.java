package controller.account;

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

@WebServlet("/ResetPassword")
public class ResetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ResetPassword() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String notice = null;
		String newPass = RandomStringUtils.randomAlphanumeric(8);
		AccountDAO dao = new AccountDAO();
	
		try {
			User user = dao.getUserBy("id", id);
			Md5Encrypt md = new Md5Encrypt();
			dao.passwordUpdate(id, md.getMd5Encrypt(newPass));
			
			SendEmail send = new SendEmail();
			send.sendResetPassword(user.getEmail(), user.getFirstName(), newPass);
			notice="<h5 class='text-success'>Mật khẩu đã được reset và gửi tới email của tài khoản số "+id+"</h5>";
		} catch (Exception e) {
			e.printStackTrace();
			notice="<h5 class='text-danger'>Reset mật khẩu thất bại. Vui lòng thử lại<h5>";
		}
		
		request.setAttribute("notice", notice);
		request.setAttribute("url", "ListUser");
		request.getRequestDispatcher("/view/notice.jsp").forward(request, response);
	}
}
