package shop.dao;

import org.apache.ibatis.session.SqlSession;

import shop.vo.ItemVO;
import shop.vo.OrderVO;
import user.dao.MyBatisDao;
import util.MyBatisUtil;

public class OrderDaoImpl extends MyBatisDao implements IOrderDao {
	
	private static IOrderDao orderDao;
	
	private OrderDaoImpl() {}
	
	public static IOrderDao getInstance() {
		if(orderDao == null) {
			orderDao = new OrderDaoImpl();
		}
		return orderDao;
	}
	
	@Override
	public int addOrder(OrderVO ov) {
		int cnt = insert("shop.addOrder", ov);
		return cnt;
	}

	@Override
	public int ordNoProdCheck(ItemVO item) {
		int cnt = 0;
		SqlSession session = MyBatisUtil.getInstance();
		
		cnt = session.selectOne("shop.ordNoProdCheck", item);
		return cnt;
	}

	@Override
	public OrderVO orderPriceCheck(String ordNo) {
		return selectOne("shop.orderPriceCheck",ordNo);
	}

	@Override
	public OrderVO orderNoCheck(OrderVO ordNo) {
		return selectOne("shop.orderNoCheck", ordNo);
	}

	@Override
	public int updateOrdStatus(OrderVO ov) {
		return update("shop.updateOrdStatus", ov);
	}
	
	@Override
	public int deleteOrder(OrderVO ov) {
		int cnt = update("shop.deleteOrder", ov);
		return cnt;
	}

	@Override
	public int insertReturn(String ordNo) {
		int cnt = insert("shop.insertReturn", ordNo);
		return 0;
	}
}
