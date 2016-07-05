package com.seoulnori.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seoulnori.vo.Tweet;
import com.seoulnori.vo.Twitter;

@Controller
public class TwitterController {

	String access_token = "1942733396-nCJE43Ve2YOJ1kgT6e6TbwVvWiLwbFxcBL7YgTR";
	String access_token_secret = "hsv2S7Dx1wR8HEvQRswI4OVGswPISowghx11xhOejw8pd";


	@RequestMapping("twitter_write.do")
	@ResponseBody
	public HashMap<String, Object> twitter(String query, Model model)
			throws JSONException {
		
		query = titleCut(query);

		HashMap<String, Object> map = new HashMap<>();
		Twitter twitter = new Twitter();
		ArrayList<Tweet> tweetList = new ArrayList<>();
		
		JSONObject json = twitter.searchTweets(query, 10, "recent", access_token, access_token_secret);
		JSONObject json1 = (JSONObject) json.get("twitter_oa");
		JSONArray json2 = (JSONArray) json1.get("statuses");
		JSONObject json3 = new JSONObject();
		JSONObject user = new JSONObject();
		
		String url = "";
		String url2 = "";
		String url3 = "";
		String text = "";
		String createAt = "";
		String afterText="";
		String beforeText="";
		String middleText="";
		String afterMiddleText="";
		
		for (int i = 0; i < json2.length(); i++) {
			json3 = (JSONObject) json2.get(i);
			text = json3.getString("text");
			user = (JSONObject) json3.get("user");
			createAt= json3.getString("created_at");
		
			
			if (text.indexOf("http://") != -1) {		
				//url 시작부분
				url = text.substring(text.indexOf("http://"), text.length());	
				beforeText = text.substring(0, text.indexOf("http://"));
				
				//url 끝부분
				if(url.indexOf('"')!=-1){
					afterText= url.substring(url.indexOf('"'),url.length());
					url = url.substring(0,url.indexOf('"'));	
				}else if(url.indexOf("+")!=-1){
					afterText= url.substring(url.indexOf("+"),url.length());
					url = url.substring(0,url.indexOf('+'));
				}else if(url.indexOf("…")!=-1){
					afterText= url.substring(url.indexOf("…"),url.length());
					url = "";
				}else if(url.indexOf("지난")!=-1){
					afterText= url.substring(url.indexOf("지난"),url.length());
					url = url.substring(0,url.indexOf("지난"));	
				}else if(url.indexOf("공연기간")!=-1){
					afterText= url.substring(url.indexOf("공연기간"),url.length());
					url = url.substring(0,url.indexOf("공연기간"));	
				}else if(url.indexOf(" ")!=-1){
					afterText= url.substring(url.indexOf(" "),url.length());
					url = url.substring(0,url.indexOf(" "));	
				}else{
					afterText= url.substring(url.length());
					
				}
				
				
				
				if(afterText.indexOf("http://")!=-1){
					//url2 시작부분
					url2 = afterText.substring(afterText.indexOf("http://"), afterText.length());	
					middleText = afterText.substring(0, afterText.indexOf("http://"));
					//url2 끝부분
					if(url2.indexOf("지난")!=-1){
						afterText= url.substring(url2.indexOf("지난"),url2.length());
						url2 = url2.substring(0,url2.indexOf("지난"));	
					}else if(url2.indexOf("공연기간")!=-1){
						afterText= url2.substring(url.indexOf("공연기간"),url2.length());
						url = url.substring(0,url.indexOf("공연기간"));	
					}else if(url2.indexOf(" ")!=-1){
						afterText= url2.substring(url2.indexOf(" "),url2.length());
						url2 = url2.substring(0,url2.indexOf(" "));	
					}else{
						afterText= url2.substring(url2.length());
						
					}

				
					if(afterText.indexOf("http://")!=-1){
						url3 = afterText.substring(afterText.indexOf("http://"), afterText.length());
						afterMiddleText =  afterText.substring(0, afterText.indexOf("http://"));
						
						if(url3.indexOf(" ")!=-1){
							afterText= url3.substring(url3.indexOf(" "),url3.length());
							url3 = url3.substring(0,url3.indexOf(" "));	
						}else{
							afterText= url3.substring(url3.length());
							
						}
					}
					
					
				}
			
			}else if(text.indexOf("ttp://") != -1) {		
				//url 시작부분
				url = text.substring(text.indexOf("ttp://"), text.length());
				beforeText = text.substring(0, text.indexOf("ttp://"));
				url = "h"+url;
				//url 끝부분
				if(url.indexOf('"')!=-1){
					afterText= url.substring(url.indexOf('"'),url.length());
					url = url.substring(0,url.indexOf('"'));	
				}else if(url.indexOf("…")!=-1){
					afterText= url.substring(url.indexOf("…"),url.length());
					url = "";
				}else if(url.indexOf("지난")!=-1){
					afterText= url.substring(url.indexOf("지난"),url.length());
					url = url.substring(0,url.indexOf("지난"));	
				}else if(url.indexOf("공연기간")!=-1){
					afterText= url.substring(url.indexOf("공연기간"),url.length());
					url = url.substring(0,url.indexOf("공연기간"));	
				}else if(url.indexOf(" ")!=-1){
					afterText= url.substring(url.indexOf(" "),url.length());
					url = url.substring(0,url.indexOf(" "));	
				}else{
					afterText= url.substring(url.length());
					
				}
			}else{
				beforeText=text;
			}

			tweetList.add(new Tweet(beforeText, middleText, afterMiddleText, afterText,  createAt, user.getString("profile_image_url_https"),
					user.getString("screen_name"), user.getString("name"),url,url2,url3));

		}
		if(tweetList!=null&&tweetList.size()>0){
			map.put("tweetList", tweetList);
			map.put("status", true);
		}else{
			map.put("status", false);
		}

		return map;
	}


	public Integer twitterCountAgo(String eventTitle) throws JSONException{
		
		//오늘 날짜로부터 3일전 트위터 100개
		long millisCurrent=System.currentTimeMillis()-(3*24*1000*60*60);
		Date date=new Date(millisCurrent);
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
		String until =sdf.format(date);

		String eventTitle2=titleCut(eventTitle);

				Twitter twitter = new Twitter();
				ArrayList<Tweet> tweetList = new ArrayList<>();
				JSONObject json = twitter.countTweets(eventTitle2, until, "recent", access_token, access_token_secret);
				JSONObject json1 = (JSONObject) json.get("twitter_oa");
				JSONArray json2 = (JSONArray) json1.get("statuses");
				JSONObject json3 = new JSONObject();
				JSONObject user = new JSONObject();
		
				String url = "";
				String url2 = "";
				String url3 = "";
				String text = "";
				String createAt = "";
				String afterText="";
				String beforeText="";
				String middleText="";
				String afterMiddleText="";
				
				for (int i = 0; i < json2.length(); i++) {
					json3 = (JSONObject) json2.get(i);
					text = json3.getString("text");
					user = (JSONObject) json3.get("user");
					createAt= json3.getString("created_at");
				
					
					if (text.indexOf("http://") != -1) {		
						//url 시작부분
						url = text.substring(text.indexOf("http://"), text.length());	
						beforeText = text.substring(0, text.indexOf("http://"));
						
						//url 끝부분
						if(url.indexOf('"')!=-1){
							afterText= url.substring(url.indexOf('"'),url.length());
							url = url.substring(0,url.indexOf('"'));	
						}
						if(url.indexOf("…")!=-1){
							afterText= url.substring(url.indexOf("…"),url.length());
							url = "";
						}else if(url.indexOf("지난")!=-1){
							afterText= url.substring(url.indexOf("지난"),url.length());
							url = url.substring(0,url.indexOf("지난"));	
						}else if(url.indexOf("공연기간")!=-1){
							afterText= url.substring(url.indexOf("공연기간"),url.length());
							url = url.substring(0,url.indexOf("공연기간"));	
						}else if(url.indexOf(" ")!=-1){
							afterText= url.substring(url.indexOf(" "),url.length());
							url = url.substring(0,url.indexOf(" "));	
						}else{
							afterText= url.substring(url.length());
							
						}
						
						
						
						if(afterText.indexOf("http://")!=-1){
							//url2 시작부분
							url2 = afterText.substring(afterText.indexOf("http://"), afterText.length());	
							middleText = afterText.substring(0, afterText.indexOf("http://"));
							//url2 끝부분
							if(url2.indexOf("지난")!=-1){
								afterText= url.substring(url2.indexOf("지난"),url2.length());
								url2 = url2.substring(0,url2.indexOf("지난"));	
							}else if(url2.indexOf("공연기간")!=-1){
								afterText= url2.substring(url.indexOf("공연기간"),url2.length());
								url = url.substring(0,url.indexOf("공연기간"));	
							}else if(url2.indexOf(" ")!=-1){
								afterText= url2.substring(url2.indexOf(" "),url2.length());
								url2 = url2.substring(0,url2.indexOf(" "));	
							}else{
								afterText= url2.substring(url2.length());
								
							}

						
							if(afterText.indexOf("http://")!=-1){
								url3 = afterText.substring(afterText.indexOf("http://"), afterText.length());
								afterMiddleText =  afterText.substring(0, afterText.indexOf("http://"));
								
								if(url3.indexOf(" ")!=-1){
									afterText= url3.substring(url3.indexOf(" "),url3.length());
									url3 = url3.substring(0,url3.indexOf(" "));	
								}else{
									afterText= url3.substring(url3.length());		
								}
							}
							
							
						}
					
					}else if(text.indexOf("ttp://") != -1) {		
						//url 시작부분
						url = text.substring(text.indexOf("ttp://"), text.length());
						beforeText = text.substring(0, text.indexOf("ttp://"));
						url = "h"+url;
						//url 끝부분
						if(url.indexOf('"')!=-1){
							afterText= url.substring(url.indexOf('"'),url.length());
							url = url.substring(0,url.indexOf('"'));	
						}else if(url.indexOf("…")!=-1){
							afterText= url.substring(url.indexOf("…"),url.length());
							url = "";
						}else if(url.indexOf("지난")!=-1){
							afterText= url.substring(url.indexOf("지난"),url.length());
							url = url.substring(0,url.indexOf("지난"));	
						}else if(url.indexOf("공연기간")!=-1){
							afterText= url.substring(url.indexOf("공연기간"),url.length());
							url = url.substring(0,url.indexOf("공연기간"));	
						}else if(url.indexOf(" ")!=-1){
							afterText= url.substring(url.indexOf(" "),url.length());
							url = url.substring(0,url.indexOf(" "));	
						}else{
							afterText= url.substring(url.length());
							
						}
					}else{
						beforeText=text;
					}
					
					Date createAtDate =new Date( Date.parse(createAt));  //Date 형식으로
					long createATFinal = createAtDate.getTime();  //millisec 로
			
					Calendar c=Calendar.getInstance();
				
					long millis = millisCurrent - (3*24*1000*60*60);   //3일 전
					c.setTimeInMillis(millis);

					long dateCount = (createATFinal-millis)/(24*1000*60*60);  //생성된 시간이 3일전보다 이전이면 마이너스 값
					
		
					if(dateCount>=0){
					tweetList.add(new Tweet(beforeText, middleText, afterMiddleText, afterText,  createAt, user.getString("profile_image_url_https"),
							user.getString("screen_name"), user.getString("name"),url,url2,url3));

				}
					}
		
		return tweetList.size();
	}
	

	public Integer twitterCount(String eventTitle) throws JSONException{
		
		//현재 날짜부터 100개
		long millisCurrent=System.currentTimeMillis();
		Date date=new Date(millisCurrent);
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
		String until =sdf.format(date);

		String eventTitle2=titleCut(eventTitle);

				Twitter twitter = new Twitter();
				ArrayList<Tweet> tweetList = new ArrayList<>();
				JSONObject json = twitter.countTweets(eventTitle2, until, "recent", access_token, access_token_secret);
				JSONObject json1 = (JSONObject) json.get("twitter_oa");
				JSONArray json2 = (JSONArray) json1.get("statuses");
				JSONObject json3 = new JSONObject();
				JSONObject user = new JSONObject();
		
				String url = "";
				String url2 = "";
				String url3 = "";
				String text = "";
				String createAt = "";
				String afterText="";
				String beforeText="";
				String middleText="";
				String afterMiddleText="";
				
				for (int i = 0; i < json2.length(); i++) {
					json3 = (JSONObject) json2.get(i);
					text = json3.getString("text");
					user = (JSONObject) json3.get("user");
					createAt= json3.getString("created_at");
				
					
					if (text.indexOf("http://") != -1) {		
						//url 시작부분
						url = text.substring(text.indexOf("http://"), text.length());	
						beforeText = text.substring(0, text.indexOf("http://"));
						
						//url 끝부분
						if(url.indexOf('"')!=-1){
							afterText= url.substring(url.indexOf('"'),url.length());
							url = url.substring(0,url.indexOf('"'));	
						}
						if(url.indexOf("…")!=-1){
							afterText= url.substring(url.indexOf("…"),url.length());
							url = "";
						}else if(url.indexOf("지난")!=-1){
							afterText= url.substring(url.indexOf("지난"),url.length());
							url = url.substring(0,url.indexOf("지난"));	
						}else if(url.indexOf("공연기간")!=-1){
							afterText= url.substring(url.indexOf("공연기간"),url.length());
							url = url.substring(0,url.indexOf("공연기간"));	
						}else if(url.indexOf(" ")!=-1){
							afterText= url.substring(url.indexOf(" "),url.length());
							url = url.substring(0,url.indexOf(" "));	
						}else{
							afterText= url.substring(url.length());
							
						}
						
						
						
						if(afterText.indexOf("http://")!=-1){
							//url2 시작부분
							url2 = afterText.substring(afterText.indexOf("http://"), afterText.length());	
							middleText = afterText.substring(0, afterText.indexOf("http://"));
							//url2 끝부분
							if(url2.indexOf("지난")!=-1){
								afterText= url.substring(url2.indexOf("지난"),url2.length());
								url2 = url2.substring(0,url2.indexOf("지난"));	
							}else if(url2.indexOf("공연기간")!=-1){
								afterText= url2.substring(url.indexOf("공연기간"),url2.length());
								url = url.substring(0,url.indexOf("공연기간"));	
							}else if(url2.indexOf(" ")!=-1){
								afterText= url2.substring(url2.indexOf(" "),url2.length());
								url2 = url2.substring(0,url2.indexOf(" "));	
							}else{
								afterText= url2.substring(url2.length());
								
							}

						
							if(afterText.indexOf("http://")!=-1){
								url3 = afterText.substring(afterText.indexOf("http://"), afterText.length());
								afterMiddleText =  afterText.substring(0, afterText.indexOf("http://"));
								
								if(url3.indexOf(" ")!=-1){
									afterText= url3.substring(url3.indexOf(" "),url3.length());
									url3 = url3.substring(0,url3.indexOf(" "));	
								}else{
									afterText= url3.substring(url3.length());		
								}
							}
							
							
						}
					
					}else if(text.indexOf("ttp://") != -1) {		
						//url 시작부분
						url = text.substring(text.indexOf("ttp://"), text.length());
						beforeText = text.substring(0, text.indexOf("ttp://"));
						url = "h"+url;
						//url 끝부분
						if(url.indexOf('"')!=-1){
							afterText= url.substring(url.indexOf('"'),url.length());
							url = url.substring(0,url.indexOf('"'));	
						}else if(url.indexOf("…")!=-1){
							afterText= url.substring(url.indexOf("…"),url.length());
							url = "";
						}else if(url.indexOf("지난")!=-1){
							afterText= url.substring(url.indexOf("지난"),url.length());
							url = url.substring(0,url.indexOf("지난"));	
						}else if(url.indexOf("공연기간")!=-1){
							afterText= url.substring(url.indexOf("공연기간"),url.length());
							url = url.substring(0,url.indexOf("공연기간"));	
						}else if(url.indexOf(" ")!=-1){
							afterText= url.substring(url.indexOf(" "),url.length());
							url = url.substring(0,url.indexOf(" "));	
						}else{
							afterText= url.substring(url.length());
							
						}
					}else{
						beforeText=text;
					}
					
					Date createAtDate =new Date( Date.parse(createAt));  //Date 형식으로
					long createATFinal = createAtDate.getTime();  //millisec 로
			
					Calendar c=Calendar.getInstance();
				
					long millis = millisCurrent - (3*24*1000*60*60);   //3일 전
					c.setTimeInMillis(millis);

					long dateCount = (createATFinal-millis)/(24*1000*60*60);  //생성된 시간이 3일전보다 이전이면 마이너스 값
					
		
					if(dateCount>=0){
					tweetList.add(new Tweet(beforeText, middleText, afterMiddleText, afterText,  createAt, user.getString("profile_image_url_https"),
							user.getString("screen_name"), user.getString("name"),url,url2,url3));

				}
					}
		
		return tweetList.size();
	}
	
	public String titleCut(String query){

		//연도 제거
				Calendar now = Calendar.getInstance();
				String year= String.valueOf(now.get(Calendar.YEAR));
				if(query.indexOf(year)!=-1){
					query = query.substring(0, query.indexOf(year)-1);
				}
				
				//괄호 제거 1
				if(query.indexOf("[")!=-1 && query.indexOf("]")!=-1){
					String inside = query.substring(query.indexOf("[")+1,query.indexOf("]"));
					query = query.substring(0, query.indexOf("["))+inside;
				}	
				//괄호 제거 2
				if(query.indexOf("(")!=-1 && query.indexOf(")")!=-1){
					String inside = query.substring(query.indexOf("(")+1,query.indexOf(")"));
					if(inside.length()>5||inside.equals("수원")||inside.equals("용인")){
						query = query.substring(0, query.indexOf("("));
					}else{
					query = query.substring(0, query.indexOf("("))+inside;
					}
				}
				//괄호 제거 3
				if(query.indexOf("{")!=-1 && query.indexOf("}")!=-1){
					String inside = query.substring(query.indexOf("{")+1,query.indexOf("}"));
					query = query.substring(0, query.indexOf("{"))+inside;
				}	
				//괄호 제거 4
				if(query.indexOf("<")!=-1 && query.indexOf(">")!=-1){
					String inside = query.substring(query.indexOf("<")+1,query.indexOf(">"));
					query = query.substring(0, query.indexOf("<"))+inside;
				}
			
				
				//따옴표 제거 2
				if(query.indexOf('"')!=-1 && query.substring(0,query.indexOf('"')).indexOf('"')!=-1){
					String inside = query.substring(query.indexOf('"')+1,query.indexOf('"')-1);
					query = query.substring(0, query.indexOf('"'))+inside;
				}
				
				
				// : 제거
				if(query.indexOf(":")!=-1){
					String behind = query.substring(query.indexOf(":")+1,query.length());
					query = query.substring(0,query.indexOf(":"))+" "+behind;
				}
				// - 제거
				if(query.indexOf("-")!=-1){
					String behind = query.substring(query.indexOf("-")+1,query.length());
					query = query.substring(0,query.indexOf("-"))+" "+behind;
				}
				// , 제거
				if(query.indexOf(",")!=-1){
					String behind = query.substring(query.indexOf(",")+1,query.length());
					query = query.substring(0,query.indexOf(","))+" "+behind;
				}
				// / 제거
				if(query.indexOf("/")!=-1){
					String behind = query.substring(query.indexOf("/")+1,query.length());
					query = query.substring(0,query.indexOf("/"))+" "+behind;
				}
				// ? 제거
				if(query.indexOf("?")!=-1){
					String behind = query.substring(query.indexOf("?")+1,query.length());
					query = query.substring(0,query.indexOf("?"))+" "+behind;
				}	
				// ! 제거
				if(query.indexOf("!")!=-1){
					String behind = query.substring(query.indexOf("!")+1,query.length());
					query = query.substring(0,query.indexOf("!"))+" "+behind;
						}	
				// ~ 제거
				if(query.indexOf("~")!=-1){
					String behind = query.substring(query.indexOf("~"),query.length());
					query = query.substring(0,query.indexOf("~"))+" "+behind;
				}
			
				// 2~4탄까지 
				if(query.indexOf("2탄")!=-1){
					query = query.substring(0, query.indexOf("2탄")+2);
				}
				
				if(query.indexOf("3탄")!=-1){
					query = query.substring(0, query.indexOf("3탄")+2);
				}
				
				if(query.indexOf("4탄")!=-1){
					query = query.substring(0, query.indexOf("4탄")+2);
				}
				
				
				if(query.indexOf("연극")!=-1){
					//연극이라는 글자가 뒤에 존재하는 경우
					if(query.substring(0,query.indexOf("연극")).length()>0){	
						query = query.substring(0, query.indexOf("연극")+3);
						
					//연극으로 시작되는 행사제목일경 경우	
					}
						//'연극'을 제외한 문자열의 길이가 5이상인 경우
						if(query.substring(query.indexOf("연극")+2,query.length()).trim().length()>=5){
							//'연극'을 잘라낸다
							query = query.substring(query.indexOf("연극")+2,query.length());					
						
					}
				}
			

				if(query.indexOf("코믹극")!=-1){
					//코믹극이라는 글자가 뒤에 존재하는 경우
					if(query.substring(0,query.indexOf("코믹극")).length()>0){	
						query = query.substring(query.indexOf("코믹극"), query.length());
						
					
					}//코믹극으로 시작되는 행사제목일경 경우	
						//'코믹극'을 제외한 문자열의 길이가 3보다 클 경우
						if(query.substring(query.indexOf("코믹극")+3,query.length()).trim().length()>3){
							//'코믹극'을 잘라낸다
							query = query.substring(query.indexOf("코믹극")+3,query.length());	
							query = "연극"+query;
						
					}
				}
			
				
				if(query.indexOf("뮤지컬")!=-1){
					if(query.substring(0,query.indexOf("뮤지컬")).length()>0){	
						query = query.substring(query.indexOf("뮤지컬"), query.length());
						
					}
					//뮤지컬 이라는 글자로 시작하는 경우
						if(query.substring(query.indexOf("뮤지컬")+3,query.length()).length()>0){
							//'뮤지컬'을 제외한 문자열의 길이가 4보다 클 경우
							if(query.substring(query.indexOf("뮤지컬")+3,query.length()).trim().length()>=5){
								//'뮤지컬'을 잘라낸다
								query = query.substring(query.indexOf("뮤지컬")+3,query.length());					
							}
						}
					
				}
				
			
				if(query.indexOf("인천 펜타포트")!=-1){
					query = "펜타포트";
				}
			
				if(query.indexOf("우연일까")!=-1){
				 query = "연극 "+query;
				}
				
				if(query.indexOf("화랑")!=-1){
					query = "대학로 "+query;
				}
				
				if(query.indexOf("연극 행복")!=-1){
					query = "대학로 "+query;	
				}
				
				if(query.indexOf("추격자")!=-1){
					query = "넌버벌 퍼포먼스 "+query;	
				}
				
				if(query.indexOf("동치미")!=-1){
					query = "연극 "+query;	
				}

				if(query.indexOf("담배가게 아가씨")!=-1){
					query = "뮤지컬 "+query;	
				}
				
				if(query.indexOf("삼청각 런치콘서트")!=-1){
					query = "삼청각 자미";
				}
				
				if(query.indexOf("가루야")!=-1){
					query = "연극 "+query;
				}
				
				if(query.indexOf("엄마를 부탁해")!=-1){
					query="연극 "+query;
				}

		
		return query;
	}
}
