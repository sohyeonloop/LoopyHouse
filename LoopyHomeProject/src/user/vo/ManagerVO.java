package user.vo;

public class ManagerVO {
	private String mngId;
	private String mngMail;
	private String mngTel;
	private String mngPwd;
	
	public ManagerVO() {
		// TODO Auto-generated constructor stub
	}
	
	

	public ManagerVO(String mngId, String mngMail, String mngTel, String mngPwd) {
		super();
		this.mngId = mngId;
		this.mngMail = mngMail;
		this.mngTel = mngTel;
		this.mngPwd = mngPwd;
	}



	public String getMngId() {
		return mngId;
	}

	public void setMngId(String mngId) {
		this.mngId = mngId;
	}

	public String getMngMail() {
		return mngMail;
	}

	public void setMngMail(String mngMail) {
		this.mngMail = mngMail;
	}

	public String getMngTel() {
		return mngTel;
	}

	public void setMngTel(String mngTel) {
		this.mngTel = mngTel;
	}

	public String getMngPwd() {
		return mngPwd;
	}

	public void setMngPwd(String mngPwd) {
		this.mngPwd = mngPwd;
	}
	
	
}
