	//���� �˻�, ������ ��ȣ�� �Խñ� ��û�� ���� �޼���  
	function pagelist(cpage){
		//input ����� hidden���� ����� page�� ��û�� ������ ���� ���� 
		document.getElementById("pageNo").value=cpage;
		var frm = document.getElementById("frm");
		frm.action="findTravelRecordList2.do";
		frm.submit();
	}