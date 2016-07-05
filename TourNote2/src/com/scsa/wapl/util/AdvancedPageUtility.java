package com.scsa.wapl.util;

/**
 * JSP에서 데이터를 page navigation 형식으로 구성하기 위해 사용되는 클래스이다.
 */

public class AdvancedPageUtility {
    int firstPageCount=0;
    int lastPageCount=0;

    int currentPageCount=0;			//현재 페이지
	
    int pagePerCount = 5;				//목록에서 보여줄 페이지 개수      1 2 3 4 5 
    int beforePage=0;						//이전 pagePerCount 페이지
    int nextPage=0;							//다음 pagePerCount 페이지

    int totalRowCount=0;				//총 row 개수
    int totalPageCount=0;				//총 페이지 수
    int displayRowCount=0;			//한 페이지당 보여줄 개수
    String imagePath;
    
	/**
	 * 현재페이지와 경로 한번에 보여줄 열의 갯수를 세팅하는 생성자
	 * 
	 * @param displayRowCount
	 *            int 한 페이지당 보여질 row수         
	 * @param totalRowCount
	 *            java.lang.String 조회해온 데이터의 전체 row수
	 * @param currentPageCount
	 *            int 현재 보여질 페이지
	 * @param imagePath
	 *             이미지 
	 * @exception java.lang.Exception
	 */
	public AdvancedPageUtility(int displayRowCount, int totalRowCount,
			int currentPageCount, String imagePath) throws Exception {
		super();
		this.displayRowCount = displayRowCount;
		this.totalRowCount = totalRowCount;
		this.currentPageCount = currentPageCount;
		this.imagePath = imagePath;
		
		// 전체 row수로 총 페이지수 계산
		if (totalRowCount % displayRowCount == 0){
			this.totalPageCount = totalRowCount / displayRowCount;
		}else{
			this.totalPageCount = totalRowCount / displayRowCount + 1;
		}
	}
    /**
     * 현재페이지와 경로 한번에 보여줄 열의 갯수를 세팅하는 생성자
     * @param page int 현재 보여질 페이지
     * @param count java.lang.String 조회해온 데이터의 전체 row수
     * @param interval int 한 페이지당 보여질 row수
     * @param String search 검색 조건 
     * @exception java.lang.Exception
     */
   
    /**
     * 메소드 설명을 삽입하십시오.
     * 작성 날짜: (2002-11-15 오전 11:31:16)
     * @param args java.lang.String[]
     */
    public String getCurrentPageCount()
    {
        return String.valueOf(currentPageCount);
    }
    /**
     * 목록에 출력할 page bar를 구성한다.
     * @return java.lang.String
     */
    public String getPageBar()    {
    	
        StringBuffer sb=new StringBuffer();
		// 현재 페이지가 속해 있는 페이지 그룹의 첫페이지 번호 계산
//        currentPageCount: 2인 경우  1 2 3 등에서 표시할 첫 페이지 (1)  
//        currentPageCount: 6인 경우  4 5 6등에서 표시할 첫 페이지 (4)
        firstPageCount=((currentPageCount-1)/pagePerCount*pagePerCount)+1;
        
		// 현재 페이지가 속해 있는 페이지 그룹의 마지막페이지 번호 계산
//        currentPageCount: 2인 경우  1 2 3등에서 표시할 다음 페이지 (3) 
//        currentPageCount: 6인 경우  4 5 6 등에서 표시할 첫 페이지 (6)
        lastPageCount=firstPageCount+pagePerCount - 1;
        
        // 이전 페이지 그룹목록 첫페이지 계산 
		if(firstPageCount  != 1){
			beforePage = firstPageCount - pagePerCount;
		}else{
			beforePage = 1;
		}

        // 다음 페이지 그룹목록 첫페이지 계산
        if(lastPageCount < totalPageCount){
            nextPage=lastPageCount +1;        	
        }else{
        	lastPageCount = totalPageCount;
        	nextPage = totalPageCount;
        }
        
        System.out.println("firstPageCount:"+firstPageCount);
        System.out.println("lastPageCount:"+lastPageCount);
        System.out.println("totalPageCount:"+totalPageCount);
        System.out.println("beforePage:"+beforePage);
        System.out.println("nextPage:"+nextPage);
 		
        //맨 첫페이지 link 처리 
		// 보여주려는 페이지 그룹의 첫페이지번호가 
		// 첫페이지 그룹목록이 아니면 맨 처음 페이지를 보여줄수 있도록 링크를 걸고
        if(firstPageCount>pagePerCount){ 
            sb.append(" <a href='javascript:pagelist("+1+")'><img src=\""+imagePath+"btn_first.gif\" border='0'  hspace='3' align='absmiddle'></a>&nbsp;&nbsp;");
    	// 보여주려는 페이지 그룹의 첫페이지번호가
    	// 첫페이지 그룹 목록이면  이전페이지 단위 링크 걸지 않는다.
        }else{  
            sb.append("<img src=\""+imagePath+"btn_first.gif\" border='0'  align=absmiddle>&nbsp;&nbsp;");
        }

        //  현페이지가 속한 페이지그룹의 첫페이지가 이전페이지보다 크다면 
        // 이전 페이지그룹으로 링크를 걸고
        if(firstPageCount > beforePage){
        	sb.append("<a href='javascript:pagelist("+ beforePage+")'><img src=\""+imagePath+"btn_prev.gif\" border='0' hspace='3' align=absmiddle></a>&nbsp;&nbsp;");
        //  그렇지 않다면 이전 페이지그룹으로 링크를 걸지 않는다.
        }else{
        	sb.append("<img src=\""+imagePath+"btn_prev.gif\" border='0'   align=absmiddle>&nbsp;&nbsp;");
        }
        
        // pagePerCount 만큼 link
		// 페이지 번호마다 해당 페이지 목록조회로 링크를 건다
        for (int i = firstPageCount; i <= lastPageCount; i++)
        {
        		// 현재 페이지인 경우는 링크 걸지 않음
                if (i == currentPageCount){
                    sb.append("<b>" + i + "</b>");
                }else{
                    sb.append("<a href='javascript:pagelist("+i+")'>" + i + "</a>");
                }
                
                if( i !=lastPageCount ){
                    sb.append("&nbsp;");
                }
        }

        //  현페이지가 속한 페이지그룹의 마지막페이지가 다음 페이지그룹 페이지보다 작다면 
        // 다음 페이지그룹으로 링크를 걸고  
        if(lastPageCount < nextPage){
        	sb.append("&nbsp;&nbsp;<a href='javascript:pagelist("+ (nextPage)+ ")'><img src=\""+imagePath+"btn_next.gif\" border='0' hspace='3' align=absmiddle></a>");
        //  그렇지 않다면 다음 페이지그룹으로 링크를 걸지 않는다.        	
        }else{
        	sb.append("&nbsp;&nbsp;<img src=\""+imagePath+"btn_next.gif\" border='0' hspace='3' align=absmiddle>");
        }
        
        //맨 끝 페이지  link
		// 마지막 페이지 그룹목록이 아니면 다음 페이지 그룹으로 링크를 걸고
        if(lastPageCount< totalPageCount){
            sb.append("&nbsp;&nbsp;<a href='javascript:pagelist("+ (totalPageCount)+")'><img src=\""+imagePath+"btn_end.gif\" border='0' align=absmiddle></a>");
   		// 마지막 페이지 그룹목록이면 링크 걸지 않는다.	            
        }else{
            sb.append("&nbsp;&nbsp;<img src=\""+imagePath+"btn_end.gif\" border='0' align=absmiddle>");
        }
        
        return sb.toString();
    }
    /**
     * 메소드 설명을 삽입하십시오.
     * 작성 날짜: (2002-11-15 오전 11:31:16)
     * @param args java.lang.String[]
     */
    public String getTotalPageCount() {       return String.valueOf(totalPageCount);
    }
}