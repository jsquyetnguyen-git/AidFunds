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


@WebServlet("/LandingPageController")
public class LandingPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LandingPageController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CampaignDAO dao = new CampaignDAO();
		CampaignRecordDAO campRecordDAO = new CampaignRecordDAO();
		AccountDAO accountDAO = new AccountDAO();
		HttpSession session = request.getSession();
		
		try {
			session.setAttribute("campList", dao.campShowOnPage());
			session.setAttribute("upcomingList", dao.filterCampaign("Sắp diễn ra"));
			session.setAttribute("topDonor", campRecordDAO.getTopDonor());
			Map<String, Long> total = campRecordDAO.getSum(null);
			session.setAttribute("total", total);
			session.setAttribute("campcount", dao.getCountCampaign());
			session.setAttribute("usercount", accountDAO.getCountUser());
			request.getRequestDispatcher("/view/index.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
