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
body{
font-family: 'Noto Sans KR';
}
</style>
</head>
<body>
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
                        
                    </ul>

</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>