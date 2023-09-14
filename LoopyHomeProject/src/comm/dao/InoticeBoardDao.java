package comm.dao;

import java.util.List;

import java.util.Map;

import comm.vo.NoticeVO;

public interface InoticeBoardDao {

	// 문의게시판 글 갯수 조회
	public int countNBoard();

	// 범위 별 문의게시글 조회
	public List<NoticeVO> noticeBoardList(Map<String, Object> map);
	
	//공지게시판 insert 메서드
	public int insertNotice(NoticeVO nv);
	
	//공지게시판 update 메서드
	public int updateNotice(NoticeVO nv);
	
	//공지게시판 delete 메서드
	public int deleteNotice(NoticeVO nv);
	
	//조회수 증가
	public int updateNoticeViews(NoticeVO nv);
	
	//최근 게시물 조회
	public List<NoticeVO> selectRecentNotice(int boardCount);

}
