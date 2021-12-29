package controller.campaign;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CampaignDAO;
import dao.CampaignRecordDAO;

@WebServlet("/DeleteCampaign")
public class DeleteCampaign extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteCampaign() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String notice = null;
		CampaignDAO campaignDAO = new CampaignDAO();
		CampaignRecordDAO campaignRecordDAO = new CampaignRecordDAO();
		try {
			if (id != null) {
				if (campaignRecordDAO.campaignCheck(id)) {
					notice = "<h5 class='text-danger'>Không thể xóa dữ liệu đang được sử dụng.</h5>";
				} else {
					campaignDAO.deleteCampaignById(id);
					notice = "<h5 class='text-success'>Đã xóa thành công.</h5>";
				}
			}
		} catch (Exception e) {
			notice = "<h5 class='text-danger'>Xóa thất bại.</h5>";
			e.printStackTrace();
		}

		request.setAttribute("notice", notice);
		request.setAttribute("url", "ListCampaign");
		request.getRequestDispatcher("/view/notice.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String[] campIdList = request.getParameterValues("cbox");
		String notice = null;
		String notice1 = null;
		StringBuilder beingUsedCampaign = new StringBuilder();
		StringBuilder deleted = new StringBuilder();
		CampaignDAO campaignDAO = new CampaignDAO();
		CampaignRecordDAO campaignRecordDAO = new CampaignRecordDAO();

		try {
			for (int i = 0; i < campIdList.length; i++) {
				if (campaignRecordDAO.campaignCheck(campIdList[i])) {
					beingUsedCampaign.append(campIdList[i] + " ");
				} else {
					campaignDAO.deleteCampaignById(campIdList[i]);
					deleted.append(campIdList[i] + " ");
				}
			}

			if (!beingUsedCampaign.isEmpty()) {
				notice1 = "<h5 class='text-danger'>Không thể xóa chiến dịch số: " + beingUsedCampaign
						+ " vì dữ liệu đang được sử dụng.</h5>";
			}
			if (!deleted.isEmpty()) {
				notice = "<h5 class='text-success'>Đã xóa thành công chiến dịch số: " + deleted + ".</h5>";
			}

		} catch (Exception e) {
			notice = "<h5 class='text-danger'>Xóa thất bại.</h5>";
			e.printStackTrace();
		}

		request.setAttribute("notice", notice);
		request.setAttribute("notice1", notice1);
		request.setAttribute("url", "ListCampaign");
		request.getRequestDispatcher("/view/notice.jsp").forward(request, response);
	}
}
