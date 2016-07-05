		//조건 검색, 페이지 번호로 게시글 요청을 위한 메서드  
		function pagelist(cpage){
			//input 양식의 hidden으로 선언된 page에 요청된 페이지 정보 셋팅 
			document.getElementById("pageNo").value=cpage;
			var frm = document.getElementById("frm");
			frm.action="main.do";
			frm.submit();
		}