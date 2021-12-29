package common;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import model.User;

public class SendEmail {

	public void sendHTML(String to, String subject, String content) throws AddressException, MessagingException {
		Properties mailServerProperties;
		Session getMailSession;
		MimeMessage mailMessage;
		String from = "aidfundsvietnam@gmail.com";
		String pasword = "aidfunds123";

		// Step1: setup Mail Server
		mailServerProperties = System.getProperties();
		mailServerProperties.put("mail.smtp.port", "587");
		mailServerProperties.put("mail.smtp.auth", "true");
		mailServerProperties.put("mail.smtp.starttls.enable", "true");

		// Step2: get Mail Session
		getMailSession = Session.getDefaultInstance(mailServerProperties, null);
		mailMessage = new MimeMessage(getMailSession);

		mailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

		mailMessage.setSubject(subject, "UTF-8");
		String emailBody = content;
		mailMessage.setContent(emailBody, "text/html;charset=UTF-8");

		// Step3: Send mail
		Transport transport = getMailSession.getTransport("smtp");

		transport.connect("smtp.gmail.com", from, pasword);
		transport.sendMessage(mailMessage, mailMessage.getAllRecipients());
		transport.close();
	}

	//Send password when new user register
	public void sendNewPassword(String email, String name, String newPass) throws AddressException, MessagingException {
		Md5Encrypt md = new Md5Encrypt();
		String code = md.getMd5Encrypt(newPass);
		SendEmail send = new SendEmail();
		String subject = "[no-reply] Kích hoạt tài khoản và mật khẩu đăng nhập AidFunds";
		String contentHTML = "<p>Xin chào <strong>" + name + "</strong>,</p>"
				+ "<p>Tài khoản AidFunds của bạn đã được tạo.</p>"
				+ "<p>Mật khẩu: <span style=\"color:#2980b9\"><strong>" + newPass + "</strong></span></p>"
				+ "<p>Vui lòng nhấp vào đường link bên dưới để kích hoạt tài khoản.</p>"
				+ "<a href='http://localhost:8080/Donate/ActiveAccount?email="+email+"&code="+code+"'>Kích hoạt tài khoản</a>" + "<p>&nbsp;</p>"
				+ "<p>Trân trọng trọng</p>" + "<p>AidFunds</p>";
		send.sendHTML(email, subject, contentHTML);
	}
	
	//Send new password when reset
	public void sendResetPassword(String email, String name, String newPass) throws AddressException, MessagingException {
		SendEmail send = new SendEmail();
		String subject = "[no-reply] Mật khẩu mới";
		String contentHTML = "<p>Xin chào <strong>"+name+"</strong>,</p>"
				+"<p>Chúng tôi đã cập nhật mật khẩu mới của bạn.</p>"
				+"<p>Mật khẩu mới: <span style=\"color:#2980b9\"><strong>"+newPass+"</strong></span></p>"
				+"<p>Vui lòng truy cập AidFunds và thực hiện đổi mật khẩu theo ý bạn.</p>"
				+"<p>&nbsp;</p>"
				+"<p>Trân trọng trọng</p>"
				+"<p>AidFunds</p>";
		send.sendHTML(email, subject, contentHTML);
	}
	
	//Send notification for donation status
	public void donationStatusNotice(String email, String name,String campaignName, String status) throws AddressException, MessagingException {
		SendEmail send = new SendEmail();
		String subject = "[no-reply] Thông báo trạng thái quyên góp";
		String contentHTML = "<p>Xin chào <strong>"+name+"</strong>,</p>"
				+"<p>AidFunds xin thông báo tới bạn trạng thái quyên góp bạn đã thực hiện tới chiến dịch \""+campaignName+"\".</p>"
				+"<p>Kết quả: <strong>"+status+"</strong></p>"
				+"<p>Liên hệ với chúng tôi nếu bạn có bất kỳ thắc mắc nào.</p>"
				+"<p>Xin chân thành cám ơn bạn.</p>"
				+"<p>&nbsp;</p>"
				+"<p>Trân trọng trọng</p>"
				+"<p>AidFunds</p>";
		send.sendHTML(email, subject, contentHTML);
	}
	
	//Send notification for changing user's profile
	public void profileChangeNotice(String email, String name,int role, int status) throws AddressException, MessagingException {
		SendEmail send = new SendEmail();
		String accRole;
		String accStatus;
		if(role==1) {
			accRole = "User";
		}else {
			accRole="Admin";
		}
		if(status==1) {
			accStatus = "Đang hoạt động";
		}else {
			accStatus = "Dừng hoạt động";
		}
		String subject = "[no-reply] Thông báo thay đổi thông tin tài khoản.";
		String contentHTML = "<p>Xin chào <strong>"+name+"</strong>,</p>"
				+"<p>AidFunds xin thông báo tài khoản của bạn vừa được thay đổi thông tin như bên dưới.</p>"
				+"<p>Quyền tài khoản: <strong>"+accRole+"</strong></p>"
				+"<p>Trạng thái tài khoản: <strong>"+accStatus+"</strong></p>"

				+"<p>&nbsp;</p>"
				+"<p>Trân trọng trọng</p>"
				+"<p>AidFunds</p>";
		send.sendHTML(email, subject, contentHTML);
	}
	
	//Send notification for new account is created by admin
	public void newAccountNotice(User user, String password) throws AddressException, MessagingException {
		SendEmail send = new SendEmail();
		String subject = "[no-reply] Kích hoạt tài khoản và mật khẩu đăng nhập AidFunds";
		String contentHTML = "<p>Xin chào <strong>" + user.getFirstName() + "</strong>,</p>"
				+ "<p>Tài khoản AidFunds của bạn đã được tạo bởi admin.</p>"
				+ "<p>Họ và tên: <span style=\"color:#2980b9\"><strong>" + user.getLastName()+" "+user.getFirstName()+ "</strong></span></p>"
				+ "<p>Email: <span style=\"color:#2980b9\"><strong>" + user.getEmail() + "</strong></span></p>"
				+ "<p>Mật khẩu: <span style=\"color:#2980b9\"><strong>" + password + "</strong></span></p>"
				+ "<p>Địa chỉ: <span style=\"color:#2980b9\"><strong>" + user.getAddress() + "</strong></span></p>"
				+ "<p>Số điện thoại: <span style=\"color:#2980b9\"><strong>" + user.getPhoneNumber() + "</strong></span></p>"
				+ "<p>Vui lòng nhấp vào đường link bên dưới để kích hoạt tài khoản.</p>"
				+ "<a href='http://localhost:8080/Donate/ActiveAccount?email="+user.getEmail()+"&code="+user.getPassword()+"'>Kích hoạt tài khoản</a>" + "<p>&nbsp;</p>"
				
				+ "<p>Trân trọng trọng</p>" + "<p>AidFunds</p>";
		send.sendHTML(user.getEmail(), subject, contentHTML);
	}
}