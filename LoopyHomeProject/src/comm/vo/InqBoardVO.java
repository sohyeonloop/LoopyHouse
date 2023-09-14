package comm.vo;

import java.io.Serializable;

public class InqBoardVO {
	private String inqNo;
	private String inqTitle;
	private String inqContent;
	private String inqDate;
	private int inqViews;
	private String bdCode;
	private String custId;
	
	public InqBoardVO() {
		// TODO Auto-generated constructor stub
	}

	public InqBoardVO(String custId, String inqTitle, String inqContent) {
		this.custId = custId;
		this.inqTitle = inqTitle;
		this.inqContent = inqContent;
	}

	public String getInqNo() {
		return inqNo;
	}

	public void setInqNo(String inqNo) {
		this.inqNo = inqNo;
	}

	public String getInqTitle() {
		return inqTitle;
	}

	public void setInqTitle(String inqTitle) {
		this.inqTitle = inqTitle;
	}

	public String getInqContent() {
		return inqContent;
	}

	public void setInqContent(String inqContent) {
		this.inqContent = inqContent;
	}

	public String getInqDate() {
		return inqDate;
	}

	public void setInqDate(String inqDate) {
		this.inqDate = inqDate;
	}

	public int getInqViews() {
		return inqViews;
	}

	public void setInqViews(int inqViews) {
		this.inqViews = inqViews;
	}

	public String getBdCode() {
		return bdCode;
	}

	public void setBdCode(String bdCode) {
		this.bdCode = bdCode;
	}

	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}

	@Override
	public String toString() {
		return "InqBoardVO [inqNo=" + inqNo + ", inqTitle=" + inqTitle + ", inqContent=" + inqContent + ", inqDate="
				+ inqDate + ", inqViews=" + inqViews + ", bdCode=" + bdCode + ", custId=" + custId + "]";
	}
	
	
	
}
