package controller.campaign;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CampaignDAO;
import model.Campaign;


@WebServlet("/ListCampaign")
public class ListCampaign extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ListCampaign() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String object = request.getParameter("object");
		List<Campaign> campaignList = null;
		CampaignDAO dao = new CampaignDAO();
		
		try {
				if(object!=null&&object.equals("active")) {
					campaignList = dao.filterCampaign("Đang diễn ra");
				}else if(object!=null&&object.equals("completed")) {
					campaignList = dao.filterCampaign("Đã kết thúc");
				}else if(object!=null&&object.equals("upcoming")) {
					campaignList = dao.filterCampaign("Sắp diễn ra");
				}else {
				campaignList = dao.getAllCampaign();
			}
			session.setAttribute("campaignList", campaignList);
			request.getRequestDispatcher("/view/admin/campaigns/dash-camp-show.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
