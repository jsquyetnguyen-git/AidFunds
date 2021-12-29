package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDAO;
import model.User;

@WebServlet("/ActiveAccount")
public class ActiveAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ActiveAccount() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String code = request.getParameter("code");
		
		AccountDAO dao = new AccountDAO();
		try {
			User user = dao.getUserBy("email",email);
			//change account's status
			if(user!=null&&user.getPassword().equals(code)) {
				dao.activeAccount(1, email);
			}
			request.setAttribute("email",email);
			request.getRequestDispatcher("/view/active-account.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
