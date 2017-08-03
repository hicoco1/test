package com.mrs.util;

import java.util.HashMap;
import java.util.Map;
public class Page {

	public static final Integer N10  = new Integer(10);
	public static final Integer N20 = new Integer(20);
	public static final Integer N30 = new Integer(30);
	public static final Integer N40 = new Integer(40);
	public static final Integer N50 = new Integer(50);
	
	public static final Integer CHILD_EVENT = new Integer(5);
	public static final Integer CHILD_AFTER_EVENT = new Integer(5);
  
	public static final String CURRENT = "current";
  
	public static final String MIN = "min";
  
	public static final String MAX = "max";
  
	public static final String LAST = "last";
  
	public static final String COUNT = "count";
  
	public static final String ROWSPERPAGE = "rowsPerPage";
	
	public static Map getPageMap(int pageNo, int count) {

		Map pageMap = new HashMap();

		int min = 0;
		int max = 0;
		int last = 0;

		if (count != 0 && (count % 10) == 0) {
			last = count / 10;
		}
		else if (count == 0) {
			last = 1;
		}
		else {
			last = count / 10 + 1;
		}

		if ((pageNo % 10) == 0) {
			min = pageNo - 9;
			max = pageNo;
		}
		else {
			min = ((pageNo / 10) * 10) + 1;
			max = ((pageNo / 10) + 1) * 10;
			
			if (max > last) {
				max = last;
			}
		}
    
		pageMap.put(CURRENT, new Integer(pageNo));
		pageMap.put(MIN, new Integer(min));
		pageMap.put(MAX, new Integer(max));
		pageMap.put(LAST, new Integer(last));
		pageMap.put(COUNT, new Integer(count));
		pageMap.put(ROWSPERPAGE, N10);

		return pageMap;
	}

	// 페이지 넘버
	// 토탈 카운트
	// 한 페이지에 보여줄 리스트 카운트
	// 페이지 카운트
	public static Map getPageMap(int pageNo, int count, int pageSize, int showPagePerDocument) {

		Map pageMap = new HashMap();

		int min = 0;
		int max = 0;
		int last = 0;
		
		if (showPagePerDocument == 0) {
			showPagePerDocument = 10;
		}

		if ((count % pageSize) == 0) {
			last = count / pageSize;
		}
		else if (count == 0) {
			last = 1;
		}
		else {
			last = count / pageSize + 1;
		}
		
		if ((pageNo % showPagePerDocument) == 0) {
			min = pageNo - showPagePerDocument + 1;
			max = pageNo;
		}
		else {
			min = ((pageNo / showPagePerDocument) * showPagePerDocument) + 1;
			max = ((pageNo / showPagePerDocument) + 1) * showPagePerDocument;
			
			if (max > last) {
				max = last;
			}
		}
		
		pageMap.put(CURRENT, new Integer(pageNo));
		pageMap.put(MIN, new Integer(min));
		pageMap.put(MAX, new Integer(max));
		pageMap.put(LAST, new Integer(last));
		pageMap.put(COUNT, new Integer(count));
		pageMap.put(ROWSPERPAGE, new Integer(pageSize));

		return pageMap;
	}
}
