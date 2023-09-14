package comm.service;

import java.util.List;
import java.util.Map;

import comm.vo.NoticeVO;

public interface INoticeBoardService {
	
	//공지게시판 개수 확인메서드
	public int countNBoardList();
	
	//공지게시판 가져오는 메서드
	public List<NoticeVO> getAllNBoard(Map<String, Object> map);
	
	
	//공지게시판 등록
	public int registNotice(NoticeVO nv);
	
	//공지게시판 수정
	public int modifyNotice(NoticeVO nv);
	
	//공지게시판 삭제
	public int removeNotice(NoticeVO nv);
	
	//조회수 증가
	public int increaseNoticeViews(NoticeVO nv);
	
	//최근게시물 조회
	public List<NoticeVO> getRecentNotice(int boardCount);
	
}

	
