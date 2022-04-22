<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css 모두 정리후 분리할 예정 -->
<style>
.my_img{
width:200px; 
height:200px; 
}
.my_mission{
margin-left:10px; 
width:80%; 
border:3px solid #1A271D;
}
.modal-overlay, .modal-overlay2{
	width : 100%;
	height : 100%;
	position : absolute;
	left : 0;
	top : 0;
	display : flex;
	flex-direction : column;
	align-items : center;
	justify-content : center;
	
	background : rgba(0,0,0, 0.5);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
    backdrop-filter: blur(1.5px);
    -webkit-backdrop-filter: blur(1.5px);
    border-radius: 10px;
    border: 1px solid rgba(255, 255, 255, 0.18);
    display : none;
}

.modal-window, .modal-window2{
	background-color :  #F6F5F0;
	color:#1A271D;
	box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
    backdrop-filter: blur( 13.5px );
    -webkit-backdrop-filter: blur( 13.5px );
    border-radius: 10px;
    border: 5px solid #1A271D;
    width: 400px;
    height: 500px;
    position: relative;
    padding: 10px;
}
.close-area ,.close-area2{
	display: inline;
    float: right;
    padding-right: 10px;
    cursor: pointer;
}
.p_img{
width:100px;
height:100px;
}
</style>
<script src="/jquery-3.6.0.min.js"></script>
<script>
//캔버스 이미지 위에 complete 문구 띄우기
window.onload = function(){
    var imageArr = []; 
    var contextArr = []; 
	
    for(let i=0; i<100; i++){
    var canvas = document.getElementById("myCanvas"+i);
    if(canvas != null){
    var context = canvas.getContext("2d");
    contextArr.push(context);
    
    var imageObj = new Image();
   
    imageObj.src = document.getElementById("hiddenphoto"+i).value;
    imageArr.push(imageObj);
	}
	}
    for(let i=0; i<100; i++){
    		 let contexts = contextArr[i];
    	 imageArr[i].onload = function(){
				console.dir(contexts);
    	        contexts.drawImage(imageArr[i], 0, 0, 250, 250);
    	        contexts.font = "bold 45px 'IBM Plex Sans KR'";
    	        contexts.fillStyle="#F6F5F0";
    	        contexts.fillText("COMPLETE", 10, 130);
    	        
    	        contexts.strokeStyle = '#1A271D';
    	        contexts.lineWidth = 3;
    	        contexts.strokeText("COMPLETE", 10, 130);
    	    }
	}
};


$(document).ready(function(){
	$(".back").one('click',function(){
		location.href = "participation";
	});
	
	const inputImage = document.getElementById("input-image")
	inputImage.addEventListener("change", e => {
    	readImage(e.target)
	})

	
});

function readImage(input){
	if(input.files && input.files[0]){
		// FileReader 인스턴스 생성
		const reader = new FileReader()
		
		// 이미지가 로드된 경우
		reader.onload = e =>{
			const previewImage = document.getElementById("previewimg")
			previewImage.src = e.target.result
		}
		
		// reader가 이미지 읽도록 하기
		reader.readAsDataURL(input.files[0])
	}
}


//미션 참가 모달창
function mymissiondetail(code){
	$.ajax({
		url : "/mymissiondetail",
		type : "get",
		data : {"p_code" : code},
		success : function(mymission){
			document.getElementById("modal").style.display = "flex";
			$("#modalh2").text("미션인증하기");
			$("#register_contents").html(mymission.id + "님, 사진을 찍고 미션을 완료해주세요.<br><br>");
			$('html').scrollTop(0);
			$("#register_contents").append("미션이름 : " + mymission.m_name + "<br>");
			$("#register_contents").append("미션방법 : " + mymission.m_inform + "<br>");
			$("#register_contents").append("<span style='color:orange'>인증 사진을 올려주세요!</span><br>");
			$("#register_contents").append("탄소배출량을 이만큼 감소할 수 있어요 : " + mymission.m_carbon + "g<br>");
			$("#register_contents").append("포인트를 이만큼 얻을 수 있어요 : " + mymission.m_point + "p<br>");
			$("#register_contents").append("나의 현재 포인트 : " + mymission.point + "p<br>");
			$("#register_contents").append("나의 현재 탄소배출량 : " + mymission.carbon + "g<br>");
			$("#register_contents").append("나의 별점 : " + mymission.p_star + "<br>");
			$("#register_contents").append("나의 리뷰: " + mymission.p_review + "<br>");
			$("#register_contents").append("미션 완료 ?: " + mymission.p_complete + "<br>");
			$("#register_contents").append("<img class=p_img id=previewimg src=img/"+ mymission.p_photo +" onerror='this.src=/img/nophoto.JPG'><br>");
			$("#p_code").val(mymission.p_code);
			$("#id").val(mymission.id);
			$("#point").val(mymission.point);
			$("#m_code").val(mymission.m_code);
		 	$("#m_point").val(mymission.m_point);
			$("#carbon").val(mymission.carbon);
			$("#m_carbon").val(mymission.m_carbon);
			$("#m_personnel").val(mymission.m_personnel);
			$("#p_friends").val(mymission.p_friends); 
			$("#p_complete").val(mymission.p_complete); 
			$("#p_photo").val(mymission.p_photo); 
		}
	});
}
function mymissiondetail2(code){
	$.ajax({
		url : "/mymissiondetail",
		type : "get",
		data : {"p_code" : code},
		success : function(myreview){
			document.getElementById("modal3").style.display = "flex";
			$("#modalh4").text("리뷰작성하기");
			$('html').scrollTop(0);
			$("#register_contents2").html("이번 " +myreview.m_name+" 미션은 어떠셨나요?<br>");
			$("#register_contents2").append(myreview.id+"님의 후기가 궁금해요!<br>");
			$("#p_code2").val(myreview.p_code); 
			$("#p_star").val(myreview.p_star); 
			$("#p_review").val(myreview.p_review);
			
		}
	});
}
$(document).ready(function(){
$("#modalclose").on("click",function(){
	document.getElementById("modal").style.display = "none";
});

//모달창 외부클릭시 모달창 닫기
modal.addEventListener("click", e => {
	const evTarget = e.target
	if(evTarget.classList.contains("modal-overlay")) {
    	modal.style.display = "none";
	}
});
$("#modalclose2").on("click",function(){
	document.getElementById("modal3").style.display = "none";
});

//모달창 외부클릭시 모달창 닫기
modal3.addEventListener("click", e => {
	const evTarget = e.target
	if(evTarget.classList.contains("modal-overlay2")) {
    	modal3.style.display = "none";
	}
});
}); // document ready end

</script>
</head>
<body>
<div id="modal" class="modal-overlay">
<div class="modal-window"> 
	<div class="close-area" id="modalclose">X</div>
<h2 id="modalh2"></h2>
<div id="registerbtn"></div>
<div id="register_contents">
</div>
<form name="form2" method="post" action="${pageContext.request.contextPath}/complete" enctype="multipart/form-data">
    <input type="hidden" name="p_code" id="p_code">
    <input type="hidden" name="m_code" id="m_code">
    <input type="hidden" name="id" id="id">
    <input type="hidden" name="point" id="point">
    <input type="hidden" name="m_point" id="m_point">
    <input type="hidden" name="carbon" id="carbon">
    <input type="hidden" name="m_carbon" id="m_carbon">
    <input type="hidden" name="m_personnel" id="m_personnel">
    <input type="hidden" name="p_friends" id="p_friends">
    <input type="hidden" name="p_complete" id="p_complete">
		<input name="p_photo" type="hidden" id="p_photo">
		<input name="image" id="input-image" type="file" accept="image/*">
		
		<input class="back" type="button" value="취소">
	<input type='submit' id='complete' value="인증완료!">
		</form>
</div>
</div>

<div id="modal3" class="modal-overlay2">
<div class="modal-window2"> 
	<div class="close-area2" id="modalclose2">X</div>
<h2 id="modalh4"></h2>
<div id="registerbtn"></div>
<div id="register_contents2">
		</div>
		<form name=form3 method=post action='${pageContext.request.contextPath}/review'>
		 <input type=hidden name=p_code id=p_code2>
			<input name=p_star type=number id=p_star><br>
		 <input name=p_review type=text placeholder="자유롭게 후기를 적어주세요!" id=p_review>
			<input class=back type=button value=취소>
		<input type=submit id=review value=리뷰완료!>
		</form>
	
</div>
</div>
<div style="text-align: center; margin-bottom:50px;">
<h2>나의 미션</h2>
<h3>${map.count}개의 미션 진행중</h3><br><br>

<!-- 내가 신청한 미션 목록 -->
	<c:forEach var="row" items="${map.list}" >
		<div class="my_mission" style="display: grid; grid-template-columns:30% auto; margin-left:auto; margin-right:auto; margin-bottom:10px; width:60%; border: 3px solid #1A271D;">
     	      <div style="display:inline-block">
		      <c:if test="${row.p_photo == null }">
		      <img class="my_img" src="<%=request.getContextPath()%>/img/nophoto.jpg"><br>
		      <a href="delete?p_code=${row.p_code}&m_code=${row.m_code}">미션 취소</a><br>
		      <input type="button" value="인증하기" id="mymission_detail" onclick="mymissiondetail(${row.p_code})">
		      </c:if>
		      <c:if test="${row.p_photo != null }">
		      <input id="hiddenphoto${row.p_code }" type="hidden" value="img/${row.p_photo}">
		      <canvas width="250px" height="250px" id="myCanvas${row.p_code }"></canvas>
              <span style="font-size: large; font-weight: 700; color:green;">${row.m_point}p</span> 포인트를 획득했습니다.<br>
		      <span style="font-size: large; font-weight: 700; color:green;">${row.m_carbon }g</span>의 탄소배출량을 줄였습니다.<br>
		      <c:if test="${row.p_review == null }">		    
		      <input type="button" value="리뷰작성" id="mymission_review" onclick="mymissiondetail2(${row.p_code})">
		      </c:if>
		      <c:if test="${row.p_review != null }">		    
		      <span style="font-size: large; font-weight: 700; color:orange;">내 별점은 ${row.p_star}점!</span><br>
		     나의 리뷰는 : ${row.p_review}<br>
		     </c:if>
		      </c:if>
		      </div>
		      <div style="display:inline-block">
        	  <h3>${row.m_name}</h3>
          	  미션 참가 코드 : ${row.p_code}<br>
          	  미션 완료? : ${row.p_complete}<br>
          	  미션 날짜 : ${row.m_date}<br>
          	  
              </div>		    
	    </div>	
	</c:forEach>
	</div>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>