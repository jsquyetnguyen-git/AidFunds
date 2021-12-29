package controller.campaignrecord;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CampaignRecordDAO;
import model.CampaignRecord;

@WebServlet("/ListCampaignRecord")
public class ListCampaignRecord extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListCampaignRecord() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		List<CampaignRecord> campaignRecordList = null;
		CampaignRecordDAO dao = new CampaignRecordDAO();
		
		try {
			campaignRecordList = dao.getAllCampaignRecord();
			session.setAttribute("campaignRecordList", campaignRecordList);
			request.getRequestDispatcher("/view/admin/campaignrecord/dash-camprecord-show.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
