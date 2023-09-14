package user.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.MyBatisUtil;

public class MypageDaoImpl extends MyBatisDao implements IMypageDao {

	private static IMypageDao myDao;

	private MypageDaoImpl() {
	}

	public static IMypageDao getInstance() {
		if (myDao == null) {
			myDao = new MypageDaoImpl();
		}
		return myDao;
	}

	@Override
	public List<HashMap<String, Object>> selectOrder(String id) {
		
		List<HashMap<String, Object>> list =  selectList("user.selectOrder",id);
		return list;
	}
	
	
	@Override
	public List<HashMap<String, Object>> selectWish(String id) {
		
		List<HashMap<String, Object>> list =  selectList("user.selectWish",id);
		return list;
	}
	
	
}
