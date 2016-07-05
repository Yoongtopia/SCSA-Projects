package com.scsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scsa.dao.CmtDAO;
import com.scsa.dao.ProductDAO;
import com.scsa.dao.UserDAO;
import com.scsa.vo.Product;
@Service("Product")
public class ProductServiceImpl implements ProductService{

	private ProductDAO productDao;
	private CmtDAO cmtDao;
	private UserDAO userDao;
	@Autowired
	public void setUserDao(UserDAO userDao) {
		this.userDao = userDao;
	}

	@Autowired
	public void setCmtDao(CmtDAO cmtDao) {
		this.cmtDao = cmtDao;
	}

	@Autowired
	public void setProductDao(ProductDAO productDao) {
		this.productDao = productDao;
	}

	@Override
	public int productCreate(Product product) {
		return productDao.productInsert(product);
	
	}

	@Override
	public boolean productRemoveByNum(int product_num) {
		return productDao.productDeleteByNum(product_num);
	}

	@Override
	public List<Product> productListById(String user_id) {
		List<Product> list = productDao.productListById(user_id);
		return list;
	}

	@Override
	public Product productDetailByNum(int product_num) {
		Product product = productDao.productDetailByNum(product_num);
		product.setCmtList(cmtDao.cmtList(product_num));
		product.setUser(userDao.idCheck(product.getUser_id()));
		return product;
	}

	@Override
	public List<Product> productListByTag(String tag) {
		return productDao.productListByTag(tag);
	}

	@Override
	public List<Product> productListBySquare(int square_num) {
		return productDao.productListBySquare(square_num);
	}

	@Override
	public List<Product> findProductListForMatchResult(String[] tag,
			int square_num, int product_price) {

		return productDao.selectProductListForMatchResult(tag, square_num, product_price);
	}

	@Override
	public String selectUserIdByProductNum(String product_num) {
		return productDao.selectUserIdByProductNum(product_num);
	}

	@Override
	public List<Product> mProductList() {
		return productDao.mProductList();
	}

	@Override
	public boolean updateProductStatus(int product_num, int product_status) {
		return productDao.updateProductStatus(product_num, product_status);
	}

	@Override
	public List<Product> productListByTag(String tag, int square_num) {
		return productDao.productListByTag(tag, square_num);
	}

	@Override
	public String findSellingRate(String user_id) {
		return productDao.findSellingRate(user_id);
	}

	@Override
	public String findSellingRate2(String user_id) {
		return productDao.findSellingRate2(user_id);
	}

	

}
