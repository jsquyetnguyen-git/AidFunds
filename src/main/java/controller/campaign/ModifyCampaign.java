package controller.campaign;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CampaignDAO;
import model.Campaign;

@WebServlet("/ModifyCampaign")
public class ModifyCampaign extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ModifyCampaign() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		CampaignDAO campaignDAO = new CampaignDAO();
		try {
			Campaign camp =  campaignDAO.getCampaign(id);
			request.setAttribute("function", "modify");
			request.setAttribute("camp", camp);
			request.getRequestDispatcher("/view/admin/campaigns/dash-camp-add.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String discription = request.getParameter("discription");
		String content = request.getParameter("content");
		String image = request.getParameter("image");
		String startDate = request.getParameter("startdate");
		String endDate = request.getParameter("enddate");
		String status = request.getParameter("status");
		String targetMoney = request.getParameter("targetmoney").replace(",", "");
		String notice;
		
		Date start = Date.valueOf(startDate);
		Date end = Date.valueOf(endDate);
		long target = Long.parseLong(targetMoney);
		
		Campaign camp = new Campaign(title, discription, content, image, start, end, status, target);
		CampaignDAO campaignDAO = new CampaignDAO();
		try {
			campaignDAO.modifyCampaign(camp,id);
			notice = "<h5 class='text-success'>Đã sửa thành công.</h5>";
		} catch (Exception e) {
			notice = "<h5 class='text-danger'>Sửa thất bại.</h5>";
			e.printStackTrace();
		}
		
		request.setAttribute("notice", notice);
		request.setAttribute("url", "ListCampaign");
		request.getRequestDispatcher("/view/notice.jsp").forward(request, response);	
	}
}
