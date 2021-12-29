package controller.account;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccountDAO;
import model.User;


@WebServlet("/ListUser")
public class ListUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListUser() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession s = request.getSession();
		
		AccountDAO ac = new AccountDAO();
		try {
			List<User> userList = ac.getAllUser();
			s.setAttribute("userList", userList);
			request.getRequestDispatcher("/view/admin/users/dash-user-show.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
