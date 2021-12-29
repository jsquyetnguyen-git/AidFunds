package model;

public class GoogleAcc {
	private String id;
	private String email;
	private String picture;
	
	public GoogleAcc() {
		super();
	}
	
	public GoogleAcc(String id, String email, String picture) {
		super();
		this.id = id;
		this.email = email;
		this.picture = picture;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}
	
	
	
	
	
}
