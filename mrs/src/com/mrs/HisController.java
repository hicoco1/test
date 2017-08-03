package com.mrs;
 
import java.security.Principal;
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

import com.mrs.Dao.HisDao;
import com.mrs.Dao.HeadOfficeDao;
import com.mrs.Dao.StatisticsDao;
import com.mrs.Vo.Calc_BranchVO;
import com.mrs.Vo.Calc_RiderVO;
import com.mrs.Vo.Calc_SoluVO;
import com.mrs.Vo.Calc_StoreRiderVO;
import com.mrs.Vo.Calc_StoreVO;
import com.mrs.Vo.HeadOfficeVO;
import com.mrs.Vo.His_CardfailVO;
import com.mrs.Vo.His_RechargeVO;
import com.mrs.Vo.StatisticsVO;
import com.mrs.Vo.Statistics_RiderVO;
import com.mrs.util.Page;
import com.sun.javafx.collections.MappingChange.Map;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

@Controller
public class HisController  {
 
	private static final Logger logger = LoggerFactory.getLogger(HisController.class);
	
	@Resource(name="HisDao")                 
    private HisDao HisDao;

	/*상점잔액충전이력*/
	@RequestMapping(value = "/His_main" , method = {RequestMethod.GET, RequestMethod.POST })
	public ModelAndView His_main(Principal principal, String searchFlag, String pay_type, String up_date_start, String up_date_end, String searchContent, String pageNo,String pageSize,String action) {
		logger.info("<<<<<<<<<<<<<< START His_main >>>>>>>>>>>>>>" );
		ModelAndView model = new ModelAndView();
		His_RechargeVO his_recharge = new His_RechargeVO();
		
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
			his_recharge.setPageNo(Integer.parseInt(pageNo));
		}else {
			his_recharge.setPageNo(a);
		}
		if(pageSize != null){
			his_recharge.setPageSize(Integer.parseInt(pageSize));
		}else {
			his_recharge.setPageSize(b);
		}
		if(Integer.parseInt(pageNo) <= 0) his_recharge.setPageNo(1);
        if(Integer.parseInt(pageSize)<= 0)his_recharge.setPageSize(20);
        int pageno = his_recharge.getPageNo();
		
       
	       if(searchFlag != null){
	            if(searchFlag.equals("1")) {  
	            	his_recharge.setB_id(searchContent);
	            }
	            if(searchFlag.equals("2")) {  
	            	his_recharge.setDest_id(searchContent);
	            }
	            if(searchFlag.equals("3")) {  
	            	his_recharge.setB_name(searchContent);
	            }
	            if(searchFlag.equals("4")) {  
	            	his_recharge.setDest_name(searchContent);
	            }
	        } 
	        
	        
	        if(up_date_start != null){
	        	his_recharge.setUp_date_start(up_date_start);
	        }
	        
	        if(up_date_end != null){
	        	his_recharge.setUp_date_end(up_date_end);
	        }
	    
	        if(pay_type != null){
	            if(pay_type.equals("1")) {    
	            	his_recharge.setPay_type(pay_type);
	            }
	            if(pay_type.equals("2")) {   
	            	his_recharge.setPay_type(pay_type);
	            }
	            
	        }  
	       
	     
	        List<His_RechargeVO> list = null;
	        List<His_RechargeVO> list_all = null;
	        int totalCount = 0;
	        totalCount = HisDao.getRechargeHisListCount(his_recharge);
	        list = HisDao.getRechargeHisList(his_recharge); 
	        list_all = HisDao.getRechargeHisList_all(his_recharge); 
	        
	        String name = principal.getName();
			model.addObject("username", name);
	        model.addObject("totalCount", totalCount);
	        model.addObject("list", list);
	        model.addObject("list_all", list_all);
	        model.addObject("searchContent", searchContent);
	        model.addObject("searchFlag", searchFlag);
	        model.addObject("pay_type", pay_type);
	        model.addObject("up_date_start", up_date_start);
	        model.addObject("up_date_end", up_date_end);
	        model.addObject("pageno",pageno);
	        model.addObject("pageInfo", Page.getPageMap(his_recharge.getPageNo(), totalCount , his_recharge.getPageSize(), 20));
			model.setViewName(".His_main"); 
			logger.info("<<<<<<<<<<<<<< END His_main >>>>>>>>>>>>>>" );
			return model;
	}
	
	/*지사잔액충전이력*/
	@RequestMapping(value = "/His_branch" , method = {RequestMethod.GET, RequestMethod.POST })
	public ModelAndView His_branch(Principal principal, String searchFlag, String pay_type, String up_date_start, String up_date_end, String searchContent, String pageNo,String pageSize,String action) {
		logger.info("<<<<<<<<<<<<<< START His_branch >>>>>>>>>>>>>>" );
		ModelAndView model = new ModelAndView();
		His_RechargeVO his_recharge = new His_RechargeVO();
		
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
			his_recharge.setPageNo(Integer.parseInt(pageNo));
		}else {
			his_recharge.setPageNo(a);
		}
		if(pageSize != null){
			his_recharge.setPageSize(Integer.parseInt(pageSize));
		}else {
			his_recharge.setPageSize(b);
		}
		if(Integer.parseInt(pageNo) <= 0) his_recharge.setPageNo(1);
        if(Integer.parseInt(pageSize)<= 0)his_recharge.setPageSize(20);
        int pageno = his_recharge.getPageNo();
		
       
	       if(searchFlag != null){
	            if(searchFlag.equals("1")) {  
	            	his_recharge.setB_name(searchContent);
	            }
	            if(searchFlag.equals("2")) {  
	            	his_recharge.setB_id(searchContent);
	            }
	        } 
	        
	        
	        if(up_date_start != null){
	        	his_recharge.setUp_date_start(up_date_start);
	        }
	        
	        if(up_date_end != null){
	        	his_recharge.setUp_date_end(up_date_end);
	        }
	    
	        if(pay_type != null){
	            if(pay_type.equals("1")) {    
	            	his_recharge.setPay_type(pay_type);
	            }
	            if(pay_type.equals("2")) {   
	            	his_recharge.setPay_type(pay_type);
	            }
	            
	        }  
	       
	     
	        List<His_RechargeVO> list = null;
	        List<His_RechargeVO> list_all = null;
	        int totalCount = 0;
	        totalCount = HisDao.getRechargeHisListCount_branch(his_recharge);
	        list = HisDao.getRechargeHisList_branch(his_recharge); 
	        list_all = HisDao.getRechargeHisList_all_branch(his_recharge); 
	        
	        String name = principal.getName();
			model.addObject("username", name);
	        model.addObject("totalCount", totalCount);
	        model.addObject("list", list);
	        model.addObject("list_all", list_all);
	        model.addObject("searchContent", searchContent);
	        model.addObject("searchFlag", searchFlag);
	        model.addObject("pay_type", pay_type);
	        model.addObject("up_date_start", up_date_start);
	        model.addObject("up_date_end", up_date_end);
	        model.addObject("pageno",pageno);
	        model.addObject("pageInfo", Page.getPageMap(his_recharge.getPageNo(), totalCount , his_recharge.getPageSize(), 10));
			model.setViewName(".His_branch"); 
			logger.info("<<<<<<<<<<<<<< END His_branch >>>>>>>>>>>>>>" );
			return model;
	}
	
	/*카드결제실패이력*/
	@RequestMapping(value = "/His_cardfail" , method = {RequestMethod.GET, RequestMethod.POST })
	public ModelAndView His_cardfail(Principal principal, String searchFlag, String up_date_start, String up_date_end, String searchContent, String pageNo,String pageSize,String action) {
		logger.info("<<<<<<<<<<<<<< START His_cardfail >>>>>>>>>>>>>>" );
		ModelAndView model = new ModelAndView();
		His_CardfailVO his_cardfail = new His_CardfailVO();
		
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
			his_cardfail.setPageNo(Integer.parseInt(pageNo));
		}else {
			his_cardfail.setPageNo(a);
		}
		if(pageSize != null){
			his_cardfail.setPageSize(Integer.parseInt(pageSize));
		}else {
			his_cardfail.setPageSize(b);
		}
		int pageno = his_cardfail.getPageNo();
		
		if(Integer.parseInt(pageNo) <= 0) his_cardfail.setPageNo(1);
        if(Integer.parseInt(pageSize)<= 0)his_cardfail.setPageSize(20);
        
       
	       if(searchFlag != null){
	            if(searchFlag.equals("1")) {  
	            	his_cardfail.setB_name(searchContent); 
	            }
	            if(searchFlag.equals("2")) {  
	            	his_cardfail.setB_id(searchContent);
	            }
	            if(searchFlag.equals("3")) {  
	            	his_cardfail.setS_name(searchContent); 
	            }
	            if(searchFlag.equals("4")) {  
	            	his_cardfail.setS_id(searchContent);
	            }
	            if(searchFlag.equals("5")) {  
	            	his_cardfail.setR_name(searchContent); 
	            }
	            if(searchFlag.equals("6")) {  
	            	his_cardfail.setR_id(searchContent);
	            }
	            if(searchFlag.equals("7")) {  
	            	his_cardfail.setOrder_id(searchContent);
	            }
	        } 
	        
	        if(up_date_start != null){
	        	his_cardfail.setUp_date_start(up_date_start);
	        }
	        
	        if(up_date_end != null){
	        	his_cardfail.setUp_date_end(up_date_end);
	        }
	    
	       
	     
	        List<His_CardfailVO> list = null;
	        List<His_CardfailVO> list_all = null;
	        int totalCount = 0;
	        if(up_date_start != null){
	        	totalCount = HisDao.getRechargeHisListCount_cardfail(his_cardfail);
	        	list = HisDao.getRechargeHisList_cardfail(his_cardfail); 
	        	list_all = HisDao.getRechargeHisList_all_cardfail(his_cardfail); 
	        }
	        
	        String name = principal.getName();
			model.addObject("username", name);
	        model.addObject("totalCount", totalCount);
	        model.addObject("list", list);
	        model.addObject("list_all", list_all);
	        model.addObject("searchContent", searchContent);
	        model.addObject("searchFlag", searchFlag);
	        model.addObject("up_date_start", up_date_start);
	        model.addObject("up_date_end", up_date_end);
	        model.addObject("pageno",pageno);
	        model.addObject("pageInfo", Page.getPageMap(his_cardfail.getPageNo(), totalCount , his_cardfail.getPageSize(), 10));
			model.setViewName(".His_cardfail"); 
			logger.info("<<<<<<<<<<<<<< END His_cardfail >>>>>>>>>>>>>>" );
			return model;
	}
}