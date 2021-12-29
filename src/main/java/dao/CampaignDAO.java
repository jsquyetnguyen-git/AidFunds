package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import context.DBContext;
import model.Campaign;

public class CampaignDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	DBContext db = new DBContext();
	
	public List<Campaign> getAllCampaign() throws Exception {
		List<Campaign> listCampaign = new ArrayList<>();
		String query = "select * from campaigndetail order by campaignid desc";
			conn = db.getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				listCampaign.add(new Campaign(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getDate(7), rs.getDate(8), rs.getString(9), rs.getLong(10),rs.getLong(11)));
			}			
			rs.close();

		return listCampaign;
	}
	
	public List<Campaign> filterCampaign(String object) throws Exception {
		List<Campaign> listCamp = new ArrayList<>();
		String query = "select * from campaigndetail where status=?";
		
		conn = db.getConnection();
		ps= conn.prepareStatement(query);
		ps.setNString(1, object);
		
		rs = ps.executeQuery();
		
		while(rs.next()) {
			listCamp.add(new Campaign(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getDate(7), rs.getDate(8), rs.getString(9), rs.getLong(10),rs.getLong(11)));
		}
		rs.close();
		return listCamp;
	}
	
	public List<Campaign> campShowOnPage() throws Exception {
		List<Campaign> listCamp = new ArrayList<>();
		String query = "select * from campaigndetail where status in (?,?) order by status desc";
		conn = db.getConnection();
		ps= conn.prepareStatement(query);
		ps.setNString(1, "Đang diễn ra");
		ps.setNString(2, "Đã kết thúc");
		rs = ps.executeQuery();
		while(rs.next()) {
			listCamp.add(new Campaign(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getDate(7), rs.getDate(8), rs.getString(9), rs.getLong(10),rs.getLong(11)));
		}
		rs.close();
		return listCamp;
	}
	
	public Campaign getCampaign(String id) throws Exception {
		Campaign campaign = null;
		String query = "select * from campaigndetail where campaignid=?";

			conn = db.getConnection();
			ps= conn.prepareStatement(query);
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				campaign = new Campaign(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getDate(7), rs.getDate(8), rs.getString(9), rs.getLong(10),rs.getLong(11));
			}
			rs.close();
		return campaign;
	}
	
	public int getCountCampaign() throws Exception {
		String query = "select count(*) from campaigndetail";
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
	
	public void modifyCampaign(Campaign c,String id) throws Exception {

		DBContext db = new DBContext();
		Connection conn = db.getConnection();
		PreparedStatement ps = null;
		
		String query = "update campaigndetail set name=?,discription=?,content=?,image=?,startdate=?,enddate=?,status=?,targetmoney=? where campaignid=?";
		
		ps=conn.prepareStatement(query);
		ps.setNString(1, c.getTitle());
		ps.setNString(2, c.getDescription());
		ps.setNString(3, c.getContent());
		ps.setString(4, c.getImage());
		ps.setDate(5, c.getStartDate());
		ps.setDate(6, c.getEndDate());
		ps.setNString(7, c.getStatus());
		ps.setLong(8, c.getTargetMoney());
		ps.setString(9, id);
		
		ps.executeUpdate();
		conn.close();

	}
	
	public void deleteCampaignById(String id) throws Exception {
		String query = "delete from campaigndetail where campaignid =?";

		DBContext db = new DBContext();
		conn = db.getConnection();
		ps = conn.prepareStatement(query);

		ps.setString(1, id);
		ps.executeUpdate();

		conn.close();
		ps.close();
	}
	
	public void addCampaign(Campaign c) throws Exception {
		String query = "insert into campaignDetail(name,discription,content,image,startdate,enddate,status,targetmoney) values (?,?,?,?,?,?,?,?)";
		conn = db.getConnection();
		PreparedStatement ps = conn.prepareStatement(query);
		
		ps.setNString(1, c.getTitle());
		ps.setNString(2, c.getDescription());
		ps.setNString(3, c.getContent());
		ps.setString(4, c.getImage());
		ps.setDate(5, c.getStartDate());
		ps.setDate(6, c.getEndDate());
		ps.setNString(7, c.getStatus());
		ps.setLong(8, c.getTargetMoney());
		
		ps.executeUpdate();
		conn.close();
		ps.close();
	}
	
	public void calculateCurrentMoney(String campaignId) throws Exception {
		String query = "{call calculateCurrentMoney(?)}";
		conn = db.getConnection();
		CallableStatement cs = conn.prepareCall(query);
		
		cs.setString(1,campaignId);
		cs.execute();
		conn.close();
		cs.close();
	}
	
}
