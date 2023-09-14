package comm.vo;

public class InqComtVO {
	private String inqCmNo;
	private String inqCmDate;
	private String inqCmContent;
	private String inqNo;
	private String mngId;
	
	public InqComtVO() {
		// TODO Auto-generated constructor stub
	}

	public InqComtVO(String userId, String boardNo, String content) {
		this.mngId = userId;
		this.inqNo = boardNo;
		this.inqCmContent = content;
	}

	public InqComtVO(String comtNo) {
		this.inqCmNo = comtNo;
	}

	public String getInqCmNo() {
		return inqCmNo;
	}

	public void setInqCmNo(String inqCmNo) {
		this.inqCmNo = inqCmNo;
	}

	public String getInqCmDate() {
		return inqCmDate;
	}

	public void setInqCmDate(String inqCmDate) {
		this.inqCmDate = inqCmDate;
	}

	public String getInqCmContent() {
		return inqCmContent;
	}

	public void setInqCmContent(String inqCmContent) {
		this.inqCmContent = inqCmContent;
	}

	public String getInqNo() {
		return inqNo;
	}

	public void setInqNo(String inqNo) {
		this.inqNo = inqNo;
	}

	public String getMngId() {
		return mngId;
	}

	public void setMngId(String mngId) {
		this.mngId = mngId;
	}
	
	
}
