package user.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import comm.vo.BlackListVO;
import user.dao.IUserDao;
import user.dao.UserDaoImpl;
import user.vo.CustomerVO;
import user.vo.ManagerVO;
import util.MyBatisUtil;

public class UserServiceImpl implements IUserService {

	private IUserDao userDao;
	private static IUserService userService;

	private UserServiceImpl() {
		userDao = UserDaoImpl.getInstance();
	}

	public static IUserService getInstance() {
		if (userService == null) {
			userService = new UserServiceImpl();
		}
		return userService;
	}

	@Override
	public boolean checkMng(ManagerVO mng) {
		return userDao.checkMng(mng);
	}

	@Override
	public int joinCustomer(CustomerVO cv) {
		int cnt = userDao.joinCustomer(cv);

		return cnt;
	}

	@Override
	public List<CustomerVO> selectAllCustomer() {
		return null;
	}

	@Override
	public int inserCustomer(CustomerVO cv) {
		return userDao.insertCustomer(cv);
	}

	@Override
	public int updateCustomer(CustomerVO cv) {
		return userDao.updateCustomer(cv);
	}

	@Override
	public int deleteCustomer(String id) {
		return userDao.deleteCustomer(id);
	}

	@Override
	public boolean checkCust(CustomerVO cust) {
		return userDao.checkCust(cust);
	}

	@Override
	public CustomerVO detailCostomer(String id) {
		return userDao.detailCustomer(id);	
	}

	@Override
	public int deleteUpdate(String id) {
		return userDao.deleteUpdate(id);
	}

	@Override
	public CustomerVO findId(String custTel) {
		return userDao.findId(custTel);
	}

	@Override
	public int decareUpdate(String id) {
		return userDao.decareUpdate(id);
	}
	
		@Override
	public List<CustomerVO> getDecNumCustomer() {
		return userDao.selectDecNumCustomer();
	}

	@Override
	public int registBlackList(BlackListVO bList) {
		return userDao.insertBlackList(bList);
	}

	@Override
	public List<BlackListVO> selectAllBlackList() {
		return userDao.selectAllBlackList();
	}

}
