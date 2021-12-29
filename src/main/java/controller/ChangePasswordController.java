package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Md5Encrypt;
import dao.AccountDAO;

@WebServlet("/ChangePasswordController")
public class ChangePasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChangePasswordController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect(request.getContextPath()+"/view/user/change-password.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String oldpassword = request.getParameter("oldpassword");
		String newpassword = request.getParameter("newpassword");
		
		AccountDAO dao = new AccountDAO();
		Md5Encrypt md = new Md5Encrypt();
		try {
			String password = dao.getPassword(id);
			if(password.equals(md.getMd5Encrypt(oldpassword))) {
				dao.passwordUpdate(id, md.getMd5Encrypt(newpassword));
				request.setAttribute("changenotice", "Password đã được thay đổi thành công!");
			}else {
				request.setAttribute("changeerror", "Password cũ không đúng!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("/view/user/change-password.jsp").forward(request, response);
	}
}
