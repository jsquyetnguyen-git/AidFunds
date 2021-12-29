package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import context.DBContext;
import model.CampaignRecord;

public class CampaignRecordDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	DBContext db = new DBContext();

	public List<CampaignRecord> getAllCampaignRecord() throws Exception {
		List<CampaignRecord> campaignRecordList = new ArrayList<>();
		String query = "select cr.recordid,cd.name,cr.amount,cr.donationdate,cr.method,cr.status,ac.accountid,ac.lastname,ac.firstname,"
				+ "ac.email,ac.phonenumber,cr.campaignid from campaignRecord as cr join account as ac on cr.accountid=ac.accountid "
				+ "join campaignDetail as cd on cr.campaignid = cd.campaignid order by cr.recordid desc";
		conn = db.getConnection();
		ps = conn.prepareStatement(query);
		rs = ps.executeQuery();
		while (rs.next()) {
			campaignRecordList.add(new CampaignRecord(rs.getInt(1), rs.getString(2),rs.getInt(12), rs.getLong(3), rs.getDate(4),
					rs.getString(5), rs.getString(6), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10),
					rs.getString(11)));
		}
		conn.close();
		rs.close();
		return campaignRecordList;
	}

	public List<CampaignRecord> getCampaignRecordById(String accountId) throws Exception {
		List<CampaignRecord> campaignRecordList = new ArrayList<>();
		String query = "select cr.recordid,cd.name,cr.amount,cr.donationdate,cr.method,cr.status,ac.accountid,ac.lastname,ac.firstname,"
				+ "ac.email,ac.phonenumber,cr.campaignid from campaignRecord as cr join account as ac on cr.accountid=ac.accountid "
				+ "join campaignDetail as cd on cr.campaignid = cd.campaignid where ac.accountid =?";

		conn = db.getConnection();
		ps = conn.prepareStatement(query);
		ps.setString(1, accountId);
		rs = ps.executeQuery();
		while (rs.next()) {
			campaignRecordList.add(new CampaignRecord(rs.getInt(1), rs.getString(2),rs.getInt(12), rs.getLong(3), rs.getDate(4),
					rs.getString(5), rs.getString(6), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10),
					rs.getString(11)));
		}
		conn.close();
		rs.close();
		return campaignRecordList;
	}

	public List<CampaignRecord> getCampaignRecordLastest(String campId) throws Exception {
		List<CampaignRecord> campaignRecordLastest = new ArrayList<>();
		String query = "select top(15) cr.recordid,cd.name,cr.amount,cr.donationdate,cr.method,cr.status,ac.accountid,ac.lastname,"
				+ "ac.firstname,ac.email,ac.phonenumber,cr.campaignid from campaignRecord as cr join account as ac on cr.accountid=ac.accountid "
				+ "join campaignDetail as cd on cr.campaignid = cd.campaignid where cd.campaignid=? order by cr.donationdate desc";
		conn = db.getConnection();
		ps = conn.prepareStatement(query);
		ps.setString(1, campId);
		rs = ps.executeQuery();
		while (rs.next()) {
			campaignRecordLastest.add(new CampaignRecord(rs.getInt(1), rs.getString(2),rs.getInt(12), rs.getLong(3), rs.getDate(4),
					rs.getString(5), rs.getString(6), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10),
					rs.getString(11)));
		}
		conn.close();
		rs.close();
		return campaignRecordLastest;
	}

	public CampaignRecord getCampaignRecordByRecordId(String recordId) throws Exception {
		CampaignRecord campaignRecord = new CampaignRecord();
		String query = "select cr.recordid,cd.name,cr.amount,cr.donationdate,cr.method,cr.status,ac.accountid,ac.lastname,ac.firstname,ac.email,"
				+ "ac.phonenumber,cr.campaignid from campaignRecord as cr join account as ac on cr.accountid=ac.accountid join"
				+ " campaignDetail as cd on cr.campaignid = cd.campaignid where cr.recordid =?";
		conn = db.getConnection();
		ps = conn.prepareStatement(query);
		ps.setString(1, recordId);
		rs = ps.executeQuery();
		while (rs.next()) {
			campaignRecord = new CampaignRecord(rs.getInt(1), rs.getString(2),rs.getInt(12), rs.getLong(3), rs.getDate(4),
					rs.getString(5), rs.getString(6), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10),
					rs.getString(11));
		}
		conn.close();
		rs.close();
		return campaignRecord;
	}

	public List<CampaignRecord> getTopDonor() throws Exception {
		List<CampaignRecord> topDonorList = new ArrayList<>();
		String query = "select top(4) sum(cr.amount),ac.avatar,ac.lastname,ac.firstname from campaignRecord as cr join account as ac"
				+ " on cr.accountid=ac.accountid group by ac.accountid, cr.status,ac.avatar,ac.lastname,ac.firstname "
				+ "having cr.status=N'Thành công' order by sum(cr.amount) desc";
		conn = db.getConnection();
		ps = conn.prepareStatement(query);
		rs = ps.executeQuery();
		while (rs.next()) {
			topDonorList.add(new CampaignRecord(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getString(4)));
		}
		conn.close();
		rs.close();
		return topDonorList;
	}

	public void modifyCampaignRecord(String recordId, String status) throws Exception {
		String query = "update campaignRecord set status=? where recordid=?";
		conn = db.getConnection();
		ps = conn.prepareStatement(query);
		ps.setNString(1, status);
		ps.setString(2, recordId);

		ps.executeUpdate();
		conn.close();
	}

	public Map<String, Long> getSum(String accountId) throws Exception {
		Map<String, Long> map = new HashMap<String, Long>();
		String query = null;
		if (accountId!=null) {
			query = "select count(*), sum(cr.amount) from campaignRecord as cr join account as ac on cr.accountid=ac.accountid "
					+ "join campaignDetail as cd on cr.campaignid = cd.campaignid where ac.accountid =?";
		} else {
			query = "select count(*), sum(cr.amount) from campaignRecord as cr join account as ac on cr.accountid=ac.accountid "
					+ "join campaignDetail as cd on cr.campaignid = cd.campaignid";
		}
		conn = db.getConnection();
		ps = conn.prepareStatement(query);
		if (accountId!=null) {
			ps.setString(1, accountId);
		}

		rs = ps.executeQuery();
		if (rs.next()) {
			map.put("count", rs.getLong(1));
			map.put("amout", rs.getLong(2));
		}
		return map;
	}

	public void deleteCampaignRecordById(String id) throws Exception {
		String query = "{call deleteCampaignRecord(?)}";
		conn = db.getConnection();
		CallableStatement cs = conn.prepareCall(query);
		
		cs.setString(1,id);
		cs.execute();
		conn.close();
		cs.close();
	}

	public void addCampaignRecord(int accountId, int campaignId, long amount, Date donationDate, String method,
			String status) throws Exception {
		String query = "insert into campaignrecord (accountid,campaignid,amount,donationdate,method,status) values(?,?,?,?,?,?)";
		conn = db.getConnection();
		ps = conn.prepareStatement(query);

		ps.setInt(1, accountId);
		ps.setInt(2, campaignId);
		ps.setLong(3, amount);
		ps.setDate(4, donationDate);
		ps.setString(5, method);
		ps.setString(6, status);
		ps.executeUpdate();
		conn.close();
	}
	
	public boolean userCheck(String accountId) throws Exception {
		String query = "select count(*) as count from campaignrecord where accountid = ?";
		conn = db.getConnection();
		ps = conn.prepareStatement(query);
		ps.setString(1, accountId);
		
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
	
	public boolean campaignCheck(String campaignId) throws Exception {
		String query = "select count(*) as count from campaignrecord where campaignid = ?";
		conn = db.getConnection();
		ps = conn.prepareStatement(query);
		ps.setString(1, campaignId);
		
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
}
