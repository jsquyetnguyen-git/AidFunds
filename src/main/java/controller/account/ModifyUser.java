package controller.account;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SendEmail;
import dao.AccountDAO;
import model.User;

@WebServlet("/ModifyUser")
public class ModifyUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ModifyUser() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		AccountDAO dao = new AccountDAO();
		try {
			User user =  dao.getUserBy("id",id);
			request.setAttribute("function", "modify");
			request.setAttribute("user", user);
			request.getRequestDispatcher("/view/admin/users/dash-user-add.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int role = Integer.parseInt(request.getParameter("role"));
		int status = Integer.parseInt(request.getParameter("status"));
		String id = request.getParameter("id");
		String notice = null;
		AccountDAO dao = new AccountDAO();
		SendEmail email = new SendEmail();
		
		try {
			User user = dao.getUserBy("id",id);
			if(user.getAdmin()==role&&user.getStatus()==status) {
				notice = "<h5>Không có sự thay đổi thông tin tài khoản.</h5>";
			}else if(dao.isAdmin(id)&&role==0) {
				notice = "<h5 class='text-danger'>Không thể chuyển admin thành user.</h5>";
			}else {
				dao.modifyUser(role, status, id);
				notice = "<h5 class='text-success'>Đã update tài khoản số "+id+".</h5>";
				email.profileChangeNotice(user.getEmail(), user.getFirstName(), role, status);
			}
		} catch (Exception e) {
			notice = "<h5 class='text-danger'>Update thất bại.</h5>";
			e.printStackTrace();
		}
		
		request.setAttribute("notice", notice);
		request.setAttribute("url", "ListUser");
		request.getRequestDispatcher("/view/notice.jsp").forward(request, response);	
	}
}
