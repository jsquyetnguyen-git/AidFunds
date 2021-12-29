package model;

import java.sql.Date;

import common.DurationConvert;

public class Campaign {
	
	private int campaignId;
	private int accountId;
	private String title;
	private String description;
	private String content;
	private String image;
	private Date startDate;
	private Date endDate;
	private String status;
	private long targetMoney;
	private long currentMoney;
	private int duration;
	
	public Campaign() {
		super();
	}
	
	public Campaign(String title, String description, String content, String image,
			Date startDate, Date endDate, String status, long targetMoney) {
		super();
		this.title = title;
		this.description = description;
		this.content = content;
		this.image = image;
		this.startDate = startDate;
		this.endDate = endDate;
		this.status = status;
		this.targetMoney = targetMoney;
	}
	
	public Campaign(int campaignId, int accountId, String title, String description, String content, String image,
			Date startDate, Date endDate, String status, long targetMoney, long currentMoney) {
		super();
		this.campaignId = campaignId;
		this.accountId = accountId;
		this.title = title;
		this.description = description;
		this.content = content;
		this.image = image;
		this.startDate = startDate;
		this.endDate = endDate;
		this.status = status;
		this.targetMoney = targetMoney;
		this.currentMoney = currentMoney;
	}

	public Campaign(int campaignId, int accountId, String title, String description, String content, String image,
			Date startDate, Date endDate, String status, long targetMoney, int duration) {
		super();
		this.campaignId = campaignId;
		this.accountId = accountId;
		this.title = title;
		this.description = description;
		this.content = content;
		this.image = image;
		this.startDate = startDate;
		this.endDate = endDate;
		this.status = status;
		this.targetMoney = targetMoney;
		this.duration = duration;
	}

	public int getCampaignId() {
		return campaignId;
	}

	public void setCampaignId(int campaignId) {
		this.campaignId = campaignId;
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public long getTargetMoney() {
		return targetMoney;
	}

	public void setTargetMoney(long targetMoney) {
		this.targetMoney = targetMoney;
	}
	
	public long getCurrentMoney() {
		return currentMoney;
	}

	public void setCurrentMoney(long currentMoney) {
		this.currentMoney = currentMoney;
	}

	public int getDuration() {
		DurationConvert d = new DurationConvert();
		duration = d.duration(startDate, endDate);
		return duration;
	}

	@Override
	public String toString() {
		return "Campaign [campaignId=" + campaignId + ", accountId=" + accountId + ", title=" + title + ", description="
				+ description + ", content=" + content + ", image=" + image + ", startDate=" + startDate + ", endDate="
				+ endDate + ", status=" + status + ", targetMoney=" + targetMoney + ", currentMoney=" + currentMoney
				+ ", duration=" + duration + "]";
	}


}
