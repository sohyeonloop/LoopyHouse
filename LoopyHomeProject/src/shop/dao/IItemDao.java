package shop.dao;

import java.util.List;

import shop.vo.ItemVO;

public interface IItemDao {
	
	//
	public int addCart(ItemVO iv);
	
	public int ordNoCheck(String ordNo);
	
	public int updateQty(ItemVO iv);
	
	// 회원 장바구니 조회
	public List<ItemVO> selectItems(ItemVO iv);
	// 장바구니 삭제
	public int deleteItems(ItemVO iv);
	
	public List<ItemVO> orderNumber(String prodCode);
	
	public int itemStUpdate(ItemVO iv);
	
	//오더넘버 장바구니 조회
	public List<ItemVO> selectOrdItem(ItemVO iv);
}
