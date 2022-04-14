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
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&family=Righteous&family=Josefin+Sans:ital,wght@0,300;0,400;1,300;1,400;1,500;1,600;1,700&family=Noto+Sans+KR:wght@100;300&display=swap');

body{
font-family: 'Noto Sans KR';
}
li{
list-style: none;
}
</style>
</head>
<body>

<h2>환경지킴이 모집중(예시)</h2><br>
  <div id="product list">
            <div class="line">
                    <c:forEach items="${list }" var="row">
                <div style="display:inline-block; width:500px; border: 5px solid pink" class="box" id="p1">

                    <ul class="list">
                        <br height=1>
                         <li>
                       <a href = "mission_group/${row.m_code}"><img width=200px height=200px src="<%=request.getContextPath()%>/img/${row.m_photo}"></a>
                        </li>
                        <li>
                        <h3>${row.m_name }</h3>
                        </li>
                        <li>
                        장소 : ${row.m_location }
                        </li>
                    
                        <li>
                        날짜 : ${row.m_date }
                        </li>
                        <li>
                        포인트 : ${row.m_point }
                        </li>
                        <li>
                        탄소배출감소량 : ${row.m_carbon }
                        </li>
                       
                        
                    </ul>

                </div>
                    </c:forEach>
            
        </div>
    </div>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>