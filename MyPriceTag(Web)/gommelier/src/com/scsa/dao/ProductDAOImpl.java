package com.scsa.dao;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scsa.vo.Product;
@Repository
public class ProductDAOImpl implements ProductDAO {
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public int productInsert(Product product) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("product_price", product.getProduct_price());
		map.put("square_num", product.getSquare_num());
		map.put("product_content", product.getProduct_content());
		map.put("user_id", product.getUser_id());
		map.put("imgList", product.getImgList());
		map.put("tagList", product.getTagList());
		sqlSessionTemplate.insert("Product.productInsert", map);
		return sqlSessionTemplate.selectOne("Product.lastProduct");
	}

	@Override
	public boolean productDeleteByNum(int product_num) {
		return sqlSessionTemplate.delete("Product.productDeleteByNum", product_num) > 0;
	}

	@Override
	public List<Product> productListById(String user_id) {
		return sqlSessionTemplate.selectList("Product.productListById", user_id);
	}

	@Override
	public Product productDetailByNum(int product_num) {
		return sqlSessionTemplate.selectOne("Product.productDetailByNum", product_num);
	}

	@Override
	public List<Product> productListByTag(String tag) {
		return sqlSessionTemplate.selectList("Product.productListByTag", tag);
	}
	
	@Override
	public List<Product> productListByTag(String tag, int square_num) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("tag", tag);
		map.put("square_num", square_num);
		return sqlSessionTemplate.selectList("Product.productListByTagAndSquare", map);
	}
	
	@Override
	public List<Product> productListBySquare(int square_num) {
		return sqlSessionTemplate.selectList("Product.productListBySquare", square_num);
	}

	@Override
	public List<Product> selectProductListForMatchResult(String[] tag,
			int square_num, int product_price) {
		/*for (int i = 0; i < tag.length; i++) {
			System.out.println(tag[i].toString());
		}		
		HashMap<String, Object> map = new HashMap<>();
		map.put("tag", tag);
		map.put("square_num", square_num);
		map.put("product_price", product_price);
		return sqlSessionTemplate.selectList("Product.selectProductListForMatchResult", map);*/
		
		//tag 媛쒖닔���곴��놁씠 and 寃�깋
		HashMap<String, Object> map = new HashMap<>();
		map.put("square_num", square_num);
		map.put("product_price", product_price);
		map.put("tag", tag);
		ArrayList<Product> list = new ArrayList<>();
		
		List<Product> aa = sqlSessionTemplate.selectList("Product.selectProductListForMatchResult", map);
		list.addAll(aa);
		
		
		switch (tag.length) {
		case 2:
			//�쒓렇媛�2媛쒖씪 寃쎌슦
			//1媛��쒓렇濡�寃�깋�댁꽌 list��異붽�
			String[] tag2_0 = {tag[0]};
			String[] tag2_1 = {tag[1]};
			
			map.put("tag", tag2_0);
			List<Product> a = (sqlSessionTemplate.selectList("Product.selectProductListForMatchResult", map));
			list.addAll(a);
		
			
			map.put("tag", tag2_1);
			List<Product> b = (sqlSessionTemplate.selectList("Product.selectProductListForMatchResult", map));
			list.addAll(b);
						
			break;
		case 3:
			//�쒓렇媛�3媛쒖씪 寃쎌슦 
			//3媛쒖쨷 2媛쒕줈 寃�깋�댁꽌 list 異붽�
			String[] tag3_01 = {tag[0],tag[1]};
			String[] tag3_02 = {tag[0],tag[2]};
			String[] tag3_12 = {tag[1],tag[2]};
			
			map.put("tag", tag3_01);
			List<Product> c = (sqlSessionTemplate.selectList("Product.selectProductListForMatchResult", map));
			list.addAll(c);
			
			map.put("tag", tag3_02);
			List<Product> d = (sqlSessionTemplate.selectList("Product.selectProductListForMatchResult", map));
			list.addAll(d);
			
			map.put("tag", tag3_12);
			List<Product> e = (sqlSessionTemplate.selectList("Product.selectProductListForMatchResult", map));
			list.addAll(e);
			
			// 1媛��쒓렇濡�寃�깋�댁꽌 list 異붽�
			String[] tag3_0 = {tag[0]};
			String[] tag3_1 = {tag[1]};
			String[] tag3_2 = {tag[2]};
			
			map.put("tag", tag3_0);
			List<Product> f = (sqlSessionTemplate.selectList("Product.selectProductListForMatchResult", map));
			list.addAll(f);
			
			map.put("tag", tag3_1);
			List<Product> g = (sqlSessionTemplate.selectList("Product.selectProductListForMatchResult", map));
			list.addAll(g);
			
			map.put("tag", tag3_2);
			List<Product> h = (sqlSessionTemplate.selectList("Product.selectProductListForMatchResult", map));
			list.addAll(h);
			
			break;
		case 4:
			//�쒓렇媛�4媛쒖씪 寃쎌슦
			//3媛쒕줈 寃�깋
			String[] tag4_012 = {tag[0],tag[1],tag[2]};
			String[] tag4_013 = {tag[0],tag[1],tag[3]};
			String[] tag4_023 = {tag[0],tag[2],tag[3]};
			String[] tag4_123 = {tag[1],tag[2],tag[3]};
			
			map.put("tag", tag4_012);
			List<Product> k = (sqlSessionTemplate.selectList("Product.selectProductListForMatchResult", map));
			list.addAll(k);
			
			map.put("tag", tag4_013);
			List<Product> l = (sqlSessionTemplate.selectList("Product.selectProductListForMatchResult", map));
			list.addAll(l);
			
			map.put("tag", tag4_023);
			List<Product> m = (sqlSessionTemplate.selectList("Product.selectProductListForMatchResult", map));
			list.addAll(m);
			
			map.put("tag", tag4_123);
			List<Product> n = (sqlSessionTemplate.selectList("Product.selectProductListForMatchResult", map));
			list.addAll(n);
			
			//2媛쒕줈 寃�깋
			String[] tag4_01 = {tag[0],tag[1]};
			String[] tag4_02 = {tag[0],tag[2]};
			String[] tag4_03 = {tag[0],tag[3]};
			String[] tag4_12 = {tag[1],tag[2]};
			String[] tag4_13 = {tag[1],tag[3]};
			String[] tag4_23 = {tag[2],tag[3]};
			
			map.put("tag", tag4_01);
			List<Product> o = (sqlSessionTemplate.selectList("Product.selectProductListForMatchResult", map));
			list.addAll(o);
			
			map.put("tag", tag4_02);
			List<Product> p = (sqlSessionTemplate.selectList("Product.selectProductListForMatchResult", map));
			list.addAll(p);
			
			map.put("tag", tag4_03);
			List<Product> q = (sqlSessionTemplate.selectList("Product.selectProductListForMatchResult", map));
			list.addAll(q);

			map.put("tag", tag4_12);
			List<Product> r = (sqlSessionTemplate.selectList("Product.selectProductListForMatchResult", map));
			list.addAll(r);
			
			map.put("tag", tag4_13);
			List<Product> s = (sqlSessionTemplate.selectList("Product.selectProductListForMatchResult", map));
			list.addAll(s);
			
			map.put("tag", tag4_23);
			List<Product> t = (sqlSessionTemplate.selectList("Product.selectProductListForMatchResult", map));
			list.addAll(t);
			
			//1媛쒕줈 寃�깋
			String[] tag4_0 = {tag[0]};
			String[] tag4_1 = {tag[1]};
			String[] tag4_2 = {tag[2]};
			String[] tag4_3 = {tag[3]};
			
			map.put("tag", tag4_0);
			List<Product> u = (sqlSessionTemplate.selectList("Product.selectProductListForMatchResult", map));
			list.addAll(u);
			
			map.put("tag", tag4_1);
			List<Product> v = (sqlSessionTemplate.selectList("Product.selectProductListForMatchResult", map));
			list.addAll(v);
			
			map.put("tag", tag4_2);
			List<Product> w = (sqlSessionTemplate.selectList("Product.selectProductListForMatchResult", map));
			list.addAll(w);

			map.put("tag", tag4_3);
			List<Product> x = (sqlSessionTemplate.selectList("Product.selectProductListForMatchResult", map));
			list.addAll(x);
			break;
		default:
			break;
		}
		
/*		HashMap<Integer, Product> list2 = new HashMap<>();
		for (int i = 0; i < list.size(); i++) {
			if(!list2.containsKey(list.get(i).getProduct_num())){
				list2.put(list.get(i).getProduct_num(), list.get(i));
			}
		}
		*/
		
		
	////////////////	
		for (int i = 0; i < list.size(); i++) {
			for (int j = i+1; j < list.size(); j++) {
				if(list.get(i).getProduct_num() == list.get(j).getProduct_num()){
					list.remove(j);
				}
			}
		}
		
		for (int i = 0; i < list.size(); i++) {
			for (int j = i+1; j < list.size(); j++) {
				if(list.get(i).getProduct_num() == list.get(j).getProduct_num()){
					list.remove(j);
				}
			}
		}
		
		for (int i = 0; i < list.size(); i++) {
			for (int j = i+1; j < list.size(); j++) {
				if(list.get(i).getProduct_num() == list.get(j).getProduct_num()){
					list.remove(j);
				}
			}
		}
		
		
/*		for (Product product : list) {
			if(!list2.containsKey(product.getProduct_num())){
				list2.put(product.getProduct_num(), product);
			}
		}
		*/
/*		List<Product> uniqList = new ArrayList<>(list2.values());*/

		System.out.println("////////////////////////////////////////////////////////");
		System.out.println(list.size());
		for (int j	 = 0; j < list.size(); j++) {
			System.out.println(list.get(j).getProduct_num());
		}
/*		System.out.println("////////////////////////////////////////////////////////");
		System.out.println(uniqList.size());
		for (int j = 0; j < uniqList.size(); j++) {
			System.out.println(uniqList.get(j).getProduct_num());
		}
		System.out.println("////////////////////////////////////////////////////////");
*/
		return list;
	}

	@Override
	public String selectUserIdByProductNum(String product_num) {
		return sqlSessionTemplate.selectOne("Product.selectUserIdByProductNum", product_num);
	}

	@Override
	public List<Product> mProductList() {
		return sqlSessionTemplate.selectList("Product.mProductList");
	}

	@Override
	public boolean updateProductStatus(int product_num, int product_status) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("product_num", product_num);
		map.put("product_status", product_status);
		return sqlSessionTemplate.update("Product.updateProductStatus", map) > 0;
	}

	@Override
	public String findSellingRate(String user_id) {
		return sqlSessionTemplate.selectOne("Product.findSellingRate", user_id);
	}
	
	@Override
	public String findSellingRate2(String user_id) {
		return sqlSessionTemplate.selectOne("Product.findSellingRate2", user_id);
	}



}
