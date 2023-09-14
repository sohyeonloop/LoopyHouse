package user.dao;

import java.util.List;

import comm.vo.BlackListVO;
import user.vo.CustomerVO;
import user.vo.ManagerVO;

public interface IUserDao {
	
	//회원체크(로그인) 메서드
	public boolean checkCust(CustomerVO cv);
	
	//매니저체크(로그인) 메서드
	public boolean checkMng(ManagerVO mng);
	
	
	//회원가입 메서드
	public int joinCustomer(CustomerVO cv);
	
	//전체리스트
	public List<CustomerVO> selectAllCustomer();
	
	//저장하기
	public int insertCustomer(CustomerVO cv);
	
	//수정하기
	public int updateCustomer(CustomerVO cv);
	
	//삭제하기
	public int deleteCustomer(String id);
	
	//상세보기
	public CustomerVO detailCustomer(String id);
	
	//탈퇴하기
	public int deleteUpdate(String id);
	
	//아이디찾기
	public CustomerVO findId(String custTel);
	
	//신고횟수 추가
	public int decareUpdate(String id);
	
		// 회원 신고횟수 조회
	public List<CustomerVO> selectDecNumCustomer();
	
	// 블랙리스트 추가
	public int insertBlackList(BlackListVO bList);
	
	// 블랙리스트 조회
	public List<BlackListVO> selectAllBlackList();
	
}
