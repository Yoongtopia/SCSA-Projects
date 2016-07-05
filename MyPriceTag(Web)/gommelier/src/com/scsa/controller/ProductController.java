package com.scsa.controller;

import java.io.File;
import java.io.IOException;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.shineware.nlp.komoran.core.MorphologyAnalyzer;
import kr.co.shineware.util.common.model.Pair;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.android.gcm.server.Message;
import com.google.android.gcm.server.Result;
import com.google.android.gcm.server.Sender;
import com.scsa.service.NoticeService;
import com.scsa.service.ProductService;
import com.scsa.service.PushService;
import com.scsa.service.TagService;
import com.scsa.service.UnivService;
import com.scsa.service.UserService;
import com.scsa.vo.Img;
import com.scsa.vo.Product;
import com.scsa.vo.Push;
import com.scsa.vo.Tag;
import com.scsa.vo.Univ;
import com.scsa.vo.User;

@Controller("productController")
public class ProductController {


	@Autowired
	private ProductService productService;

	@Autowired
	private TagService tagService;
	
	@Autowired
	private PushService pushService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private UnivService univService;
	
	public void setPushService(PushService pushService) {
		this.pushService = pushService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public void setTagService(TagService tagService) {
		this.tagService = tagService;
	}
	
	@RequestMapping("/move_regist_product.do")
	public String moveRegistProduct(Model model) {
		model.addAttribute("page", "/match/regist_product.jsp");
		return "index";
	}

	@RequestMapping("/match.do")
	public String match(String product_price, String square_num, String tag,
			Model model) {
		model.addAttribute("page", "/match/match.jsp");
		return "index";
	}

	// 占승깍옙 占쏙옙占�
	@RequestMapping("/result.do")
	public String result(String match_tag, int square_num, int product_price,
			Model model) {
		String[] tags = changeStringtoArray(match_tag);
		
		List<Product> list = productService.findProductListForMatchResult(tags,
				square_num, product_price);
		List<User> userInfoOfProduct = new ArrayList<>();
		ArrayList<String> tagList = new ArrayList<>();
		for (int i = 0; i < tags.length; i++) {
			tagList.add(tags[i]);
		}
		
		for(Product p : list){
			p.setUser(productService.productDetailByNum(p.getProduct_num()).getUser());
		}
		
		model.addAttribute("tags", tagList);
		model.addAttribute("list", list);
		model.addAttribute("page", "/match/result.jsp");
		return "index";
	}

	// 占승깍옙 占쌘듸옙占싹쇽옙
	@RequestMapping("/tag_autocomplete.do")
	@ResponseBody
	public String[] tagAutocomplete(String tag, Model model) {
		String[] tags = tagService.tagAutoComplete();
		return tags;
	}

	// 占승깍옙 > 占승깍옙占쏙옙천
	@RequestMapping("/tag_recommend.do")
	@ResponseBody
	public List<Tag> tagRecommend(String tag, Model model) {
		if (tag.equals("[]")) {
			return null;
		} else {
			String[] tags = changeStringtoArray(tag);
			return tagService.findTagListByTag(tags);
		}
	}

	// ["占쏙옙", "占쏙옙"] 占쏙옙占쏙옙占�占쏙옙트占쏙옙占쏙옙 array占쏙옙 占쏙옙환占싹댐옙 占신쇽옙占쏙옙
	static public String[] changeStringtoArray(String tag) {
		final int SIZE = tag.length();
		String [] tagArray = tag.substring(1, SIZE - 1).replace("\"", "").split(",");
		ArrayList<String> templist = new ArrayList<>();
		for (int i = 0; i < tagArray.length; i++) {
			String string = tagArray[i];
			if(!templist.contains(string)) templist.add(string);
		}
		String[] tags = new String[templist.size()];
		templist.toArray(tags);
		return tags;
	}

	// 占쏙옙품 占쏙옙占쏙옙트 占쏙옙占쏙옙咀곤옙占�
	@RequestMapping("/product_list_by_square.do")
	public String productListBySquare(int square_num, Model model) {
		model.addAttribute("list",
				productService.productListBySquare(square_num));
		model.addAttribute("page", "/product_list.jsp");
		return "index";
	}

	// 占쏙옙품 占싯삼옙
	@RequestMapping("/product_search.do")
	public String productSearch(String text, Model model) {
		List<Product> list = null;
		/*if (square_num == 0) {*/
			list = productService.productListByTag(text);
		/*}else{
			list = productService.productListByTag(text, square_num);			
		}
*/		
		model.addAttribute("list",list);
		model.addAttribute("page", "/product_list.jsp");
		return "index";
	}
	
	@RequestMapping("product_search_click.do")
	public String TagClick(String text, int square_num, Model model) {
		model.addAttribute("list",productService.productListByTag(text, square_num));
		model.addAttribute("page", "/product_list.jsp");
		return "index";
	}
	
	//파일 등록
	@RequestMapping(value = "/regist_product.do", method = RequestMethod.POST)
	public String RegistProduct(Product product, String tag,
			@RequestParam("file") ArrayList<MultipartFile> file,
			@RequestParam("main_file") MultipartFile mainFile,
			HttpSession httpSession, HttpServletRequest request, Model model)
			throws IllegalStateException, IOException {
		//유저 세션~
		product.setUser_id(((User) httpSession.getAttribute("user"))
				.getUser_id());

		// 태그 리스트~
		product.setTagList(new ArrayList<Tag>());
		String[] tags = changeStringtoArray(tag);
		for (String string : tags) {
			
			Tag tempTag = new Tag();
			tempTag.setTag(string);
			product.getTagList().add(tempTag);
		}
		
		// 이미지~
		product.setImgList(new ArrayList<Img>());
		String saveDir = request.getServletContext().getRealPath("/images");
		
		// 메인 이미지~
		String nameGenerator = new BigInteger(130, new SecureRandom()).toString();
		mainFile.transferTo(new File(saveDir + "/" + nameGenerator +  mainFile.getOriginalFilename()));
		Img tempImg = new Img();
		tempImg.setImg(nameGenerator + mainFile.getOriginalFilename());
		tempImg.setImg_main(1);
		product.getImgList().add(tempImg);
		// 다른 사진은 없어도 등록이 됨
		for (MultipartFile f : file) {
			if(!f.isEmpty()){				
				if(!mainFile.getOriginalFilename().equals( f.getOriginalFilename()) ){
					if(mainFile.getSize() != f.getSize()){
						
						f.transferTo(new File(saveDir + "/" + nameGenerator + f.getOriginalFilename()));
						Img img = new Img();
						img.setImg(nameGenerator + f.getOriginalFilename());
						product.getImgList().add(img);					
					}
				}
			}
		}

		// 등록~
		int product_num = productService.productCreate(product);
		
		// 푸쉬로~
		product.setProduct_num(product_num);
		pushMsgSend(request, null, product);
		
		model.addAttribute("square_num", product.getSquare_num());
		return "redirect: product_list_by_square.do";
	}

	// 占쏙옙占승븝옙占쏙옙
	@RequestMapping("product_update_status.do")
	@ResponseBody
	public boolean updateProductStatus(int product_num, int product_status, Model model) {
		if(product_status == 1){
			product_status = 2;
		}
		return productService.updateProductStatus(product_num, product_status);
	}
	
	// 占쏙옙占승쇽옙 占싻쇽옙
	@RequestMapping(value="analysis.do", method=RequestMethod.POST)
	@ResponseBody
	public String[] analysis (String product_content, Model model, HttpServletRequest request){
		ArrayList<Tag> tagList = new ArrayList<Tag>();
			
		String path = request.getServletContext().getRealPath("/datas");
		MorphologyAnalyzer analyzer = new MorphologyAnalyzer(path);
/*		analyzer.setUserDic(path+"/dic.txt");*/
		List<List<Pair<String,String>>> result =  analyzer.analyze(product_content);
		
		for (List<Pair<String, String>> wordResult : result) {
			for (Pair<String, String> pair : wordResult) {
				if (pair.getSecond().matches("NN[A-Z]*")) {
					if(pair.getFirst().toString().length() >= 2){
						tagList.add(new Tag(0, 0, pair.getFirst().toString(), 0));
					}
				}
			}
		}
		
		final int SIZE = tagList.size();
		String[] tags = new String[SIZE];
		for (int i = 0; i < SIZE; i++) {
			 tags[i] = tagList.get(i).getTag();
		}

		return tags;
	}
	
	//占쏙옙占쏙옙咀곤옙占�占쏙옙품占쏙옙占쏙옙트
	@RequestMapping("/product_list_by_square_pg.do")
	public String productListBySquarePG(int square_num, Model model) {
		model.addAttribute("list",
				productService.productListBySquare(square_num));
		model.addAttribute("page", "/product_list.jsp");
		return "index";
	}
	
	//占쏙옙품占쏙옙占쏙옙
	@RequestMapping("/delete_product_by_num.do")
	@ResponseBody
	public HashMap<String, Object> removeProductByNum(int[] product_num){
		HashMap<String, Object> map = new HashMap<String, Object>();
		boolean flag = false; 
		
		for (int i : product_num) {
			flag = productService.productRemoveByNum(i);			
		}
				
		if(flag){
			map.put("status", true);
		}else{
			map.put("status", false);
		}
		return map;
	}
	
	@RequestMapping("after_sale.do")
	@ResponseBody
	public HashMap<String, Object> afterSale(int[] product_num){
		HashMap<String, Object> map = new HashMap<String, Object>();
		return map;
	}

	//이미지 확대
	@RequestMapping("product_image_expansion.do")
	public String productImageExpansion(int product_num, Model model) {

		Product product = productService.productDetailByNum(product_num);
		model.addAttribute("product", product);
		return "my_info/imageExpansion";
	}
	

	//占쏙옙품 占쏙옙占쏙옙
	@RequestMapping("product_modify.do")
	public String productDetail(int product_num, Model model) {
		
		Product product = productService.productDetailByNum(product_num);
		ArrayList<String> tag = new ArrayList<>();
		for (Tag t : product.getTagList()) {
			tag.add(t.getTag());
		}
		
		model.addAttribute("tag", tag);
		model.addAttribute("product", product);
		model.addAttribute("page", "/match/regist_product.jsp");
		return "index";
	}
	
	
	
	//푸占쏙옙 占쏙옙占�
	public void pushMsgSend(HttpServletRequest request, HttpServletResponse response, Product product) {
		List<Push> sendList = pushService.pushMegSend(product);
		final int SIZE = sendList.size();
		if (SIZE > 0) {
			Sender sender = new Sender("AIzaSyBwkLDUhb2iQG2T1pdwpYeo4kzuLlTHOE4");							//푸占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙체 占쏙옙
			Message.Builder builder = new Message.Builder();	//푸占쏙옙 占쌨쏙옙占쏙옙 占쏙옙占쏙옙占�占쏙옙체
			
			Map<String, String[]> map = request.getParameterMap();	//占식띰옙占쏙옙占�占쏙옙占쏙옙 占쌨아울옙
			Iterator<String> iterator = map.keySet().iterator();				//占쏙옙占쏙옙 占쏙옙占�키占쏙옙 占쌨아울옙
			while(iterator.hasNext()) {
				String key = iterator.next();									//占식띰옙占쏙옙占쏙옙占�키
				//String key = "product_num";									//占식띰옙占쏙옙占쏙옙占�키
				String values[] = map.get(key);								//占식띰옙占쏙옙占�占쏙옙
				String value = null;												//푸占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙
				//String value = Integer.toString(product.getProduct_num());												//푸占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙
				if(values != null) {
					for(String v : values)
						value += v+",";											//占썼열占쏙옙 a,b,c,d 占쏙옙占쏙옙占쏙옙 占쏙옙占쌘울옙占쏙옙 占쏙옙占쏙옙
						value = value.substring(0, value.length()-1);
				}
				
				builder.addData(key, value);								//푸占쏙옙 占쌨쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쌩곤옙
				builder.addData("product_num", Integer.toString(product.getProduct_num()));
			}
			
/*			String product_num = Integer.toString(product.getProduct_num());
			builder.addData("product_num", product_num);
			*/
			
			for (int i = 0; i < SIZE; i++) {
				if (sendList.get(i).getReg_id() != null) {
					Message msg = builder.build();												//푸占쏙옙 占쌨쏙옙占쏙옙 占쏙옙
					try {
						Result result = sender.send(msg, sendList.get(i).getReg_id(), 5);					//푸占쏙옙 占쏙옙占�
						String error = result.getErrorCodeName();					//占쏙옙占쏙옙占쌘듸옙
						String msgId = result.getMessageId();						//푸占쏙옙 占쌨쏙옙占쏙옙 id
						
						request.setAttribute("error", error);							//占쏙옙占쏙옙占쌨쏙옙占쏙옙 占쏙옙占쏙옙
						request.setAttribute("msgId", msgId);						//푸占쏙옙 占쌨쏙옙占쏙옙 id 占쏙옙占쏙옙
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				pushService.pushCheck(2, sendList.get(i).getProduct_num(), sendList.get(i).getPush_num());
			}
		}
	}
}