package comm.dao;

import java.util.List;


import java.util.Map;

import comm.vo.InqBoardVO;
import comm.vo.InqComtVO;

public interface IinqBoardDao {

	// 문의게시판 글 갯수 조회
	public int countIBoard();

	// 범위 별 문의게시글 조회
	public List<InqBoardVO> inqBoardList(Map<String, Object> map);

	// 문의게시판 insert 메서드
	public int insertInqBoard(InqBoardVO ibv);

	// 문의게시판 update 메서드
	public int updateInqBoard(InqBoardVO ibv);

	// 문의게시판 delete 메서드
	public int deleteInqBoard(InqBoardVO ibv);

	// 문의게시판 댓글 조회 메서드
	public List<InqComtVO> getListInqComt(InqComtVO icmv);

	// 문의게시판 댓글 insert 메서드
	public int insertInqComt(InqComtVO icmv);

	// 문의게시판 댓글 update 메서드
	public int updateInqComt(InqComtVO icmv);

	// 문의게시판 댓글 delete 메서드
	public int deleteInqComt(InqComtVO icmv);
	
	// 조회수 증가
	public int updateInqViews(InqBoardVO ibv);
	
	// 문의게시판 최근 게시물 조회
	public List<InqBoardVO> selectRecentInq(int boardCount);
}
