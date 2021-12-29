package controller.campaignrecord;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SendEmail;
import dao.CampaignDAO;
import dao.CampaignRecordDAO;
import model.CampaignRecord;

@WebServlet("/ModifyCampaignRecord")
public class ModifyCampaignRecord extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ModifyCampaignRecord() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		CampaignRecordDAO dao = new CampaignRecordDAO();
		try {
			CampaignRecord camprecord =  dao.getCampaignRecordByRecordId(id);
			request.setAttribute("camprecord", camprecord);
			request.getRequestDispatcher("/view/admin/campaignrecord/dash-camprecord-edit.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String status = request.getParameter("status");
		String recordId = request.getParameter("recordid");
		String campaignId = request.getParameter("campaignid");
		String campaignName = request.getParameter("campaignname");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String notice = null;
		
		CampaignRecordDAO dao = new CampaignRecordDAO();
		CampaignDAO addCampaignDAO = new CampaignDAO();
		SendEmail sendEmail = new SendEmail();
		try {
			dao.modifyCampaignRecord(recordId, status);
			if(status.equals("Thất bại")||status.equals("Thành công")) {
				sendEmail.donationStatusNotice(email, name, campaignName, status);
			}
			addCampaignDAO.calculateCurrentMoney(campaignId);
			notice = "<h5 class='text-success'>Đã update thành công lượt quyên góp số "+recordId+".</h5>";
		} catch (Exception e) {
			notice = "<h5 class='text-danger'>Update thất bại.</h5>";
			e.printStackTrace();
		}
		request.setAttribute("notice", notice);
		request.setAttribute("url", "ListCampaignRecord");
		request.getRequestDispatcher("/view/notice.jsp").forward(request, response);
	}
}
