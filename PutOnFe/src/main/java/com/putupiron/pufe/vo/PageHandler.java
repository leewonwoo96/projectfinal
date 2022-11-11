package com.putupiron.pufe.vo;

import lombok.Data;

@Data
public class PageHandler {
	private int totalCnt;
	private int pageSize;
	private int naviSize=10;
	private int totalPage;
	private int page;
	private int beginPage;
	private int endPage;
	private boolean showPrev;
	private boolean showNext;
	private SearchCondition sc;
	
	public PageHandler(int totalCnt, SearchCondition sc) {
		this.totalCnt=totalCnt;
		this.sc=sc;
		doPaging(totalCnt,sc);
	}
	public PageHandler(int totalCnt, int page, int pageSize) {
		this.totalCnt = totalCnt;
		this.page = page;
		this.pageSize = pageSize;
		
		totalPage = (int)Math.ceil(totalCnt/(double)pageSize);
		beginPage = (page-1)/naviSize*naviSize+1;
		endPage = Math.min(beginPage+naviSize-1, totalPage);
		showPrev = beginPage!=1;
		showNext = endPage!=totalPage;
	}
	public PageHandler(int totalCnt, int page) {
		this(totalCnt, page, 10);
	}
	
	void print() {
		System.out.println("page= "+sc.getPage());
		System.out.print(showPrev?"< ":"");
		for(int i=beginPage;i<=endPage;i++) System.out.print(i+" ");
		System.out.println(showNext?">":"");
	}
	public void doPaging(int totalCnt, SearchCondition sc) {
		totalPage= (int)Math.ceil(totalCnt/(double)sc.getPageSize());
		beginPage= (sc.getPage()-1)/naviSize*naviSize+1;
		endPage= Math.min(beginPage+naviSize-1, totalPage);
		showPrev= beginPage!=1;
		showNext= endPage!=totalPage;
	}
}
