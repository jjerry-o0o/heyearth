<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/js/mission/mission.js"></script>
<link rel="stylesheet" href="/css/mission/mission.css" />


<script>
$(document).ready(function (){
	var savedFileName = "";
	$("#file").on('change', function(){ 
		var formData = new FormData();
		
	formData.append("uploadFile", $("#file")[0].files[0]);			
		$.ajax({
			url: '/ocrresult2',
			data: formData,
			type:'post',
			processData : false ,
			contentType : false ,
			success : function(data){
				$("#preview1").attr("src", "/img/" + data);
				savedFileName = data;
				document.querySelector("#ocrreceipt").onclick = ocrreceipt(data);
				
			}//success
		});//ajax
	});//on
	
	function ocrreceipt(data){
		let savedFileName = data;
		return function(){
			$.ajax({
			url : '/ocrreceipt',
			data: {"savedFileName" : savedFileName},
			type: 'post',
			success: function(data){
				var json = JSON.parse(data.json); //OCR 영수증 변환 값
				var list = data.list; //모든 제로웨이스트샵 리스트
				 
				var title = json.images[0].receipt.result.storeInfo.name.text; // 가게 이름
				var product = json.images[0].receipt.result.subResults[0].items[0].name.text; // 상품 이름
				var price = json.images[0].receipt.result.subResults[0].items[0].price.price.text; // 상품 가격
				var total = json.images[0].receipt.result.totalPrice.price.text; // 총 가격
				
				// 모든 제로웨이스트샵 이름으로 배열 만들기
				let zerolist = [];
				for(var i=0; i< list.length; i++) {
					zerolist.push(list[i].s_name); 
				}

				// 배열 안에 해당 영수증의 가게 이름이 존재하는지 확인
				if(zerolist.includes(title)){ 
					alert(title + " 가게는 헤이얼스 제로웨이스트샵 리스트에 있습니다.");
				$("#a").css("display", "");	
				$("#p_photo").val(savedFileName);
				}				
				$("#store").html('');
				$("#p").empty();
		
				$("#store").append("당신이 방문한 가게는 : " + title);
				
				}//success
			});//ajax
		}
	}
});//ready
</script>
</head>

<body>

<!-- Talk Talk Banner Script start -->
	<script type="text/javascript" src="https://partner.talk.naver.com/banners/script"></script>
	<div class="talk_banner_div" data-id="114553" style="position: fixed; right: 100px; bottom: 30px; z-index: 99;"></div>
<!-- Talk Talk Banner Script end -->
<div id=title>

</div>
	<div>
		<div>
			<div>
				<img id=preview1 width=300 height=700 />
			</div>
			<div>
				<label id=filelabel for="file">사진 첨부하기
				</label> <input type="file" id="file" name=uploadFile><br>
			</div>
			<input id="ocrreceipt" type=button value="영수증 인식하기">
			<div>
				<div id=store></div>
				<br><br>
				<p id=p></p>
			</div>

		</div>

		<!--  수정중 -->
		<div class="content"></div>
		<div id="a" style="display:none;">
		<form method="post" action="${pageContext.request.contextPath}/register_complete2">
		<input type="hidden" name="m_code" value="14">
				<input name="p_photo" type="hidden" id="p_photo">
				<input name="id" type="hidden" id="id" value="${sessionScope.session_id}">
				<input type="hidden" name="p_complete" value=1>
				<input type="hidden" name="m_point" value="500">
				<input type="hidden" name="m_carbon" value="1000">
					<br><br>
				<input type='submit' id='register_complete' class="register" value='미션 완료하기'>
		</form>
		</div>
	</div>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
