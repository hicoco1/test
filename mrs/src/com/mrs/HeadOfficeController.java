package com.mrs;
 
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
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
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;

import com.mrs.Dao.HeadOfficeDao;
import com.mrs.Vo.BranchOffice_AddrVO;
import com.mrs.Vo.BranchOffice_NationVO;
import com.mrs.Vo.HeadOfficeVO;
import com.mrs.Vo.HeadOffice_AddrVO;
import com.mrs.Vo.HeadOffice_BankVO;
import com.mrs.Vo.HeadOffice_CityguVO;
import com.mrs.Vo.HeadOffice_ConfigVO;
import com.mrs.Vo.HeadOffice_DongVO;
import com.mrs.util.Page;


@Controller
public class HeadOfficeController  {
 
	private static final Logger logger = LoggerFactory.getLogger(HeadOfficeController.class);
	
	@Resource(name="HeadOfficeDao")                 
    private HeadOfficeDao headofficeDao;
	

	
	@RequestMapping(value = "/daum_address.html")
	public ModelAndView daum_address(ModelAndView model) throws IllegalStateException, IOException
	{
		logger.info("<<<<<<<<<<<<<< START daum_address >>>>>>>>>>>>>>" );
        model.setViewName("daum/daum_address");
        logger.info("<<<<<<<<<<<<<< END daum_address >>>>>>>>>>>>>>" );
        return model;
    }


	
	@RequestMapping(value = "/HeadOffice_main", method = {RequestMethod.GET, RequestMethod.POST })
	public ModelAndView HeadOffice(Principal principal, String searchFlag, String searchContent, String enabled,String pageNo,String pageSize, String result, String action) throws UnsupportedEncodingException {
		logger.info("<<<<<<<<<<<<<< START HeadOffice_main >>>>>>>>>>>>>>" );
		ModelAndView model = new ModelAndView();
		HeadOfficeVO headoffice = new HeadOfficeVO();
		
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
			headoffice.setPageNo(Integer.parseInt(pageNo));
		}else {
			headoffice.setPageNo(a);
		}
		if(pageSize != null){
			headoffice.setPageSize(Integer.parseInt(pageSize));
		}else {
			headoffice.setPageSize(b);
		}
		if(Integer.parseInt(pageNo) <= 0) headoffice.setPageNo(1);
        if(Integer.parseInt(pageSize)<= 0)headoffice.setPageSize(10);
        int pageno = headoffice.getPageNo();
        
	        if(searchContent != null) {
	        	
	        	headoffice.setLogin_id(searchContent);
	        }
        
	        if(searchFlag != null){
	            	headoffice.setAuthority(searchFlag);
	        }  
	        
	        if(enabled != null){
	            if(enabled.equals("0")) {    
	            	headoffice.setEnabled(enabled);
	            }
	            if(enabled.equals("1")) {   
	            	headoffice.setEnabled(enabled);
	            }
	        }   
	      
	        List<HeadOfficeVO> list = null;
	        int totalCount = 0;
	        totalCount = headofficeDao.getHeadOfficeListCount(headoffice);
	        list = headofficeDao.getHeadOfficeList(headoffice); 
	        String name = principal.getName();
	     
			model.addObject("username", name);
	        model.addObject("totalCount", totalCount);
	        model.addObject("list", list);
	        model.addObject("searchContent", searchContent);
	        model.addObject("searchFlag", searchFlag);
	        model.addObject("enabled", enabled);
	        model.addObject("result", result);
	        model.addObject("action", action);
	        model.addObject("pageno", pageno);
	        model.addObject("pageInfo", Page.getPageMap(headoffice.getPageNo(), totalCount , headoffice.getPageSize(), 10));
			model.setViewName(".HeadOffice_main"); 
			logger.info("<<<<<<<<<<<<<< END HeadOffice_main >>>>>>>>>>>>>>" );
			return model;
	}
	
	@RequestMapping(value = "/headoffice_update" , method = {RequestMethod.POST })
	public @ResponseBody List<HeadOfficeVO> headoffice_update(HttpServletRequest request, HttpServletResponse response,String login_id)
			throws Exception {
		logger.info("<<<<<<<<<<<<<< START headoffice_update >>>>>>>>>>>>>>" );
		
		HeadOfficeVO headoffice = new HeadOfficeVO();
		
		headoffice.setLogin_id(login_id);
		List<HeadOfficeVO> userlist = null;
		userlist = headofficeDao.getHeadOfficeUpdate(headoffice);
		
		logger.info("<<<<<<<<<<<<<< END headoffice_update >>>>>>>>>>>>>>" );
		return userlist;
	}
	

	@RequestMapping(value = "/insertheadoffice", method = { RequestMethod.POST })
	public ModelAndView insertheadoffice(ModelAndView model, HeadOfficeVO headoffice, String action) throws IllegalStateException, IOException
	{
		logger.info("<<<<<<<<<<<<<< START insertheadoffice >>>>>>>>>>>>>>" );
		int result = headofficeDao.insertheadoffice(headoffice);
		headofficeDao.insertHeadOffice_authority(headoffice);
	
		model.addObject("result",result);   
		model.addObject("action",action);
        model.setViewName("redirect:/HeadOffice_main");
        logger.info("<<<<<<<<<<<<<< END insertheadoffice >>>>>>>>>>>>>>" );
        return model;
    }
	
	@RequestMapping(value = "/updateheadoffice", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView updateheadoffice(ModelAndView model, HeadOfficeVO headoffice, String action, String searchFlag, String searchContent, String pageNo) throws IllegalStateException, IOException
	{
		logger.info("<<<<<<<<<<<<<< START updateheadoffice >>>>>>>>>>>>>>" );
		int result = headofficeDao.updateheadoffice(headoffice);
		headofficeDao.updateHeadOffice_authority(headoffice);
	
		model.addObject("result",result); 
		model.addObject("action",action);
		model.addObject("pageNo",pageNo);
		model.addObject("searchFlag",searchFlag);
		model.addObject("searchContent", searchContent);
        model.setViewName("redirect:/HeadOffice_main");
        logger.info("<<<<<<<<<<<<<< END updateheadoffice >>>>>>>>>>>>>>" );
        return model;
    }
	
	
	 @RequestMapping(value = "/deleteheadoffice", method = { RequestMethod.GET, RequestMethod.POST })
	 public ModelAndView deleteheadoffice(ModelAndView model, String login_id, String action, String searchFlag, String searchContent, String pageNo)
    {
        logger.info("<<<<<<<<<<<<<< START deleteheadoffice >>>>>>>>>>>>>>" );
        int result = headofficeDao.deleteHeadOffice_authority(login_id);
        headofficeDao.deleteHeadOffice(login_id);
        model.addObject("result",result);
		model.addObject("action",action);
		model.addObject("pageNo",pageNo);
		model.addObject("searchFlag",searchFlag);
		model.addObject("searchContent", searchContent);
        model.setViewName("redirect:/HeadOffice_main");
        logger.info("<<<<<<<<<<<<<< END deleteheadoffice >>>>>>>>>>>>>>" );
        return model;
    }
	 
	 //전국 주소 정보 메뉴
	@RequestMapping(value = "/HeadOffice_addr" , method = {RequestMethod.GET, RequestMethod.POST })
	public ModelAndView HeadOffice_addr(Principal principal, String searchFlag, String searchContent, String san_flag,String pageNo,String pageSize, String result, String action) throws UnsupportedEncodingException {
		logger.info("<<<<<<<<<<<<<< START HeadOffice_addr >>>>>>>>>>>>>>" );
		ModelAndView model = new ModelAndView();
		HeadOffice_AddrVO headoffice_addr = new HeadOffice_AddrVO();
		
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
			headoffice_addr.setPageNo(Integer.parseInt(pageNo));
		}else {
			headoffice_addr.setPageNo(a);
		}
		if(pageSize != null){
			headoffice_addr.setPageSize(Integer.parseInt(pageSize));
		}else {
			headoffice_addr.setPageSize(b);
		}
		if(Integer.parseInt(pageNo) <= 0) headoffice_addr.setPageNo(1);
        if(Integer.parseInt(pageSize)<= 0)headoffice_addr.setPageSize(10);
        int pageno = headoffice_addr.getPageNo();
        
	        if(searchFlag != null){
	        	
		            if(searchFlag.equals("1")) {   
		            	headoffice_addr.setCity_code(searchContent);
		            }
		            if(searchFlag.equals("2")) {   
		            	headoffice_addr.setGu_code(searchContent);
		            }
		            if(searchFlag.equals("3")) {   
		            	headoffice_addr.setTown_code(searchContent);
		            }
		            if(searchFlag.equals("4")) {   
		            	headoffice_addr.setDong_code(searchContent);
		            }
		            if(searchFlag.equals("5")) {   
		            	headoffice_addr.setLi_code(searchContent);
		            }
		            if(searchFlag.equals("6")) {   
		            	headoffice_addr.setJi_bonbun(searchContent);
		            }
		            if(searchFlag.equals("7")) {   
		            	headoffice_addr.setJi_bubun(searchContent);
		            }
		            if(searchFlag.equals("8")) {   
		            	headoffice_addr.setBuilding_name(searchContent);
		            }
		            if(searchFlag.equals("9")) {   
		            	headoffice_addr.setBuilding_dongho(searchContent);
		            }
		            if(searchFlag.equals("10")) {   
		            	headoffice_addr.setRoad_codenum(searchContent);
		            }
		            if(searchFlag.equals("11")) {   
		            	headoffice_addr.setRoad_code(searchContent);
		            }
		            if(searchFlag.equals("12")) {   
		            	headoffice_addr.setRoad_bonbun(searchContent);
		            }
		            if(searchFlag.equals("13")) {   
		            	headoffice_addr.setRoad_bubun(searchContent);
		            }
		       
	        }  
	        
	        if(san_flag != null){
	            if(san_flag.equals("0")) {    
	            	headoffice_addr.setSan_flag(san_flag);
	            }
	            if(san_flag.equals("1")) {   
	            	headoffice_addr.setSan_flag(san_flag);
	            }
	        }   
	        
	        List<HeadOffice_AddrVO> list = null;
	        int totalCount = 0;
	       // if(searchFlag != null || san_flag != null){
	        	totalCount = headofficeDao.getHeadOfficeAddrListCount(headoffice_addr);
	        	list = headofficeDao.getHeadOfficeAddrList(headoffice_addr);
	       // }
	        String name = principal.getName();
	       
			model.addObject("username", name);
	        model.addObject("totalCount", totalCount);
	        model.addObject("list", list);
	        model.addObject("searchContent", searchContent);
	        model.addObject("searchFlag", searchFlag);
	        model.addObject("san_flag", san_flag);
	        model.addObject("result", result);
	        model.addObject("pageno",pageno);
	        model.addObject("action", action);
	        model.addObject("pageInfo", Page.getPageMap(headoffice_addr.getPageNo(), totalCount , headoffice_addr.getPageSize(), 10));
			model.setViewName(".HeadOffice_addr"); 
			logger.info("<<<<<<<<<<<<<< END HeadOffice_addr >>>>>>>>>>>>>>" );
			return model;
	}

	@RequestMapping(value = "/insertheadoffice_addr", method = { RequestMethod.POST })
	public ModelAndView insertheadoffice_addr(ModelAndView model, HeadOffice_AddrVO headoffice_addr, String action) throws IllegalStateException, IOException
	{
		logger.info("<<<<<<<<<<<<<< START insertheadoffice_addr >>>>>>>>>>>>>>" );
		int result = headofficeDao.insertheadoffice_addr(headoffice_addr);
		model.addObject("result",result);   
		model.addObject("action",action);
        model.setViewName("redirect:/HeadOffice_addr");
        logger.info("<<<<<<<<<<<<<< END insertheadoffice_addr >>>>>>>>>>>>>>" );
        return model;
    }
	
	@RequestMapping(value = "/updateheadoffice_addr", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView updateheadoffice_addr(ModelAndView model, HeadOffice_AddrVO headoffice_addr, String action, String searchFlag, String searchContent, String pageNo) throws IllegalStateException, IOException
	{
		logger.info("<<<<<<<<<<<<<< START updateheadoffice_addr >>>>>>>>>>>>>>" );
		int result = headofficeDao.updateheadoffice_addr(headoffice_addr);
		
		model.addObject("result",result); 
		model.addObject("action",action);
		model.addObject("pageNo",pageNo);
		model.addObject("searchFlag",searchFlag);
		model.addObject("searchContent", searchContent);
        model.setViewName("redirect:/HeadOffice_addr");
        logger.info("<<<<<<<<<<<<<< END updateheadoffice_addr >>>>>>>>>>>>>>" );
        return model;
    }
	
	
	 @RequestMapping(value = "/deleteheadoffice_addr", method = { RequestMethod.GET, RequestMethod.POST })
	 public ModelAndView deleteheadoffice_addr(ModelAndView model, String seq, String action, String searchFlag, String searchContent, String pageNo)throws UnsupportedEncodingException
    {
        logger.info("<<<<<<<<<<<<<< START deleteheadoffice_addr >>>>>>>>>>>>>>" );
        int result = headofficeDao.deleteHeadOffice_addr(seq);
        
        model.addObject("result",result);
		model.addObject("action",action);
		model.addObject("pageNo",pageNo);
		model.addObject("searchFlag",searchFlag);
		model.addObject("searchContent", searchContent);
        model.setViewName("redirect:/HeadOffice_addr");
        logger.info("<<<<<<<<<<<<<< END deleteheadoffice_addr >>>>>>>>>>>>>>" );
        return model;
    }
	 
	 
	//전국 시/도 시군구 정보 메뉴
	@RequestMapping(value = "/HeadOffice_citygu" , method = {RequestMethod.GET, RequestMethod.POST })
	public ModelAndView HeadOffice_citygu(Principal principal, String searchFlag, String searchContent,String pageNo,String pageSize, String result, String action) throws UnsupportedEncodingException {
		logger.info("<<<<<<<<<<<<<< START HeadOffice_citygu >>>>>>>>>>>>>>" );
		ModelAndView model = new ModelAndView();
		HeadOffice_CityguVO headoffice_citygu = new HeadOffice_CityguVO();
		
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
			headoffice_citygu.setPageNo(Integer.parseInt(pageNo));
		}else {
			headoffice_citygu.setPageNo(a);
		}
		if(pageSize != null){
			headoffice_citygu.setPageSize(Integer.parseInt(pageSize));
		}else {
			headoffice_citygu.setPageSize(b);
		}
		if(Integer.parseInt(pageNo) <= 0) headoffice_citygu.setPageNo(1);
        if(Integer.parseInt(pageSize)<= 0)headoffice_citygu.setPageSize(10);
        int pageno = headoffice_citygu.getPageNo();
        
	        if(searchFlag != null){
	        	
	            if(searchFlag.equals("1")) {   
	            	headoffice_citygu.setCity_code(searchContent);
	            }
	            if(searchFlag.equals("2")) {   
	            	headoffice_citygu.setGu_code(searchContent);
	            }
	            if(searchFlag.equals("3")) {   
	            	headoffice_citygu.setTown_code(searchContent);
	            }
	           
	        }  
	        
	        List<HeadOffice_CityguVO> list = null;
	        int totalCount = 0;
	        //if(searchFlag != null){
	        	totalCount = headofficeDao.getHeadOfficeCityguListCount(headoffice_citygu);
	        	list = headofficeDao.getHeadOfficeCityguList(headoffice_citygu);  
	        //}
	        String name = principal.getName();
	     
			model.addObject("username", name);
	        model.addObject("totalCount", totalCount);
	        model.addObject("list", list);
	        model.addObject("searchContent", searchContent);
	        model.addObject("searchFlag", searchFlag);
	        model.addObject("result", result);
	        model.addObject("action", action);
	        model.addObject("pageno", pageno);
	        model.addObject("pageInfo", Page.getPageMap(headoffice_citygu.getPageNo(), totalCount , headoffice_citygu.getPageSize(), 10));
			model.setViewName(".HeadOffice_citygu"); 
			logger.info("<<<<<<<<<<<<<< END HeadOffice_citygu >>>>>>>>>>>>>>" );
			return model;
	}

	@RequestMapping(value = "/insertheadoffice_citygu", method = { RequestMethod.POST })
	public ModelAndView insertheadoffice_citygu(ModelAndView model, HeadOffice_CityguVO headoffice_citygu, String action) throws IllegalStateException, IOException
	{
		logger.info("<<<<<<<<<<<<<< START insertheadoffice_citygu >>>>>>>>>>>>>>" );
		int result = headofficeDao.insertheadoffice_citygu(headoffice_citygu);
		model.addObject("result",result);   
		model.addObject("action",action);
        model.setViewName("redirect:/HeadOffice_citygu");
        logger.info("<<<<<<<<<<<<<< END insertheadoffice_citygu >>>>>>>>>>>>>>" );
        return model;
    }
	
	@RequestMapping(value = "/updateheadoffice_citygu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView updateheadoffice_citygu(ModelAndView model, HeadOffice_CityguVO headoffice_citygu, String action, String searchFlag, String searchContent, String pageNo) throws IllegalStateException, IOException
	{
		logger.info("<<<<<<<<<<<<<< START updateheadoffice_citygu >>>>>>>>>>>>>>" );
		int result = headofficeDao.updateheadoffice_citygu(headoffice_citygu);
		model.addObject("result",result); 
		model.addObject("action",action);
		model.addObject("pageNo",pageNo);
		model.addObject("searchFlag",searchFlag);
		model.addObject("searchContent", searchContent);
        model.setViewName("redirect:/HeadOffice_citygu");
        logger.info("<<<<<<<<<<<<<< END updateheadoffice_citygu >>>>>>>>>>>>>>" );
        return model;
    }
	
	
	 @RequestMapping(value = "/deleteheadoffice_citygu", method = { RequestMethod.GET, RequestMethod.POST })
	 public ModelAndView deleteheadoffice_citygu(ModelAndView model, String seq, String action, String searchFlag, String searchContent, String pageNo)
    {
        logger.info("<<<<<<<<<<<<<< START deleteheadoffice_citygu >>>>>>>>>>>>>>" );
        int result = headofficeDao.deleteHeadOffice_citygu(seq);
        model.addObject("result",result);
		model.addObject("action",action);
		model.addObject("pageNo",pageNo);
		model.addObject("searchFlag",searchFlag);
		model.addObject("searchContent", searchContent);
        model.setViewName("redirect:/HeadOffice_citygu");
        logger.info("<<<<<<<<<<<<<< END deleteheadoffice_citygu >>>>>>>>>>>>>>" );
        return model;
    }
	 
//전국 동 코드 정보 메뉴
 @RequestMapping(value = "/HeadOffice_dong" , method = {RequestMethod.GET, RequestMethod.POST })
	public ModelAndView HeadOffice_dong(Principal principal, String searchFlag, String searchContent,String pageNo,String pageSize, String result, String action) throws UnsupportedEncodingException {
		logger.info("<<<<<<<<<<<<<< START HeadOffice_dong >>>>>>>>>>>>>>" );
		ModelAndView model = new ModelAndView();
		HeadOffice_DongVO headoffice_dong = new HeadOffice_DongVO();
		
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
			headoffice_dong.setPageNo(Integer.parseInt(pageNo));
		}else {
			headoffice_dong.setPageNo(a);
		}
		if(pageSize != null){
			headoffice_dong.setPageSize(Integer.parseInt(pageSize));
		}else {
			headoffice_dong.setPageSize(b);
		}
		if(Integer.parseInt(pageNo) <= 0) headoffice_dong.setPageNo(1);
        if(Integer.parseInt(pageSize)<= 0)headoffice_dong.setPageSize(10);
        int pageno = headoffice_dong.getPageNo();
        
	        if(searchFlag != null){
	        	
	            if(searchFlag.equals("1")) {   
	            	headoffice_dong.setCity_code(searchContent);
	            }
	            if(searchFlag.equals("2")) {   
	            	headoffice_dong.setGu_code(searchContent);
	            }
	            if(searchFlag.equals("3")) {   
	            	headoffice_dong.setDong_code(searchContent);
	            }
	           
	        }  
	        
	        List<HeadOffice_DongVO> list = null;
	        int totalCount = 0;
	        //if(searchFlag != null){
	        	totalCount = headofficeDao.getHeadOfficeDongListCount(headoffice_dong);
	        	list = headofficeDao.getHeadOfficeDongList(headoffice_dong); 
	        //}
	        String name = principal.getName();
	     
			model.addObject("username", name);
	        model.addObject("totalCount", totalCount);
	        model.addObject("list", list);
	        model.addObject("searchContent", searchContent);
	        model.addObject("searchFlag", searchFlag);
	        model.addObject("result", result);
	        model.addObject("action", action);
	        model.addObject("pageno", pageno);
	        model.addObject("pageInfo", Page.getPageMap(headoffice_dong.getPageNo(), totalCount , headoffice_dong.getPageSize(), 10));
			model.setViewName(".HeadOffice_dong"); 
			logger.info("<<<<<<<<<<<<<< END HeadOffice_dong >>>>>>>>>>>>>>" );
			return model;
	}

	@RequestMapping(value = "/insertheadoffice_dong", method = { RequestMethod.POST })
	public ModelAndView insertheadoffice_dong(ModelAndView model, HeadOffice_DongVO headoffice_dong, String action) throws IllegalStateException, IOException
	{
		logger.info("<<<<<<<<<<<<<< START insertheadoffice_dong >>>>>>>>>>>>>>" );
		int result = headofficeDao.insertheadoffice_dong(headoffice_dong);
		model.addObject("result",result);   
		model.addObject("action",action);
        model.setViewName("redirect:/HeadOffice_dong");
        logger.info("<<<<<<<<<<<<<< END insertheadoffice_dong >>>>>>>>>>>>>>" );
        return model;
    }
	
	@RequestMapping(value = "/updateheadoffice_dong", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView updateheadoffice_dong(ModelAndView model, HeadOffice_DongVO headoffice_dong, String action, String searchFlag, String searchContent, String pageNo) throws IllegalStateException, IOException
	{
		logger.info("<<<<<<<<<<<<<< START updateheadoffice_dong >>>>>>>>>>>>>>" );
		int result = headofficeDao.updateheadoffice_dong(headoffice_dong);
		model.addObject("result",result); 
		model.addObject("action",action);
		model.addObject("pageNo",pageNo);
		model.addObject("searchFlag",searchFlag);
		model.addObject("searchContent", searchContent);
        model.setViewName("redirect:/HeadOffice_dong");
        logger.info("<<<<<<<<<<<<<< END updateheadoffice_dong >>>>>>>>>>>>>>" );
        return model;
    }
	
	
	 @RequestMapping(value = "/deleteheadoffice_dong", method = { RequestMethod.GET, RequestMethod.POST })
	 public ModelAndView deleteheadoffice_dong(ModelAndView model, String seq, String action, String searchFlag, String searchContent, String pageNo)
    {
        logger.info("<<<<<<<<<<<<<< START deleteheadoffice_dong >>>>>>>>>>>>>>" );
        int result = headofficeDao.deleteHeadOffice_dong(seq);
        model.addObject("result",result);
		model.addObject("action",action);
		model.addObject("pageNo",pageNo);
		model.addObject("searchFlag",searchFlag);
		model.addObject("searchContent", searchContent);
        model.setViewName("redirect:/HeadOffice_dong");
        logger.info("<<<<<<<<<<<<<< END deleteheadoffice_dong >>>>>>>>>>>>>>" );
        return model;
    }
	 
	//가상계좌 은행 관리 메뉴
	 @RequestMapping(value = "/HeadOffice_bank" , method = {RequestMethod.GET, RequestMethod.POST })
		public ModelAndView HeadOffice_bank(Principal principal, String searchFlag, String searchContent,String pageNo,String pageSize, String result, String action) {
			logger.info("<<<<<<<<<<<<<< START HeadOffice_bank >>>>>>>>>>>>>>" );
			ModelAndView model = new ModelAndView();
			HeadOffice_BankVO headoffice_bank = new HeadOffice_BankVO();
			
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
			
			int a = 1;
			int b = 10;

			if(pageNo != null){
				headoffice_bank.setPageNo(Integer.parseInt(pageNo));
			}else {
				headoffice_bank.setPageNo(a);
			}
			if(pageSize != null){
				headoffice_bank.setPageSize(Integer.parseInt(pageSize));
			}else {
				headoffice_bank.setPageSize(b);
			}
			if(Integer.parseInt(pageNo) <= 0) headoffice_bank.setPageNo(1);
	        if(Integer.parseInt(pageSize)<= 0)headoffice_bank.setPageSize(10);
		        
		        List<HeadOffice_BankVO> list = null;
		        int totalCount = 0;
		        	totalCount = headofficeDao.getHeadOfficeBankListCount(headoffice_bank);
		        	list = headofficeDao.getHeadOfficeBankList(headoffice_bank); 
		      
		        String name = principal.getName();
		     
				model.addObject("username", name);
		        model.addObject("totalCount", totalCount);
		        model.addObject("list", list);
		        model.addObject("searchContent", searchContent);
		        model.addObject("searchFlag", searchFlag);
		        model.addObject("result", result);
		        model.addObject("action", action);
		        model.addObject("pageInfo", Page.getPageMap(headoffice_bank.getPageNo(), totalCount , headoffice_bank.getPageSize(), 10));
				model.setViewName(".HeadOffice_bank"); 
				logger.info("<<<<<<<<<<<<<< END HeadOffice_bank >>>>>>>>>>>>>>" );
				return model;
		}

	 @RequestMapping(value = "/updatebank", method = {RequestMethod.GET, RequestMethod.POST })
		public ModelAndView updatebank(ModelAndView model, HeadOffice_BankVO headoffice_bank, String action) throws IllegalStateException, IOException
		{
			logger.info("<<<<<<<<<<<<<< START updatebank >>>>>>>>>>>>>>" );
			int result = 0;
			String[] a = headoffice_bank.getBank_id().split(",");
			
			for(int i=0; i < a.length; i++) {
				result = headofficeDao.updatebank(a[i]);
			}
			
			model.addObject("result",result);   
			model.addObject("action",action);
	        model.setViewName("redirect:/HeadOffice_bank");
	        logger.info("<<<<<<<<<<<<<< END updatebank >>>>>>>>>>>>>>" );
	        return model;
	    }
	 
	 @RequestMapping(value = "/deletebank", method = {RequestMethod.GET, RequestMethod.POST })
		public ModelAndView deletebank(ModelAndView model, HeadOffice_BankVO headoffice_bank, String action) throws IllegalStateException, IOException
		{
			logger.info("<<<<<<<<<<<<<< START deletebank >>>>>>>>>>>>>>" );
			int result = 0;
			String[] a = headoffice_bank.getBank_id().split(",");
			
			for(int i=0; i < a.length; i++) {
				result = headofficeDao.deletebank(a[i]);
			}
			
			model.addObject("result",result);   
			model.addObject("action",action);
	        model.setViewName("redirect:/HeadOffice_bank");
	        logger.info("<<<<<<<<<<<<<< END deletebank >>>>>>>>>>>>>>" );
	        return model;
	    }
	 
	 /*모 계좌 정보관리*/
	 @RequestMapping(value = "/HeadOffice_config" , produces="text/plain; charset=UTF-8", method = {RequestMethod.GET, RequestMethod.POST })
		public ModelAndView HeadOffice_config(Principal principal, String searchFlag, String searchContent, String enabled,String pageNo,String pageSize, String result, String action) {
			logger.info("<<<<<<<<<<<<<< START HeadOffice_config >>>>>>>>>>>>>>" );
			ModelAndView model = new ModelAndView();
			HeadOffice_ConfigVO headoffice_config = new HeadOffice_ConfigVO();
			
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
			
			int a = 1;
			int b = 10;

			if(pageNo != null){
				headoffice_config.setPageNo(Integer.parseInt(pageNo));
			}else {
				headoffice_config.setPageNo(a);
			}
			if(pageSize != null){
				headoffice_config.setPageSize(Integer.parseInt(pageSize));
			}else {
				headoffice_config.setPageSize(b);
			}
			if(Integer.parseInt(pageNo) <= 0) headoffice_config.setPageNo(1);
	        if(Integer.parseInt(pageSize)<= 0)headoffice_config.setPageSize(10);
	        
	        
		        if(searchFlag != null){
		            if(searchFlag.equals("1")) {  
		            	headoffice_config.setH_bank(searchContent);
		            }
		            if(searchFlag.equals("2")) {   
		            	headoffice_config.setH_account(searchContent);
		            }
		            if(searchFlag.equals("3")) {   
		            	headoffice_config.setH_name(searchContent);
		            }
		            if(searchFlag.equals("4")) {   
		            	headoffice_config.setH_institution_code(searchContent);
		            }
		        }  
		      
		        List<HeadOffice_ConfigVO> list = null;
		        int totalCount = 0;
		        totalCount = headofficeDao.getHead_ConfigListCount(headoffice_config);
		        list = headofficeDao.getHead_ConfigList(headoffice_config);
		        String name = principal.getName();
		     
				model.addObject("username", name);
		        model.addObject("totalCount", totalCount);
		        model.addObject("list", list);
		        model.addObject("searchContent", searchContent);
		        model.addObject("searchFlag", searchFlag);
		        model.addObject("enabled", enabled);
		        model.addObject("result", result);
		        model.addObject("action", action);
		        model.addObject("pageInfo", Page.getPageMap(headoffice_config.getPageNo(), totalCount , headoffice_config.getPageSize(), 10));
				model.setViewName(".HeadOffice_config"); 
				logger.info("<<<<<<<<<<<<<< END HeadOffice_config >>>>>>>>>>>>>>" );
				return model;
		}
	 
	 @RequestMapping(value = "/insertheadoffice_config", method = { RequestMethod.POST })
		public ModelAndView insertheadoffice_config(ModelAndView model, HeadOffice_ConfigVO headoffice_config, String action) throws IllegalStateException, IOException
		{
			logger.info("<<<<<<<<<<<<<< START insertheadoffice_config >>>>>>>>>>>>>>" );
			int result = headofficeDao.insertheadoffice_config(headoffice_config); 
			model.addObject("result",result);   
			model.addObject("action",action);
	        model.setViewName("redirect:/HeadOffice_config");
	        logger.info("<<<<<<<<<<<<<< END insertheadoffice_config >>>>>>>>>>>>>>" );
	        return model;
	    }
		
		@RequestMapping(value = "/updateheadoffice_config", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView updateheadoffice_config(ModelAndView model, HeadOffice_ConfigVO headoffice_config, String action) throws IllegalStateException, IOException
		{
			logger.info("<<<<<<<<<<<<<< START updateheadoffice_config >>>>>>>>>>>>>>" );
			int result = headofficeDao.updateheadoffice_config(headoffice_config);
			model.addObject("result",result); 
			model.addObject("action",action);
	        model.setViewName("redirect:/HeadOffice_config");
	        logger.info("<<<<<<<<<<<<<< END updateheadoffice_config >>>>>>>>>>>>>>" );
	        return model;
	    }
		
		
		 @RequestMapping(value = "/deleteheadoffice_config", method = { RequestMethod.GET, RequestMethod.POST })
		 public ModelAndView deleteheadoffice_config(ModelAndView model, String b_sequence, String action)
	    {
	        logger.info("<<<<<<<<<<<<<< START deleteheadoffice_config >>>>>>>>>>>>>>" );
	        int result = headofficeDao.deleteHeadOffice_config(b_sequence);
	        model.addObject("result",result);
			model.addObject("action",action);
	        model.setViewName("redirect:/HeadOffice_config");
	        logger.info("<<<<<<<<<<<<<< END deleteheadoffice_config >>>>>>>>>>>>>>" );
	        return model;
	    }
	 
}