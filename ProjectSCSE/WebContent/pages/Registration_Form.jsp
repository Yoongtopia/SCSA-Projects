<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function registerFormCheck() {
		if ($("#userId").val() == "") {
			$("#userIdFormCheck").show();
			$("#userId").focus();
			console.log("1");
			return false;
		}else{
			$("#userIdFormCheck").hide();			
		}
		
		if ($("#password").val() == "") {
			$("#passFormCheck").show();
			$("#password").focus();
			console.log("2");
			return false;
		}else{
			$("#passFormCheck").hide();
		}
		

		if ($("#passwordChk").val() == "") {
			$("#passDupFormCheck").show();
			$("#passwordChk").focus();
			event.preventDefault();
			console.log("5");
			return false;
		}else{
			$("#passDupFormCheck").hide();
		}	
		
		if ($("#sName").val() == "") {
			$("#snameFormCheck").show();
			$("#sName").focus();
			event.preventDefault();
			console.log("6");
			return false;
		}else{
			$("#snameFormCheck").hide();
		}	
		
		if($("#schoolNum").val()==""){
			$("#schoolFormCheck").show();
			$("#schoolNum").focus();
			event.preventDefault();
			console.log("7");
			return false;
		}else{
			$("#schoolFormCheck").hide();
		}
		
		if($("#grade").val()==""){
			$("#gradeFormCheck").show();
			$("#grade").focus();
			event.preventDefault();
			console.log("8");
			return false;
		}else{
			$("#gradeFormCheck").hide();
		}
		
		if($("#email").val()==""){
			console.log("xxx");
			$("#emailFormCheck").show();
			$("#email").focus();
			event.preventDefault();
			console.log("10");
			return false;			
		}else if($("#email").length!=0){
				
			   var emailExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			   if(!emailExp.test($('#email').val())){
				$("#emailFormCheck").hide();
			    $("#emailAtCheck").show();
			    $('#email').focus();
			    event.preventDefault();
			    console.log("11");
			    return false;
			   }
		}
		
		if($("#phone").val()==""){
			$("#phoneFormCheck").show();
			$("#phone").focus();
			event.preventDefault();
			console.log("12");
			return false;
		}else{
			$("#phoneFormCheck").hide();
		}
		
		if($("#temail1").val()==""){
			$("#teacherEmailCheck").show();
			$("#temail1").focus();
			event.preventDefault();
			console.log("13");
			return false;
		}else{
			$("#teacherEmailCheck").hide();
		}
		
		if ($("select-school#item").val() == "") {
			 $("#teacherEmailSelectCheck").show();
			 event.preventDefault();
			 console.log("13");
			 return false;  
		}else{
			 $("#teacherEmailSelectCheck").hide();
		}  		
		return true;
	}

	$(document).ready(function() {		
		$(".formCheck").hide();
		$("#loading").hide();
		$("#goSearch").on("click",function() {
			$(".formCheck").hide();
			$("#loading").show();
			$("#target").hide();
			$(".result").remove();
			$.post("search_School_ajax.scse", {
				"schoolName" : $("#search").val()
			}, function(jsonObj) {
				if (jsonObj.status) {
				$(jsonObj.list).each(function(index, item) {
						$("#target").show();
						$("#loading").hide();
						var td1 = $("<td/>").text(item.schoolNum);
						var a = $("<a/>").attr("href","javascript:void(0)").text(item.schoolName);
						var td2 = $("<td/>").attr("class","resultSchool").append(a);
						var td3 = $("<td/>").text(item.schoolAddress);
						var tr = $("<tr/>").attr("class", "result").append(td1, td2, td3);
						$("#target").append(tr);
						});
				} else if(!jsonObj.status) {
					$("#loading").hide();
					var td1 = $("<td/>").text("검색결과가 없습니다.");
					var tr = $("<tr/>").attr("class", "result").append(td1);
					$("#target").append(tr);
					}
			}, "json");
		});
			$(document).on("click", ".resultSchool", function() {
				$("#school").val($(this).text());
				$("#schoolNum").val($(this).prev().text());
				$('#searchSchoolForm').modal('hide');
				$(".result").remove();
			});
			//아이디 중복 체크	
			$("#userId").on("blur", function() {
				if($("#userId").val()==""){
					$("#userIdFormCheck").show();
					return;
				}
				$.post("userId_check_ajax.scse", {
					"userId" : $("#userId").val()
				}, check, "json");
				$("#userIdFormCheck").hide();
			});

				function check(jsonObj) {
					if (jsonObj.status) {
						console.log("진입");
						$("#userIdField").removeClass("error");
						$("#userIdField").removeClass("ui");
						$("#userIdField").removeClass("input");
						$("#userIdFormOk").show();
					} else {
						console.log("진입");
						$("#userIdField").addClass("error");
						$("#userIdField").addClass("ui");
						$("#userIdField").addClass("input");
						$("#userId").focus();
						$("#userId").attr("placeholder", $("#userId").val()+"(은)는 이미 사용중인 아이디 입니다.");						
						$("#userId").val("");
						$("#groupName").val("");
					}
				}
				
				//비밀번호 중복 체크
				$("#passwordChk").on("blur", function() {
					var one = $("#password").val();
					var two = $("#passwordChk").val();
					if (one != two) {
						$("#DupFormCheck").show();
					} else {
						$("#DupFormCheck").hide();
					}
					
					if ($("#password").val().length<4) {
						$("#passFormCheck").hide();
						$("#passFormLengthCheck").show();
						$("#password").focus();
						return false;
					}else{
						$("#passFormLengthCheck").hide();
					}
					
				});
				//비밀번호 중복 체크 끝
				
		$(".goSubmit").on("click", function(){
			registerFormCheck();			
			var value = $(':radio[name="cha_checked"]:checked').val();
			console.log(value);
			if (value==1){
				$("#hi").attr("src","${pageContext.request.contextPath}/assets/image/Character/main_apeach.png");
			} else if (value==2){
				$("#hi").attr("src","${pageContext.request.contextPath}/assets/image/Character/main_muzi.png");
			} else if (value==3){
				$("#hi").attr("src","${pageContext.request.contextPath}/assets/image/Character/main_prodo.png");
			} else if (value==4){
				$("#hi").attr("src","${pageContext.request.contextPath}/assets/image/Character/main_neo.png");
			} else {
				console.log("왔네왔어");
				$("#goSubmit").submit();
				return;
			}
			$("#welcomeModal").modal("show");
		});
				
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#target").hide();
		$("#registerForm").hide();
		$('.ui.dropdown').dropdown();
		$("#agreement").on("change", function() {
			if ($("#agreement").is(":checked")) {
				$("#registerForm").show("clip", 700);
				$("#yak").hide("fold", 700);
			} else {
				$("#registerForm").hide("clip", 700);
				$("#yak").show("fold", 700);
			}
		});

		$("#t_email").on("blur", function() {
			var test = $("#t_email").val();
			console.log(test);

			if (test.indexOf('@') != -1) {
				alert("으아~!");
			}
		});

		//학교검색용
		$("#school").on("click", function() {
			$('#searchSchoolForm').modal('setting', {
				closable : false,
				onDeny : function() {
					window.alert('Wait not yet!');
					return false;
				},
				onApprove : function() {
					$("#school").val($("#schoolResult").val());
				}
			}).modal('show');
		});
		//학교 검색끝
		
		//엔터치면 검색이 되는 함수 시작
        $(document).keypress(function(event){
           var keycode = (event.keyCode ? event.keyCode : event.which);
           if(keycode == '13'){
            	$('#goSearch').trigger('click');   
           }
        });
		//엔터치면 검색이 되는 함수 끝
		
		$("#temail2").on("change", function(){
			emailSum();
		});
		
		$("#submitmit").on("click", function(){
			if(registerFormCheck()){
			$("#goSubmit").submit();
			} else {
				$("#welcomeModal").modal("hide");
			}
		})
	});
	function emailSum() {
		var temail1 = $("#temail1").val();
		var temail2 = $("#temail2").val();
		$("#temail").val(temail1 + temail2);
	} 
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div id="registrationFormWidthControl" style="margin: 0 auto; margin-top: 80px; width: 70%">
		<div class="ui form">
		<div class="fiels">
		<label style="font-size:large;font-weight: bold;"><i class="circular inverted user icon"></i>회원 가입</label>
		</div>
			<div class="field" style="margin-top: 30px; ">
				<label>가입약관</label>
				<textarea autofocus="autofocus" draggable="false" id="yak" readonly="readonly" rows="20">
제 1 장 총 칙

제1조 [목적]
본 약관은 슬기로운 코딩㈜(이하 “회사”라 합니다)가 웹사이트(www.intelligentcoding.com)를 통하여 제공하는 교육정보서비스(이하 “서비스”라 합니다)의 이용과 관련하여 회사와 회원 사이에 권리ㆍ의무 및 책임사항 등을 규정함을 목적으로 합니다.

제2조 [정의]
① 본 약관에서 사용하는 용어의 정의는 다음과 같습니다.
1. “이용자”라 함은 회사의 웹사이트에 접속하여 본 약관에 따라 회사가 제공하는 콘텐츠 및 제반서비스를 
이용하는 회원 및 비회원을 말합니다.
2. “회원”이라 함은 회사의 웹사이트에 접속하여 본 약관에 동의함으로써 회사와 이용계약을 체결하고 
아이디(ID)를 부여받은 자로서 회사가 제공하는 정보와 서비스를 지속적으로 이용할 수 있는 자를 말합니다.
3. “콘텐츠”라 함은 회사가 제작하여 웹사이트에서 제공 및 판매하는 온라인 강좌 및 기타 관련정보를 
의미함으로서, 정보통신망이용촉진 및 정보보호 등에 관한 법률 제2조 제1항 제1호의 규정에 의한 
정보통신망에서 사용되는 부호ㆍ문자ㆍ음성ㆍ음향ㆍ이미지 또는 영상 등으로 표현된 자료 또는 정보를 말합니다. 
4. “아이디(ID)”라 함은 회원의 식별 및 서비스 이용을 위하여 회원이 정하고 회사가 승인하는 문자 또는 
숫자의 조합을 말합니다.
5. “비밀번호(PASSWORD)”라 함은 서비스 이용 시, 아이디와 일치되는 회원임을 확인하고 회원 개인정보 
보호를 위하여 회원 자신이 정한 문자 또는 숫자의 조합을 말합니다.
② 전항 각호에 해당하는 정의 이외의 기타 용어의 정의에 대하여는 거래 관행 및 관계 법령에 따릅니다. 

제3조 [회사 신원정보 등의 제공] 
회사는 회사의 상호, 대표자 성명, 주소, 전화번호(소비자의 불만을 처리하는 곳의 연락처 포함), 모사전송번호, 전자우편주소, 사업자등록번호, 통신판매업 신고번호 및 개인정보관리책임자 등을 이용자가 쉽게 알 수 있도록 온라인 서비스 초기화면에 게시합니다.

제4조 [약관의 게시 등]
① 회사는 이용자가 별도의 연결화면을 통하여 약관을 확인할 수 있도록 회사 웹사이트에 게시하며, 약관의 전문을 출력할 수 있도록 하고 있습니다.
② 회사는 약관의 중요한 내용을 굵은 문자 등으로 명확하게 표시하여 이용자가 알아보기 쉽도록 하고 있습니다.

제5조 [약관의 개정]
① 회사는 관계법령을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.
② 회사가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여, 개정 전 약관과 함께 적용일 14일 전부터 회사 웹사이트에서 확인할 수 있도록 게시하며, 기존 회원에게는 본 약관 제7조의 방법을 통하여 약관 개정사실을 통지합니다.
③ 기존 회원이 변경된 약관에 동의하지 않는 경우 서비스 이용을 중단하고 회원탈퇴를 할 수 있습니다. 

제6조 [약관의 효력]
① 본 약관은 이용자가 약관의 내용에 동의하며 회원가입을 신청하고, 회사가 그 신청에 대하여 승낙함으로써 효력이 발생합니다.
② 회사는 기존 회원이 본 약관 제5조 제2항에 따른 공지 또는 통지에도 불구하고, 동 기간 내에 이의를 제기하지 않는 경우에는 변경된 약관을 승인한 것으로 봅니다.
③ 본 약관에 명시되지 않은 사항에 대해서는 “약관의 규제에 관한 법률”, “정보통신망 이용촉진 및 정보보호 등에 관한 법률”, “전자상거래 등에서의 소비자보호에 관한 법률”, “학원의 설립·운영 및 과외교습에 관한 법률”, “콘텐츠 산업 진흥법” 및 기타 관련법령 또는 상관례에 따릅니다. 

제7조 [“회원”에 대한 통지]
① 회사는 회원에게 알려야 할 사항이 발생하는 경우, 회원가입 시 회원이 공개한 전자우편주소 또는 쪽지, 팝업창, 유ㆍ무선 등의 방법으로 통지할 수 있습니다.
② 회사는 회원 전체에 대한 통지의 경우 14일 이상 회사 웹사이트 게시판에 게시함으로써 전항의 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래 및 사이트의 이용과 관련하여 중대한 영향을 미치는 사항에 대하여는 30일 이상 전항과 동일한 방법으로 별도 통지할 수 있습니다.

제2장 회원가입

제8조 [회원가입]
① 회원으로 가입하여 회사 서비스의 이용을 희망하는 자는 약관의 내용을 숙지한 후 동의함을 표시하고, 회사가 제시하는 소정의 회원가입 양식에 관련사항을 기재하여 회원가입을 신청하여야 합니다.
② 회사는 전항에 따라 이용자가 온라인 회원가입 신청양식에 기재하는 모든 회원정보를 실제 데이터인 것으로 간주합니다.
③ 실명이나 실제 정보를 입력하지 않은 회원은 법적인 보호를 받을 수 없으며, 본 약관의 관련 규정에 따라 서비스 사용에 제한을 받을 수 있습니다.
④ 회사는 본조 제1항에 따른 이용자의 신청에 대하여 회원가입을 승낙함을 원칙으로 합니다. 다만, 회사는 다음 각호에 해당하는 신청에 대하여는 승낙을 하지 않을 수 있으며, 승낙 이후라도 취소할 수 있습니다. 
1. 이용자의 귀책사유로 인하여 승인이 불가능한 경우 
2. 실명을 사용하지 않은 경우 
3. 타인의 명의 또는 개인정보를 도용하는 경우 
4. 허위의 정보를 제공하는 경우 
5. 중복된 아이디를 사용하는 경우 
6. 회사가 제시하는 회원가입 신청양식에 관련 내용을 기재하지 않은 경우 
7. 이전에 회사 이용약관 또는 관계법령을 위반하여 회원자격이 상실되었던 경우 
8. 본 약관 제19조 [회원의 의무]를 위반하는 경우 
9. 기타 본 약관 및 관계법령을 위반하는 경우 
10. 회원가입 신청양식에 기재되어 회사에 제공되는 개인정보(ID, 비밀번호, 주소 등)가 선량한 풍속 기타 
사회질서에 위배되거나 타인을 모욕하는 경우 
⑤ 회사는 서비스 관련 설비의 여유가 없거나 기술상 또는 업무상 문제가 있는 경우에는 승낙을 유보할 수 있습니다.
⑥ 회사가 본조 제4항과 제5항에 따라 회원가입신청의 승낙을 하지 아니하거나 유보한 경우에는 팝업창을 통하여 즉시 이용자(신청자)에게 알립니다. 단, 회사의 귀책사유 없이 이용자에게 알릴 수 없는 경우에는 예외로 합니다.
⑦ 보호자(법정대리인)는 별도의 “학부모 회원가입”을 통하여 자녀의 학습 진도율 등을 확인할 수 있습니다. 

제9조 [만 14세 미만 아동의 회원가입에 관한 특칙]
① 만14세 미만의 이용자는 회사 웹사이트에서 전자적 표시 형태로 제공되는 개인정보처리방침을 충분히 숙지한 후, 반드시 보호자의 동의를 얻어 회원가입을 신청 하여야 하는 등 본인의 개인정보를 제공함에 있어 신중을 기해야 합니다.
② 회사는 만 14세 미만의 이용자가 회원가입을 신청하는 경우 별도의 안내 또는 절차를 통하여 보호자의 동의 여부를 확인할 수 있습니다.
③ 만14세 미만의 이용자는 회사가 보호자에게 전항의 동의사실 여부를 확인 할 수 있도록 회원가입 시, 보호자의 성명 및 유ㆍ무선 연락처 등을 제공하여야 합니다.
④ 회사는 보호자 동의에 대한 확인절차를 거치지 않은 만14세 미만 이용자에 대하여는 회원가입을 불허 또는 취소할 수 있습니다.
⑤ 만 14세 미만 회원의 보호자는 자녀에 대한 개인정보의 열람, 정정, 갱신을 요구하거나 회원가입에 대한 동의를 철회할 수 있으며, 이러한 경우에 회사는 지체 없이 필요한 조치를 취해야 합니다. 이때 회사는 보호자임을 입증할 수 있는 문서 등의 확인서류 제출을 요청할 수 있습니다. 

제10조 [회원정보의 변경]
① 회원은 회사 웹사이트 “정보수정” 페이지에서 언제든지 자신의 개인정보를 열람하고 수정할 수 있습니다.
② 회원이 전항의 변경사항을 수정하지 않아 발생한 불이익에 대하여 회사는 책임지지 않습니다. 

제11조 [“회원”의 “아이디” 및 “비밀번호”의 관리에 대한 의무]
① 회원은 아이디와 비밀번호에 대한 관리책임이 있으며, 이를 타인에게 공개하여 제3자가 이용하도록 하여서는 안됩니다.
② 회원은 자신의 아이디 및 비밀번호가 유출되어 제3자에 의해 사용되고 있음을 인지한 경우, 즉시 회사에 알려야 합니다.
③ 회사는 전항의 경우 회원의 개인정보보호 및 기타 서비스 부정이용행위 방지 등을 위하여 회원에게 비밀번호의 변경 등 필요한 조치를 요구할 수 있으며, 회원은 회사의 요구가 있는 즉시 회사의 요청에 성실히 응해야 합니다.
④ 회사는 회원이 본조 제2항 및 제3항에 따른 의무를 성실히 이행하지 않아 발생한 불이익에 대하여 책임지지 않습니다. 

제12조 [이용계약의 해지·해제 등] 
① 회원이 이용계약의 해지 또는 해제를 원할 경우에는 본인이 회사 고객센터에 전화접수를 하거나 웹사이트를 통하여 신청할 수 있으며, 회사는 회원의 의사표시를 수령한 후 지체없이 이러한 사실을 회신하고 본 약관에 따라 환불 등의 조치를 취합니다.
② 회사는 회원이 본 약관 또는 관계법령 등을 위반하는 경우, 이용계약을 해지할 수 있습니다.

제3장 서비스 이용

제13조 [서비스의 원활한 이용]
① 회사는 서비스의 원활한 제공을 위하여 회원이 회사 웹사이트 접속 시, 회사에서 제작 및 배포하는 ActiveX Control의 설치를 권장합니다.
② 회원이 해당 프로그램 설치를 위하여 설치동의 [“예”] 버튼을 클릭하면, 회원 PC에 자동으로 설치됩니다.
③ 회원이 회사에서 권장하는 본조 제1항의 프로그램을 설치하지 않는 경우 일부 서비스 이용에 어려움이 있을 수 있습니다. 

제14조 [콘텐츠 이용에 필요한 기술사양]
① 회사가 제공하는 콘텐츠를 이용하는데 필요한 PC의 최소사양은 아래와 같습니다.
- CPU: Pentium4 2.4 이상 
- 메모리: 2G 이상 
- HDD: C:\ 공간이 2G이상 
- VGA : NVIDIA GeForce FX 5200 Memory: 128MB 
ATI Radeon 9500 128MB 이상 
- 운영체제 : Windows XP 이상 
- DirectX : 9.0 이상 
- Internet Explorer : 8.0 이상 
② 회사가 제공하는 콘텐츠를 이용할 수 있는 PMP등 학습기기의 기술사양은 고객센터에 전화로 문의하거나 회사 웹사이트 내에서 확인할 수 있습니다.

제15조 [거래조건에 대한 정보의 표시] 
① 회사는 다음 각호에 해당하는 사항을 해당 콘텐츠 또는 그 포장에 표시합니다.
1. 콘텐츠의 명칭, 종류, 내용, 가격, 이용기간 
2. 콘텐츠 이용에 필요한 전자매체의 최소한의 기술사양 
3. 휴대가 가능한 학습용 전자기기의 사용가능 여부 
4. 이용약관 및 개인정보처리방침 
② 회사는 전항 각호의 사항을 회사 웹사이트, 본 이용약관, 개인정보처리방침 등에서 이미 고지하고 있는 경우, 별도로 표시하지 않을 수 있습니다. 

제16조 [서비스 이용계약의 성립]
① 회원은 회사가 제공하는 다음 각호 또는 이와 유사한 절차에 의하여 콘텐츠 서비스 이용을 신청을 합니다. 회사는 계약 체결 전, 다음 각호의 사항에 관하여 회원이 정확하게 이해하고 실수 또는 착오 없이 거래할 수 있도록 정보를 제공합니다.
1. 콘텐츠 목록의 열람 및 선택 
2. 콘텐츠 상세정보 확인 

제17조 [회사의 의무]
① 회사는 법령과 본 약관이 정하는 권리의 행사와 의무의 이행을 신의에 좇아 성실하게 하여야 합니다. 
② 회사는 회원이 서비스를 이용하는 과정에서 회원 개인정보가 외부로 유출되지 않도록 방화벽을 설치하는 등 별도의 보안장치를 사용하고 있으며, 그 구체적인 내용은 회사 웹사이트의 “개인정보처리방침”에서 확인할 수 있습니다.
③ 회사는 회원이 유료서비스 이용 및 그 대금내역을 수시로 확인할 수 있도록 조치합니다. 
④ 회사는 서비스 이용과 관련하여 회원으로부터 제기된 의견이나 불만이 정당하다고 인정할 경우에는 이를 지체없이 처리합니다. 회원이 제기한 의견이나 불만사항에 대해서는 게시판을 활용하거나 전자우편 등을 통하여 그 처리과정 및 결과를 전달합니다. 
⑤ 회사는 본 약관에서 정한 회사의 의무 위반으로 인하여 회원이 입은 손해를 배상합니다. 

제18조 [회원의 의무] 
① 회사의 명시적 동의가 없는 한 회원의 이용권한은 회원 개인에 한정되며, 타인에게 양도, 증여하거나 이를 담보 등으로 제공할 수 없습니다.
② 회사는 회원이 다음 각호의 1에 해당하는 의무를 위반 하였을 경우, 기간을 정하여 전부 또는 일부의 서비스 이용을 중지하거나 상당기간의 최고 후 이용계약을 해지할 수 있습니다. 
1. 회원이 이용신청 또는 변경 시, 허위사실을 기재하거나 자신 또는 다른 회원의 ID 및 개인정보를 
이용ㆍ공유하는 경우 
2. 회원이 회사 또는 제3자의 권리 등을 침해하는 경우 
3. 회원이 회사에서 제공하는 서비스를 이용하여 상품 또는 용역을 판매하는 영업활동 등의 상행위를 하는 경우 
4. 회원이 다른 이용자의 서비스 이용을 방해하거나 회사의 운영진, 직원 또는 관계자를 사칭하는 경우 
5. 회원이 회사 웹사이트 내에서 사회의 안녕질서 혹은 미풍양속을 저해하는 행위를 하거나, 그와 
관련된 부호ㆍ문자ㆍ음성ㆍ음향 및 영상 등의 정보를 게시하여 타인에게 유포시키는 경우 
6. 회원이 회사로부터 유ㆍ무상으로 제공받은 캐쉬 등의 재화를 제3자와 유ㆍ무상 등의 방법으로 거래하는 경우 
7. 회사의 서비스 운영을 고의로 방해 하거나 그리할 목적으로 다량의 정보를 전송하거나 광고성 정보를 
전송하는 경우 
8. 관계법령 및 기타 본 약관에서 규정한 사항을 위반한 경우 
9. 회사 및 타인의 명예를 훼손하거나 모욕하는 경우 등 

제19조 [부정이용 금지 및 차단] 
① 회사는 다음 각호에 해당하는 경우를 부정 이용행위로 봅니다. 
1. 동일한 ID로 2대 이상의 PC에서 동시접속이 발생하는 경우 
2. 동일한 ID로 다수의 PC 또는 IP에서 서비스를 이용하는 경우 
3. 자신의 ID 및 강좌 등의 서비스를 타인이 이용하도록 하는 경우 
4. 자신의 ID 및 강좌 등의 서비스를 타인에게 판매, 대여, 양도하는 행위 및 이를 광고하는 행위 
5. 서비스 이용 중 복제프로그램을 실행하는 경우 또는 녹화를 하거나 시도하는 경우 
② 회사는 전항에 따른 부정 이용자가 발견 되었을 경우, 다음 각호에 따른 조치를 취할 수 있습니다.
1. [1차 발견 시] - 전자우편, 쪽지, 팝업창을 통하여 경고합니다.
2. [2차 발견 시] - 전호와 동일한 방법으로 경고하고 동시에 서비스 제공을 정지합니다. 이때, 보호자가 
가족관계를 확인할 수 있는 주민등록등본을 첨부하여 “재발방지확약ㆍ보증서”를 회사에 송달하는 경우에는 
서비스 제공을 재개합니다.
3. [3차 발견 시] - 전자우편, 쪽지, 팝업창 또는 유ㆍ무선을 통하여 3차 위반내용의 통지 및 서비스 제공을 
정지하고 30일간의 소명기간 부여하며, 정당한 사유가 없는 경우 강제 탈퇴처리 합니다.
③ 회원은 전항 제2호 및 3호의 조치를 이유로 서비스 이용기간의 연장을 요구할 수 없습니다. 
④ 회원은 회사로부터의 본조 제2항의 조치에 이의가 있는 경우 회사 고객센터 또는 부정사용관리센터에 해당 사실에 대하여 소명할 수 있으며, 회원이 자신의 고의나 과실이 없었음을 입증한 경우 회사는 서비스 제공 정지기간만큼 이용기간을 연장합니다.
⑤ 부정이용 식별방법 및 차단 
1. 회사는 회원의 서비스 이용 중에 수집ㆍ확인된 IP정보 등의 자료를 토대로 서버를 통하여 부정이용 
여부를 분류ㆍ확인합니다.
2. 회사는 이용자가 서비스 이용 중에 복제프로그램을 실행시키거나 동일한 ID로 동시 접속을 하는 경우 
서비스 이용 접속을 강제로 차단합니다. 

제20조 [서비스의 제공 및 변경]
① 회사는 연중무휴, 1일 24시간 서비스 제공을 원칙으로 합니다.
② 회사는 운영상 또는 기술상 등의 상당한 이유가 있는 경우 제공하고 있는 서비스를 변경할 수 있습니다.
③ 전항에 따라 서비스가 변경되는 경우에는 변경되는 사유 및 내용을 본 약관 제7조에 따른 방법으로 회원에게 통지합니다. 

제21조 [정보의 제공 및 광고의 게재 등] 
① 회사는 회원이 서비스 이용 중 필요하다고 인정되는 다양한 정보를 공지사항이나 전자우편 또는 유선상 등의 방법으로 회원에게 제공할 수 있습니다. 다만, 회원은 언제든지 전자우편 등을 통하여 수신 거절을 할 수 있습니다. 
② 회사는 서비스 제공과 관련하여 해당 서비스 화면, 회사 웹사이트, 회원가입 시 회원이 직접 작성한 전자우편 등에 광고를 게재할 수 있습니다. 광고가 게재된 전자우편 등을 수신한 회원은 수신거절을 할 수 있습니다. 
③ 회사는 회원에게 회사가 서비스하는 상품에 대하여 회원 가입 시 기입한 전화번호로 전화권유판매를 할 수 있으며, 회원은 온라인 홈페이지 또는 고객센터 등을 통하여 회사의 전화권유판매에 대한 수신거절을 할 수 있습니다. 

제22조 [회원이 등록한 게시물의 이용 및 삭제]
① 회사는 회원이 등록한 게시물 중 본 약관 및 관계법령 등에 위배되는 게시물이 있는 경우 이를 지체없이 삭제합니다.
② 회사가 운영하는 게시판 등에 게시된 정보로 인하여 법률상 이익이 침해된 자는 회사에게 당해 정보의 삭제 또는 반박내용의 게재를 요청할 수 있습니다. 이 경우 회사는 지체없이 필요한 조치를 취하고 이를 즉시 신청인에게 통지합니다. 
③ 회사는 회사가 제공하는 웹사이트에 회원이 게시한 게시물을 이용·수정하여 마케팅 및 출판 등에 활용할 수 있습니다. 
④ 회원은 전항에 따른 회사의 이용 등에 대하여 웹사이트 등을 통하여 철회 할 수 있으며, 회사는 회원의 철회의사를 받은 후로부터 해당 회원의 게시물을 사용하지 않습니다. 단, 회사는 철회의 의사표시 전 기 제작된 제작물에 대하여는 소진 시 까지 사용할 수 있습니다.

제23조 [저작권] 
① 회사가 제공하는 모든 콘텐츠에 대한 저작권은 회사에 있습니다.
② 회원은 회사가 제공하는 서비스를 이용함으로써 얻은 정보를 회사의 사전 승낙없이 녹화ㆍ복제ㆍ편집ㆍ전시ㆍ전송ㆍ배포ㆍ판매ㆍ방송ㆍ공연하는 등의 행위로 회사의 저작권을 침해 하여서는 안됩니다. 

제24조 [개인정보보호] 
① 회사는 회원의 개인정보보호를 중요시하며, 회원이 회사의 서비스를 이용함과 동시에 온라인상에서 회사에게 제공한 개인정보의 철저한 보호를 위하여 최선을 다하고 있습니다.
② 개인정보보호와 관련된 자세한 사항은 회사 웹사이트에서 전자적 표시형태로 제공되는 개인정보처리방침에서 확인하실 수 있습니다.

[부칙]
1.본 약관은 2014년 5월 31일부터 시행됩니다.
			</textarea>
			</div>
		</div>
		<div class="ui form">
			<div class="inline field">
				<div class="ui toggle checkbox">
					<input type="checkbox" id="agreement">
					<label for="agreement">상기 약관에 동의합니다.</label>
				</div>
			</div>
		</div>
		<form method="post" action="register.scse" id="goSubmit" onsubmit="javascript:registerFormCheck()">
			<div id="registerForm">
				<div class="ui form segment">
					<div class="field" id="userIdField">
						<label>아이디</label>
						<div class="ui left labeled icon input">
							<input maxlength="30" type="text" id='userId' name='userId' placeholder="아이디를 입력해주세요">
							<i class="user icon"></i>
							<div class="ui corner label">
								<i class="icon asterisk"></i>
							</div>
							<div class="ui red pointing above ui label formCheck" id="userIdFormCheck">아이디를 입력해주세요.</div>
							<div class="ui blue pointing above ui label formCheck" id="userIdFormOk">좋은 아이디다.</div>
						</div>
					</div>
					<div class="field">
						<label>비밀번호</label>
						<div class="ui left labeled icon input">
							<input type="password" id='password' name='password' placeholder="비밀번호를 입력해주세요">
							<i class="lock icon"></i>
							<div class="ui corner label">
								<i class="icon asterisk"></i>
							</div>
							<div class="ui red pointing above ui label formCheck" id="passFormCheck">비밀번호를 입력해주세요.</div>
							<div class="ui red pointing above ui label formCheck" id="passFormLengthCheck">비밀번호는 5글자 이상으로 입력해주세요.</div>
						</div>
					</div>
					<div class="field">
						<label>비밀번호확인</label>
						<div class="ui left labeled icon input">
							<input type="password" id='passwordChk' name='passwordChk' placeholder="다시 한 번 입력해주세요.">
							<i class="lock icon"></i>
							<div class="ui corner label">
								<i class="icon asterisk"></i>
							</div>
							<div class="ui red pointing above ui label formCheck" id="passDupFormCheck">비밀번호를 다시 한 번 입력해주세요.</div>
							<div class="ui red pointing above ui label formCheck" id="DupFormCheck">비밀번호가 일치 하지 않습니다.</div>
						</div>
					</div>
					<div class="field">
						<label>이름</label>
						<div class="ui left labeled icon input">
							<input type='text' id='sName' name='sName' placeholder="이름을 입력해주세요.">
							<i class="terminal icon"></i>
							<div class="ui corner label">
								<i class="icon asterisk"></i>
							</div>
							<div class="ui red pointing above ui label formCheck" id="snameFormCheck">이름을 입력해주세요.</div>
						</div>
					</div>
					<div class="two fields">
						
							<div class="field">
								<label>학교</label>
								<div class="ui left labeled icon input">
									<!-- 실제 컨트롤러에서 쓰이는 학교번호가 입력되는 곳 -->
									<input type="hidden" id='schoolNum' name='schoolNum'>
									<input type='text' id='school' name='school' readonly="readonly" placeholder='학교를 입력해주세요.'>
									<i class="briefcase icon"></i>
									<div class="ui corner label">
										<i class="icon asterisk"></i>
									</div>
									<div class="ui red pointing above ui label formCheck" id="schoolFormCheck">학교를 입력해주세요.</div>
								</div>
							</div>
						<c:if test="${uType =='s'.charAt(0) }">
							<div class="field">
								<label>학년</label>
								<div class="ui left labeled icon input">
									<input type='number' min='1' max='6' step="'1" id='grade' name='grade' placeholder='학년을 입력해주세요.'>
									<i class="briefcase icon"></i>
									<div class="ui corner label">
										<i class="icon asterisk"></i>
									</div>
									<div class="ui red pointing above ui label formCheck" id="gradeFormCheck">학년을 입력해주세요.</div>
									<div class="ui red pointing above ui label formCheck" id="gradeIntCheck">학년은 숫자여야 합니다.</div>
								</div>
							</div>
						</c:if>
					</div>
					<c:if test="${uType == 'p'.charAt(0) }">
						<div class="field">
							<label>학부모용 이메일</label>
							<div class="ui left labeled icon input">
								<input type='text' id='email' name='email' placeholder='이메일을 입력해주세요.'>
								<i class="mail outline icon"></i>
								<div class="ui corner label">
									<i class="icon asterisk"></i>
								</div>
								<div class="ui red pointing above ui label formCheck" id="emailFormCheck">이메일을 입력해주세요.</div>
								<div class="ui red pointing above ui label formCheck" id="emailAtCheck">이메일에는 @가 들어가야 합니다.</div>
							</div>
						</div>
					</c:if>
					<c:if test="${uType == 't'.charAt(0) }">
						<!-- 이메일 여기서 합쳐짐 -->
						<input type="hidden" id='temail' name='temail'>
						<div class="field">
							<label>교사용 이메일</label>
							<div class="ui left labeled icon input">
								<Table>
									<tr>
										<td width="76%"><input type='text' id='temail1' placeholder='교육청 이메일 아이디를 입력해주세요.'>
										<td><div class="ui dropdown selection error select-school">
												<input type="hidden" name="temail2" id="temail2">
												<div class="default text">교육청 이메일 선택</div>
												<i class="dropdown icon"></i>
												<div class="menu">
													<div class="item" data-value="@sen.go.kr">@sen.go.kr</div>
													<div class="item" data-value="@goe.go.kr">@goe.go.kr</div>
													<div class="item" data-value="@gne.go.kr">@gne.go.kr</div>
													<div class="item" data-value="@pen.go.kr">@pen.go.kr</div>
													<div class="item" data-value="@cne.go.kr">@cne.go.kr</div>
													<div class="item" data-value="@dge.go.kr">@dge.go.kr</div>
													<div class="item" data-value="@gen.go.kr">@gen.go.kr</div>
													<div class="item" data-value="@jbe.go.kr">@jbe.go.kr</div>
													<div class="item" data-value="@gwe.go.kr">@gwe.go.kr</div>
													<div class="item" data-value="@dje.go.kr">@dje.go.kr</div>
													<div class="item" data-value="@ice.go.kr">@ice.go.kr</div>
													<div class="item" data-value="@use.go.kr">@use.go.kr</div>
													<div class="item" data-value="@jje.go.kr">@jje.go.kr</div>
													<div class="item" data-value="@gbe.go.kr">@gbe.go.kr</div>
													<div class="item" data-value="@cbe.go.kr">@cbe.go.kr</div>
													<div class="item" data-value="@jne.go.kr">@jne.go.kr</div>
													<div class="item" data-value="@sje.go.kr">@sje.go.kr</div>
													<div class="item" data-value="@naver.com">@naver.com</div>
												</div>
											</div></td>
								</Table>
								<div class="ui red pointing above ui label formCheck" id="teacherEmailCheck">교사용 이메일을 선택해주세요.</div>
								<div class="ui red pointing above ui label formCheck" id="teacherEmailSelectCheck">교사용 이메일 계정을 선택해주세요.</div>
								<!-- 	 <i class="mail icon"></i> -->
							</div>
						</div>
					</c:if>
					<c:if test="${uType != 's'.charAt(0) }">
						<div class="field">
							<label>연락처</label>
							<div class="ui left labeled icon input">
								<input type='tel' id='phone' name='phone' placeholder='연락처 입력해주세요.'>
								<i class="phone icon"></i>
								<div class="ui corner label">
									<i class="icon asterisk"></i>
								</div>
								<div class="ui red pointing above ui label formCheck" id="phoneFormCheck">연락처를 입력해주세요.</div>
							</div>
						</div>
					</c:if>
					<c:if test="${uType =='s'.charAt(0) }">
					<div class="field">
						<label>기본캐릭터 선택</label>
						<table class="ui table segment">
							<tr>
						
							<c:forEach items="${requestScope.characterlist }" var="character" begin="0" end="3" varStatus="status">
							
								<td><label for="${status.count}"><img width="200px" height="200px" class="ui image"  src="${pageContext.request.contextPath}/assets/image/Character/${character.chaImg}"></label></td>
							</c:forEach>
							</tr>
							<tr>
								<td><input type="radio" id="1" checked="checked" name="cha_checked" value="1"> 애교부리는 어피치</td>
								<td><input type="radio" id="2" name="cha_checked" value="2"> 졸린 단무지</td>
								<td><input type="radio" id="3" name="cha_checked" value="3"> 호기심 많은 프로도</td>
								<td><input type="radio" id="4" name="cha_checked" value="4"> 부끄럼 많은 네오</td>
							
						</table>
					</div>
					</c:if>
					<input type="hidden" name="uType" value="${uType }">
					<div class="ui form">
						<div class="ui two fields" style="margin-bottom: 30px">
							<div class="field">
								<input type="button" class="ui blue goSubmit button fluid" value="가입하기" onsubmit="javascript:registerFormCheck();">
							</div>
							<div class="field">
								<div class="ui red cancel button fluid">취소하기</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="ui small modal" id="welcomeModal" style="width:30%; margin-left: -17%;">
			<div class="ui inverted block header" style="background: #D1C8E5; font-family: 'Nanum Gothic';">슬기로운 코딩의 <br/>새로운 가족이 되셨습니다!</div>
			<div class="content">
				<table class="ui table segment">
					<tr>
						<th style="text-align: center;">안녕하세요!<br/> 앞으로 함께 열심히 공부해 보아요!</th>
					<tr>
						<td align="center" style="text-align: center;"><img width="150px" style="margin: 0 auto" height="150px" align="middle" id="hi" class="ui image" src=""></td>		
					<tr>
						<td style="text-align: center; font-size: medium;" id="targetText">여러분과 함께할 친구예요!<br/>게임을 통해서 더많은 친구를 만나보세요!</td>
				</table>
				<div class="actions">
					<div class="small negative orange ui button">취소</div>
					<input type="submit" value="가입" id="submitmit" class="small submit blue positive ui button">
				</div>
			</div>
			</div>
			
			
			
		</form>
		
		
		<div class="ui small modal" id="searchSchoolForm">
			<i class="close icon"></i>
			<div class="ui inverted block header" style="background: #D1C8E5; font-family: 'Nanum Gothic'; padding: 1em 2em">학교 검색</div>
			<div class="content" style="padding: 0.5em; width: 100%">
				<div class="ui form segment">
					<div class="two fields">
						<div class="field" style="width: 80%">
							<div class="ui icon fluid input">
								<input type="text" placeholder="검색을 원하는 학교명을 입력해주세요." id="search">
								<i class="search link icon"></i>
							</div>
						</div>
						<div class="field" style="width: 20%">
							<input type="submit" class="ui button" value="검색" id="goSearch">
						</div>
					</div>
				</div>
				<div style="height: 400px; overflow-y: scroll; overflow-x: hidden;">
					<div id="loading" align="center" style="width: 100%; height: 100%; vertical-align: middle">
						<img src="img/ajaxLoading.gif">
					</div>
					<table class="ui table segment" id="target">
						<thead id="tableahead">
							<tr>
								<th>학교코드</th>
								<th>학교명</th>
								<th>학교위치</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	
</div>
</body>
</html>