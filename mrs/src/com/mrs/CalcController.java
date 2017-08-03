package com.mrs;
 
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.Principal;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
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

import com.mrs.Cipher.CipherAES;
import com.mrs.Dao.CalcDao;
import com.mrs.Dao.HeadOfficeDao;
import com.mrs.Dao.StatisticsDao;
import com.mrs.Vo.Calc_BranchVO;
import com.mrs.Vo.Calc_RiderVO;
import com.mrs.Vo.Calc_SoluVO;
import com.mrs.Vo.Calc_StoreRiderVO;
import com.mrs.Vo.Calc_StoreVO;
import com.mrs.Vo.HeadOfficeVO;
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
public class CalcController  {
 
	private static final Logger logger = LoggerFactory.getLogger(CalcController.class);
	
	@Resource(name="CalcDao")                 
    private CalcDao calcDao;

	/*지사 정산*/
	@RequestMapping(value = "/Calc_main" , method = {RequestMethod.GET, RequestMethod.POST })
	public ModelAndView calc(Principal principal, String searchFlag, String calculate_period, String calculate_sdate, String calculate_edate, String searchContent, String pageNo,String pageSize, String action) {
		logger.info("<<<<<<<<<<<<<< START Calc_main >>>>>>>>>>>>>>" );
		ModelAndView model = new ModelAndView();
		Calc_BranchVO calc_branch = new Calc_BranchVO();
		
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
			calc_branch.setPageNo(Integer.parseInt(pageNo));
		}else {
			calc_branch.setPageNo(a);
		}
		if(pageSize != null){
			calc_branch.setPageSize(Integer.parseInt(pageSize));
		}else {
			calc_branch.setPageSize(b);
		}	
		if(Integer.parseInt(pageNo) <= 0) calc_branch.setPageNo(1);
        if(Integer.parseInt(pageSize)<= 0)calc_branch.setPageSize(10);
        int pageno = calc_branch.getPageNo();
		
	       if(searchFlag != null){
	            if(searchFlag.equals("1")) {  
	            	calc_branch.setB_id(searchContent);
	            }
	            if(searchFlag.equals("2")) {  
	            	calc_branch.setB_name(searchContent);
	            }
	        } 
	        
	        
	        if(calculate_sdate != null){
	        	calc_branch.setCalculate_sdate(calculate_sdate);
	        }
	        
	        if(calculate_edate != null){
	        	calc_branch.setCalculate_edate(calculate_edate);
	        }
	    
	        if(calculate_period != null){
	            if(calculate_period.equals("1")) {    
	            	calc_branch.setCalculate_period(calculate_period);
	            }
	            if(calculate_period.equals("2")) {   
	            	calc_branch.setCalculate_period(calculate_period);
	            }
	            if(calculate_period.equals("3")) {   
	            	calc_branch.setCalculate_period(calculate_period);
	            }
	        }   
	     
	        List<Calc_BranchVO> list = null;
	        List<Calc_BranchVO> list_all = null;
	        int totalCount = 0;
	        totalCount = calcDao.getBranchListCount(calc_branch);
	        list = calcDao.getBranchList(calc_branch); 
	        list_all = calcDao.getBranchList_all(calc_branch);
	        
	        String name = principal.getName();
			model.addObject("username", name);
	        model.addObject("totalCount", totalCount);
	        model.addObject("list", list);
	        model.addObject("list_all", list_all);
	        model.addObject("searchContent", searchContent);
	        model.addObject("searchFlag", searchFlag);
	        model.addObject("calculate_period", calculate_period);
	        model.addObject("calculate_sdate", calculate_sdate);
	        model.addObject("calculate_edate", calculate_edate);
	        model.addObject("pageno", pageno);
	        model.addObject("pageInfo", Page.getPageMap(calc_branch.getPageNo(), totalCount , calc_branch.getPageSize(), 10));
			model.setViewName(".Calc_main"); 
			logger.info("<<<<<<<<<<<<<< END Calc_main >>>>>>>>>>>>>>" );
			return model;
	}
	
	/*가맹점 정산*/
	@RequestMapping(value = "/Calc_store" , method = {RequestMethod.GET, RequestMethod.POST })
	public ModelAndView calc_store(Principal principal, String searchFlag, String searchFlag_s, String calculate_period, String calculate_sdate, String calculate_edate, String searchContent, String searchContent_s, String pageNo,String pageSize, String action) {
		logger.info("<<<<<<<<<<<<<< START Calc_store >>>>>>>>>>>>>>" );
		ModelAndView model = new ModelAndView();
		Calc_StoreVO calc_store = new Calc_StoreVO();
		
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
			calc_store.setPageNo(Integer.parseInt(pageNo));
		}else {
			calc_store.setPageNo(a);
		}
		if(pageSize != null){
			calc_store.setPageSize(Integer.parseInt(pageSize));
		}else {
			calc_store.setPageSize(b);
		}
		if(Integer.parseInt(pageNo) <= 0) calc_store.setPageNo(1);
        if(Integer.parseInt(pageSize)<= 0)calc_store.setPageSize(10);
        int pageno = calc_store.getPageNo();
		
	       if(searchFlag != null){
	            if(searchFlag.equals("1")) {  
	            	calc_store.setB_id(searchContent);
	            }
	            if(searchFlag.equals("2")) {  
	            	calc_store.setB_name(searchContent);
	            }
	        } 
	        
	       if(searchFlag_s != null){
	            if(searchFlag_s.equals("1")) {  
	            	calc_store.setS_name(searchContent_s);
	            }
	            if(searchFlag_s.equals("2")) {  
	            	calc_store.setS_id(searchContent_s);
	            }
	        }  
	       
	        if(calculate_sdate != null){
	        	calc_store.setCalculate_sdate(calculate_sdate);
	        }
	        
	        if(calculate_edate != null){
	        	calc_store.setCalculate_edate(calculate_edate);
	        }
	        
	      
	        if(calculate_period != null){
	            if(calculate_period.equals("1")) {    
	            	calc_store.setCalculate_period(calculate_period);
	            }
	            if(calculate_period.equals("2")) {   
	            	calc_store.setCalculate_period(calculate_period);
	            }
	            if(calculate_period.equals("3")) {   
	            	calc_store.setCalculate_period(calculate_period);
	            }
	        }   
	        
	        List<Calc_StoreVO> list = null;
	        List<Calc_StoreVO> list_all = null;
	        int totalCount = 0;
	        totalCount = calcDao.getStoreListCount(calc_store);
	        list = calcDao.getStoreList(calc_store); 
	        list_all = calcDao.getStoreList_all(calc_store); 
	        
	        String name = principal.getName();
			model.addObject("username", name);
	        model.addObject("totalCount", totalCount);
	        model.addObject("list", list);
	        model.addObject("list_all", list_all);
	        model.addObject("searchContent", searchContent);
	        model.addObject("searchContent_s", searchContent_s);
	        model.addObject("searchFlag", searchFlag);
	        model.addObject("searchFlag_s", searchFlag_s);
	        model.addObject("calculate_period", calculate_period);
	        model.addObject("calculate_sdate", calculate_sdate);
	        model.addObject("calculate_edate", calculate_edate);
	        model.addObject("pageno", pageno);
	        model.addObject("pageInfo", Page.getPageMap(calc_store.getPageNo(), totalCount , calc_store.getPageSize(), 10));
			model.setViewName(".Calc_store"); 
			logger.info("<<<<<<<<<<<<<< END Calc_store >>>>>>>>>>>>>>" );
			return model;
	}
	
	/*배달기사 정산*/
	@RequestMapping(value = "/Calc_rider" , method = {RequestMethod.GET, RequestMethod.POST })
	public ModelAndView calc_rider(Principal principal, String searchFlag, String searchFlag_r, String calculate_period, String calculate_sdate, String calculate_edate, String searchContent, String searchContent_r, String pageNo,String pageSize, String action) throws UnsupportedEncodingException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
		logger.info("<<<<<<<<<<<<<< START calc_rider >>>>>>>>>>>>>>" );
		ModelAndView model = new ModelAndView();
		Calc_RiderVO calc_rider = new Calc_RiderVO();
		
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
			calc_rider.setPageNo(Integer.parseInt(pageNo));
		}else {
			calc_rider.setPageNo(a);
		}
		if(pageSize != null){
			calc_rider.setPageSize(Integer.parseInt(pageSize));
		}else {
			calc_rider.setPageSize(b);
		}
		if(Integer.parseInt(pageNo) <= 0) calc_rider.setPageNo(1);
        if(Integer.parseInt(pageSize)<= 0)calc_rider.setPageSize(10);
        int pageno = calc_rider.getPageNo();
		
        if(searchFlag != null){
            if(searchFlag.equals("1")) {  
            	calc_rider.setB_id(searchContent);
            }
            if(searchFlag.equals("2")) {  
            	calc_rider.setB_name(searchContent);
            }
        } 
        
        if(searchFlag_r != null){
        	if(searchFlag_r.equals("1")) {  
            	calc_rider.setR_name(searchContent_r);
            }
            if(searchFlag_r.equals("2")) {  
            	calc_rider.setR_id(searchContent_r);
            }
        } 
        
        if(calculate_sdate != null){
        	calc_rider.setCalculate_sdate(calculate_sdate);
        }
        
        if(calculate_edate != null){
        	calc_rider.setCalculate_edate(calculate_edate);
        }
        
      
        if(calculate_period != null){
            if(calculate_period.equals("1")) {    
            	calc_rider.setCalculate_period(calculate_period);
            }
            if(calculate_period.equals("2")) {   
            	calc_rider.setCalculate_period(calculate_period);
            }
            if(calculate_period.equals("3")) {   
            	calc_rider.setCalculate_period(calculate_period);
            }
        }   
	        
	        List<Calc_RiderVO> list = null;
	        List<Calc_RiderVO> list_all = null;
	        int totalCount = 0;
	        totalCount = calcDao.getRiderListCount(calc_rider);
	        list = calcDao.getRiderList(calc_rider); 
	        list_all = calcDao.getRiderList_all(calc_rider); 
	        String name = principal.getName();
	        
			model.addObject("username", name);
	        model.addObject("totalCount", totalCount);
	        model.addObject("list", list);
	        model.addObject("list_all", list_all);
	        model.addObject("searchContent", searchContent);
	        model.addObject("searchFlag", searchFlag);
	        model.addObject("searchContent_r", searchContent_r);
	        model.addObject("searchFlag_r", searchFlag_r);
	        model.addObject("calculate_period", calculate_period);
	        model.addObject("calculate_sdate", calculate_sdate);
	        model.addObject("calculate_edate", calculate_edate);
	        model.addObject("pageno", pageno);
	        model.addObject("pageInfo", Page.getPageMap(calc_rider.getPageNo(), totalCount , calc_rider.getPageSize(), 10));
			model.setViewName(".Calc_rider"); 
			logger.info("<<<<<<<<<<<<<< END calc_rider >>>>>>>>>>>>>>" );
			return model;
	}
	
	/*상점 별 배달기사 정산*/
	@RequestMapping(value = "/Calc_storider" , method = {RequestMethod.GET, RequestMethod.POST })
	public ModelAndView calc_storider(Principal principal, String searchFlag, String calculate_period, String calculate_sdate, String calculate_edate, String searchContent, String pageNo,String pageSize, String action) {
		logger.info("<<<<<<<<<<<<<< START calc_storider >>>>>>>>>>>>>>" );
		ModelAndView model = new ModelAndView();
		Calc_StoreRiderVO calc_storerider = new Calc_StoreRiderVO();
		
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
			calc_storerider.setPageNo(Integer.parseInt(pageNo));
		}else {
			calc_storerider.setPageNo(a);
		}
		if(pageSize != null){
			calc_storerider.setPageSize(Integer.parseInt(pageSize));
		}else {
			calc_storerider.setPageSize(b);
		}
		if(Integer.parseInt(pageNo) <= 0) calc_storerider.setPageNo(1);
        if(Integer.parseInt(pageSize)<= 0)calc_storerider.setPageSize(10);
        int pageno = calc_storerider.getPageNo();
		
        if(searchFlag != null){
            if(searchFlag.equals("1")) {  
            	calc_storerider.setB_id(searchContent);
            }
            if(searchFlag.equals("2")) {  
            	calc_storerider.setB_name(searchContent);
            }
            if(searchFlag.equals("3")) {  
            	calc_storerider.setR_id(searchContent);
            }
            if(searchFlag.equals("4")) {  
            	calc_storerider.setS_id(searchContent);
            }
        } 
        
        
        if(calculate_sdate != null){
        	calc_storerider.setCalculate_sdate(calculate_sdate);
        }
        
        if(calculate_edate != null){
        	calc_storerider.setCalculate_edate(calculate_edate);
        }
        
      
        if(calculate_period != null){
            if(calculate_period.equals("1")) {    
            	calc_storerider.setCalculate_period(calculate_period);
            }
            if(calculate_period.equals("2")) {   
            	calc_storerider.setCalculate_period(calculate_period);
            }
            if(calculate_period.equals("3")) {   
            	calc_storerider.setCalculate_period(calculate_period);
            }
        }   
	        
	        List<Calc_StoreRiderVO> list = null;
	        List<Calc_StoreRiderVO> list_all = null;
	        int totalCount = 0;
	        totalCount = calcDao.getStoreRiderListCount(calc_storerider);
	        list = calcDao.getStoreRiderList(calc_storerider); 
	        list_all = calcDao.getStoreRiderList_all(calc_storerider); 
	        
	        String name = principal.getName();
			model.addObject("username", name);
	        model.addObject("totalCount", totalCount);
	        model.addObject("list", list);
	        model.addObject("list_all", list_all);
	        model.addObject("searchContent", searchContent);
	        model.addObject("searchFlag", searchFlag);
	        model.addObject("calculate_period", calculate_period);
	        model.addObject("calculate_sdate", calculate_sdate);
	        model.addObject("calculate_edate", calculate_edate);
	        model.addObject("pageno", pageno);
	        model.addObject("pageInfo", Page.getPageMap(calc_storerider.getPageNo(), totalCount , calc_storerider.getPageSize(), 10));
			model.setViewName(".Calc_storider"); 
			logger.info("<<<<<<<<<<<<<< END calc_storider >>>>>>>>>>>>>>" );
			return model;
	}
	
	/*솔루션사 정산*/
	@RequestMapping(value = "/Calc_sol" , method = {RequestMethod.GET, RequestMethod.POST })
	public ModelAndView calc_solu(Principal principal, String searchFlag, String calculate_sdate, String calculate_edate, String searchContent, String pageNo,String pageSize, String action) {
		logger.info("<<<<<<<<<<<<<< START calc_solu >>>>>>>>>>>>>>" );
		ModelAndView model = new ModelAndView();
		Calc_SoluVO calc_solu = new Calc_SoluVO();
		
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
			calc_solu.setPageNo(Integer.parseInt(pageNo));
		}else {
			calc_solu.setPageNo(a);
		}
		if(pageSize != null){
			calc_solu.setPageSize(Integer.parseInt(pageSize));
		}else {
			calc_solu.setPageSize(b);
		}
		if(Integer.parseInt(pageNo) <= 0) calc_solu.setPageNo(1);
        if(Integer.parseInt(pageSize)<= 0)calc_solu.setPageSize(10);
        int pageno = calc_solu.getPageNo();
        
        if(calculate_sdate != null){
        	calc_solu.setCalculate_sdate(calculate_sdate);
        }
        
        if(calculate_edate != null){
        	calc_solu.setCalculate_edate(calculate_edate);
        }
        
  
	        List<Calc_SoluVO> list = null;
	        List<Calc_SoluVO> list_all = null;
	        int totalCount = 0;
	        totalCount = calcDao.getSoluListCount(calc_solu);
	        list = calcDao.getSoluList(calc_solu); 
	        list_all = calcDao.getSoluList_all(calc_solu); 
	        
	        String name = principal.getName();
			model.addObject("username", name);
	        model.addObject("totalCount", totalCount);
	        model.addObject("list", list);
	        model.addObject("list_all", list_all);
	        model.addObject("searchContent", searchContent);
	        model.addObject("calculate_sdate", calculate_sdate);
	        model.addObject("calculate_edate", calculate_edate);
	        model.addObject("pageno", pageno);
	        model.addObject("pageInfo", Page.getPageMap(calc_solu.getPageNo(), totalCount , calc_solu.getPageSize(), 10));
			model.setViewName(".Calc_sol"); 
			logger.info("<<<<<<<<<<<<<< END calc_solu >>>>>>>>>>>>>>" );
			return model;
	}
		
}