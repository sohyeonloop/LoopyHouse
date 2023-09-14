package comm.service;

import java.util.List;

import java.util.Map;

import comm.vo.InqBoardVO;
import comm.vo.InqComtVO;

public interface IinqBoardService {

	// 문의게시판 글 갯수 조회
	public int countIBoard();

	// 범위 별 문의게시글 조회
	public List<InqBoardVO> inqBoardList(Map<String, Object> map);

	// 문의게시판 insert 메서드
	public int registInqBoard(InqBoardVO ibv);

	// 문의게시판 update 메서드
	public int modifyInqBoard(InqBoardVO ibv);

	// 문의게시판 delete 메서드
	public int removeInqBoard(InqBoardVO ibv);

	// 문의게시판 댓글 조회 메서드
	public List<InqComtVO> getListInqComt(InqComtVO icmv);

	// 문의게시판 댓글 insert 메서드
	public int registInqComt(InqComtVO icmv);

	// 문의게시판 댓글 update 메서드
	public int modifyInqComt(InqComtVO icmv);

	// 문의게시판 댓글 delete 메서드
	public int removeInqComt(InqComtVO icmv);
	
	// 조회수 증가
	public int increaseInqViews(InqBoardVO ibv);
	
	// 문의게시판 최근 게시물 조회
	public List<InqBoardVO> getRecentInq(int boardCount);

}
