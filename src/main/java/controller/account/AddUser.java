package controller.account;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import common.Md5Encrypt;
import common.SendEmail;
import dao.AccountDAO;
import model.User;

@MultipartConfig
@WebServlet("/AddUser")
public class AddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddUser() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		long now = System.currentTimeMillis();
		Date registerdate = new Date(now);
		Md5Encrypt md = new Md5Encrypt();
		String notice;
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String lastname = request.getParameter("lastname");
		String firstname = request.getParameter("firstname");
		String address = request.getParameter("address");
		String phoneNumber = request.getParameter("phonenumber");
		String role = request.getParameter("role");
		
		//upload image
		Part part = request.getPart("avatar");
		String realPath = request.getServletContext().getRealPath("/media/images/avatar");
		String filename  = Path.of(part.getSubmittedFileName()).getFileName().toString();
		//create storage folder if not exist
		if(!Files.exists(Path.of(realPath))) {
			Files.createDirectory(Path.of(realPath));
		}
		part.write(realPath+"/"+filename);
		String avatar = request.getContextPath()+"/media/images/avatar/"+filename;
		
		User user = new User(email, avatar, md.getMd5Encrypt(password), Integer.parseInt(role), phoneNumber.replace("-", ""), lastname, firstname, address, registerdate, 0);
		AccountDAO dao = new AccountDAO();
		try {
			if (!dao.emailCheck(email)) {
				dao.addUser(user);
				notice = "<h5 class='text-success'>Đã thêm thành công tài khoản mới. Email kích hoạt đã được gửi.</h5>";
				SendEmail sendEmail = new SendEmail();
				sendEmail.newAccountNotice(user, password);
			}else {
				notice = "<h5 class='text-danger'>Thêm thất bại.<h4><h4>Email đã được sử dụng bởi tài khoản khác.</h5>";
			}
		} catch (Exception e) {
			notice = "<h5 class='text-danger'>Thêm thất bại.</h5>";
			e.printStackTrace();
		}
		
		request.setAttribute("notice", notice);
		request.setAttribute("url", "ListUser");
		request.getRequestDispatcher("/view/notice.jsp").forward(request, response);
	}
}
