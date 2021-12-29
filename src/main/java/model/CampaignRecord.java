package model;

import java.sql.Date;

public class CampaignRecord {
	private int recordId;
	private String campaignName;
	private int campaignId;
	private long amount;
	private Date donationDate;
	private int accountId;
	private String lastName;
	private String firstName;
	private String email;
	private String mobile;
	private String method;
	private String status;
	private String avatar;
	
	public CampaignRecord() {
		super();
	}
	
	public CampaignRecord(long amount, String avatar, String lastName, String firstName) {
		super();
		this.amount = amount;
		this.avatar = avatar;
		this.lastName = lastName;
		this.firstName = firstName;
	}
	
	public CampaignRecord(String campaignName, long amount, Date donationDate, String method, String status,
			int accountId, String lastName, String firstName, String email, String mobile) {
		super();
		this.campaignName = campaignName;
		this.amount = amount;
		this.donationDate = donationDate;
		this.accountId = accountId;
		this.lastName = lastName;
		this.firstName = firstName;
		this.email = email;
		this.mobile = mobile;
		this.method = method;
		this.status = status;
	}

	public CampaignRecord(int recordId, String campaignName,int campaignId, long amount, Date donationDate, String method, String status, int accountId,
			String lastName, String firstName, String email, String mobile) {
		super();
		this.recordId = recordId;
		this.campaignName = campaignName;
		this.campaignId = campaignId;
		this.amount = amount;
		this.donationDate = donationDate;
		this.accountId = accountId;
		this.lastName = lastName;
		this.firstName = firstName;
		this.email = email;
		this.mobile = mobile;
		this.method = method;
		this.status = status;
	}

	public int getRecordId() {
		return recordId;
	}

	public void setRecordId(int recordId) {
		this.recordId = recordId;
	}

	public String getCampaignName() {
		return campaignName;
	}

	public void setCampaignName(String campaignName) {
		this.campaignName = campaignName;
	}

	public long getAmount() {
		return amount;
	}

	public void setAmount(long amount) {
		this.amount = amount;
	}

	public Date getDonationDate() {
		return donationDate;
	}

	public void setDonationDate(Date donationDate) {
		this.donationDate = donationDate;
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public int getCampaignId() {
		return campaignId;
	}

	public void setCampaignId(int campaignId) {
		this.campaignId = campaignId;
	}
	
	
}
