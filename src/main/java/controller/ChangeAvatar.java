package controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.AccountDAO;
import model.User;

@MultipartConfig
@WebServlet("/ChangeAvatar")
public class ChangeAvatar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChangeAvatar() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		Part part = request.getPart("avatar");
		AccountDAO dao = new AccountDAO();
		User user = new User();
		
		try {
				String realPath = request.getServletContext().getRealPath("/media/images/avatar");
				String filename  = Path.of(part.getSubmittedFileName()).getFileName().toString();
				//create storage folder if not exist
				if(!Files.exists(Path.of(realPath))) {
					Files.createDirectory(Path.of(realPath));
				}
				part.write(realPath+"/"+filename);
				String image = request.getContextPath()+"/media/images/avatar/"+filename;
				dao.changeAvatar(id, image);
				user = dao.getUserBy("id",id);
				//update session
				request.getSession().removeAttribute("userlogging");
				session.setAttribute("userlogging", user);
				
				if(dao.isAdmin(id)) {
					response.sendRedirect(request.getContextPath()+"/view/admin/dash-admin-profile.jsp");
				}else {
					response.sendRedirect(request.getContextPath()+"/view/user/change-user-profile.jsp");
				}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
