package controller.donation;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CampaignDAO;
import dao.CampaignRecordDAO;
import model.Campaign;
import model.CampaignRecord;


@WebServlet("/ViewMoreController")
public class ViewMoreController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ViewMoreController() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String campaignId = request.getParameter("campid");
		CampaignDAO dao = new CampaignDAO();
		CampaignRecordDAO cr = new CampaignRecordDAO(); 
		try {
			if(campaignId!=null) {
			Campaign camp = dao.getCampaign(campaignId);
			List<CampaignRecord> lastest = cr.getCampaignRecordLastest(campaignId);
			session.setAttribute("lastest", lastest);
			session.setAttribute("campaign", camp);
			}
			response.sendRedirect(request.getContextPath()+"/view/view-more.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
