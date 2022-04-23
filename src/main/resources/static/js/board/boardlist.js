/*한페이지당 게시물 */
	function page(idx){
		var pagenum = idx;
		var contentnum = $("#contentnum option:selected").val();
		
		if(contentnum == 5){
			location.href="/boardlist?pagenum="+pagenum+"&contentnum="+5
		}else if(contentnum == 10){
			location.href="/boardlist?pagenum="+pagenum+"&contentnum="+10
		}else if(contentnum == 15){
			location.href="/boardlist?pagenum="+pagenum+"&contentnum="+15
		}
	}