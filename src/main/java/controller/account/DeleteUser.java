package controller.account;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDAO;
import dao.CampaignRecordDAO;
import model.User;

@WebServlet("/DeleteUser")
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteUser() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String notice;
		AccountDAO accountDAO = new AccountDAO();
		CampaignRecordDAO campagnRecordDAO = new CampaignRecordDAO();

		try {
			User u = accountDAO.getUserBy("id", id);
			if (u.getAdmin() == 1) {
				notice = "<h5 class='text-danger'>Không thể xóa tài khoản admin.</h5>";
			} else if (campagnRecordDAO.userCheck(id)) {
				notice = "<h5 class='text-danger'>Xóa thất bại, dữ liệu đang được sử dụng.</h5><h5>Tài khoản được chuyển sang trạng thái dừng hoạt động.</h5>";
				accountDAO.changeStatus(id);
			} else {
				accountDAO.deleteUserById(id);
				notice = "<h5 class='text-success'>Đã xóa thành công.</h5>";
			}
		} catch (Exception e) {
			notice = "<h5 class='text-danger'>Xóa thất bại.</h5>";
			e.printStackTrace();
		}

		request.setAttribute("notice", notice);
		request.setAttribute("url", "ListUser");
		request.getRequestDispatcher("/view/notice.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String[] idList = request.getParameterValues("cbox");
		String notice = null;
		String error = null;
		StringBuilder notice1 = new StringBuilder();
		StringBuilder admin = new StringBuilder();
		StringBuilder user = new StringBuilder();
		StringBuilder deleted = new StringBuilder();
		AccountDAO accountDAO = new AccountDAO();
		CampaignRecordDAO campagnRecordDAO = new CampaignRecordDAO();

		for (int i = 0; i < idList.length; i++) {
			User u = null;
			// get user
			try {
				u = accountDAO.getUserBy("id", idList[i]);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			// can not delete admin
			if (u.getAdmin() == 1) {
				admin.append(idList[i] + " ");
				continue;
			} else
				try {
					if (campagnRecordDAO.userCheck(idList[i])) {
						user.append(idList[i] + " ");
						accountDAO.changeStatus(idList[i]);
					} else {
						accountDAO.deleteUserById(idList[i]);
						deleted.append(idList[i]);
					}
				} catch (Exception e) {
					e.printStackTrace();
					error = "<h5 class='text-danger'>Xóa thất bại.</h5>";
				}
		}

		if (!admin.isEmpty()) {
			notice1.append("<h5 class='text-danger'>Không thể xóa tài khoản admin số: " + admin + ".</h5>");
		}
		if (!user.isEmpty()) {
			notice1.append("<h5 class='text-danger'>Không thể xóa tài khoản số: " + user
					+ " vì dữ liệu đang được sử dụng, tài khoản chuyển sang trạng thái dừng hoạt động.</h5>");
		}
		if (!deleted.isEmpty()) {
			notice = "<h5 class='text-success'>Đã xóa tài khoản số: " + deleted + ".</h5>";
		}

		request.setAttribute("error", error);
		request.setAttribute("notice", notice);
		request.setAttribute("notice1", notice1);
		request.setAttribute("url", "ListUser");
		request.getRequestDispatcher("/view/notice.jsp").forward(request, response);
	}
}
