package shop.service;

import shop.dao.IOrderDao;
import shop.dao.OrderDaoImpl;
import shop.vo.ItemVO;
import shop.vo.OrderVO;
import shop.vo.ProdDtaVO;

public class OrderServiceImpl implements IOrderService {
	
	private IOrderDao orderDao;
	private static IOrderService orderService;
	
	private OrderServiceImpl() {
		orderDao = OrderDaoImpl.getInstance();
	}
	
	public static IOrderService getinstance() {
		if(orderService == null) {
			orderService = new OrderServiceImpl();
		}
		return orderService;
	}
	
	@Override
	public int addOrder(OrderVO ov) {
		int cnt = orderDao.addOrder(ov);
		return cnt;
	}

	@Override
	public int ordNoProdCheck(ItemVO item) {
		return orderDao.ordNoProdCheck(item);
	}

	@Override
	public OrderVO orderPriceCheck(String ordNo) {
		return orderDao.orderPriceCheck(ordNo);
	}

	@Override
	public OrderVO orderNoCheck(OrderVO ordNo) {
		return orderDao.orderNoCheck(ordNo);
	}

	@Override
	public int changeOrdStatus(OrderVO ov) {
		return orderDao.updateOrdStatus(ov);
	}
	
	
	@Override
	public int deleteOrder(OrderVO ov) {
		int cnt = orderDao.deleteOrder(ov);
		return cnt;
	}

	@Override
	public int insertReturn(String ordNo) {
		int cnt = orderDao.insertReturn(ordNo);
		return cnt;
	}
	
	
}
