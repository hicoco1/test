package com.mrs;
 
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mrs.Dao.HeadOfficeDao;
import com.mrs.Dao.StatisticsDao;
import com.mrs.Vo.HeadOfficeVO;
import com.mrs.Vo.StatisticsVO;
import com.mrs.Vo.Statistics_RiderVO;
import com.mrs.Vo.Statistics_StoreVO;
import com.mrs.util.Page;
import com.sun.javafx.collections.MappingChange.Map;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

@Controller
public class StatisticsController  {
 
	private static final Logger logger = LoggerFactory.getLogger(StatisticsController.class);
	
	@Resource(name="StatisticsDao")                 
    private StatisticsDao statisticsDao;

	/*지사별 배달 통계*/
	@RequestMapping(value = "/Statistics_main" , method = {RequestMethod.GET, RequestMethod.POST })
	public ModelAndView Statistics(Principal principal, String searchFlag, String searchFlag_date, String hour, String searchContent, String pageNo,String pageSize, String start_date, String end_date, String start_time, String end_time, String action) {
		logger.info("<<<<<<<<<<<<<< START Statistics_main >>>>>>>>>>>>>>" );
		ModelAndView model = new ModelAndView();
		StatisticsVO statistics = new StatisticsVO();
		String start_hour ="", end_hour = "";
		
		if(pageNo == null){
			pageNo="1";
		}
		if(pageNo == ""){
			pageNo="1";
		}
		if(pageNo .equals("")){
			pageNo="1";
		}
		if(pageSize == null){
			pageSize="10";  
		}
		if(pageSize == ""){
			pageSize="10";
		}
		if(pageSize .equals("")){
			pageSize="10";
		}
		
		if(action != null){
			if(action.equals(""))pageNo="1";
		}
	
		int a = 1;
		int b = 10;

		if(pageNo != null){
			statistics.setPageNo(Integer.parseInt(pageNo));
		}else {
			statistics.setPageNo(a);
		}
		if(pageSize != null){
			statistics.setPageSize(Integer.parseInt(pageSize));
		}else {
			statistics.setPageSize(b);
		}
		if(Integer.parseInt(pageNo) <= 0) statistics.setPageNo(1);
        if(Integer.parseInt(pageSize)<= 0)statistics.setPageSize(10);
        int pageno = statistics.getPageNo();
		
	        if(searchFlag != null){
	            if(searchFlag.equals("1")) {  
	            	statistics.setB_id(searchContent);
	            }
	            if(searchFlag.equals("2")) {  
	            	statistics.setB_name(searchContent);
	            }
	        } 
	        
	        if(searchFlag_date == null) {
	        	statistics.setSearchFlag_date("1");
	        }
	        
	        if(searchFlag_date != null){
	        	if(searchFlag_date.equals("1")) {  
	        		String[] hour_ = hour.split(",");
	        		 start_hour = start_date+start_time;
	        		 end_hour = end_date+end_time;
	        		 
	            	statistics.setHour(hour);
	            	statistics.setStart_time(start_hour);
	            	statistics.setEnd_time(end_hour);
	            	statistics.setSearchFlag_date("1");
	        	}else if(searchFlag_date.equals("2")) { 
	        		start_hour = start_date+start_time;
	        		end_hour = end_date+end_time;
	            	statistics.setStart_time(start_hour);
	            	statistics.setEnd_time(end_hour);
	            	statistics.setOrder_date(hour);
	            	statistics.setSearchFlag_date("2");
	        	}
	        	/*
	        	else if(searchFlag_date.equals("3")) {  
	            	statistics.setHour(hour);
	        	}else if(searchFlag_date.equals("4")) {  
	            	statistics.setHour(hour);
	        	}
	        	*/
	        }     
	        
	        List<StatisticsVO> list = null;
	        List<StatisticsVO> list_all = null;
	        int totalCount = 0;
	        totalCount = statisticsDao.getStatisticsListCount(statistics);
	        list = statisticsDao.getStatisticsList(statistics); 
	        list_all = statisticsDao.getStatisticsList_all(statistics); 
	        String name = principal.getName();
	        
			model.addObject("username", name);
	        model.addObject("totalCount", totalCount);
	        model.addObject("list", list);
	        model.addObject("list_all", list_all);
	        model.addObject("searchContent", searchContent);
	        model.addObject("searchFlag", searchFlag);
	        model.addObject("searchFlag_date", searchFlag_date);
	        model.addObject("hour", hour);
	        model.addObject("start_hour", start_hour);
	        model.addObject("end_hour", end_hour);
	        model.addObject("start_date", start_date);
	        model.addObject("end_date", end_date);
	        model.addObject("start_time", start_time);
	        model.addObject("end_time", end_time);
	        model.addObject("pageno", pageno);
	        model.addObject("pageInfo", Page.getPageMap(statistics.getPageNo(), totalCount , statistics.getPageSize(), 10));
			model.setViewName(".Statistics_main"); 
			logger.info("<<<<<<<<<<<<<< END Statistics_main >>>>>>>>>>>>>>" );
			return model;
	}
	
	/*지사별 배달기사 등록 통계*/
	@RequestMapping(value = "/Statistics_rider" , method = {RequestMethod.GET, RequestMethod.POST })
	public ModelAndView Statistics_Rider(Principal principal, String searchFlag, String order_date, String searchContent, String pageNo,String pageSize, String start_date, String end_date,String action) {
		logger.info("<<<<<<<<<<<<<< START Statistics_rider >>>>>>>>>>>>>>" );
		ModelAndView model = new ModelAndView();
		Statistics_RiderVO statistics_rider = new Statistics_RiderVO();
		
		if(pageNo == null){
			pageNo="1";
		}
		if(pageNo == ""){
			pageNo="1";
		}
		if(pageNo .equals("")){
			pageNo="1";
		}
		if(pageSize == null){
			pageSize="10";  
		}
		if(pageSize == ""){
			pageSize="10";
		}
		if(pageSize .equals("")){
			pageSize="10";
		}
		
		if(action != null){
			if(action.equals(""))pageNo="1";
		}
		
		int a = 1;
		int b = 10;

		if(pageNo != null){
			statistics_rider.setPageNo(Integer.parseInt(pageNo));
		}else {
			statistics_rider.setPageNo(a);
		}
		if(pageSize != null){
			statistics_rider.setPageSize(Integer.parseInt(pageSize));
		}else {
			statistics_rider.setPageSize(b);
		}	
		if(Integer.parseInt(pageNo) <= 0) statistics_rider.setPageNo(1);
        if(Integer.parseInt(pageSize)<= 0)statistics_rider.setPageSize(10);
        int pageno = statistics_rider.getPageNo();
		
	        if(searchFlag != null){
	            if(searchFlag.equals("1")) {  
	            	statistics_rider.setB_id(searchContent);
	            }
	            if(searchFlag.equals("2")) {  
	            	statistics_rider.setB_name(searchContent); 
	            }
	            if(searchFlag.equals("3")) {  
	            	statistics_rider.setR_name(searchContent); 
	            }
	        }        
	        statistics_rider.setOrder_date(order_date);
	        statistics_rider.setStart_date(start_date);
	        statistics_rider.setEnd_date(end_date); 
	        List<Statistics_RiderVO> list = null;
	        List<Statistics_RiderVO> list_all = null;
	        int totalCount = 0;
	        totalCount = statisticsDao.getStatistics_RiderListCount(statistics_rider);
	        list = statisticsDao.getStatistics_RiderList(statistics_rider); 
	        list_all = statisticsDao.getStatistics_RiderList_all(statistics_rider); 
	        String name = principal.getName();
			model.addObject("username", name);
			
	        model.addObject("totalCount", totalCount);
	        model.addObject("list", list);
	        model.addObject("list_all", list_all);
	        model.addObject("searchContent", searchContent);
	        model.addObject("searchFlag", searchFlag);
	        model.addObject("order_date", order_date);
	        model.addObject("start_date", start_date);
	        model.addObject("end_date", end_date);
	        model.addObject("pageno", pageno);
	        model.addObject("pageInfo", Page.getPageMap(statistics_rider.getPageNo(), totalCount , statistics_rider.getPageSize(), 10));
			model.setViewName(".Statistics_main2"); 
			logger.info("<<<<<<<<<<<<<< END Statistics_rider >>>>>>>>>>>>>>" );
			return model;
	}
	

	/*상점별 배달 통계*/
	
	@RequestMapping(value = "/Statistics_store" , method = {RequestMethod.GET, RequestMethod.POST })
	public ModelAndView Statistics_store(Principal principal, String searchFlag, String searchFlag_date, String hour, String searchContent, String pageNo,String pageSize, String start_date, String end_date, String start_time, String end_time, String action) {
		logger.info("<<<<<<<<<<<<<< START Statistics_store >>>>>>>>>>>>>>" );
		ModelAndView model = new ModelAndView();
		Statistics_StoreVO statistics_store = new Statistics_StoreVO();
		String start_hour ="", end_hour = "";
		
		if(pageNo == null){
			pageNo="1";
		}
		if(pageNo == ""){
			pageNo="1";
		}
		if(pageNo .equals("")){
			pageNo="1";
		}
		if(pageSize == null){
			pageSize="10";  
		}
		if(pageSize == ""){
			pageSize="10";
		}
		if(pageSize .equals("")){
			pageSize="10";
		}
		
		if(action != null){
			if(action.equals(""))pageNo="1";
		}
	
		int a = 1;
		int b = 10;

		if(pageNo != null){
			statistics_store.setPageNo(Integer.parseInt(pageNo));
		}else {
			statistics_store.setPageNo(a);
		}
		if(pageSize != null){
			statistics_store.setPageSize(Integer.parseInt(pageSize));
		}else {
			statistics_store.setPageSize(b);
		}
		if(Integer.parseInt(pageNo) <= 0) statistics_store.setPageNo(1);
        if(Integer.parseInt(pageSize)<= 0)statistics_store.setPageSize(10);
        int pageno = statistics_store.getPageNo();
		
	        if(searchFlag != null){
	            if(searchFlag.equals("1")) {  
	            	statistics_store.setB_id(searchContent);
	            }
	            if(searchFlag.equals("2")) {  
	            	statistics_store.setB_name(searchContent); 
	            }
	            if(searchFlag.equals("3")) {  
	            	statistics_store.setS_name(searchContent); 
	            }
	        } 

	        if(searchFlag_date != null){
	        	if(searchFlag_date.equals("1")) {  
	        		String[] hour_ = hour.split(",");
	        		 start_hour = start_date+start_time;
	        		 end_hour = end_date+end_time;
	        		 
	        		 statistics_store.setHour(hour);
	        		 statistics_store.setStart_time(start_hour);
	        		 statistics_store.setEnd_time(end_hour);
	        		 statistics_store.setSearchflag_date("1");
	        	}else if(searchFlag_date.equals("2")) { 
	        		start_hour = start_date;
	        		end_hour = end_date;
	        		statistics_store.setStart_time(start_hour);
	        		statistics_store.setEnd_time(end_hour);
	            	statistics_store.setOrder_date(hour);
	            	statistics_store.setSearchflag_date("2");  
	        	}
	        	/*
	        	else if(searchFlag_date.equals("3")) {  
	            	statistics.setHour(hour);
	        	}else if(searchFlag_date.equals("4")) {  
	            	statistics.setHour(hour);
	        	}
	        	*/
	        }
	        
	        if(searchFlag_date == null) {
	        	Calendar c = Calendar.getInstance();
	        	SimpleDateFormat d = new SimpleDateFormat("yyyyMMddHH");
	        	statistics_store.setStart_time(d.format(c.getTime()));
	        	statistics_store.setEnd_time(d.format(c.getTime()));
	        }
	        
	        List<Statistics_StoreVO> list = null;
	        List<Statistics_StoreVO> list_all = null;
	        int totalCount = 0;
	        totalCount = statisticsDao.getStatistics_storeListCount(statistics_store);
	        list = statisticsDao.getStatistics_storeList(statistics_store); 
	        list_all = statisticsDao.getStatisticsList_store_all(statistics_store); 
	        String name = principal.getName();
	        
			model.addObject("username", name);
	        model.addObject("totalCount", totalCount);
	        model.addObject("list", list);
	        model.addObject("list_all", list_all);
	        model.addObject("searchContent", searchContent);
	        model.addObject("searchFlag", searchFlag);
	        model.addObject("searchFlag_date", searchFlag_date);
	        model.addObject("hour", hour);
	        model.addObject("start_hour", start_hour);
	        model.addObject("end_hour", end_hour);
	        model.addObject("start_date", start_date);
	        model.addObject("end_date", end_date);
	        model.addObject("start_time", start_time);
	        model.addObject("end_time", end_time);
	        model.addObject("pageno", pageno);
	        model.addObject("pageInfo", Page.getPageMap(statistics_store.getPageNo(), totalCount , statistics_store.getPageSize(), 10));
			model.setViewName(".Statistics_store"); 
			logger.info("<<<<<<<<<<<<<< END Statistics_store >>>>>>>>>>>>>>" );
			return model;
	}
		
}