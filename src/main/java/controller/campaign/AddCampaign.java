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

@WebServlet("/AddCampaign")
public class AddCampaign extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddCampaign() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("title");
		String discription = request.getParameter("discription");
		String content = request.getParameter("content");
		String image = request.getParameter("image");
		String startDate = request.getParameter("startdate");
		String endDate = request.getParameter("enddate");
		String status = request.getParameter("status");
		String targetMoney = request.getParameter("targetmoney").replace(",", "");
		String notice;
		
		Campaign camp = new Campaign(title, discription, content, image, Date.valueOf(startDate), Date.valueOf(endDate), status, Long.parseLong(targetMoney));
		
		CampaignDAO dao = new CampaignDAO();
		try {
			dao.addCampaign(camp);
			notice = "<h5 class='text-success'>Đã thêm thành công.</h5>";
		} catch (Exception e) {
			notice = "<h5 class='text-danger'>Thêm thất bại.</h5>";
			e.printStackTrace();
		}
		
		request.setAttribute("notice", notice);
		request.setAttribute("url", "ListCampaign");
		request.getRequestDispatcher("/view/notice.jsp").forward(request, response);
	}
}
