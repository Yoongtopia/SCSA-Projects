package com.scsa.controller;

import java.util.HashMap;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scsa.service.ProductService;
import com.scsa.vo.Product;

@Controller
public class BumsikController {

	private ProductService productService;

	@Autowired
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
	@RequestMapping("/find_product_info_by_product_num.do")
	@ResponseBody
	public HashMap<String, Object> findProductByNum(String product_num){
		HashMap<String, Object> map = new HashMap<String, Object>();
		int productNum = Integer.parseInt(product_num);
		Product product = productService.productDetailByNum(productNum);
		
		if (product.getProduct_num() != 0) {
			map.put("status", true);
			map.put("product", product);
		} else {
			map.put("status", false);
		}
		return map;
	}

}
