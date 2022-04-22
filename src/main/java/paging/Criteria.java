package paging;



public class Criteria {
	
	int totalcount; //페이징에 적용할 전체 데이터
	int pagenum; //현재 페이지 번호
	int contentnum; //한페이지에 몇개 표시
	int startPage = 1; //현재 페이지 블록의 시작페이지
	int endPage = 1; //현재 페이지 블록의 마지막페이지
	boolean prev; //이전버튼
	boolean next; //다음버튼
	int currentblock; //현제페이지 블럭
	int lastblock; //마지막페이지 블럭
	
	public void prevnext(int pageum) {
		//이전, 다음 페이지
		
		if(calcpage(totalcount, contentnum) < 6) {
			setPrev(false);
			setNext(false);
		}
		else if(pagenum > 0 && pagenum < 6) {
			setPrev(false);
			setNext(true);
		}
		else if(getLastblock() == getCurrentblock()) {
			setPrev(true);
			setNext(false);
		}
		else {
			setPrev(true);
			setNext(true);
		}
		
	}
	
	public int calcpage(int totalcount, int contentnum) {
		//전체 페이지 수 계산
		
		int totalpage = totalcount/contentnum;
		if(totalcount%contentnum > 0) {
			totalpage++;
		}
		return totalpage;
	}

	public int getTotalcount() {
		return totalcount;
	}

	public void setTotalcount(int totalcount) {
		this.totalcount = totalcount;
	}

	public int getPagenum() {
		return pagenum;
	}

	public void setPagenum(int pagenum) {
		this.pagenum = pagenum;
	}

	public int getContentnum() {
		return contentnum;
	}

	public void setContentnum(int contentnum) {
		this.contentnum = contentnum;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int currentblock) {
		this.startPage = (currentblock * 5) -4;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int getlastblock, int getcurrentblock) {
		if(getlastblock == getcurrentblock) {
			this.endPage = calcpage(getTotalcount(), getContentnum());
		}
		else {
			this.endPage = getStartPage() + 4;
		}
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getCurrentblock() {
		return currentblock;
	}

	public void setCurrentblock(int pagenum) {
		this.currentblock = pagenum/5;
		if(pagenum % 5 > 0) {
			this.currentblock++;
		}
	}

	public int getLastblock() {
		return lastblock;
	}

	public void setLastblock(int lastblock) {
		this.lastblock = totalcount / (5*this.contentnum);
		if(totalcount % (5*this.contentnum)>0) {
			this.lastblock++;
		}
	}
	
	
}
