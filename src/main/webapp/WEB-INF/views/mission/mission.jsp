<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/jquery-3.6.0.min.js"></script>
<style>

li{
list-style: none;
}
 #ing, #end{
 display:inline-block;
 width:100px;
	padding-left : 18px;
	padding-right : 18px;
	padding-top : 8px;
	padding-bottom : 8px;
	border:2px solid #1A271D;
	font-size: 16px;
	margin-left: 20px;
	margin-right:20px;
	color: #1A271D;
}
#group, #solo{
	padding-left : 18px;
	padding-right : 18px;
	padding-top : 8px;
	padding-bottom : 8px;
	border:2px solid #1A271D;
	font-size: 16px;
	color: #1A271D;
}
#solo{
	background-color : #F6F5F0;
}

#group{
	background-color : #1A271D;
	font-weight : bold;
	color:#F6F5F0;
}
#end{
	background-color : #F6F5F0;
}

#ing{
	background-color : #1A271D;
	font-weight : bold;
	color:#F6F5F0;
}
#group:hover, #solo:hover,  #ing:hover,  #end:hover{
	cursor : pointer;
}

</style>
<script>


function register(number){
	if(number =='1'){
		document.getElementById("ing_div").style.display = "";
		document.getElementById("end_div").style.display = "none";
		document.getElementById("ing").style.backgroundColor = "#1A271D";
		document.getElementById("end").style.backgroundColor = "#F6F5F0";
		document.getElementById("ing").style.fontWeight = "bold";
		document.getElementById("ing").style.color = "#F6F5F0";
		document.getElementById("end").style.color = "#1A271D";
		document.getElementById("end").style.fontWeight = "normal";
		document.getElementById("solo").style.display = "";
		document.getElementById("group").style.display = "";
	}else{
		document.getElementById("end_div").style.display = "";
		document.getElementById("ing_div").style.display = "none";
		document.getElementById("end").style.backgroundColor = "#1A271D";
		document.getElementById("ing").style.backgroundColor = "#F6F5F0";
		document.getElementById("end").style.fontWeight = "bold";
		document.getElementById("end").style.color = "#F6F5F0";
		document.getElementById("ing").style.color = "#1A271D";
		document.getElementById("ing").style.fontWeight = "normal";
		document.getElementById("solo").style.display = "none";
		document.getElementById("group").style.display = "none";
	}
}

function group(number){
	if(number =='1'){
		document.getElementById("group_div").style.display = "";
		document.getElementById("solo_div").style.display = "none";
		document.getElementById("e_group_div").style.display = "";
		document.getElementById("group").style.backgroundColor = "#1A271D";
		document.getElementById("solo").style.backgroundColor = "#F6F5F0";
		document.getElementById("group").style.fontWeight = "bold";
		document.getElementById("group").style.color = "#F6F5F0";
		document.getElementById("solo").style.color = "#1A271D";
		document.getElementById("solo").style.fontWeight = "normal";
	}else{
		document.getElementById("solo_div").style.display = "";
		document.getElementById("group_div").style.display = "none";
		document.getElementById("e_group_div").style.display = "";
		document.getElementById("solo").style.backgroundColor = "#1A271D";
		document.getElementById("group").style.backgroundColor = "#F6F5F0";
		document.getElementById("solo").style.fontWeight = "bold";
		document.getElementById("solo").style.color = "#F6F5F0";
		document.getElementById("group").style.color = "#1A271D";
		document.getElementById("group").style.fontWeight = "normal";
	}
}
</script>

</head>
<body>
<jsp:useBean id="toDate" class="java.util.Date" />
<fmt:parseDate var="regDate" value="${row.m_date }" pattern="yyyy-MM-dd" />
<fmt:formatDate value="${regDate}" pattern="yyyy-MM-dd" />
<fmt:parseNumber value="${toDate.time / (1000*60*60*24)}" integerOnly="true" var="toDate2" scope="request"></fmt:parseNumber>
<fmt:parseNumber value="${regDate.time / (1000*60*60*24)}" integerOnly="true" var="regDate2" scope="request"></fmt:parseNumber>

<c:if test="${group.m_type == 'group'}">
단체 미션은 활동일 하루 전까지 신청가능합니다!<br>
<c:if test="${regDate2 > toDate2}">
미션일까지 ${regDate2 - toDate2}일 남았습니다.<br>
    신청은 ${regDate2 - toDate2 -1}일 뒤 종료됩니다.
  </c:if>
<c:if test="${regDate2 == toDate2}">오늘 활동 예정인 미션입니다(어제 마감)</c:if>
<c:if test="${regDate2 < toDate2}">이미 종료된 미션입니다.</c:if>
</c:if>


<div style="text-align: center; margin-top: 50px;">
<input type=button id=ing name="_ing" checked="checked" autofocus value="모집중" onclick="register(1)">
<input type=button id=end  name="_ing" value="종료" onclick="register(2)">
 </div>
 <div style="text-align: left; margin-top: 30px; margin-left: 10%;">
<input type=button id=group name="mission" checked="checked" autofocus value="단체미션" onclick="group(1)">
<input type=button id=solo  name="mission" value="상시미션" onclick="group(2)">
 </div>
 <div style="margin-top:20px; margin-bottom:50px; text-align: center;">
            <div id=ing_div> 
            <div id=group_div>
            <h3>모집 단체</h3>
               <c:forEach items="${gilist }" var="row">
               	 <div style="display:grid; grid-template-columns:20% auto; margin-left:auto; margin-right:auto; margin-bottom:10px; width:80%; border: 3px solid #1A271D">

                        <div style="display:inline-block">
                        <a href = "mission_group/${row.m_code}"><img width=250px height=250px src="<%=request.getContextPath()%>/img/${row.m_photo}"></a>
                        </div>
                        <div  style="display:inline-block">
                  <br>
                    <ul class="list">
                      	<fmt:parseDate var="regDate" value="${row.m_date }" pattern="yyyy-MM-dd" />
<fmt:formatDate value="${regDate}" pattern="yyyy-MM-dd" /> / 
<fmt:parseNumber value="${regDate.time / (1000*60*60*24)}" integerOnly="true" var="regDate2" scope="request"></fmt:parseNumber>
                    <c:if test="${(regDate2 - toDate2) > 1}">
                  <strong style="color:orange">미션일까지 ${regDate2 - toDate2}일 남았습니다</strong>
                  </c:if>
                  <c:if test="${(regDate2 - toDate2) == 1}">                   
                  <strong style="color:orange">내일 미션이 진행됩니다! 오늘 안으로 신청해주세요</strong>
                  </c:if>
                        <li><h3>${row.m_name }</h3></li>
                        <li>장소 : ${row.m_location }</li>
                        <li>포인트 : ${row.m_point }p</li>
                        <li>탄소배출감소량 : ${row.m_carbon }g</li>
                          <c:if test="${row.m_personnel > 5}">
                        <li>모집인원이 ${row.m_personnel }명 남았습니다</li>
                          </c:if>
                        <c:if test="${row.m_personnel < 6 && row.m_personnel > 0}">
                        <li>모집인원이 ${row.m_personnel }명 남았습니다 <strong style="color:red">서둘러 신청해주세요!</strong></li>
                        </c:if>
                        <c:if test="${row.m_personnel == 0}">
                        <li><strong style="color:green">정원이 다 찼습니다. 다른 참여자가 취소시 신청할 수 있습니다.</strong></li>
                        </c:if>
                    </ul>
                    </div>
               	 </div>
               </c:forEach>
               </div>
                   <div id=solo_div style="display: none">
                 <h3>모집 상시</h3>
               <c:forEach items="${silist }" var="row">
               	 <div style="display:grid; grid-template-columns:20% auto; margin-left:auto; margin-right:auto; margin-bottom:10px; width:80%; border: 3px solid #1A271D">

                        <div style="display:inline-block">
                        <a href = "mission_group/${row.m_code}"><img width=250px height=250px src="<%=request.getContextPath()%>/img/${row.m_photo}"></a>
                        </div>
                        <div  style="display:inline-block">
                    	<br><br>
                    <ul class="list">
                  
                        <li style="color:green"><strong>지금 당장 미션을 수행해보세요!</strong></li>
                        <li><h3>${row.m_name }</h3></li>
                        <li>포인트 : ${row.m_point }p</li>
                        <li>탄소배출감소량 : ${row.m_carbon }g</li>
                    </ul>
                    </div>
               	 </div>
               </c:forEach>
               </div>
            </div>
            
        <!-- 마감 미션 -->
        <div id="end_div" style="display: none">
          <div id="e_group_div" style="margin-top:109px;">
        	 <c:forEach items="${gelist }" var="row">
               	 <div style="display:grid; grid-template-columns:20% auto; margin-left:auto; margin-right:auto; margin-bottom:10px; width:80%; border: 3px solid #1A271D">

                        <div style="display:inline-block">
                        <a href = "mission_group/${row.m_code}"><img width=250px height=250px src="<%=request.getContextPath()%>/img/${row.m_photo}"></a>
                        </div>
                        <div  style="display:inline-block">
                    	<br><br>
                    <ul class="list">
                  
                         <li style="color:blue"><strong>종료된 미션입니다</strong></li>
                        <li><h3>${row.m_name }</h3></li>
                        <li>장소 : ${row.m_location }</li>
                      	<li>날짜 : ${row.m_date }  </li>
                    </ul>
                    </div>
               	 </div>
               </c:forEach>   
                <c:forEach items="${selist }" var="row">
               	 <div style="display:grid; grid-template-columns:20% auto; margin-left:auto; margin-right:auto; margin-bottom:10px; width:80%; border: 3px solid #1A271D">

                        <div style="display:inline-block">
                        <a href = "mission_group/${row.m_code}"><img width=250px height=250px src="<%=request.getContextPath()%>/img/${row.m_photo}"></a>
                        </div>
                        <div  style="display:inline-block">
                    	<br><br>
                    <ul class="list">
                  
                        <li><h3>${row.m_name }</h3></li>
                        <li>장소 : ${row.m_location }</li>
                      	<li>날짜 : ${row.m_date }  </li>
                        <li>포인트 : ${row.m_point }</li>
                        <li>탄소배출감소량 : ${row.m_carbon }</li>
                    </ul>
                    </div>
               	 </div>
               </c:forEach>   
               </div>       
            
        </div> 
    </div>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%> 