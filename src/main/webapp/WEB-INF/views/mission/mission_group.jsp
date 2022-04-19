<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
li{
list-style: none;
}
.modal-overlay{
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

.modal-window{
	background-color :  #F6F5F0;
	color:#1A271D
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
.close-area{
	display: inline;
    float: right;
    padding-right: 10px;
    cursor: pointer;
}
</style>
<script src="/jquery-3.6.0.min.js"></script>
<script>
//미션 참가 모달창
function groupdetail(code){
	$.ajax({
		url : "/groupdetail",
		type : "get",
		data : {"m_code" : code},
		success : function(group){
			document.getElementById("modal").style.display = "flex";
			$("#modalh2").text(group.m_name);
			$("#register_contents").html("날짜 : " + group.m_date + "<br>");
			$("#register_contents").append("모집중인 인원 : " + group.m_personnel + "명<br>");
		}
	});
}
//모달창 닫기버튼
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
 <form name="form1" method="post" action="${pageContext.request.contextPath}/register">
    <input type="hidden" name="m_code" value="${group.m_code }">
        <div>   
           신청 인원(최대 5명) : 
               <select name="p_friends">
					<c:forEach begin="1" end="5" var="i">
						<option value="${i}">${i}</option>
					</c:forEach> 
			   </select>명
	<input type='submit' id='participation' value='참가하기'>
		</div>
		</form>
</div>
</div>
<ul>
  <li>
                       <img width=200px height=200px src="<%=request.getContextPath()%>/img/${group.m_photo}">
                        </li>
                        <li>
                        미션 이름 : ${group.m_name }
                        </li>
                        <li>
                        장소 : ${group.m_location }
                        </li>
                        <li>
                        정보 : ${group.m_inform }
                        </li>
                        <li>
                        타입 : ${group.m_type }
                        </li>
                        <li>
                        날짜 : ${group.m_date }
                        </li>
                        <li>
                        포인트 : ${group.m_point }
                        </li>
                        <li>
                        탄소배출감소량 : ${group.m_carbon }
                        </li>
                        <li>
                        최대 인원 : ${group.m_personnel }
                        </li>
                        <li>
                        <input type="button" value="신청하기" id="groupdetail" onclick="groupdetail(${group.m_code})">
                        </li>
                        
                    </ul>
  
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>