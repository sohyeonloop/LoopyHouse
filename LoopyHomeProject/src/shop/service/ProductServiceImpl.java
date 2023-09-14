package shop.service;

import java.util.List;

import shop.dao.IProductDao;
import shop.dao.ProductDaoImpl;
import shop.vo.ProductVO;

public class ProductServiceImpl implements IProductService{

	private IProductDao prodDao;
	private static IProductService prodService;
	
	private ProductServiceImpl() {
		prodDao = ProductDaoImpl.getInstance();
	}
	
	public static IProductService getInstance() {
		if(prodService == null) {
			prodService = new ProductServiceImpl();
		}
		return prodService;
	}
	
	//移댄뀒怨좊━蹂� �긽�뭹�럹�씠吏� 由ъ뒪�듃 硫붿꽌�뱶
	@Override
	public List<ProductVO> selectCateProd(String cateCode) {
		return prodDao.selectCateProd(cateCode);
	}
	
	@Override
	public List<ProductVO> selectSaleProd(String cateCode) {
		return prodDao.selectSaleProd(cateCode);
	}

	@Override
	public List<ProductVO> selectWishProd(String cateCode) {
		return prodDao.selectWishProd(cateCode);
	}
	
	//�긽�뭹 �긽�꽭 由ъ뒪�듃
	@Override
	public ProductVO getDetail(String prodCode) {
		return prodDao.getDetail(prodCode);
	}

	@Override
	public int prodWishUp(String prodCode) {
		return prodDao.prodWishUp(prodCode);
	}

	@Override
	public int prodWishDown(String prodCode) {
		return prodDao.prodWishDown(prodCode);
	}

	@Override
	public ProductVO getProdPrice(ProductVO pv) {
		return prodDao.getProdPrice(pv);
	}
	
	@Override
	public List<ProductVO> CateProd() {
		return prodDao.CateProd();
	}

	@Override
	public List<ProductVO> searchProd(String searchText) {
		return prodDao.searchProd(searchText);
	}

	@Override
	public List<ProductVO> getAllProdCode() {
		return prodDao.selectAllProdCode();
	}

	@Override
	public List<ProductVO> getAllCateProd(ProductVO pv) {
		return prodDao.selectCateAllProd(pv);
	}

	@Override
	public int registProd(ProductVO pv) {
		return prodDao.insertProd(pv);
	}

	@Override
	public int removeProd(ProductVO pv) {
		return prodDao.deleteProd(pv);
	}

	@Override
	public int prodSaleUp(ProductVO pv) {
		return prodDao.prodSaleUp(pv);
	}
	
}
