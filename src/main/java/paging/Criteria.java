package paging;



public class Criteria {
	int pageSize; //한페이지에 보인 게시물 사이즈
	int totalPage; //총 페이지 갯수
	int pageNum; //현재시작 페이지
	int pageNavSize; //페이지 보여줄 단위
	long totalRecord; //총게시물 갯수
	long startRowIndex; //게시물 시작번호(거꾸로시작)
	int firstPageNo; //페이지 시작번호
	int lastPageNo; //페이지 마지막번호
	
	boolean hasPreviousPageNav; //이전페이지
	boolean hasNextPageNav; //다음페이지
	boolean hasFirstPageNav; //첫번째 페이지
	boolean hasLastPageNav; //마지막 페이지
	
	public Criteria(int pageNum, long totalRecord, int pageSize, int pageNavSize) {
		this.pageNum = pageNum;
		this.totalRecord = totalRecord;
		this.pageSize = pageSize;
		this.pageNavSize = pageNavSize;
		
		if(this.pageNum < 1) {
			this.pageNum = 1;
		} 
		if(this.pageNavSize < 1) {
			this.pageSize = 10;
		}
		this.totalRecord = totalRecord;
		calculation();
	}
	private void calculation() {
		//페이지수
		this.totalPage = (int)(((this.totalRecord -1)/this.pageSize)+1);
		if(this.pageNum > this.totalPage) {
			this.pageNum = this.totalPage;
		}
		
		//현재페이지 번호로 페이지 링크 블럭의 시작페이지 번호, 마지막페이지 번호 취득
		this.firstPageNo = ((int)Math.ceil((float)this.pageNum/(float)this.pageNavSize)-1)*this.pageNavSize+1;
		this.lastPageNo = this.firstPageNo + this.pageNavSize-1;
		if(this.lastPageNo > this.totalPage) {
			this.lastPageNo = this.totalPage;
		}
		
		this.startRowIndex = this.totalRecord - ((this.pageNum-1)*this.pageSize);
		
		hasPreviousPageNav = this.firstPageNo == 1 ? false : true;
		hasNextPageNav = (this.lastPageNo*this.pageSize) < this.totalRecord;
		
		hasFirstPageNav = (this.pageNum > 1 && this.pageNavSize < this.pageNum);
		hasLastPageNav = (this.pageNum < this.totalPage && this.lastPageNo+1 <this.totalPage);
	}
}
