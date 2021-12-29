package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccountDAO;
import model.User;

@WebServlet("/ChangeProfileController")
public class ChangeProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChangeProfileController() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String gender = request.getParameter("gender");
		String address = request.getParameter("address");
		String phonenumber = request.getParameter("phonenumber");
		String notice;
		
		AccountDAO dao = new AccountDAO();
		User user = new User();

		try {
			dao.changeProfile(id, firstname, lastname, Integer.parseInt(gender), address, phonenumber.replace("-", ""));
			notice = "<h5 class='text-success'>Thay đổi thông tin thành công!</h5>";
			//update session
			user = dao.getUserBy("id",id);
			request.getSession().removeAttribute("userlogging");
			session.setAttribute("userlogging", user);
			if(dao.isAdmin(id)) {
				request.setAttribute("url", "view/admin/dash-admin-profile.jsp");
			}else {
				request.setAttribute("url", "/view/user/change-user-profile.jsp");
			}
		} catch (Exception e) {
			notice = "<h5 class='text-danger'>Thay đổi thông tin không thành công. Hãy thử lại!</h5>";
			e.printStackTrace();
		}
		
		request.setAttribute("notice", notice);
		request.getRequestDispatcher("/view/notice.jsp").forward(request, response);
	}
}
