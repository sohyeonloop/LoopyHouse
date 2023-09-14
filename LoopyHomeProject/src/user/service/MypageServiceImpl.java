package user.service;

import java.util.HashMap;
import java.util.List;

import user.dao.IMypageDao;
import user.dao.MypageDaoImpl;

public class MypageServiceImpl implements IMypageService {

	private IMypageDao myDao;
	private static IMypageService daoService;
	
	private MypageServiceImpl() {
		myDao = MypageDaoImpl.getInstance();
	}
	
	public static IMypageService getInstance() {
		if(daoService == null) {
			daoService = new MypageServiceImpl();
		}
		return daoService;
	}
	
	@Override
	public List<HashMap<String, Object>> selectOrder(String id) {
		return myDao.selectOrder(id);
	}
	
	
	@Override
	public List<HashMap<String, Object>> selectWish(String id) {
		return myDao.selectWish(id);
	}

}
