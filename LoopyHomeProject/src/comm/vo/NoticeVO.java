package comm.vo;

public class NoticeVO {
	private String noticeNo;
	private String noticeDate;
	private String noticeTitle;
	private String noticeContent;
	private int noticeViews;
	private String mngId;
	
	public NoticeVO() {
		// TODO Auto-generated constructor stub
	}

	

	public NoticeVO(String userId, String title, String content) {
		this.mngId = userId;
		this.noticeTitle = title;
		this.noticeContent = content;
	}

	public String getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(String noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public int getNoticeViews() {
		return noticeViews;
	}

	public void setNoticeViews(int noticeViews) {
		this.noticeViews = noticeViews;
	}

	public String getMngId() {
		return mngId;
	}

	public void setMngId(String mngId) {
		this.mngId = mngId;
	}
	
	
}
