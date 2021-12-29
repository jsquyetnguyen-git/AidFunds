package controller.donation;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CampaignRecordDAO;

@WebServlet("/CheckoutController")
public class CheckoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckoutController() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String accountId = request.getParameter("accountid");
		String campaignId = request.getParameter("campaignid");
		String amount = request.getParameter("amount");
		long now = System.currentTimeMillis();
		Date donationDate = new Date(now);
		String method = request.getParameter("method");
		
		CampaignRecordDAO dao = new CampaignRecordDAO();

		try {
			dao.addCampaignRecord(Integer.parseInt(accountId), Integer.parseInt(campaignId), Long.parseLong(amount), donationDate, method, "Đang xác nhận");
			request.setAttribute("amount", amount);
			request.getRequestDispatcher("/view/notice.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
