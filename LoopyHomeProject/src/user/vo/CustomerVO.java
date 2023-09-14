                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   package user.vo;

public class CustomerVO {
	private String custId;
	private String custName;
	private String custMail;
	private String custAddr;
	private String custGender;
	private String custTel;
	private String custBirth;
	private String custNickName;
	private String custPwd;
	private int custDecNum;
	private String custPhoto;
	private String custDelete;

	
	public CustomerVO() {
	}

	public String getCustDelete() {
		return custDelete;
	}

	public void setCustDelete(String custDelete) {
		this.custDelete = custDelete;
	}

	public CustomerVO(String custId, String custName, String custMail, String custAddr, String custGender,
			String custTel, String custBirth, String custNickName, String custPwd) {
		super();
		this.custId = custId;
		this.custName = custName;
		this.custMail = custMail;
		this.custAddr = custAddr;
		this.custGender = custGender;
		this.custTel = custTel;
		this.custBirth = custBirth;
		this.custNickName = custNickName;
		this.custPwd = custPwd;
	}

	public CustomerVO(String custId, String custName, String custMail, String custAddr, String custGender,
			String custTel, String custBirth, String custNickName, String custPwd, String custPhoto, String custDelete) {
		super();
		this.custId = custId;
		this.custName = custName;
		this.custMail = custMail;
		this.custAddr = custAddr;
		this.custGender = custGender;
		this.custTel = custTel;
		this.custBirth = custBirth;
		this.custNickName = custNickName;
		this.custPwd = custPwd;
		this.custPhoto = custPhoto;
		this.custDelete = custDelete;
	}
	
	
	public CustomerVO(String custId, String custName, String custMail, String custAddr, String custGender,
			String custTel, String custBirth, String custNickName, String custPwd, String custPhoto) {
		super();
		this.custId = custId;
		this.custName = custName;
		this.custMail = custMail;
		this.custAddr = custAddr;
		this.custGender = custGender;
		this.custTel = custTel;
		this.custBirth = custBirth;
		this.custNickName = custNickName;
		this.custPwd = custPwd;
		this.custPhoto = custPhoto;
	}


	public CustomerVO(String custId, String custName, String custMail, String custAddr, String custGender,
			String custTel, String custBirth, String custNickName, String custPwd, int custDecNum, String custDelete) {
		super();
		this.custId = custId;
		this.custName = custName;
		this.custMail = custMail;
		this.custAddr = custAddr;
		this.custGender = custGender;
		this.custTel = custTel;
		this.custBirth = custBirth;
		this.custNickName = custNickName;
		this.custPwd = custPwd;
		this.custDecNum = custDecNum;
		this.custDelete = custDelete;
	}

	public String getCustPhoto() {
		return custPhoto;
	}

	public void setCustPhoto(String custPhoto) {
		this.custPhoto = custPhoto;
	}

	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public String getCustMail() {
		return custMail;
	}

	public void setCustMail(String custMail) {
		this.custMail = custMail;
	}

	public String getCustAddr() {
		return custAddr;
	}

	public void setCustAddr(String custAddr) {
		this.custAddr = custAddr;
	}

	public String getCustGender() {
		return custGender;
	}

	public void setCustGender(String custGender) {
		this.custGender = custGender;
	}

	public String getCustTel() {
		return custTel;
	}

	public void setCustTel(String custTel) {
		this.custTel = custTel;
	}

	public String getCustBirth() {
		return custBirth;
	}

	public void setCustBirth(String custBirth) {
		this.custBirth = custBirth;
	}

	public String getCustNickName() {
		return custNickName;
	}

	public void setCustNickName(String custNickName) {
		this.custNickName = custNickName;
	}

	public String getCustPwd() {
		return custPwd;
	}

	public void setCustPwd(String custPwd) {
		this.custPwd = custPwd;
	}

	public int getCustDecNum() {
		return custDecNum;
	}

	public void setCustDecNum(int custDecNum) {
		this.custDecNum = custDecNum;
	}


	@Override
	public String toString() {
		return "ID : " + custId + "\n 이름 : " + custName + "\n 이메일  : " + custMail + "\n 주소  : "
				+ custAddr + ", custGender=" + custGender + ", custTel=" + custTel + ", custBirth=" + custBirth
				+ "\n 닉네임  : " + custNickName + ", custPwd=" + custPwd + ", custDecNum=" + custDecNum
				+ ", custPhoto=" + custPhoto + "]";
	}

}
