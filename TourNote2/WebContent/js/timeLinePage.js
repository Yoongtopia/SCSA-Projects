//���� �˻�, ������ ��ȣ�� �Խñ� ��û�� ���� �޼���  
	function pagelist(cpage){
		//input ����� hidden���� ����� page�� ��û�� ������ ���� ���� 		
		document.getElementById("pageNoTime").value=cpage;
		var frmTimeLine = document.getElementById("frmTimeLine");
		frmTimeLine.action="timeline_list.do";
		frmTimeLine.submit();
	}
	
