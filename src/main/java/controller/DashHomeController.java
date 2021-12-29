package controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccountDAO;
import dao.CampaignDAO;
import dao.CampaignRecordDAO;

@WebServlet("/dash-home")
public class DashHomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DashHomeController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		CampaignRecordDAO dao = new CampaignRecordDAO();
		CampaignDAO listCampaignDAO = new CampaignDAO();
		AccountDAO accountDAO = new AccountDAO();
		
		try {
			Map<String, Long> total = dao.getSum(null);
			session.setAttribute("total", total);
			session.setAttribute("campcount", listCampaignDAO.getCountCampaign());
			session.setAttribute("usercount", accountDAO.getCountUser());
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect(request.getContextPath()+"/view/admin/dash-home.jsp");
	}
}
