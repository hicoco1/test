package com.mrs;
 
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.mrs.Dao.BranchInfoDao;
import com.mrs.Vo.Afd_userinfoVO;
import com.mrs.Vo.BranchOfficeInfo_AnnVO;
import com.mrs.Vo.BranchOfficeInfo_B_Sw_VerVO;
import com.mrs.Vo.BranchOfficeInfo_CidVO;
import com.mrs.Vo.BranchOfficeInfo_Cid_Sw_VerVO;
import com.mrs.Vo.BranchOfficeInfo_PrinterVO;
import com.mrs.Vo.BranchOfficeInfo_R_Sw_VerVO;
import com.mrs.Vo.BranchOfficeInfo_S_Sw_VerVO;
import com.mrs.Vo.BranchOfficeInfo_Sapp_Sw_VerVO;
import com.mrs.Vo.BranchOfficeInfo_Sw_HisVO;
import com.mrs.Vo.BranchOfficeInfo_Sw_VerVO;
import com.mrs.Vo.developer_Fee_ConfigVO;
import com.mrs.util.Page;


@Controller
public class BranchOfficeInfoController  {
 
	private static final Logger logger = LoggerFactory.getLogger(BranchOfficeInfoController.class);
	
	// 프로퍼티 객체 주입
	@Resource(name = "mrs_prop")
	private Properties mrs_prop; // vxml_url     = ems_prop.getProperty("pvsvxml.url"); 프로퍼티에서 일케 가져와도 대여.

	@Resource(name="BranchInfoDao")                 
    private BranchInfoDao branchinfoDao; 

	/*프린터 단말기 정보 메뉴*/
	@RequestMapping(value = "/BranchOfficeInfo_main" , method = {RequestMethod.GET, RequestMethod.POST })
	public ModelAndView BranchOfficeInfo(Principal principal, String searchFlag, String searchContent, String pageNo,String pageSize, String result, String action) throws UnsupportedEncodingException {
		logger.info("<<<<<<<<<<<<<< START BranchOfficeInfo_main >>>>>>>>>>>>>>" );
		ModelAndView model = new ModelAndView();
		BranchOfficeInfo_PrinterVO branchofficeinfo_printer = new BranchOfficeInfo_PrinterVO();
		
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
			branchofficeinfo_printer.setPageNo(Integer.parseInt(pageNo));
		}else {
			branchofficeinfo_printer.setPageNo(a);
		}
		if(pageSize != null){
			branchofficeinfo_printer.setPageSize(Integer.parseInt(pageSize));
		}else {
			branchofficeinfo_printer.setPageSize(b);
		}
		
		if(Integer.parseInt(pageNo) <= 0) branchofficeinfo_printer.setPageNo(1);
        if(Integer.parseInt(pageSize)<= 0)branchofficeinfo_printer.setPageSize(10);
        int pageno = branchofficeinfo_printer.getPageNo();
        
	        if(searchFlag != null){
	        	
	            if(searchFlag.equals("1")) {    
	            	branchofficeinfo_printer.setPrinter_id(searchContent);
	            }
	            if(searchFlag.equals("2")) {    
	            	branchofficeinfo_printer.setPrinter_detail(searchContent);
	            }
	        }    
	            
	        
	        List<BranchOfficeInfo_PrinterVO> list = null;
	        int totalCount = 0;
	        totalCount = branchinfoDao.getBranchOfficeInfoListCount(branchofficeinfo_printer);
	        int maxIdx_Printer = 0;
			maxIdx_Printer = branchinfoDao.getMaxIdx_Printer(branchofficeinfo_printer);
	        list = branchinfoDao.getBranchOfficeInfoList(branchofficeinfo_printer);  
	        String name = principal.getName();
	        
			model.addObject("username", name);
	        model.addObject("totalCount", totalCount);
	        model.addObject("maxIdx_Printer", maxIdx_Printer);
	        model.addObject("list", list);
	        model.addObject("searchContent", searchContent);
	        model.addObject("searchFlag", searchFlag);
	        model.addObject("action", action);
	        model.addObject("result", result);
	        model.addObject("pageno", pageno);
	        model.addObject("pageInfo", Page.getPageMap(branchofficeinfo_printer.getPageNo(), totalCount , branchofficeinfo_printer.getPageSize(), 10));
			model.setViewName(".BranchOfficeInfo_main"); 
			logger.info("<<<<<<<<<<<<<< END BranchOfficeInfo_main >>>>>>>>>>>>>>" );
			return model;
	}
	

	@RequestMapping(value = "/insertbranchofficeinfo", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView insertbranchofficeinfo(ModelAndView model, BranchOfficeInfo_PrinterVO branchofficeinfo_printer, String action) throws IllegalStateException, IOException
	{
		logger.info("<<<<<<<<<<<<<< START insertbranchofficeinfo >>>>>>>>>>>>>>" );
	    
		int result = branchinfoDao.insertbranchofficeinfo(branchofficeinfo_printer);
		model.addObject("result",result);   
        model.addObject("action",action);
        model.setViewName("redirect:/BranchOfficeInfo_main");
        logger.info("<<<<<<<<<<<<<< END insertbranchofficeinfo >>>>>>>>>>>>>>" );
        return model;
    }
	
	@RequestMapping(value = "/updatebranchofficeinfo", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView updatebranchofficeinfo(ModelAndView model, BranchOfficeInfo_PrinterVO branchofficeinfo_printer, String action, String searchFlag, String searchContent, String pageNo) throws IllegalStateException, IOException
	{
		logger.info("<<<<<<<<<<<<<< START updatebranchofficeinfo >>>>>>>>>>>>>>" );
		int result = branchinfoDao.updatebranchofficeinfo(branchofficeinfo_printer);
	
		model.addObject("result",result);   
		model.addObject("action",action); 
		model.addObject("pageNo",pageNo);
		model.addObject("searchFlag",searchFlag);
		model.addObject("searchContent", searchContent);
        model.setViewName("redirect:/BranchOfficeInfo_main");
        logger.info("<<<<<<<<<<<<<< END updatebranchofficeinfo >>>>>>>>>>>>>>" );
        return model;
    }
	
	 @RequestMapping(value = "/deletebranchofficeinfo", method = { RequestMethod.GET, RequestMethod.POST })
	 public ModelAndView deletebranchofficeinfo(ModelAndView model, String idx, String action, String searchFlag, String searchContent, String pageNo)
    {
        logger.info("<<<<<<<<<<<<<< START deletebranchofficeinfo >>>>>>>>>>>>>>" );
        int result = branchinfoDao.deleteBranchOfficeInfo(idx);
        model.addObject("result",result);
        model.addObject("action",action); 
		model.addObject("pageNo",pageNo);
		model.addObject("searchFlag",searchFlag);
		model.addObject("searchContent", searchContent);
        model.setViewName("redirect:/BranchOfficeInfo_main");
        logger.info("<<<<<<<<<<<<<< END deletebranchofficeinfo >>>>>>>>>>>>>>" );
        return model;
    }
	 
	
	 
	
	 /*CID 단말기 정보 메뉴*/
	 /*프린터 단말기 정보 메뉴*/
		@RequestMapping(value = "/BranchOfficeInfo_cid" , method = {RequestMethod.GET, RequestMethod.POST })
		public ModelAndView BranchOfficeInfo_cid(Principal principal, String searchFlag, String searchContent, String pageNo,String pageSize, String result, String action) throws UnsupportedEncodingException {
			logger.info("<<<<<<<<<<<<<< START BranchOfficeInfo_cid >>>>>>>>>>>>>>" );
			ModelAndView model = new ModelAndView();
			BranchOfficeInfo_CidVO branchofficeinfo_cid = new BranchOfficeInfo_CidVO();
			
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
				branchofficeinfo_cid.setPageNo(Integer.parseInt(pageNo));
			}else {
				branchofficeinfo_cid.setPageNo(a);
			}
			if(pageSize != null){
				branchofficeinfo_cid.setPageSize(Integer.parseInt(pageSize));
			}else {
				branchofficeinfo_cid.setPageSize(b);
			}
			if(Integer.parseInt(pageNo) <= 0) branchofficeinfo_cid.setPageNo(1);
	        if(Integer.parseInt(pageSize)<= 0)branchofficeinfo_cid.setPageSize(10);
	        int pageno = branchofficeinfo_cid.getPageNo();
				
		        if(searchFlag != null){
		        	
		            if(searchFlag.equals("1")) {    
		            	branchofficeinfo_cid.setCid_id(searchContent);
		            }
		            
		            if(searchFlag.equals("2")) {    
		            	branchofficeinfo_cid.setCid_detail(searchContent);
		            }
		        }    
		            
		        
		        List<BranchOfficeInfo_CidVO> list = null;
		        int totalCount = 0;
		        totalCount = branchinfoDao.getBranchOfficeInfo_CidListCount(branchofficeinfo_cid);
		        int maxIdx_Cid = 0;
		        maxIdx_Cid = branchinfoDao.getMaxIdx_Cid(branchofficeinfo_cid);
		        list = branchinfoDao.getBranchOfficeInfo_CidList(branchofficeinfo_cid);  
		        String name = principal.getName();
		        
				model.addObject("username", name);
		        model.addObject("totalCount", totalCount);
		        model.addObject("maxIdx_Cid", maxIdx_Cid);
		        model.addObject("list", list);
		        model.addObject("searchContent", searchContent);
		        model.addObject("searchFlag", searchFlag);
		        model.addObject("action", action);
		        model.addObject("result", result);
		        model.addObject("pageno", pageno);
		        model.addObject("pageInfo", Page.getPageMap(branchofficeinfo_cid.getPageNo(), totalCount , branchofficeinfo_cid.getPageSize(), 10));
				model.setViewName(".BranchOfficeInfo_cid"); 
				logger.info("<<<<<<<<<<<<<< END BranchOfficeInfo_cid >>>>>>>>>>>>>>" );
				return model;
		}
		

		@RequestMapping(value = "/insertbranchofficeinfo_cid", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView insertbranchofficeinfo_cid(ModelAndView model, BranchOfficeInfo_CidVO branchofficeinfo_cid, String action) throws IllegalStateException, IOException
		{
			logger.info("<<<<<<<<<<<<<< START insertbranchofficeinfo_cid >>>>>>>>>>>>>>" );
			int result = branchinfoDao.insertbranchofficeinfo_cid(branchofficeinfo_cid);
		
			model.addObject("result",result);   
	        model.addObject("action",action);
	        model.setViewName("redirect:/BranchOfficeInfo_cid");
	        logger.info("<<<<<<<<<<<<<< END insertbranchofficeinfo_cid >>>>>>>>>>>>>>" );
	        return model;
	    }
		
		@RequestMapping(value = "/updatebranchofficeinfo_cid", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView updatebranchofficeinfo_cid(ModelAndView model, BranchOfficeInfo_CidVO branchofficeinfo_cid, String action, String searchFlag, String searchContent, String pageNo) throws IllegalStateException, IOException
		{
			logger.info("<<<<<<<<<<<<<< START updatebranchofficeinfo_cid >>>>>>>>>>>>>>" );
			int result = branchinfoDao.updatebranchofficeinfo_cid(branchofficeinfo_cid);
		
			model.addObject("result",result);   
			model.addObject("action",action);
			model.addObject("pageNo",pageNo);
			model.addObject("searchFlag",searchFlag);
			model.addObject("searchContent", searchContent);
	        model.setViewName("redirect:/BranchOfficeInfo_cid");
	        logger.info("<<<<<<<<<<<<<< END updatebranchofficeinfo_cid >>>>>>>>>>>>>>" );
	        return model;
	    }
		
		 @RequestMapping(value = "/deletebranchofficeinfo_cid", method = { RequestMethod.GET, RequestMethod.POST })
		 public ModelAndView deletebranchofficeinfo_cid(ModelAndView model, String idx, String action, String searchFlag, String searchContent, String pageNo)
	    {
	        logger.info("<<<<<<<<<<<<<< START deletebranchofficeinfo_cid >>>>>>>>>>>>>>" );
	        int result = branchinfoDao.deleteBranchOfficeInfo_Cid(idx);
	        model.addObject("result",result);
	        model.addObject("action",action);
			model.addObject("pageNo",pageNo);
			model.addObject("searchFlag",searchFlag);
			model.addObject("searchContent", searchContent);
	        model.setViewName("redirect:/BranchOfficeInfo_cid");
	        logger.info("<<<<<<<<<<<<<< END deletebranchofficeinfo_cid >>>>>>>>>>>>>>" );
	        return model;
	    }
		
		
		 /*지사 프로그램관리 메뉴*/
			@RequestMapping(value = "/BranchOfficeInfo_sw_ver" , method = {RequestMethod.GET, RequestMethod.POST })
			public ModelAndView BranchOfficeInfo_sw_ver(Principal principal, String searchFlag, String searchContent, String pageNo,String pageSize, String result, String action) throws UnsupportedEncodingException {
				logger.info("<<<<<<<<<<<<<< START BranchOfficeInfo_sw_ver >>>>>>>>>>>>>>" );
				ModelAndView model = new ModelAndView();
				BranchOfficeInfo_Sw_VerVO branchofficeinfo_sw_ver = new BranchOfficeInfo_Sw_VerVO();
				BranchOfficeInfo_Sw_HisVO branchofficeinfo_sw_his = new BranchOfficeInfo_Sw_HisVO();
				
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
					branchofficeinfo_sw_his.setPageNo(Integer.parseInt(pageNo));
				}else {
					branchofficeinfo_sw_his.setPageNo(a);
				}
				if(pageSize != null){
					branchofficeinfo_sw_his.setPageSize(Integer.parseInt(pageSize));
				}else {
					branchofficeinfo_sw_his.setPageSize(b);
				}
				if(Integer.parseInt(pageNo) <= 0) branchofficeinfo_sw_his.setPageNo(1);
		        if(Integer.parseInt(pageSize)<= 0)branchofficeinfo_sw_his.setPageSize(10);
		        int pageno = branchofficeinfo_sw_his.getPageNo();
					
			        if(searchFlag != null){
			            if(searchFlag.equals("1")) {    
			            	branchofficeinfo_sw_his.setBranch_sw_version(searchContent);
			            }
			            if(searchFlag.equals("2")) {    
			            	branchofficeinfo_sw_his.setBranch_sw_update(searchContent);
			            }
			        }    
			            
			        
			        List<BranchOfficeInfo_Sw_VerVO> list = null;
			        List<BranchOfficeInfo_Sw_HisVO> his_list = null;
			        
			        int totalCount = 0;
			        int his_totalCount = 0;
			        
			        totalCount = branchinfoDao.getBranchOfficeInfo_Sw_VerListCount(branchofficeinfo_sw_ver);
			        list = branchinfoDao.getBranchOfficeInfo_Sw_VerList(branchofficeinfo_sw_ver);
			        
			        his_totalCount = branchinfoDao.getBranchOfficeInfo_Sw_HisListCount(branchofficeinfo_sw_his);
			        his_list = branchinfoDao.getBranchOfficeInfo_Sw_HisList(branchofficeinfo_sw_his); 
			        
			        String name = principal.getName();
			        
					model.addObject("username", name);
			        model.addObject("totalCount", totalCount);
			        model.addObject("list", list);
			        model.addObject("his_totalCount", his_totalCount);
			        model.addObject("his_list", his_list);
			        model.addObject("searchContent", searchContent);
			        model.addObject("searchFlag", searchFlag);
			        model.addObject("action", action);
			        model.addObject("result", result);
			        model.addObject("pageno", pageno);
			        model.addObject("pageInfo", Page.getPageMap(branchofficeinfo_sw_his.getPageNo(), his_totalCount , branchofficeinfo_sw_his.getPageSize(), 10));
					model.setViewName(".BranchOfficeInfo_sw_ver"); 
					logger.info("<<<<<<<<<<<<<< END BranchOfficeInfo_sw_ver >>>>>>>>>>>>>>" );
					return model;
			}
			
			

			@RequestMapping(value = "/insertbranchofficeinfo_sw_ver", method = { RequestMethod.GET, RequestMethod.POST })
			public ModelAndView insertbranchofficeinfo_sw_ver(ModelAndView model, BranchOfficeInfo_Sw_VerVO branchofficeinfo_sw_ver, String action) throws IllegalStateException, IOException
			{
				logger.info("<<<<<<<<<<<<<< START insertbranchofficeinfo_sw_ver >>>>>>>>>>>>>>" );
				
				int result = branchinfoDao.insertbranchofficeinfo_sw_ver(branchofficeinfo_sw_ver);
			
				model.addObject("result",result);   
		        model.addObject("action",action);
		        model.setViewName("redirect:/BranchOfficeInfo_sw_ver");
		        logger.info("<<<<<<<<<<<<<< END insertbranchofficeinfo_sw_ver >>>>>>>>>>>>>>" );
		        return model;
		    }
			
		
			
			@RequestMapping(value = " /updatebranchofficeinfo_sw_ver", method = { RequestMethod.GET, RequestMethod.POST })
			public ModelAndView updatebranchofficeinfo_sw_ver(ModelAndView model, BranchOfficeInfo_Sw_VerVO branchofficeinfo_sw_ver, String action, String searchFlag, String searchContent, String pageNo, String branch_sw_update_org) throws IllegalStateException
			{
				logger.info("<<<<<<<<<<<<<< START updatebranchofficeinfo_sw_ver >>>>>>>>>>>>>>" );
				BranchOfficeInfo_Sw_HisVO branchofficeinfo_sw_his = new BranchOfficeInfo_Sw_HisVO();
				
				int result = branchinfoDao.updatebranchofficeinfo_sw_ver(branchofficeinfo_sw_ver);
				/*지사CS S/W관리 이력*/
				branchofficeinfo_sw_his.setVersion(branchofficeinfo_sw_ver.getBranch_sw_version());
				branchofficeinfo_sw_his.setUp_date(branchofficeinfo_sw_ver.getBranch_sw_update());
				branchofficeinfo_sw_his.setMemo(branchofficeinfo_sw_ver.getBranch_sw_memo());
				branchinfoDao.insertsw_his(branchofficeinfo_sw_his);
				
				 MultipartFile uploadfile = branchofficeinfo_sw_ver.getUploadfile();
				 
				 if(!branchofficeinfo_sw_ver.getBranch_sw_version_org().equals(branchofficeinfo_sw_ver.getBranch_sw_version())) {
			        if (uploadfile != null) {
			        	String path =  mrs_prop.getProperty("fileup.filepath");
			            String fileName = uploadfile.getOriginalFilename();
			            String re_fileName = "BranchCS_"+branchofficeinfo_sw_ver.getBranch_sw_version()+".zip";
			           
			            try {
			                File file = new File(path + re_fileName);
			                
			                System.out.println(file.length());
			                uploadfile.transferTo(file);
			            } catch (IOException e) {
			                e.printStackTrace();
			            } // try - catch
			        } // if
				 }
				
				model.addObject("result",result);
				model.addObject("action",action); 
				model.addObject("pageNo",pageNo);
				model.addObject("searchFlag",searchFlag);
				model.addObject("searchContent", searchContent);
		        model.setViewName("redirect:/BranchOfficeInfo_sw_ver");
		        logger.info("<<<<<<<<<<<<<< END updatebranchofficeinfo_sw_ver >>>>>>>>>>>>>>" );
		        return model;
		    }
			
			
			@RequestMapping(value = " /applybranchofficeinfo_sw_ver", method = { RequestMethod.GET, RequestMethod.POST })
			public ModelAndView applybranchofficeinfo_sw_ver(ModelAndView model, BranchOfficeInfo_Sw_VerVO branchofficeinfo_sw_ver, String action, String searchFlag, String searchContent, String pageNo, String branch_sw_update_org) throws IllegalStateException
			{
				logger.info("<<<<<<<<<<<<<< START applybranchofficeinfo_sw_ver >>>>>>>>>>>>>>" );
				BranchOfficeInfo_Sw_HisVO branchofficeinfo_sw_his = new BranchOfficeInfo_Sw_HisVO();
				branchofficeinfo_sw_his.setBranch_sw_version_org(branchofficeinfo_sw_ver.getBranch_sw_version());
				
				int result = branchinfoDao.applybranchofficeinfo_sw_ver(branchofficeinfo_sw_ver);  
				
				model.addObject("result",result);
				model.addObject("action",action); 
				model.addObject("pageNo",pageNo);
				model.addObject("searchFlag",searchFlag);
				model.addObject("searchContent", searchContent);
		        model.setViewName("redirect:/BranchOfficeInfo_sw_ver");
		        logger.info("<<<<<<<<<<<<<< END applybranchofficeinfo_sw_ver >>>>>>>>>>>>>>" );
		        return model;
		    }
			
			 @RequestMapping(value = "/deletebranchofficeinfo_sw_ver", method = { RequestMethod.GET, RequestMethod.POST })
			 public ModelAndView deletebranchofficeinfo_sw_ver(ModelAndView model, String branch_sw_version, String action, String searchFlag, String searchContent, String pageNo)
		    {
		        logger.info("<<<<<<<<<<<<<< START deletebranchofficeinfo_sw_ver >>>>>>>>>>>>>>" );
		        int result = branchinfoDao.deleteBranchOfficeInfo_Sw_Ver(branch_sw_version);
		        model.addObject("result",result);
		        model.addObject("action",action); 
				model.addObject("pageNo",pageNo);
				model.addObject("searchFlag",searchFlag);
				model.addObject("searchContent", searchContent);
		        model.setViewName("redirect:/BranchOfficeInfo_sw_ver");
		        logger.info("<<<<<<<<<<<<<< END deletebranchofficeinfo_sw_ver >>>>>>>>>>>>>>" );
		        return model;
		    }
			 
		
			 
		 /*상점 프로그램관리 메뉴*/
		@RequestMapping(value = "/BranchOfficeInfo_s_sw_ver" , method = {RequestMethod.GET, RequestMethod.POST })
		public ModelAndView BranchOfficeInfo_s_sw_ver(Principal principal, String searchFlag, String searchContent, String pageNo,String pageSize, String result, String action) throws UnsupportedEncodingException {
			logger.info("<<<<<<<<<<<<<< START BranchOfficeInfo_s_sw_ver >>>>>>>>>>>>>>" );
			ModelAndView model = new ModelAndView();
			BranchOfficeInfo_S_Sw_VerVO branchofficeinfo_s_sw_ver = new BranchOfficeInfo_S_Sw_VerVO();
			BranchOfficeInfo_Sw_HisVO branchofficeinfo_sw_his = new BranchOfficeInfo_Sw_HisVO();
			
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
				branchofficeinfo_sw_his.setPageNo(Integer.parseInt(pageNo));
			}else {
				branchofficeinfo_sw_his.setPageNo(a);
			}
			if(pageSize != null){
				branchofficeinfo_sw_his.setPageSize(Integer.parseInt(pageSize));
			}else {
				branchofficeinfo_sw_his.setPageSize(b);
			}
			if(Integer.parseInt(pageNo) <= 0) branchofficeinfo_sw_his.setPageNo(1);
	        if(Integer.parseInt(pageSize)<= 0)branchofficeinfo_sw_his.setPageSize(10);
	        int pageno = branchofficeinfo_sw_his.getPageNo();
				
		        if(searchFlag != null){
		        	
		            if(searchFlag.equals("1")) {    
		            	branchofficeinfo_sw_his.setStore_sw_version(searchContent);
		            }
		            if(searchFlag.equals("2")) {    
		            	branchofficeinfo_sw_his.setStore_sw_update(searchContent);
		            }
		        }    
		            
		        
		        List<BranchOfficeInfo_S_Sw_VerVO> list = null;
		        List<BranchOfficeInfo_Sw_HisVO> his_list = null;
		        
		        int totalCount = 0;
		        int his_totalCount = 0;
		        
		        totalCount = branchinfoDao.getBranchOfficeInfo_S_Sw_VerListCount(branchofficeinfo_s_sw_ver);
		        list = branchinfoDao.getBranchOfficeInfo_S_Sw_VerList(branchofficeinfo_s_sw_ver); 
		        
		        his_totalCount = branchinfoDao.getBranchOfficeInfo_S_Sw_HisListCount(branchofficeinfo_sw_his);
		        his_list = branchinfoDao.getBranchOfficeInfo_S_Sw_HisList(branchofficeinfo_sw_his);
		        
		        String name = principal.getName();
		        
				model.addObject("username", name);
		        model.addObject("totalCount", totalCount);
		        model.addObject("list", list);
		        model.addObject("his_totalCount", his_totalCount);
		        model.addObject("his_list", his_list);
		        model.addObject("searchContent", searchContent);
		        model.addObject("searchFlag", searchFlag);
		        model.addObject("action", action);
		        model.addObject("result", result);
		        model.addObject("pageno", pageno);
		        model.addObject("pageInfo", Page.getPageMap(branchofficeinfo_sw_his.getPageNo(), totalCount , branchofficeinfo_sw_his.getPageSize(), 10));
				model.setViewName(".BranchOfficeInfo_s_sw_ver"); 
				logger.info("<<<<<<<<<<<<<< END BranchOfficeInfo_s_sw_ver >>>>>>>>>>>>>>" );
				return model;
		}
		

		@RequestMapping(value = "/insertbranchofficeinfo_s_sw_ver", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView insertbranchofficeinfo_s_sw_ver(ModelAndView model, BranchOfficeInfo_S_Sw_VerVO branchofficeinfo_s_sw_ver, String action) throws IllegalStateException, IOException
		{
			logger.info("<<<<<<<<<<<<<< START insertbranchofficeinfo_s_sw_ver >>>>>>>>>>>>>>" );
			int result = branchinfoDao.insertbranchofficeinfo_s_sw_ver(branchofficeinfo_s_sw_ver);
		
			model.addObject("result",result);   
	        model.addObject("action",action);
	        model.setViewName("redirect:/BranchOfficeInfo_s_sw_ver");
	        logger.info("<<<<<<<<<<<<<< END insertbranchofficeinfo_s_sw_ver >>>>>>>>>>>>>>" );
	        return model;
	    }
		
		@RequestMapping(value = "/updatebranchofficeinfo_s_sw_ver", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView updatebranchofficeinfo_s_sw_ver(ModelAndView model, BranchOfficeInfo_S_Sw_VerVO branchofficeinfo_s_sw_ver, String action, String searchFlag, String searchContent, String pageNo, String store_sw_update_org) throws IllegalStateException
		{
			logger.info("<<<<<<<<<<<<<< START updatebranchofficeinfo_s_sw_ver >>>>>>>>>>>>>>" );
			BranchOfficeInfo_Sw_HisVO branchofficeinfo_sw_his = new BranchOfficeInfo_Sw_HisVO();
			
			int result = branchinfoDao.updatebranchofficeinfo_s_sw_ver(branchofficeinfo_s_sw_ver);
			branchofficeinfo_sw_his.setVersion(branchofficeinfo_s_sw_ver.getStore_sw_version());
			branchofficeinfo_sw_his.setUp_date(branchofficeinfo_s_sw_ver.getStore_sw_update());
			branchofficeinfo_sw_his.setMemo(branchofficeinfo_s_sw_ver.getStore_sw_memo());
			branchinfoDao.inserts_sw_his(branchofficeinfo_sw_his);
			
			MultipartFile uploadfile = branchofficeinfo_s_sw_ver.getUploadfile(); 
			if(!branchofficeinfo_s_sw_ver.getStore_sw_version_org().equals(branchofficeinfo_s_sw_ver.getStore_sw_version())) {
		        if (uploadfile != null) {
		        	String path =  mrs_prop.getProperty("fileup.filepath");
		            String fileName = uploadfile.getOriginalFilename();
		            String re_fileName = "StoreCS_"+branchofficeinfo_s_sw_ver.getStore_sw_version()+".zip";
		           
		            try {
		                File file = new File(path + re_fileName);
		                
		                System.out.println(file.length());
		                uploadfile.transferTo(file);
		            } catch (IOException e) {
		                e.printStackTrace();
		            } // try - catch
		        } // if
			}
			
			model.addObject("result",result);   
			model.addObject("action",action);
			model.addObject("pageNo",pageNo);
			model.addObject("searchFlag",searchFlag);
			model.addObject("searchContent", searchContent);
	        model.setViewName("redirect:/BranchOfficeInfo_s_sw_ver");
	        logger.info("<<<<<<<<<<<<<< END updatebranchofficeinfo_s_sw_ver >>>>>>>>>>>>>>" );
	        return model;
	    }
		
		 @RequestMapping(value = "/deletebranchofficeinfo_s_sw_ver", method = { RequestMethod.GET, RequestMethod.POST })
		 public ModelAndView deletebranchofficeinfo_s_sw_ver(ModelAndView model, String store_sw_version, String action, String searchFlag, String searchContent, String pageNo)
	    {
	        logger.info("<<<<<<<<<<<<<< START deletebranchofficeinfo_s_sw_ver >>>>>>>>>>>>>>" );
	        int result = branchinfoDao.deleteBranchOfficeInfo_S_Sw_Ver(store_sw_version);
	        model.addObject("result",result);
	        model.addObject("action",action);
			model.addObject("pageNo",pageNo);
			model.addObject("searchFlag",searchFlag);
			model.addObject("searchContent", searchContent);
	        model.setViewName("redirect:/BranchOfficeInfo_s_sw_ver");
	        logger.info("<<<<<<<<<<<<<< END deletebranchofficeinfo_s_sw_ver >>>>>>>>>>>>>>" );
	        return model;
	    }
		 
		 @RequestMapping(value = " /applybranchofficeinfo_s_sw_ver", method = { RequestMethod.GET, RequestMethod.POST })
			public ModelAndView applybranchofficeinfo_s_sw_ver(ModelAndView model, BranchOfficeInfo_S_Sw_VerVO branchofficeinfo_s_sw_ver, String action, String searchFlag, String searchContent, String pageNo, String branch_sw_update_org) throws IllegalStateException
			{
				logger.info("<<<<<<<<<<<<<< START applybranchofficeinfo_s_sw_ver >>>>>>>>>>>>>>" );
				BranchOfficeInfo_Sw_HisVO branchofficeinfo_sw_his = new BranchOfficeInfo_Sw_HisVO();
				branchofficeinfo_sw_his.setStore_sw_version_org(branchofficeinfo_s_sw_ver.getStore_sw_version());
				
				int result = branchinfoDao.applybranchofficeinfo_s_sw_ver(branchofficeinfo_s_sw_ver); 
				
				model.addObject("result",result);
				model.addObject("action",action); 
				model.addObject("pageNo",pageNo);
				model.addObject("searchFlag",searchFlag);
				model.addObject("searchContent", searchContent);
		        model.setViewName("redirect:/BranchOfficeInfo_s_sw_ver");
		        logger.info("<<<<<<<<<<<<<< END applybranchofficeinfo_s_sw_ver >>>>>>>>>>>>>>" );
		        return model;
		    }
		 
		 /*상점CID 프로그램관리 메뉴*/
			@RequestMapping(value = "/BranchOfficeInfo_cid_sw_ver" , method = {RequestMethod.GET, RequestMethod.POST })
			public ModelAndView BranchOfficeInfo_cid_sw_ver(Principal principal, String searchFlag, String searchContent, String pageNo,String pageSize, String result, String action) throws UnsupportedEncodingException {
				logger.info("<<<<<<<<<<<<<< START BranchOfficeInfo_cid_sw_ver >>>>>>>>>>>>>>" );
				ModelAndView model = new ModelAndView();
				BranchOfficeInfo_Cid_Sw_VerVO branchofficeinfo_cid_sw_ver = new BranchOfficeInfo_Cid_Sw_VerVO();
				BranchOfficeInfo_Sw_HisVO branchofficeinfo_sw_his = new BranchOfficeInfo_Sw_HisVO();
				
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
					branchofficeinfo_sw_his.setPageNo(Integer.parseInt(pageNo));
				}else {
					branchofficeinfo_sw_his.setPageNo(a);
				}
				if(pageSize != null){
					branchofficeinfo_sw_his.setPageSize(Integer.parseInt(pageSize));
				}else {
					branchofficeinfo_sw_his.setPageSize(b);
				}
				if(Integer.parseInt(pageNo) <= 0) branchofficeinfo_sw_his.setPageNo(1);
		        if(Integer.parseInt(pageSize)<= 0)branchofficeinfo_sw_his.setPageSize(10);
		        int pageno = branchofficeinfo_sw_his.getPageNo();
					
			        if(searchFlag != null){
			        	
			            if(searchFlag.equals("1")) {    
			            	branchofficeinfo_sw_his.setStore_cid_sw_version(searchContent);
			            }
			            if(searchFlag.equals("2")) {    
			            	branchofficeinfo_sw_his.setStore_cid_sw_update(searchContent);
			            }
			        }    
			            
			        
			        List<BranchOfficeInfo_Cid_Sw_VerVO> list = null;
			        List<BranchOfficeInfo_Sw_HisVO> his_list = null;
			        
			        int totalCount = 0;
			        int his_totalCount = 0;
			        
			        totalCount = branchinfoDao.getBranchOfficeInfo_Cid_Sw_VerListCount(branchofficeinfo_cid_sw_ver);
			        list = branchinfoDao.getBranchOfficeInfo_Cid_Sw_VerList(branchofficeinfo_cid_sw_ver); 
			        
			        his_totalCount = branchinfoDao.getBranchOfficeInfo_Cid_Sw_HisListCount(branchofficeinfo_sw_his);
			        his_list = branchinfoDao.getBranchOfficeInfo_Cid_Sw_HisList(branchofficeinfo_sw_his);
			        
			        String name = principal.getName();
			        
					model.addObject("username", name);
			        model.addObject("totalCount", totalCount);
			        model.addObject("list", list);
			        model.addObject("his_totalCount", his_totalCount);
			        model.addObject("his_list", his_list);
			        model.addObject("searchContent", searchContent);
			        model.addObject("searchFlag", searchFlag);
			        model.addObject("action", action);
			        model.addObject("result", result);
			        model.addObject("pageno", pageno);
			        model.addObject("pageInfo", Page.getPageMap(branchofficeinfo_sw_his.getPageNo(), totalCount , branchofficeinfo_sw_his.getPageSize(), 10));
					model.setViewName(".BranchOfficeInfo_cid_sw_ver"); 
					logger.info("<<<<<<<<<<<<<< END BranchOfficeInfo_cid_sw_ver >>>>>>>>>>>>>>" );
					return model;
			}
			

			@RequestMapping(value = "/insertbranchofficeinfo_cid_sw_ver", method = { RequestMethod.GET, RequestMethod.POST })
			public ModelAndView insertbranchofficeinfo_cid_sw_ver(ModelAndView model, BranchOfficeInfo_Cid_Sw_VerVO branchofficeinfo_cid_sw_ver, String action) throws IllegalStateException, IOException
			{
				logger.info("<<<<<<<<<<<<<< START insertbranchofficeinfo_cid_sw_ver >>>>>>>>>>>>>>" );
				int result = branchinfoDao.insertbranchofficeinfo_cid_sw_ver(branchofficeinfo_cid_sw_ver);
			
				model.addObject("result",result);   
		        model.addObject("action",action);
		        model.setViewName("redirect:/BranchOfficeInfo_cid_sw_ver");
		        logger.info("<<<<<<<<<<<<<< END insertbranchofficeinfo_cid_sw_ver >>>>>>>>>>>>>>" );
		        return model;
		    }
			
			@RequestMapping(value = "/updatebranchofficeinfo_cid_sw_ver", method = { RequestMethod.GET, RequestMethod.POST })
			public ModelAndView updatebranchofficeinfo_cid_sw_ver(ModelAndView model, BranchOfficeInfo_Cid_Sw_VerVO branchofficeinfo_cid_sw_ver, String action, String searchFlag, String searchContent, String pageNo, String store_cid_sw_update_org) throws IllegalStateException, IOException
			{
				logger.info("<<<<<<<<<<<<<< START updatebranchofficeinfo_cid_sw_ver >>>>>>>>>>>>>>" );
				BranchOfficeInfo_Sw_HisVO branchofficeinfo_sw_his = new BranchOfficeInfo_Sw_HisVO();
				
				int result = branchinfoDao.updatebranchofficeinfo_cid_sw_ver(branchofficeinfo_cid_sw_ver);
				branchofficeinfo_sw_his.setVersion(branchofficeinfo_cid_sw_ver.getStore_cid_sw_version());
				branchofficeinfo_sw_his.setUp_date(branchofficeinfo_cid_sw_ver.getStore_cid_sw_update());
				branchofficeinfo_sw_his.setMemo(branchofficeinfo_cid_sw_ver.getStore_cid_sw_memo());
				branchinfoDao.insertcid_sw_his(branchofficeinfo_sw_his);
				MultipartFile uploadfile = branchofficeinfo_cid_sw_ver.getUploadfile(); 
				 
				if(!branchofficeinfo_cid_sw_ver.getStore_cid_sw_version_org().equals(branchofficeinfo_cid_sw_ver.getStore_cid_sw_version())) {
			        if (uploadfile != null) {
			        	String path =  mrs_prop.getProperty("fileup.filepath");
			            String fileName = uploadfile.getOriginalFilename();
			            String re_fileName = "StoreCID_"+branchofficeinfo_cid_sw_ver.getStore_cid_sw_version()+".zip";
			           
			            try {
			                File file = new File(path + re_fileName);
			                
			                System.out.println(file.length());
			                uploadfile.transferTo(file);
			            } catch (IOException e) {
			                e.printStackTrace();
			            } // try - catch
			        } // if
				}
			
				model.addObject("result",result);   
				model.addObject("action",action);
				model.addObject("pageNo",pageNo);
				model.addObject("searchFlag",searchFlag);
				model.addObject("searchContent", searchContent);
		        model.setViewName("redirect:/BranchOfficeInfo_cid_sw_ver");
		        logger.info("<<<<<<<<<<<<<< END updatebranchofficeinfo_cid_sw_ver >>>>>>>>>>>>>>" );
		        return model;
		    }
			
			 @RequestMapping(value = "/deletebranchofficeinfo_cid_sw_ver", method = { RequestMethod.GET, RequestMethod.POST })
			 public ModelAndView deletebranchofficeinfo_cid_sw_ver(ModelAndView model, String store_cid_sw_version, String action, String searchFlag, String searchContent, String pageNo)
		    {
		        logger.info("<<<<<<<<<<<<<< START deletebranchofficeinfo_cid_sw_ver >>>>>>>>>>>>>>" );
		        int result = branchinfoDao.deleteBranchOfficeInfo_Cid_Sw_Ver(store_cid_sw_version);
		        model.addObject("result",result);
		        model.addObject("action",action);
				model.addObject("pageNo",pageNo);
				model.addObject("searchFlag",searchFlag);
				model.addObject("searchContent", searchContent);
		        model.setViewName("redirect:/BranchOfficeInfo_cid_sw_ver");
		        logger.info("<<<<<<<<<<<<<< END deletebranchofficeinfo_cid_sw_ver >>>>>>>>>>>>>>" );
		        return model;
		    }
			 
			 @RequestMapping(value = " /applybranchofficeinfo_cid_sw_ver", method = { RequestMethod.GET, RequestMethod.POST })
				public ModelAndView applybranchofficeinfo_cid_sw_ver(ModelAndView model, BranchOfficeInfo_Cid_Sw_VerVO branchofficeinfo_cid_sw_ver, String action, String searchFlag, String searchContent, String pageNo, String branch_sw_update_org) throws IllegalStateException
				{
					logger.info("<<<<<<<<<<<<<< START applybranchofficeinfo_cid_sw_ver >>>>>>>>>>>>>>" );
					BranchOfficeInfo_Sw_HisVO branchofficeinfo_sw_his = new BranchOfficeInfo_Sw_HisVO();
					branchofficeinfo_sw_his.setStore_cid_sw_version_org(branchofficeinfo_cid_sw_ver.getStore_cid_sw_version());
					
					int result = branchinfoDao.applybranchofficeinfo_cid_sw_ver(branchofficeinfo_cid_sw_ver); 
					
					model.addObject("result",result);
					model.addObject("action",action); 
					model.addObject("pageNo",pageNo);
					model.addObject("searchFlag",searchFlag);
					model.addObject("searchContent", searchContent);
			        model.setViewName("redirect:/BranchOfficeInfo_cid_sw_ver");
			        logger.info("<<<<<<<<<<<<<< END applybranchofficeinfo_cid_sw_ver >>>>>>>>>>>>>>" );
			        return model;
			    }
			 
			 /*지사App SW 버전 관리 메뉴*/
				@RequestMapping(value = "/BranchOfficeInfo_b_sw_ver" , method = {RequestMethod.GET, RequestMethod.POST })
				public ModelAndView BranchOfficeInfo_b_sw_ver(Principal principal, String searchFlag, String searchContent, String pageNo,String pageSize, String result, String action) throws UnsupportedEncodingException {
					logger.info("<<<<<<<<<<<<<< START BranchOfficeInfo_b_sw_ver >>>>>>>>>>>>>>" );
					ModelAndView model = new ModelAndView();
					BranchOfficeInfo_B_Sw_VerVO branchofficeinfo_b_sw_ver = new BranchOfficeInfo_B_Sw_VerVO();
					BranchOfficeInfo_Sw_HisVO branchofficeinfo_sw_his = new BranchOfficeInfo_Sw_HisVO();
					
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
						branchofficeinfo_sw_his.setPageNo(Integer.parseInt(pageNo));
					}else {
						branchofficeinfo_sw_his.setPageNo(a);
					}
					if(pageSize != null){
						branchofficeinfo_sw_his.setPageSize(Integer.parseInt(pageSize));
					}else {
						branchofficeinfo_sw_his.setPageSize(b);
					}
					if(Integer.parseInt(pageNo) <= 0) branchofficeinfo_sw_his.setPageNo(1);
			        if(Integer.parseInt(pageSize)<= 0)branchofficeinfo_sw_his.setPageSize(10);
			        int pageno = branchofficeinfo_sw_his.getPageNo();
						
				        if(searchFlag != null){
				        	
				            if(searchFlag.equals("1")) {    
				            	branchofficeinfo_sw_his.setBranchapp_sw_version(searchContent);
				            }
				            if(searchFlag.equals("2")) {    
				            	branchofficeinfo_sw_his.setBranchapp_sw_update(searchContent);
				            }
				        }    
				            
				        
				        List<BranchOfficeInfo_B_Sw_VerVO> list = null;
				        List<BranchOfficeInfo_Sw_HisVO> his_list = null;
				        
				        int totalCount = 0;
				        int his_totalCount = 0;
				        
				        totalCount = branchinfoDao.getBranchOfficeInfo_B_Sw_VerListCount(branchofficeinfo_b_sw_ver);
				        list = branchinfoDao.getBranchOfficeInfo_B_Sw_VerList(branchofficeinfo_b_sw_ver); 
				        
				        his_totalCount = branchinfoDao.getBranchOfficeInfo_B_Sw_HisListCount(branchofficeinfo_sw_his);
				        his_list = branchinfoDao.getBranchOfficeInfo_B_Sw_HisList(branchofficeinfo_sw_his);
				        
				        String name = principal.getName();
				        
						model.addObject("username", name);
				        model.addObject("totalCount", totalCount);
				        model.addObject("list", list);
				        model.addObject("his_totalCount", his_totalCount);
				        model.addObject("his_list", his_list);
				        model.addObject("searchContent", searchContent);
				        model.addObject("searchFlag", searchFlag);
				        model.addObject("action", action);
				        model.addObject("result", result);
				        model.addObject("pageno", pageno);
				        model.addObject("pageInfo", Page.getPageMap(branchofficeinfo_sw_his.getPageNo(), totalCount , branchofficeinfo_sw_his.getPageSize(), 10));
						model.setViewName(".BranchOfficeInfo_b_sw_ver"); 
						logger.info("<<<<<<<<<<<<<< END BranchOfficeInfo_b_sw_ver >>>>>>>>>>>>>>" );
						return model;
				}
				

				@RequestMapping(value = "/insertbranchofficeinfo_b_sw_ver", method = { RequestMethod.GET, RequestMethod.POST }) 
				public ModelAndView insertbranchofficeinfo_b_sw_ver(ModelAndView model, BranchOfficeInfo_B_Sw_VerVO branchofficeinfo_b_sw_ver, String action) throws IllegalStateException, IOException
				{
					logger.info("<<<<<<<<<<<<<< START insertbranchofficeinfo_b_sw_ver >>>>>>>>>>>>>>" );
					int result = branchinfoDao.insertbranchofficeinfo_b_sw_ver(branchofficeinfo_b_sw_ver);
				
					model.addObject("result",result);   
			        model.addObject("action",action);
			        model.setViewName("redirect:/BranchOfficeInfo_b_sw_ver");
			        logger.info("<<<<<<<<<<<<<< END insertbranchofficeinfo_b_sw_ver >>>>>>>>>>>>>>" );
			        return model;
			    }
				
				@RequestMapping(value = "/updatebranchofficeinfo_b_sw_ver", method = { RequestMethod.GET, RequestMethod.POST })
				public ModelAndView updatebranchofficeinfo_b_sw_ver(ModelAndView model, BranchOfficeInfo_B_Sw_VerVO branchofficeinfo_b_sw_ver, String action, String searchFlag, String searchContent, String pageNo, String branchapp_sw_update_org) throws IllegalStateException, IOException
				{
					logger.info("<<<<<<<<<<<<<< START updatebranchofficeinfo_b_sw_ver >>>>>>>>>>>>>>" );
					BranchOfficeInfo_Sw_HisVO branchofficeinfo_sw_his = new BranchOfficeInfo_Sw_HisVO();
					
					int result = branchinfoDao.updatebranchofficeinfo_b_sw_ver(branchofficeinfo_b_sw_ver);
					branchofficeinfo_sw_his.setVersion(branchofficeinfo_b_sw_ver.getBranchapp_sw_version());
					branchofficeinfo_sw_his.setUp_date(branchofficeinfo_b_sw_ver.getBranchapp_sw_update());
					branchofficeinfo_sw_his.setMemo(branchofficeinfo_b_sw_ver.getBranchapp_sw_memo());
					branchinfoDao.insertb_sw_his(branchofficeinfo_sw_his);

					MultipartFile uploadfile = branchofficeinfo_b_sw_ver.getUploadfile(); 
					if(!branchofficeinfo_b_sw_ver.getBranchapp_sw_version_org().equals(branchofficeinfo_b_sw_ver.getBranchapp_sw_version())) {
						if (uploadfile != null) {
				        	String path =  mrs_prop.getProperty("fileup.filepath");
				            String fileName = uploadfile.getOriginalFilename();
				            String re_fileName = "BranchApp_"+branchofficeinfo_b_sw_ver.getBranchapp_sw_version()+".apk";
				           
				            try {
				                File file = new File(path + re_fileName);
				                
				                System.out.println(file.length());
				                uploadfile.transferTo(file);
				            } catch (IOException e) {
				                e.printStackTrace();
				            } // try - catch
				        } // if
					}
					
					model.addObject("result",result);   
					model.addObject("action",action);
					model.addObject("pageNo",pageNo);
					model.addObject("searchFlag",searchFlag);
					model.addObject("searchContent", searchContent);
			        model.setViewName("redirect:/BranchOfficeInfo_b_sw_ver");
			        logger.info("<<<<<<<<<<<<<< END updatebranchofficeinfo_b_sw_ver >>>>>>>>>>>>>>" );
			        return model;
			    }
				
				 @RequestMapping(value = "/deletebranchofficeinfo_b_sw_ver", method = { RequestMethod.GET, RequestMethod.POST })
				 public ModelAndView deletebranchofficeinfo_b_sw_ver(ModelAndView model, String branchapp_sw_version, String action, String searchFlag, String searchContent, String pageNo)
			    {
			        logger.info("<<<<<<<<<<<<<< START deletebranchofficeinfo_b_sw_ver >>>>>>>>>>>>>>" );
			        int result = branchinfoDao.deleteBranchOfficeInfo_B_Sw_Ver(branchapp_sw_version);
			        model.addObject("result",result);
			        model.addObject("action",action);
					model.addObject("pageNo",pageNo);
					model.addObject("searchFlag",searchFlag);
					model.addObject("searchContent", searchContent);
			        model.setViewName("redirect:/BranchOfficeInfo_b_sw_ver");
			        logger.info("<<<<<<<<<<<<<< END deletebranchofficeinfo_b_sw_ver >>>>>>>>>>>>>>" );
			        return model;
			    }
				 
				 
				 @RequestMapping(value = " /applybranchofficeinfo_b_sw_ver", method = { RequestMethod.GET, RequestMethod.POST })
					public ModelAndView applybranchofficeinfo_b_sw_ver(ModelAndView model, BranchOfficeInfo_B_Sw_VerVO branchofficeinfo_b_sw_ver, String action, String searchFlag, String searchContent, String pageNo, String branch_sw_update_org) throws IllegalStateException
					{
						logger.info("<<<<<<<<<<<<<< START applybranchofficeinfo_b_sw_ver >>>>>>>>>>>>>>" );
						BranchOfficeInfo_Sw_HisVO branchofficeinfo_sw_his = new BranchOfficeInfo_Sw_HisVO();
						branchofficeinfo_sw_his.setBranchapp_sw_version_org(branchofficeinfo_b_sw_ver.getBranchapp_sw_version());
						
						int result = branchinfoDao.applybranchofficeinfo_b_sw_ver(branchofficeinfo_b_sw_ver); 
						
						model.addObject("result",result);
						model.addObject("action",action); 
						model.addObject("pageNo",pageNo);
						model.addObject("searchFlag",searchFlag);
						model.addObject("searchContent", searchContent);
				        model.setViewName("redirect:/BranchOfficeInfo_b_sw_ver");
				        logger.info("<<<<<<<<<<<<<< END applybranchofficeinfo_b_sw_ver >>>>>>>>>>>>>>" );
				        return model;
				    }
				 
			 /*기사App SW 버전 관리 메뉴*/
				@RequestMapping(value = "/BranchOfficeInfo_r_sw_ver" , method = {RequestMethod.GET, RequestMethod.POST })
				public ModelAndView BranchOfficeInfo_r_sw_ver(Principal principal, String searchFlag, String searchContent, String pageNo,String pageSize, String result, String action) throws UnsupportedEncodingException {
					logger.info("<<<<<<<<<<<<<< START BranchOfficeInfo_r_sw_ver >>>>>>>>>>>>>>" );
					ModelAndView model = new ModelAndView();
					BranchOfficeInfo_R_Sw_VerVO branchofficeinfo_r_sw_ver = new BranchOfficeInfo_R_Sw_VerVO();
					BranchOfficeInfo_Sw_HisVO branchofficeinfo_sw_his = new BranchOfficeInfo_Sw_HisVO();
					
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
						branchofficeinfo_sw_his.setPageNo(Integer.parseInt(pageNo));
					}else {
						branchofficeinfo_sw_his.setPageNo(a);
					}
					if(pageSize != null){
						branchofficeinfo_sw_his.setPageSize(Integer.parseInt(pageSize));
					}else {
						branchofficeinfo_sw_his.setPageSize(b);
					}
					if(Integer.parseInt(pageNo) <= 0) branchofficeinfo_sw_his.setPageNo(1);
			        if(Integer.parseInt(pageSize)<= 0)branchofficeinfo_sw_his.setPageSize(10);
			        int pageno = branchofficeinfo_sw_his.getPageNo();
						
						
				        if(searchFlag != null){
				        	
				            if(searchFlag.equals("1")) {    
				            	branchofficeinfo_sw_his.setRiderapp_sw_version(searchContent);
				            }
				            if(searchFlag.equals("2")) {    
				            	branchofficeinfo_sw_his.setRiderapp_sw_update(searchContent);
				            }
				        }    
				            
				        
				        List<BranchOfficeInfo_R_Sw_VerVO> list = null;
				        List<BranchOfficeInfo_Sw_HisVO> his_list = null;
				        
				        int totalCount = 0;
				        int his_totalCount = 0;
				        
				        totalCount = branchinfoDao.getBranchOfficeInfo_R_Sw_VerListCount(branchofficeinfo_r_sw_ver);
				        list = branchinfoDao.getBranchOfficeInfo_R_Sw_VerList(branchofficeinfo_r_sw_ver); 
				        
				        his_totalCount = branchinfoDao.getBranchOfficeInfo_R_Sw_HisListCount(branchofficeinfo_sw_his);
				        his_list = branchinfoDao.getBranchOfficeInfo_R_Sw_HisList(branchofficeinfo_sw_his);
				        
				        String name = principal.getName();
				        
						model.addObject("username", name);
				        model.addObject("totalCount", totalCount);
				        model.addObject("list", list);
				        model.addObject("his_totalCount", his_totalCount);
				        model.addObject("his_list", his_list);
				        model.addObject("searchContent", searchContent);
				        model.addObject("searchFlag", searchFlag);
				        model.addObject("action", action);
				        model.addObject("result", result);
				        model.addObject("pageno", pageno);
				        model.addObject("pageInfo", Page.getPageMap(branchofficeinfo_sw_his.getPageNo(), totalCount , branchofficeinfo_sw_his.getPageSize(), 10));
						model.setViewName(".BranchOfficeInfo_r_sw_ver"); 
						logger.info("<<<<<<<<<<<<<< END BranchOfficeInfo_r_sw_ver >>>>>>>>>>>>>>" );
						return model;
				}
				

				@RequestMapping(value = "/insertbranchofficeinfo_r_sw_ver", method = { RequestMethod.GET, RequestMethod.POST }) 
				public ModelAndView insertbranchofficeinfo_r_sw_ver(ModelAndView model, BranchOfficeInfo_R_Sw_VerVO branchofficeinfo_r_sw_ver, String action) throws IllegalStateException, IOException
				{
					logger.info("<<<<<<<<<<<<<< START insertbranchofficeinfo_r_sw_ver >>>>>>>>>>>>>>" );
					int result = branchinfoDao.insertbranchofficeinfo_r_sw_ver(branchofficeinfo_r_sw_ver);
				
					model.addObject("result",result);   
			        model.addObject("action",action);
			        model.setViewName("redirect:/BranchOfficeInfo_r_sw_ver");
			        logger.info("<<<<<<<<<<<<<< END insertbranchofficeinfo_r_sw_ver >>>>>>>>>>>>>>" );
			        return model;
			    }
				
				@RequestMapping(value = "/updatebranchofficeinfo_r_sw_ver", method = { RequestMethod.GET, RequestMethod.POST })
				public ModelAndView updatebranchofficeinfo_r_sw_ver(ModelAndView model, BranchOfficeInfo_R_Sw_VerVO branchofficeinfo_r_sw_ver, String action, String searchFlag, String searchContent, String pageNo, String riderapp_sw_update_org) throws IllegalStateException, IOException
				{
					logger.info("<<<<<<<<<<<<<< START updatebranchofficeinfo_r_sw_ver >>>>>>>>>>>>>>" );
					BranchOfficeInfo_Sw_HisVO branchofficeinfo_sw_his = new BranchOfficeInfo_Sw_HisVO();
					
					int result = branchinfoDao.updatebranchofficeinfo_r_sw_ver(branchofficeinfo_r_sw_ver);
					branchofficeinfo_sw_his.setVersion(branchofficeinfo_r_sw_ver.getRiderapp_sw_version());
					branchofficeinfo_sw_his.setUp_date(branchofficeinfo_r_sw_ver.getRiderapp_sw_update());
					branchofficeinfo_sw_his.setMemo(branchofficeinfo_r_sw_ver.getRiderapp_sw_memo());
					branchinfoDao.insertr_sw_his(branchofficeinfo_sw_his);
					MultipartFile uploadfile = branchofficeinfo_r_sw_ver.getUploadfile(); 
					
					if(!branchofficeinfo_r_sw_ver.getRiderapp_sw_version_org().equals(branchofficeinfo_r_sw_ver.getRiderapp_sw_version())) {
						if (uploadfile != null) {
				        	String path =  mrs_prop.getProperty("fileup.filepath");
				            String fileName = uploadfile.getOriginalFilename();
				            String re_fileName = "RiderApp_"+branchofficeinfo_r_sw_ver.getRiderapp_sw_version()+".apk";
				           
				            try {
				                File file = new File(path + re_fileName);
				                
				                System.out.println(file.length());
				                uploadfile.transferTo(file);
				            } catch (IOException e) {
				                e.printStackTrace();
				            } // try - catch
				        } // if
					}
					
					model.addObject("result",result);   
					model.addObject("action",action);
					model.addObject("pageNo",pageNo);
					model.addObject("searchFlag",searchFlag);
					model.addObject("searchContent", searchContent);
			        model.setViewName("redirect:/BranchOfficeInfo_r_sw_ver");
			        logger.info("<<<<<<<<<<<<<< END updatebranchofficeinfo_r_sw_ver >>>>>>>>>>>>>>" );
			        return model;
			    }
				
				 @RequestMapping(value = "/deletebranchofficeinfo_r_sw_ver", method = { RequestMethod.GET, RequestMethod.POST })
				 public ModelAndView deletebranchofficeinfo_r_sw_ver(ModelAndView model, String riderapp_sw_version, String action, String searchFlag, String searchContent, String pageNo)
			    {
			        logger.info("<<<<<<<<<<<<<< START deletebranchofficeinfo_r_sw_ver >>>>>>>>>>>>>>" );
			        int result = branchinfoDao.deleteBranchOfficeInfo_R_Sw_Ver(riderapp_sw_version);
			        model.addObject("result",result);
			        model.addObject("action",action);
					model.addObject("pageNo",pageNo);
					model.addObject("searchFlag",searchFlag);
					model.addObject("searchContent", searchContent);
			        model.setViewName("redirect:/BranchOfficeInfo_r_sw_ver");
			        logger.info("<<<<<<<<<<<<<< END deletebranchofficeinfo_r_sw_ver >>>>>>>>>>>>>>" );
			        return model;
			    }


			@RequestMapping(value = " /applybranchofficeinfo_r_sw_ver", method = { RequestMethod.GET, RequestMethod.POST })
			public ModelAndView applybranchofficeinfo_r_sw_ver(ModelAndView model, BranchOfficeInfo_R_Sw_VerVO branchofficeinfo_r_sw_ver, String action, String searchFlag, String searchContent, String pageNo, String branch_sw_update_org) throws IllegalStateException
			{
				logger.info("<<<<<<<<<<<<<< START applybranchofficeinfo_r_sw_ver >>>>>>>>>>>>>>" );
				BranchOfficeInfo_Sw_HisVO branchofficeinfo_sw_his = new BranchOfficeInfo_Sw_HisVO();
				branchofficeinfo_sw_his.setRiderapp_sw_version_org(branchofficeinfo_r_sw_ver.getRiderapp_sw_version());
				
				int result = branchinfoDao.applybranchofficeinfo_r_sw_ver(branchofficeinfo_r_sw_ver); 
				
				model.addObject("result",result);
				model.addObject("action",action); 
				model.addObject("pageNo",pageNo);
				model.addObject("searchFlag",searchFlag);
				model.addObject("searchContent", searchContent);
		        model.setViewName("redirect:/BranchOfficeInfo_r_sw_ver");
		        logger.info("<<<<<<<<<<<<<< END applybranchofficeinfo_r_sw_ver >>>>>>>>>>>>>>" );
		        return model;
		    }
				 
				 
				 
				 
				 
				 /*상점App SW 버전 관리 메뉴*/
					@RequestMapping(value = "/BranchOfficeInfo_sapp_sw_ver" , method = {RequestMethod.GET, RequestMethod.POST })
					public ModelAndView BranchOfficeInfo_sapp_sw_ver(Principal principal, String searchFlag, String searchContent, String pageNo,String pageSize, String result, String action) throws UnsupportedEncodingException {
						logger.info("<<<<<<<<<<<<<< START BranchOfficeInfo_sapp_sw_ver >>>>>>>>>>>>>>" );
						ModelAndView model = new ModelAndView();
						BranchOfficeInfo_Sapp_Sw_VerVO branchofficeinfo_sapp_sw_ver = new BranchOfficeInfo_Sapp_Sw_VerVO();
						BranchOfficeInfo_Sw_HisVO branchofficeinfo_sw_his = new BranchOfficeInfo_Sw_HisVO();
						
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
							branchofficeinfo_sw_his.setPageNo(Integer.parseInt(pageNo));
						}else {
							branchofficeinfo_sw_his.setPageNo(a);
						}
						if(pageSize != null){
							branchofficeinfo_sw_his.setPageSize(Integer.parseInt(pageSize));
						}else {
							branchofficeinfo_sw_his.setPageSize(b);
						}
						if(Integer.parseInt(pageNo) <= 0) branchofficeinfo_sw_his.setPageNo(1);
				        if(Integer.parseInt(pageSize)<= 0)branchofficeinfo_sw_his.setPageSize(10);
				        int pageno = branchofficeinfo_sw_his.getPageNo();
							
							
					        if(searchFlag != null){
					        	
					            if(searchFlag.equals("1")) {    
					            	branchofficeinfo_sw_his.setStoreapp_sw_version(searchContent);
					            }
					            if(searchFlag.equals("2")) {    
					            	branchofficeinfo_sw_his.setStoreapp_sw_update(searchContent);
					            }
					        }    
					            
					        
					        List<BranchOfficeInfo_Sapp_Sw_VerVO> list = null;
					        List<BranchOfficeInfo_Sw_HisVO> his_list = null;
					        
					        int totalCount = 0;
					        int his_totalCount = 0;
					        
					        totalCount = branchinfoDao.getBranchOfficeInfo_Sapp_Sw_VerListCount(branchofficeinfo_sapp_sw_ver);
					        list = branchinfoDao.getBranchOfficeInfo_Sapp_Sw_VerList(branchofficeinfo_sapp_sw_ver); 
					        
					        his_totalCount = branchinfoDao.getBranchOfficeInfo_Sapp_Sw_HisListCount(branchofficeinfo_sw_his);
					        his_list = branchinfoDao.getBranchOfficeInfo_Sapp_Sw_HisList(branchofficeinfo_sw_his);
					        
					        String name = principal.getName();
					        
							model.addObject("username", name);
					        model.addObject("totalCount", totalCount);
					        model.addObject("list", list);
					        model.addObject("his_totalCount", his_totalCount);
					        model.addObject("his_list", his_list);
					        model.addObject("searchContent", searchContent);
					        model.addObject("searchFlag", searchFlag);
					        model.addObject("action", action);
					        model.addObject("result", result);
					        model.addObject("pageno", pageno);
					        model.addObject("pageInfo", Page.getPageMap(branchofficeinfo_sw_his.getPageNo(), totalCount , branchofficeinfo_sw_his.getPageSize(), 10));
							model.setViewName(".BranchOfficeInfo_sapp_sw_ver"); 
							logger.info("<<<<<<<<<<<<<< END BranchOfficeInfo_sapp_sw_ver >>>>>>>>>>>>>>" );
							return model;
					}
					

					@RequestMapping(value = "/insertbranchofficeinfo_sapp_sw_ver", method = { RequestMethod.GET, RequestMethod.POST }) 
					public ModelAndView insertbranchofficeinfo_sapp_sw_ver(ModelAndView model, BranchOfficeInfo_Sapp_Sw_VerVO branchofficeinfo_sapp_sw_ver, String action) throws IllegalStateException, IOException
					{
						logger.info("<<<<<<<<<<<<<< START insertbranchofficeinfo_sapp_sw_ver >>>>>>>>>>>>>>" );
						int result = branchinfoDao.insertbranchofficeinfo_sapp_sw_ver(branchofficeinfo_sapp_sw_ver);
					
						model.addObject("result",result);   
				        model.addObject("action",action);
				        model.setViewName("redirect:/BranchOfficeInfo_sapp_sw_ver");
				        logger.info("<<<<<<<<<<<<<< END insertbranchofficeinfo_sapp_sw_ver >>>>>>>>>>>>>>" );
				        return model;
				    }
					
					@RequestMapping(value = "/updatebranchofficeinfo_sapp_sw_ver", method = { RequestMethod.GET, RequestMethod.POST })
					public ModelAndView updatebranchofficeinfo_sapp_sw_ver(ModelAndView model, BranchOfficeInfo_Sapp_Sw_VerVO branchofficeinfo_sapp_sw_ver, String action, String searchFlag, String searchContent, String pageNo, String storeapp_sw_update_org) throws IllegalStateException, IOException
					{
						logger.info("<<<<<<<<<<<<<< START updatebranchofficeinfo_sapp_sw_ver >>>>>>>>>>>>>>" );
						BranchOfficeInfo_Sw_HisVO branchofficeinfo_sw_his = new BranchOfficeInfo_Sw_HisVO();
						
						int result = branchinfoDao.updatebranchofficeinfo_sapp_sw_ver(branchofficeinfo_sapp_sw_ver);
						branchofficeinfo_sw_his.setVersion(branchofficeinfo_sapp_sw_ver.getStoreapp_sw_version());
						branchofficeinfo_sw_his.setUp_date(branchofficeinfo_sapp_sw_ver.getStoreapp_sw_update());
						branchofficeinfo_sw_his.setMemo(branchofficeinfo_sapp_sw_ver.getStoreapp_sw_memo());
						branchinfoDao.insertsapp_sw_his(branchofficeinfo_sw_his);
						MultipartFile uploadfile = branchofficeinfo_sapp_sw_ver.getUploadfile(); 
						
						if(!branchofficeinfo_sapp_sw_ver.getStoreapp_sw_version_org().equals(branchofficeinfo_sapp_sw_ver.getStoreapp_sw_version())) {
							if (uploadfile != null) {
					        	String path =  mrs_prop.getProperty("fileup.filepath");
					            String fileName = uploadfile.getOriginalFilename();
					            String re_fileName = "StoreApp_"+branchofficeinfo_sapp_sw_ver.getStoreapp_sw_version()+".apk";
					           
					            try {
					                File file = new File(path + re_fileName);
					                
					                System.out.println(file.length());
					                uploadfile.transferTo(file);
					            } catch (IOException e) {
					                e.printStackTrace();
					            } // try - catch
					        } // if
						}
					
						model.addObject("result",result);   
						model.addObject("action",action);
						model.addObject("pageNo",pageNo);
						model.addObject("searchFlag",searchFlag);
						model.addObject("searchContent", searchContent);
				        model.setViewName("redirect:/BranchOfficeInfo_sapp_sw_ver");
				        logger.info("<<<<<<<<<<<<<< END updatebranchofficeinfo_sapp_sw_ver >>>>>>>>>>>>>>" );
				        return model;
				    }
					
					 @RequestMapping(value = "/deletebranchofficeinfo_sapp_sw_ver", method = { RequestMethod.GET, RequestMethod.POST })
					 public ModelAndView deletebranchofficeinfo_sapp_sw_ver(ModelAndView model, String storeapp_sw_version, String action, String searchFlag, String searchContent, String pageNo)
				    {
				        logger.info("<<<<<<<<<<<<<< START deletebranchofficeinfo_sapp_sw_ver >>>>>>>>>>>>>>" );
				        int result = branchinfoDao.deleteBranchOfficeInfo_Sapp_Sw_Ver(storeapp_sw_version);
				        model.addObject("result",result);
				        model.addObject("action",action);
						model.addObject("pageNo",pageNo);
						model.addObject("searchFlag",searchFlag);
						model.addObject("searchContent", searchContent);
				        model.setViewName("redirect:/BranchOfficeInfo_sapp_sw_ver");
				        logger.info("<<<<<<<<<<<<<< END deletebranchofficeinfo_sapp_sw_ver >>>>>>>>>>>>>>" );
				        return model;
				    }
					 
					 @RequestMapping(value = " /applybranchofficeinfo_sapp_sw_ver", method = { RequestMethod.GET, RequestMethod.POST })
						public ModelAndView applybranchofficeinfo_sapp_sw_ver(ModelAndView model, BranchOfficeInfo_Sapp_Sw_VerVO branchofficeinfo_sapp_sw_ver, String action, String searchFlag, String searchContent, String pageNo, String branch_sw_update_org) throws IllegalStateException
						{
							logger.info("<<<<<<<<<<<<<< START applybranchofficeinfo_sapp_sw_ver >>>>>>>>>>>>>>" );
							BranchOfficeInfo_Sw_HisVO branchofficeinfo_sw_his = new BranchOfficeInfo_Sw_HisVO();
							branchofficeinfo_sw_his.setStoreapp_sw_version_org(branchofficeinfo_sapp_sw_ver.getStoreapp_sw_version());
							
							int result = branchinfoDao.applybranchofficeinfo_sapp_sw_ver(branchofficeinfo_sapp_sw_ver); 
							
							model.addObject("result",result);
							model.addObject("action",action); 
							model.addObject("pageNo",pageNo);
							model.addObject("searchFlag",searchFlag);
							model.addObject("searchContent", searchContent);
					        model.setViewName("redirect:/BranchOfficeInfo_sapp_sw_ver");
					        logger.info("<<<<<<<<<<<<<< END applybranchofficeinfo_sapp_sw_ver >>>>>>>>>>>>>>" );
					        return model;
					    }
					 
					 /*업데이트 공지 메뉴*/
						@RequestMapping(value = "/BranchOfficeInfo_ann" , method = {RequestMethod.GET, RequestMethod.POST })
						public ModelAndView BranchOfficeInfo_ann(Principal principal, String rs_flag, String pageNo,String pageSize, String result, String action) throws UnsupportedEncodingException {
							logger.info("<<<<<<<<<<<<<< START BranchOfficeInfo_ann >>>>>>>>>>>>>>" );
							ModelAndView model = new ModelAndView();
							BranchOfficeInfo_AnnVO branchofficeinfo_ann = new BranchOfficeInfo_AnnVO();
							
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
								branchofficeinfo_ann.setPageNo(Integer.parseInt(pageNo));
							}else {
								branchofficeinfo_ann.setPageNo(a);
							}
							if(pageSize != null){
								branchofficeinfo_ann.setPageSize(Integer.parseInt(pageSize));
							}else {
								branchofficeinfo_ann.setPageSize(b);
							}
							if(Integer.parseInt(pageNo) <= 0) branchofficeinfo_ann.setPageNo(1);
					        if(Integer.parseInt(pageSize)<= 0)branchofficeinfo_ann.setPageSize(10);
					        int pageno = branchofficeinfo_ann.getPageNo();
					        
					        List<BranchOfficeInfo_AnnVO> list = null;
					        
					        int totalCount = 0;
					        
					        totalCount = branchinfoDao.getBranchOfficeInfo_AnnListCount(branchofficeinfo_ann);
					        list = branchinfoDao.getBranchOfficeInfo_AnnList(branchofficeinfo_ann); 
					        
					        String name = principal.getName();
					        
							model.addObject("action", action);
							model.addObject("result",result);
							model.addObject("username", name);
							model.addObject("totalCount", totalCount);
							model.addObject("list",list);
							model.addObject("rs_flag", rs_flag);
					        model.addObject("action", action);
					        model.addObject("result", result);
					        model.addObject("pageno", pageno);
					        model.addObject("pageInfo", Page.getPageMap(branchofficeinfo_ann.getPageNo(), totalCount , branchofficeinfo_ann.getPageSize(), 10));
							model.setViewName(".BranchOfficeInfo_ann"); 
							logger.info("<<<<<<<<<<<<<< END BranchOfficeInfo_ann >>>>>>>>>>>>>>" );
							return model;
						}
						
						@RequestMapping(value = "/insertbranchofficeinfo_ann", method = { RequestMethod.GET, RequestMethod.POST }) 
						public ModelAndView insertbranchofficeinfo_ann(ModelAndView model, BranchOfficeInfo_AnnVO branchofficeinfo_ann, String action) throws IllegalStateException, IOException
						{
							logger.info("<<<<<<<<<<<<<< START insertbranchofficeinfo_ann >>>>>>>>>>>>>>" );
							
							int result = 0;
							if(branchofficeinfo_ann.getRs_flag().equals("3")) {
								result = branchinfoDao.insertann_branch(branchofficeinfo_ann);
							}else if(branchofficeinfo_ann.getRs_flag().equals("1")) {
								result = branchinfoDao.insertann_store(branchofficeinfo_ann);
							}else {
								result = branchinfoDao.insertann_rider(branchofficeinfo_ann);
							}
							model.addObject("result",result);   
					        model.addObject("action",action);
					        model.setViewName("redirect:/BranchOfficeInfo_ann");
					        logger.info("<<<<<<<<<<<<<< END insertbranchofficeinfo_ann >>>>>>>>>>>>>>" );
					        return model;
					    }
						
						
						
						
						
						
						
						
						
						
						
						
						
						@RequestMapping(value = "/developer_Fee_Config" , method = {RequestMethod.GET, RequestMethod.POST })
						public ModelAndView developer_Fee_Config(Principal principal, String result, String action) throws UnsupportedEncodingException {
							logger.info("<<<<<<<<<<<<<< START developer_Fee_Config >>>>>>>>>>>>>>" );
							ModelAndView model = new ModelAndView();
							developer_Fee_ConfigVO developer_Fee_Config = new developer_Fee_ConfigVO();
							
					        List<developer_Fee_ConfigVO> list = null;
					        list = branchinfoDao.getdeveloper_Fee_Config(developer_Fee_Config); 
					        
					        String name = principal.getName();
					        

							model.addObject("username", name);
					        model.addObject("list", list);
					        model.addObject("action", action);
					        model.addObject("result", result);
							model.setViewName(".developer_Fee_Config"); 
							logger.info("<<<<<<<<<<<<<< END developer_Fee_Config >>>>>>>>>>>>>>" );
							return model;
						}
						 
						 @RequestMapping(value = " /developer_Fee_Config_act", method = { RequestMethod.GET, RequestMethod.POST })
							public ModelAndView developer_Fee_Config_act(ModelAndView model, String developer_fee, String action,String username,String curr_passwd) throws IllegalStateException
							{
								logger.info("<<<<<<<<<<<<<< START developer_Fee_Config_act >>>>>>>>>>>>>>" );
								   Afd_userinfoVO Afd_userinfo = new Afd_userinfoVO();
								   developer_Fee_ConfigVO developer_Fee_Config = new developer_Fee_ConfigVO();
								   int totalCount = 0;
							       int result = 0; 
							       int passwd_chk = 0;
							       Afd_userinfo.setLogin_id(username);
							       Afd_userinfo.setLogin_passwd(curr_passwd);
							       developer_Fee_Config.setDeveloper_fee(developer_fee);
							       
							       passwd_chk = branchinfoDao.getpasswd_chk(Afd_userinfo);
							       if(passwd_chk > 0){
							    	   totalCount = branchinfoDao.getdeveloper_Fee_ConfigCount(developer_Fee_Config);
										if( totalCount < 1)
										{
											 result = branchinfoDao.developer_Fee_Config_insert(developer_Fee_Config); 
										}else{
											 result = branchinfoDao.developer_Fee_Config_update(developer_Fee_Config); 
										}
							       }else{
							    	   result = 999;
							       }
							       
								       
						
								
								model.addObject("result",result);
								model.addObject("action",action); 
						        model.setViewName("redirect:/developer_Fee_Config");
						        logger.info("<<<<<<<<<<<<<< END developer_Fee_Config_act >>>>>>>>>>>>>>" );
						        return model;
						    }
				 
}