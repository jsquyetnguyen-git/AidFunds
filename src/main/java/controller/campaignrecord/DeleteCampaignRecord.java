package controller.campaignrecord;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CampaignRecordDAO;

@WebServlet("/DeleteCampaignRecord")
public class DeleteCampaignRecord extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteCampaignRecord() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String notice;
		CampaignRecordDAO delete = new CampaignRecordDAO();
		try {
			delete.deleteCampaignRecordById(id);
			notice = "<h5 class='text-success'>Đã xóa thành công.</h5>";
		} catch (Exception e) {
			notice = "<h5 class='text-danger'>Xóa thất bại.</h5>";
			e.printStackTrace();
		}
		request.setAttribute("notice", notice);
		request.setAttribute("url", "ListCampaignRecord");
		request.getRequestDispatcher("/view/notice.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] camp = request.getParameterValues("cbox");
		String notice;
		CampaignRecordDAO delete = new CampaignRecordDAO();
		try {
			for (int i = 0; i < camp.length; i++) {
				delete.deleteCampaignRecordById(camp[i]);
			}	
			notice = "<h5 class='text-success'>Đã xóa thành công.</h5>";
		} catch (Exception e) {			
			notice = "<h5 class='text-danger'>Xóa thất bại.</h5>";
			e.printStackTrace();
		}
		request.setAttribute("notice", notice);
		request.setAttribute("url", "ListCampaignRecord");
		request.getRequestDispatcher("/view/notice.jsp").forward(request, response);
	}
}
