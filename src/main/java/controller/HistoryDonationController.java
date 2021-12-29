package controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CampaignRecordDAO;
import model.CampaignRecord;

@WebServlet("/HistoryDonationController")
public class HistoryDonationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HistoryDonationController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		HttpSession session = request.getSession();
		CampaignRecordDAO dao = new CampaignRecordDAO();
		try {
			List<CampaignRecord> campaignRecordList = dao.getCampaignRecordById(id);
			session.setAttribute("campRecordList", campaignRecordList);
			Map<String, Long> total = dao.getSum(id);
			session.setAttribute("total", total);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("/view/user/donation-history.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
