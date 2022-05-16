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
$(document).ready(function() {
		var json = JSON.parse('${ocrresult}');
		var title = json.images[0].receipt.result.storeInfo.name.text;
		var product = json.images[0].receipt.result.subResults[0].items[0].name.text;
		var price = json.images[0].receipt.result.subResults[0].items[0].price.price.text;
		var total = json.images[0].receipt.result.totalPrice.price.text;
		$("#title").html("<h1>"+title+"</h1>");
		$("#title").append("<h2>"+product+"를 "+ price+"원 만큼 구매하셨습니다.</h2>");
		$("#title").append("<h2>총 "+total+"원의 상품을 구매하셨습니다.</h2>");
		});
</script>
</head>

<body>

<!-- Talk Talk Banner Script start -->
	<script type="text/javascript" src="https://partner.talk.naver.com/banners/script"></script>
	<div class="talk_banner_div" data-id="114553" style="position: fixed; right: 100px; bottom: 30px; z-index: 99;"></div>
<!-- Talk Talk Banner Script end -->
<div id=title>

</div>

</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
