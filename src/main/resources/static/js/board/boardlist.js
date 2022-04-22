/*한페이지당 게시물 */
	function page(idx){
		var pagenum = idx;
		var contentnum = $("#contentnum option:selected").val();
		
		if(contentnum == 5){
			location.href="${pageContext.request.contextPath}/boardlist?pagenum="+pagenum+"&contentnum="+contentnum
		}else if(contentnum == 10){
			location.href="${pageContext.request.contextPath}/boardlist?pagenum="+pagenum+"&contentnum="+contentnum
		}else if(contentnum == 15){
			location.href="${pageContext.request.contextPath}/boardlist?pagenum="+pagenum+"&contentnum="+contentnum
		}
	}