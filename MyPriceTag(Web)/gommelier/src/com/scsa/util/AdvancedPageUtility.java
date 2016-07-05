package com.scsa.util;


/**
 * JSP���� �����͸� page navigation �������� �����ϱ� ���� ���Ǵ� Ŭ�����̴�.
 */
public class AdvancedPageUtility {
    int firstPageCount=0;
    int lastPageCount=0;

    int currentPageCount=0;			//���� ������
	
    int pagePerCount = 10;				//��Ͽ��� ������ ������ ����      1 2 3 4 5 
    int beforePage=0;						//���� pagePerCount ������
    int nextPage=0;							//���� pagePerCount ������

    int totalRowCount=0;				//�� row ����
    int totalPageCount=0;				//�� ������ ��
    int displayRowCount=0;			//�� �������� ������ ����
    String imagePath;
    
	/**
	 * ������������ ��� �ѹ��� ������ ���� ������ �����ϴ� ������
	 * 
	 * @param displayRowCount
	 *            int �� �������� ������ row��         
	 * @param totalRowCount
	 *            java.lang.String ��ȸ�ؿ� �������� ��ü row��
	 * @param currentPageCount
	 *            int ���� ������ ������
	 * @param imagePath
	 *             �̹��� 
	 * @exception java.lang.Exception
	 */
	public AdvancedPageUtility(int displayRowCount, int totalRowCount,
			int currentPageCount, String imagePath) throws Exception {
		super();
		this.displayRowCount = displayRowCount;
		this.totalRowCount = totalRowCount;
		this.currentPageCount = currentPageCount;
		this.imagePath = imagePath;
		
		// ��ü row���� �� �������� ���
		if (totalRowCount % displayRowCount == 0){
			this.totalPageCount = totalRowCount / displayRowCount;
		}else{
			this.totalPageCount = totalRowCount / displayRowCount + 1;
		}
	}
    /**
     * ������������ ��� �ѹ��� ������ ���� ������ �����ϴ� ������
     * @param page int ���� ������ ������
     * @param count java.lang.String ��ȸ�ؿ� �������� ��ü row��
     * @param interval int �� �������� ������ row��
     * @param String search �˻� ���� 
     * @exception java.lang.Exception
     */
   
    /**
     * �޼ҵ� ������ �����Ͻʽÿ�.
     * �ۼ� ��¥: (2002-11-15 ���� 11:31:16)
     * @param args java.lang.String[]
     */
    public String getCurrentPageCount()
    {
        return String.valueOf(currentPageCount);
    }
    /**
     * ��Ͽ� ����� page bar�� �����Ѵ�.
     * @return java.lang.String
     */
    public String getPageBar()    {
    	
        StringBuffer sb=new StringBuffer();
		// ���� �������� ���� �ִ� ������ �׷��� ù������ ��ȣ ���
//        currentPageCount: 2�� ���  1 2 3 ��� ǥ���� ù ������ (1)  
//        currentPageCount: 6�� ���  4 5 6��� ǥ���� ù ������ (4)
        firstPageCount=((currentPageCount-1)/pagePerCount*pagePerCount)+1;
        
		// ���� �������� ���� �ִ� ������ �׷��� ������������ ��ȣ ���
//        currentPageCount: 2�� ���  1 2 3��� ǥ���� ���� ������ (3) 
//        currentPageCount: 6�� ���  4 5 6 ��� ǥ���� ù ������ (6)
        lastPageCount=firstPageCount+pagePerCount - 1;
        
        // ���� ������ �׷��� ù������ ��� 
		if(firstPageCount  != 1){
			beforePage = firstPageCount - pagePerCount;
		}else{
			beforePage = 1;
		}
		
        // ���� ������ �׷��� ù������ ���
        if(lastPageCount < totalPageCount){
            nextPage=lastPageCount +1;        	
        }else{
        	lastPageCount = totalPageCount;
        	nextPage = totalPageCount;
        }
        
         		
        //�� ù������ link ó�� 
		// �����ַ��� ������ �׷��� ù��������ȣ�� 
		// ù������ �׷����� �ƴϸ� �� ó�� �������� �����ټ� �ֵ��� ��ũ�� �ɰ�
        if(firstPageCount>pagePerCount){ 
            sb.append(" <a href='javascript:pagelist("+1+")'></a>&nbsp;&nbsp;");
    	// �����ַ��� ������ �׷��� ù��������ȣ��
    	// ù������ �׷� ����̸�  ���������� ���� ��ũ ���� �ʴ´�.
        }else{  
            sb.append("&nbsp;&nbsp;");
        }

        //  ���������� ���� �������׷��� ù�������� �������������� ũ�ٸ� 
        // ���� �������׷����� ��ũ�� �ɰ�
        if(firstPageCount > beforePage){
        	sb.append("<a href='javascript:pagelist("+ beforePage+")'></a>&nbsp;&nbsp;");
        //  �׷��� �ʴٸ� ���� �������׷����� ��ũ�� ���� �ʴ´�.
        }else{
        	sb.append("&nbsp;&nbsp;");
        }
        
        
        
        // pagePerCount ��ŭ link
		// ������ ��ȣ���� �ش� ������ �����ȸ�� ��ũ�� �Ǵ�
        for (int i = firstPageCount; i <= lastPageCount; i++)
        {
        		// ���� �������� ���� ��ũ ���� ����
                if (i == currentPageCount){
                    sb.append("<b>" + i + "</b>");
                }else{
                    sb.append("<a href='javascript:pagelist("+i+")'>" + i + "</a>");
                }
                
                if( i !=lastPageCount ){
                    sb.append("&nbsp;");
                }

        }


        //  ���������� ���� �������׷��� �������������� ���� �������׷� ���������� �۴ٸ� 
        // ���� �������׷����� ��ũ�� �ɰ�  
        if(lastPageCount < nextPage){
        	sb.append("&nbsp;&nbsp;<a href='javascript:pagelist("+ (nextPage)+ ")'></a>");
        //  �׷��� �ʴٸ� ���� �������׷����� ��ũ�� ���� �ʴ´�.        	
        }else{
        	sb.append("&nbsp;&nbsp;");
        }
        
        //�� �� ������  link
		// ������ ������ �׷����� �ƴϸ� ���� ������ �׷����� ��ũ�� �ɰ�
        if(lastPageCount< totalPageCount){
            sb.append("&nbsp;&nbsp;<a href='javascript:pagelist("+ (totalPageCount)+")'></a>");
   		// ������ ������ �׷����̸� ��ũ ���� �ʴ´�.	            
        }else{
            sb.append("&nbsp;&nbsp;");
        }
        
        return sb.toString();
    }
    /**
     * �޼ҵ� ������ �����Ͻʽÿ�.
     * �ۼ� ��¥: (2002-11-15 ���� 11:31:16)
     * @param args java.lang.String[]
     */
    public String getTotalPageCount() {       return String.valueOf(totalPageCount);
    }
}