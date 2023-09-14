package shop.service;

import java.util.List;

import shop.dao.IItemDao;
import shop.dao.ItemDaoImpl;
import shop.vo.ItemVO;

public class ItemServiceImpl implements IItemService {
	
	private IItemDao itemDao;
	private static IItemService itemService;
	
	private ItemServiceImpl() {
		itemDao = ItemDaoImpl.getInstance();
	}
	
	public static IItemService getInstance() {
		if(itemService == null) {
			itemService = new ItemServiceImpl();
		}
		return itemService;
	}
	
	
	@Override
	public int addCart(ItemVO iv) {
		int cnt = itemDao.addCart(iv);
		return cnt;
	}
	
	public int ordNoCheck(String ordNo) {
		int cnt = itemDao.ordNoCheck(ordNo);
		return cnt;
	}

	@Override
	public int updateQty(ItemVO iv) {
		int cnt = itemDao.updateQty(iv);
		return cnt;
	}

	@Override
	public List<ItemVO> selectItems(ItemVO iv) {
		return itemDao.selectItems(iv);
	}

	@Override
	public int deleteItems(ItemVO iv) {
		return itemDao.deleteItems(iv);
	}
	
	@Override
	public List<ItemVO> orderNumber(String prodCode) {
		return itemDao.orderNumber(prodCode);
	}

	@Override
	public int itemStUpdate(ItemVO iv) {
		return itemDao.itemStUpdate(iv);
	}

	@Override
	public List<ItemVO> getOrdItem(ItemVO iv) {
		return itemDao.selectOrdItem(iv);
	}
	
	

}
