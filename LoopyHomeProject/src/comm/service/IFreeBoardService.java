package comm.service;

import java.util.List;
import java.util.Map;

import comm.vo.FreeAttachVO;
import comm.vo.FreeBoardVO;
import comm.vo.FreeComtVO;

public interface IFreeBoardService {

	// 자유게시판 개수 확인메서드
	public int countFBoardList();

	// 자유게시판 가져오는 메서드
	public List<FreeBoardVO> getAllFBoard(Map<String, Object> map);

	// 자유게시판 insert 메서드
	public int registFreeBoard(FreeBoardVO fbv);

	// 자유게시판 update 메서드
	public int modifyFreeBoard(FreeBoardVO fbv);

	// 자유게시판 delete메서드
	public int removeFreeBoard(FreeBoardVO fbv);

	// 자유게시판 댓글 조회 메서드
	public List<FreeComtVO> getListFreeComt(FreeComtVO fcmv);

	// 자유게시판 댓글 insert 메서드
	public int registFreeComt(FreeComtVO fcmv);

	// 자유게시판 댓글 update 메서드
	public int modifyFreeComt(FreeComtVO fcmv);

	// 자유게시판 댓글 delete 메서드
	public int removeFreeComt(FreeComtVO fcmv);
	
	// 조회수 증가
	public int increaseFreeViews(FreeBoardVO fbv);
	
	// 자유게시판 인기게시물 조회
	public List<FreeBoardVO> getPopularFree(int boardCount);
	
	// 자유게시판 최근게시물 조회
	public List<FreeBoardVO> getRecentFree(int boardCount);
	
	// 자유게시판 검색
	public List<FreeBoardVO> searchFree(String searchText);
}
