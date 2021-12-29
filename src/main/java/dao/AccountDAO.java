package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import context.DBContext;
import model.User;

public class AccountDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	CallableStatement cs = null;
	ResultSet rs = null;
	DBContext db = new DBContext();

	public List<User> getAllUser() throws Exception {
		List<User> userList = new ArrayList<>();
		String query = "select * from account order by accountid desc";

		conn = db.getConnection();
		ps = conn.prepareStatement(query);

		rs = ps.executeQuery();
		while (rs.next()) {
			userList.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
					rs.getInt(5), rs.getString(6), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10),
					rs.getDate(11),rs.getInt(12)));
		}
		
		rs.close();
		return userList;
	}
	
	public User getUserBy(String by,String value) throws Exception {
		User user = new User();
		String query = null;
		if(by.equals("id")) {
			query = "select * from account where accountid = ?";
		}else if(by.equals("email")) {
			query = "select * from account where email = ?";
		}

		conn = db.getConnection();
		ps = conn.prepareStatement(query);
		ps.setString(1, value);

		rs = ps.executeQuery();
		while (rs.next()) {
			user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
					rs.getInt(5), rs.getString(6), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10),
					rs.getDate(11),rs.getInt(12));
		}
		
		rs.close();
		return user;
	}
	
	public void addUser(User u) throws Exception {
		String query = "insert into account(email,avatar,password,role,phonenumber,lastname,firstname,address,registerdate,status)"
				+ "values(?,?,?,?,?,?,?,?,?,?)";
		conn = db.getConnection();
		ps = conn.prepareStatement(query);
		ps.setString(1, u.getEmail());
		ps.setString(2, u.getAvatar());
		ps.setString(3, u.getPassword());
		ps.setInt(4, u.getAdmin());
		ps.setString(5, u.getPhoneNumber());
		ps.setString(6, u.getLastName());
		ps.setString(7, u.getFirstName());
		ps.setString(8, u.getAddress());
		ps.setDate(9, u.getRegisterdate());
		ps.setInt(10, u.getStatus());
		
		ps.executeUpdate();
		conn.close();
	}
	
	public void deleteUserById(String id) throws Exception {
		String query = "delete from account where accountid =?";
		conn = db.getConnection();
		ps = conn.prepareStatement(query);
		ps.setString(1, id);
		ps.executeUpdate();

		conn.close();
		ps.close();
	}
	
	public void modifyUser(int role,int status, String id) throws Exception {
		String query = "update account set role=?, status=?  where accountid=?";
		conn = db.getConnection();
		ps= conn.prepareStatement(query);
		ps.setInt(1, role);
		ps.setInt(2, status);
		ps.setString(3, id);
		
		ps.executeUpdate();
		conn.close();
	}
	
	public void activeAccount(int status, String email) throws Exception {
		String query = "update account set status=? where email=?";
		conn = db.getConnection();
		ps= conn.prepareStatement(query);
		ps.setInt(1, status);
		ps.setString(2, email);
		
		ps.executeUpdate();
		conn.close();
	}
	
	public void changeProfile(String id, String firstname, String lastname, int gender, String address, String phonenumber) throws Exception {
		String query = "update account set firstname=?, lastname=?, gender=?, address=?, phonenumber=?  where accountid=?";
		conn = db.getConnection();
		ps= conn.prepareStatement(query);
		ps.setNString(1, firstname);
		ps.setNString(2, lastname);
		ps.setInt(3, gender);
		ps.setNString(4, address);
		ps.setString(5, phonenumber);
		ps.setString(6, id);
		
		ps.executeUpdate();
		conn.close();
	}
	
	public void changeAvatar(String id,String image) throws Exception {
		String query = "update account set avatar=? where accountid=?";
		conn = db.getConnection();
		ps= conn.prepareStatement(query);
		ps.setString(1, image);
		ps.setString(2, id);
		
		ps.executeUpdate();
		conn.close();
	}
	
	public void changeStatus(String id) throws Exception {
		String query = "update account set status=0  where accountid=?";
		conn = db.getConnection();
		ps= conn.prepareStatement(query);
		ps.setString(1, id);
		ps.executeUpdate();
		conn.close();
	}
	
	public void passwordUpdate(String id, String newPass) throws Exception {
		String query = "update account set password=? where accountid=?";
		conn = db.getConnection();
		ps= conn.prepareStatement(query);
		ps.setString(1, newPass);
		ps.setString(2, id);
		
		ps.executeUpdate();
		conn.close();
	}
	
	public boolean isAdmin(String id) throws Exception {
		AccountDAO dao = new AccountDAO();
		User user = dao.getUserBy("id",id);
		if(user.getAdmin()==1) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean emailCheck(String email) throws Exception {
		String query = "select count(*) as count from account where email = ?";
		conn = db.getConnection();
		ps = conn.prepareStatement(query);
		ps.setString(1, email);
		
		rs = ps.executeQuery();
		int count=0;
		if(rs.next()) {
			count = rs.getInt("count");
		}
		rs.close();
		if(count==0) {
			return false;			
		}else {
			return true;
		}
	}
	
	public User getUserForLogin(String email, String password) throws Exception {
		@SuppressWarnings("unused")
		User user = new User();
		String query = "select * from account where email = ? and password = ? and status = 1";
		conn = db.getConnection();
		ps = conn.prepareStatement(query);
		ps.setString(1, email);
		ps.setString(2, password);

		rs = ps.executeQuery();
		
	   if( rs.next()){
	        return user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
					rs.getInt(5), rs.getString(6), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10),
					rs.getDate(11),rs.getInt(12));
	   } else {
	       return null;
	   }
	}
	
	public int getCountUser() throws Exception {
		String query = "select count(*) from account where role = 0";
		int count = 0;
		conn = db.getConnection();
		ps = conn.prepareStatement(query);
		
		rs = ps.executeQuery();
		while(rs.next()) {
			count = rs.getInt(1);
		}
		rs.close();
		return count;
	}
	
	public String getPassword(String id) throws Exception {
		String query = "select password from account where accountid=?";
		conn = db.getConnection();
		ps = conn.prepareStatement(query);
		ps.setString(1, id);
		
		rs = ps.executeQuery();
		if(rs.next()) {
			return rs.getString(1);
		}else {
			return null;
		}	
	}
}
