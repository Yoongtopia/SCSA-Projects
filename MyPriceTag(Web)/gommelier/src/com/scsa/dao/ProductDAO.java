package com.scsa.dao;

import java.util.List;

import com.scsa.vo.Product;

public interface ProductDAO {
	int productInsert (Product product);
	boolean productDeleteByNum (int product_num);
	List<Product> productListById (String user_id);
	Product productDetailByNum (int product_num);
	List<Product> productListByTag (String tag);
	List<Product> productListByTag (String tag, int square_num);
	List<Product> productListBySquare (int square_num);
	List<Product> selectProductListForMatchResult (String[] tag, int square_num, int product_price);
	String selectUserIdByProductNum(String product_num);
	List<Product> mProductList ();
	
	boolean updateProductStatus(int product_num, int product_status);
	String findSellingRate(String user_id);
	String findSellingRate2(String user_id);
}
