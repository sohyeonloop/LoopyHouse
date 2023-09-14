package shop.dao;

import java.util.List;

import shop.vo.ProductVO;
import user.dao.MyBatisDao;

public class ProductDaoImpl extends MyBatisDao implements IProductDao{

	private static IProductDao prodDao;
	private ProductDaoImpl() {}
	
	public static IProductDao getInstance() {
		if(prodDao == null) {
			prodDao = new ProductDaoImpl();
		}
		return prodDao;
	}

	//移댄뀒怨좊━蹂� �긽�뭹�럹�씠吏� 由ъ뒪�듃 硫붿꽌�뱶
	@Override
	public List<ProductVO> selectCateProd(String cateCode) {
		
		List<ProductVO> pvList = selectList("shop.productList", cateCode);
		
		return pvList;
	}
	
	@Override
	public List<ProductVO> selectSaleProd(String cateCode) {
		List<ProductVO> pvList = selectList("shop.productListSel", cateCode);
		return pvList;
	}
	
	@Override
	public List<ProductVO> selectWishProd(String cateCode) {
		List<ProductVO> pvList = selectList("shop.productListWish", cateCode);
		return pvList;
	}
	
	//�긽�뭹 �긽�꽭 由ъ뒪�듃
	@Override
	public ProductVO getDetail(String prodCode) {
		
		ProductVO pv = selectOne("shop.prodDetail", prodCode);
		
		return pv;
	}

	@Override
	public int prodWishUp(String prodCode) {
		int cnt = update("shop.prodWishUp", prodCode);
		return cnt;
	}

	@Override
	public int prodWishDown(String prodCode) {
		int cnt = update("shop.prodWishDown", prodCode);
		return cnt;
	}

	@Override
	public ProductVO getProdPrice(ProductVO pv) {
		return selectOne("shop.selectProdPrice", pv);
	}

	@Override
	public List<ProductVO> CateProd() {
		
		List<ProductVO> pvList = selectList("shop.productAll");
		return pvList;
	}

	@Override
	public List<ProductVO> searchProd(String searchText) {
		List<ProductVO> schList = selectList("user.searchProd",searchText);
		return schList;
	}

	@Override
	public List<ProductVO> selectAllProdCode() {
		return selectList("shop.selectAllProdCode");
	}

	@Override
	public List<ProductVO> selectCateAllProd(ProductVO pv) {
		return selectList("shop.selectProd",pv);
	}

	@Override
	public int insertProd(ProductVO pv) {
		return insert("shop.registProd",pv);
	}

	@Override
	public int deleteProd(ProductVO pv) {
		return delete("shop.removePrdo", pv);
	}

	@Override
	public int prodSaleUp(ProductVO pv) {
		return update("shop.prodSaleUp",pv);
	}
	
	
	
	

}
