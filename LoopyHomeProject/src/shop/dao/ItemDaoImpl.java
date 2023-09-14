package shop.dao;

import java.util.List;

import shop.vo.ItemVO;
import user.dao.MyBatisDao;

public class ItemDaoImpl extends MyBatisDao implements IItemDao{
	
	private static IItemDao itemDao;
	
	private ItemDaoImpl() {}
	
	public static IItemDao getInstance() {
		if(itemDao == null) {
			itemDao = new ItemDaoImpl();
		}
		return itemDao;
	}
	
	@Override
	public int addCart(ItemVO iv) {
		int cnt = insert("shop.addCart", iv);
		return cnt;
	}

	@Override
	public int ordNoCheck(String ordNo) {
		int cnt = selectOne("shop.ordNoCheck",ordNo);
		return cnt;
	}

	@Override
	public int updateQty(ItemVO iv) {
		int cnt = update("shop.updateQty", iv);
		return 0;
	}

	@Override
	public List<ItemVO> selectItems(ItemVO iv) {
		return selectList("shop.selectItems",iv);
	}

	@Override
	public int deleteItems(ItemVO iv) {
		return delete("shop.deleteItems",iv);
	}
	
	
	@Override
	public List<ItemVO> orderNumber(String prodCode) {
		List<ItemVO> list = selectList("shop.orderNumber", prodCode);
		
		return list;
	}

	@Override
	public int itemStUpdate(ItemVO iv) {
		int cnt = update("shop.itemStUpdate" ,iv);
		return cnt;
	}

	@Override
	public List<ItemVO> selectOrdItem(ItemVO iv) {
		return selectList("shop.selectOrdItem", iv);
	}
	
	
	
	
	
	
	
}
