package user.dao;

import java.util.HashMap;
import java.util.List;

public interface IMypageDao {
	
	//주문목록 불러오기
	public List<HashMap<String, Object>> selectOrder(String id);
	
	//위시리스트 불러오기
	public List<HashMap<String, Object>> selectWish(String id);
	

}
