package user.dao;

import java.util.List;


import user.vo.ManagerVO;
import org.apache.ibatis.session.SqlSession;

import comm.vo.BlackListVO;
import user.vo.CustomerVO;
import util.MyBatisUtil;

public class UserDaoImpl extends MyBatisDao implements IUserDao {
	
	private static IUserDao userDao;
	private UserDaoImpl() {}
	
	public static IUserDao getInstance() {
		if(userDao == null) {
			userDao = new UserDaoImpl();
		}
		return userDao;
	}
	
		@Override
	public boolean checkCust(CustomerVO cv) {
		int cnt = 0;
		cnt = selectOne("user.custCheck", cv)
				;
		  boolean isExist = false;
	      if (cnt > 0) {
	         isExist = true;
	      }

	      return isExist;
	}

	@Override
	public boolean checkMng(ManagerVO mng) {
		int cnt = 0;
		cnt = selectOne("user.mngCheck", mng);
		  boolean isExist = false;
	      if (cnt > 0) {
	         isExist = true;
	      }

	      return isExist;
	}
	

	
	@Override
	public int joinCustomer(CustomerVO cv) {
		int cnt = insert("user.join", cv);
		return cnt;
	}

	
	
	@Override
	public List<CustomerVO> selectAllCustomer() {
		List<CustomerVO> list = null;
		SqlSession session = MyBatisUtil.getInstance(true);
		
		list= session.selectList("");
		
		return null;
	}

	@Override
	public int insertCustomer(CustomerVO cv) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateCustomer(CustomerVO cv) {
		int cnt = update("user.updateCustomer", cv);
		return cnt;
	}

	@Override
	public int deleteCustomer(String id) {
		int cnt = delete("user.deleteCustomer", id);
		return cnt;
	}

	@Override
	public CustomerVO detailCustomer(String id) {
		CustomerVO cv = null;
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			cv = session.selectOne("user.detailCustomer", id);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return cv;
	}

	@Override
	public int deleteUpdate(String id) {
		int cnt = update("user.deleteUpdate", id);
		return cnt;
	}

	@Override
	public CustomerVO findId(String custTel) {
		CustomerVO cv = null;
		SqlSession session = MyBatisUtil.getInstance();

		cv = session.selectOne("user.findId", custTel);
		return cv;
	}

	@Override
	public int decareUpdate(String id) {
		int cnt = update("user.decareUpdate", id);
		return cnt;
	}
	
	@Override
	public List<CustomerVO> selectDecNumCustomer() {
		List<CustomerVO> decCust = selectList("user.countReport");
		return decCust;
	}

	@Override
	public int insertBlackList(BlackListVO blist) {
		return insert("user.insertBlackList", blist);
	}

	@Override
	public List<BlackListVO> selectAllBlackList() {
		return selectList("user.selectAllBlackList");
	}
	
}
