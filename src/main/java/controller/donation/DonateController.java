package controller.donation;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDAO;

@WebServlet("/DonateController")
public class DonateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DonateController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String amount = request.getParameter("money");
		if(amount==null) {
			amount = request.getParameter("othermoney").replace(",", "");
		}
		String donationMethod = request.getParameter("donationmethod");
		String id = request.getParameter("accountid");
		AccountDAO acc = new AccountDAO();
		
		request.setAttribute("amount", amount);
		try {
			if(acc.getUserBy("id", id).getAdmin()==1) {
				request.setAttribute("notice", "<h5 class='text-danger'>Tài khoản admin không thể thực hiện quyên góp!</h5>");
				request.setAttribute("url", "HomeController");
				request.getRequestDispatcher("/view/notice.jsp").forward(request, response);
			}else if(donationMethod.equals("bank")) {
				request.getRequestDispatcher("/view/user/checkout-bank.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
