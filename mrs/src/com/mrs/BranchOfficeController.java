package com.mrs;
 
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import au.com.bytecode.opencsv.CSVReader;
import au.com.bytecode.opencsv.bean.ColumnPositionMappingStrategy;
import au.com.bytecode.opencsv.bean.CsvToBean;

import com.insford.ssh.SshClientModule;
import com.mrs.Batch.StoreCsvManager;
import com.mrs.Dao.BranchOfficeDao;
import com.mrs.Vo.BranchOfficeVO;
import com.mrs.Vo.BranchOffice_AddrVO;
import com.mrs.Vo.BranchOffice_AreaVO;
import com.mrs.Vo.BranchOffice_NationVO;
import com.mrs.Vo.BranchOffice_RiderVO;
import com.mrs.Vo.BranchOffice_StoreVO;
import com.mrs.Vo.BranchOffice_Store_CsvVO;
import com.mrs.Vo.BranchOffice_Vbank_ChgVO;
import com.mrs.Vo.BranchOffice_VerVO;
import com.mrs.Vo.FileVO;
import com.mrs.util.Page;
import com.mrs.Cipher.CipherAES;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import java.security.NoSuchAlgorithmException;
import java.util.Properties;

import javax.annotation.Resource;

import com.insford.ssh.SshClientModule;



@Controller
public class BranchOfficeController  {
 
	private static final Logger logger = LoggerFactory.getLogger(BranchOfficeController.class);

	// 프로퍼티 객체 주입
	@Resource(name = "mrs_prop")
	private Properties mrs_prop; // vxml_url     = ems_prop.getProperty("pvsvxml.url"); 프로퍼티에서 일케 가져와도 대여.
	
	@Resource(name = "mybatis_prop")
	private Properties mybatis_prop; 
	
	
	@Resource(name="BranchOfficeDao")                 
    private BranchOfficeDao branchofficeDao; 

	/*지사 정보 관리 메뉴*/
	@RequestMapping(value = "/BranchOffice_main" , method = {RequestMethod.GET, RequestMethod.POST })
	public ModelAndView BranchOffice(Principal principal, String searchFlag, String bidFlag, String searchContent, String pageNo,String pageSize, String result, String action) throws UnsupportedEncodingException, InterruptedException {
		logger.info("<<<<<<<<<<<<<< START BranchOffice_main >>>>>>>>>>>>>>" );
		ModelAndView model = new ModelAndView();
		BranchOfficeVO branchoffice = new BranchOfficeVO();
		BranchOffice_NationVO branchoffice_nation = new BranchOffice_NationVO();
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
			branchoffice.setPageNo(Integer.parseInt(pageNo));
		}else {
			branchoffice.setPageNo(a);
		}
		if(pageSize != null){
			branchoffice.setPageSize(Integer.parseInt(pageSize));
		}else {
			branchoffice.setPageSize(b);
		}
		if(Integer.parseInt(pageNo) <= 0) branchoffice.setPageNo(1);
        if(Integer.parseInt(pageSize)<= 0)branchoffice.setPageSize(10);
        int pageno = branchoffice.getPageNo();
        
	        if(searchFlag != null){
	        	/*
	        	if(action != null && !action.equals("")){
	        	if(action.equals("UPDATE") || action.equals("DELETE")){
	        		if(searchContent != null && !searchContent.equals("")){
	        			searchContent = new String(searchContent.getBytes("iso-8859-1"), "utf-8");
	        		}
	        	}
	        }else {
	    	   searchContent = searchContent;
	        }
	        */
	            if(searchFlag.equals("1")) {    
	            	branchoffice.setB_name(searchContent);
	            }
	            if(searchFlag.equals("3")) {    
	            	branchoffice.setB_name(searchContent);
	            }
	            if(searchFlag.equals("4")) {   
	            	branchoffice.setB_crn(searchContent);
	            }
	            if(searchFlag.equals("5")) {   
	            	branchoffice.setB_tel1(searchContent);
	            }
	            if(searchFlag.equals("6")) {    
	            	branchoffice.setB_tel2(searchContent);
	            }
	            if(searchFlag.equals("7")) {   
	            	branchoffice.setLogin_id(searchContent);
	            }
	            if(searchFlag.equals("8")) {   
	            	branchoffice.setB_id(searchContent);
	            }
	            if(searchFlag.equals("9")) {   
	            	branchoffice.setBc_type(searchContent);
	            }
	            if(searchFlag.equals("10")) {    
	            	branchoffice.setBatch_extra_flag(searchContent);
	            }
	            if(searchFlag.equals("11")) {   
	            	branchoffice.setBatch_extra_amount(searchContent);
	            }
	            if(searchFlag.equals("12")) {    
	            	branchoffice.setOpen_time(searchContent);
	            }
	            if(searchFlag.equals("13")) {   
	            	branchoffice.setClose_time(searchContent);
	            }
	            if(searchFlag.equals("14")) {   
	            	branchoffice.setV_bank(searchContent);
	            }
	            if(searchFlag.equals("15")) {    
	            	branchoffice.setV_account(searchContent);
	            }
	            if(searchFlag.equals("16")) {    
	            	branchoffice.setV_name(searchContent);
	            }
	        }    
	         
	        if(bidFlag != null){   
	            	branchoffice.setBid_flag(bidFlag);
	        }
	        
	        List<BranchOfficeVO> list = null;
	        List<BranchOfficeVO> list_bank = null;
	        List<BranchOfficeVO> list_b_bank = null;
	        List<BranchOfficeVO> list_config = null;
	        List<BranchOffice_NationVO> nation_list = null;
	        List<BranchOfficeVO> b_account = null;
	        
	        String b_seq = "";
	        
			b_seq = branchofficeDao.getB_seq(branchoffice); 
			
			if(b_seq.length() == 1){
				b_seq = "B000"+b_seq;
			}else if(b_seq.length() == 2) {
				b_seq = "B00"+b_seq;
			}else if(b_seq.length() == 3) {
				b_seq = "B0"+b_seq;
			}else if(b_seq.length() == 4) {
				b_seq = "B"+b_seq;
			}
	        
	        int totalCount = 0;
	        totalCount = branchofficeDao.getBranchOfficeListCount(branchoffice);
	        list = branchofficeDao.getBranchOfficeList(branchoffice);  
	        list_bank = branchofficeDao.getBranchOfficeList_bank(branchoffice);  
	        list_b_bank = branchofficeDao.getBranchOfficeList_b_bank(branchoffice);  
	        list_config  = branchofficeDao.getBranchOfficeList_config(branchoffice); 
	        nation_list = branchofficeDao.getBranchOffice_NationList(branchoffice_nation);
	        
	        String name = principal.getName();
	        
			model.addObject("username", name);
	        model.addObject("totalCount", totalCount);
	        model.addObject("list", list);
	        model.addObject("list_bank", list_bank);
	        model.addObject("list_b_bank", list_b_bank);
	        model.addObject("nation_list", nation_list);
	        model.addObject("list_config", list_config);
	        model.addObject("searchContent", searchContent);
	        model.addObject("searchFlag", searchFlag);
	        model.addObject("bidFlag", bidFlag);
	        model.addObject("action", action);
	        model.addObject("result", result);
	        model.addObject("b_seq", b_seq);
	        model.addObject("pageno", pageno);
	        model.addObject("pageInfo", Page.getPageMap(branchoffice.getPageNo(), totalCount , branchoffice.getPageSize(), 10));
			model.setViewName(".BranchOffice_main"); 
			logger.info("<<<<<<<<<<<<<< END BranchOffice_main >>>>>>>>>>>>>>" );
			return model;
	}
	

	@RequestMapping(value = "/insertbranchoffice", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView inserbranchoffice(ModelAndView model, BranchOfficeVO branchoffice, String action) throws IllegalStateException, IOException, NumberFormatException, InterruptedException
	{
		
		logger.info("<<<<<<<<<<<<<< START inserbranchoffice >>>>>>>>>>>>>>" );
		/*
		String v_account = "";
		v_account = branchofficeDao.getv_account(branchoffice);
		branchoffice.setV_account(v_account);
		*/
		String ip =  mrs_prop.getProperty("ip.ipaddr");
		String b_id = branchoffice.getB_id();
		int last = 0;
		
		if(!b_id.substring(1,2).equals("0")) {
			last = Integer.parseInt(b_id.substring(4,b_id.length()));
		}else if(!b_id.substring(2,3).equals("0")) {
			last = Integer.parseInt(b_id.substring(3,b_id.length()));
		}else if(!b_id.substring(3,4).equals("0")) {
			last = Integer.parseInt(b_id.substring(2,b_id.length()));
		}else if(!b_id.substring(4,b_id.length()).equals("0")) {
			last = Integer.parseInt(b_id.substring(1,b_id.length()));
		}
		
		int module_id = last/4;
		int http_port = 13080 + module_id;
		int tcp_port = 32000 + module_id;
		String cs_heartbeat_period = "5";
		String app_heartbeat_period = "10";
		String app_polling_period = "1800";
		
		
		branchoffice.setB_id(b_id);
		branchoffice.setIp_addr(ip);
		branchoffice.setModule_id(Integer.toString(module_id));
		branchoffice.setHttp_port(Integer.toString(http_port));
		branchoffice.setTcp_port(Integer.toString(tcp_port));
		branchoffice.setCs_heartbeat_period(cs_heartbeat_period);
		branchoffice.setApp_heartbeat_period(app_heartbeat_period);
		branchoffice.setApp_polling_period(app_polling_period);
		
		int b_seq = 0;
        int b_seq1 = 0;
        String bid_seq = "";
        String s_b_id = "";
		b_seq = branchofficeDao.getB_seq2(branchoffice);   
		b_seq1 = b_seq+1;
		
		if(branchoffice.getB_id().toString().trim().equals("")) {
	        
			bid_seq = branchofficeDao.getB_seq(branchoffice); 
			
			if(bid_seq.length() == 1){
				bid_seq = "B000"+bid_seq;
			}else if(bid_seq.length() == 2) {
				bid_seq = "B00"+bid_seq;
			}else if(bid_seq.length() == 3) {
				bid_seq = "B0"+bid_seq;
			}else if(bid_seq.length() == 4) {
				bid_seq = "B"+bid_seq;
			}
			
			branchoffice.setB_id(bid_seq);
		}
		
		String city_code = branchofficeDao.getB_City_code(branchoffice);
		
		if(city_code != null) {
			branchoffice.setB_city_code(city_code);
		}
		int result = branchofficeDao.insertbranchoffice(branchoffice);
					 branchofficeDao.insertvbankchg(branchoffice);
					 branchofficeDao.updateB_seq(b_seq);
					 branchofficeDao.insertnetworkinfo(branchoffice); 
					 branchofficeDao.insertaddrver(b_id);
					 branchofficeDao.insertsessioninfo1(b_id);
					 branchofficeDao.insertsessioninfo2(b_id);
					 
					 s_b_id = branchofficeDao.getModule_id(branchoffice); 
		/*shell script  실행*/	
		if(result == 1) {
			if(mrs_prop.getProperty("shell.dir").equals("/home/project/WADDA_EIF/APP/BIN/")) {
				SshClientModule client = new SshClientModule(mrs_prop.getProperty("shell.ip"), mrs_prop.getProperty("shell.id"), mrs_prop.getProperty("shell.pwd"));
				client.setPort(Integer.parseInt(mrs_prop.getProperty("shell.port")));     
		        client.connect();
		        SshClientModule client_eif = new SshClientModule(mrs_prop.getProperty("shell.eifip1"), mrs_prop.getProperty("shell.eifid"), mrs_prop.getProperty("shell.pwd"));
		        client_eif.setPort(Integer.parseInt(mrs_prop.getProperty("shell.eifport")));     
		        client_eif.connect();
		        StringBuffer shell = new StringBuffer("cd "+mrs_prop.getProperty("shell.dir")+" \n");
		        shell.append("sh");
		        shell.append(" ./cifp_start.sh "+module_id+"\n");
		        shell.append("sh cifp_start.sh "+module_id+"\n");
		        shell.append("sh cifp_start.sh "+module_id+"\n");
		        client_eif.executeShell(shell.toString());
		        client_eif.disconnect();
		        
		        client_eif = new SshClientModule(mrs_prop.getProperty("shell.eifip2"), mrs_prop.getProperty("shell.eifid"), mrs_prop.getProperty("shell.pwd"));
		        client_eif.setPort(Integer.parseInt(mrs_prop.getProperty("shell.eifport")));     
		        client_eif.connect();
		        shell = new StringBuffer("cd "+mrs_prop.getProperty("shell.dir")+" \n");
		        shell.append("sh");
		        shell.append(" ./cifp_start.sh "+module_id+"\n");
		        shell.append("sh cifp_start.sh "+module_id+"\n");
		        shell.append("sh cifp_start.sh "+module_id+"\n");
		        client_eif.executeShell(shell.toString());
		        client_eif.disconnect();
		        client.executeShell(shell.toString());
		        client.disconnect();
		        
		        
			}else {
				SshClientModule client = new SshClientModule(mrs_prop.getProperty("shell.ip"), mrs_prop.getProperty("shell.id"), mrs_prop.getProperty("shell.pwd"));
				client.setPort(Integer.parseInt(mrs_prop.getProperty("shell.port")));     
		        client.connect();
		        StringBuffer shell = new StringBuffer("cd "+mrs_prop.getProperty("shell.dir")+" \n");
		        shell.append("sh");
		        shell.append(" ./cifp_start.sh "+module_id+"\n");
		        shell.append("sh cifp_start.sh "+module_id+"\n");
		        shell.append("sh cifp_start.sh "+module_id+"\n");
		        client.executeShell(shell.toString());
		        client.disconnect();
			}
		}
		model.addObject("result",result);   
        model.addObject("action",action);
        model.setViewName("redirect:/BranchOffice_main");
        logger.info("<<<<<<<<<<<<<< END insertbranchoffice >>>>>>>>>>>>>>" );
        Thread.sleep(Long.parseLong(mrs_prop.getProperty("sleep.count")));
        return model;
    }
	
	@RequestMapping(value = "/updatebranchoffice", method = { RequestMethod.GET, RequestMethod.POST })
	   public ModelAndView updatebranchoffice(ModelAndView model, BranchOfficeVO branchoffice, String action, String searchFlag, String searchContent, String pageNo, String bidFlag) throws IllegalStateException, IOException, NumberFormatException, InterruptedException
	   {
	      logger.info("<<<<<<<<<<<<<< START updatebranchoffice >>>>>>>>>>>>>>" );
	      
	      String org_v_bank = branchofficeDao.getv_bank(branchoffice);
	      String org_v_account = branchofficeDao.getv_account2(branchoffice);
	      String org_v_name = branchofficeDao.getv_name(branchoffice);
	      String org_v_name2 = branchofficeDao.getorg_v_name(branchoffice);
	      String org_contract_sdate = branchofficeDao.getcontract_sdate(branchoffice);
	      String org_contract_edate = branchofficeDao.getcontract_edate(branchoffice);
	      int result_rechrg = 0;
	      
	      branchoffice.setOrg_v_bank(org_v_bank);
	      branchoffice.setOrg_v_account(org_v_account);
	      
	      branchoffice.setOrg_b_representative(org_v_name);
	      branchoffice.setOrg_contract_sdate(org_contract_sdate);
	      branchoffice.setOrg_contract_edate(org_contract_edate);

	      String bid_seq = "";
	      
	      if(branchoffice.getB_id().toString().trim().equals("")) {
		        
				bid_seq = branchofficeDao.getB_seq(branchoffice);
				bid_seq = "B"+bid_seq;
				branchoffice.setB_id(bid_seq);
			}
	      
	      String city_code = branchofficeDao.getB_City_code(branchoffice);
			
	      if(city_code != null) {
	    	  branchoffice.setB_city_code(city_code);
	      }
	   
	      int result = branchofficeDao.updatebranchoffice(branchoffice);
	                	branchofficeDao.updatevbankchg(branchoffice);
	                
	   
	      model.addObject("result",result);   
	      model.addObject("action",action);
	      model.addObject("pageNo",pageNo);
	      model.addObject("searchFlag",searchFlag);
	      model.addObject("bidFlag",bidFlag);
	      model.addObject("searchContent", searchContent);
	        model.setViewName("redirect:/BranchOffice_main");
	        logger.info("<<<<<<<<<<<<<< END updatebranchoffice >>>>>>>>>>>>>>" );
	        if(org_v_bank != null) {
		        if(!org_v_bank.equals(branchoffice.getV_bank())) {
		        	Thread.sleep(Long.parseLong(mrs_prop.getProperty("sleep.count")));
		        }
	        }
	        return model;
	}
	
	
	
	
	
	
	 @RequestMapping(value = "/deletebranchoffice", method = { RequestMethod.GET, RequestMethod.POST })
	 public ModelAndView deletebranchoffice(ModelAndView model, String b_id, String action, BranchOfficeVO branchoffice, String searchFlag, String searchContent, String pageNo, String bidFlag)
    {
        logger.info("<<<<<<<<<<<<<< START deletebranchoffice >>>>>>>>>>>>>>" );
        
        String org_v_bank = branchofficeDao.getv_bank(branchoffice);
		String org_v_account = branchofficeDao.getv_account2(branchoffice);
		String org_v_name = branchofficeDao.getv_name(branchoffice);
		String contract_sdate = branchofficeDao.getcontract_sdate(branchoffice);
		String contract_edate = branchofficeDao.getcontract_edate(branchoffice);
		String org_contract_sdate = branchofficeDao.getorg_contract_sdate(branchoffice);
		String org_contract_edate = branchofficeDao.getorg_contract_edate(branchoffice);
		
		String s_b_id = "";
		s_b_id = branchofficeDao.getModule_id(branchoffice); 		
		
		branchoffice.setOrg_v_bank(org_v_bank);
		branchoffice.setOrg_v_account(org_v_account);
		branchoffice.setOrg_v_name(org_v_name);
		branchoffice.setV_name(org_v_name);
		branchoffice.setContract_sdate(contract_sdate);
		branchoffice.setContract_edate(contract_edate);
		branchoffice.setOrg_contract_sdate(org_contract_sdate);
		branchoffice.setOrg_contract_edate(org_contract_edate);
		
        int result = branchofficeDao.afd_deleted_branchinfo(b_id);
        			 branchofficeDao.deleteBranchOffice(b_id);
        			 branchofficeDao.deletevbankchg(branchoffice);
        			 branchofficeDao.deletenetworkinfo(b_id);
        			 branchofficeDao.deleteaddrver(b_id); 
        			 branchofficeDao.deletesessioninfo(b_id);
        			 branchofficeDao.deletebranchcoverarea(b_id);
        			 branchofficeDao.deletebranchaddress(b_id);
        			 branchofficeDao.deletesharedbranch(b_id);
        			 branchofficeDao.deletesharedbranchs(b_id);
        			 branchofficeDao.deletestoreinfo(b_id);
        			 branchofficeDao.deleteareaextra(b_id);
        			 branchofficeDao.deletebasemenu(b_id);
        			 branchofficeDao.deletefixedprice(b_id);
        			 branchofficeDao.deletefoodcategory(b_id);
        			 branchofficeDao.deletestoresessioninfo(b_id);
        			 branchofficeDao.deletestorecoverarea(b_id);
        			 branchofficeDao.deletetimeextra(b_id);
        			 branchofficeDao.deleteriderinfo(b_id);
        			 branchofficeDao.deletesharedrider(b_id);
        			 branchofficeDao.deletesharedriders(b_id);
        			 branchofficeDao.deleteridersessioninfo(b_id);
        			 branchofficeDao.deleteridercatchcancel(b_id);
        			 branchofficeDao.deleteannounce(b_id);
        			 branchofficeDao.deleteannounced(b_id);
        			 
		/*shell script  실행*/	
        if(result == 1) {
        	if(mrs_prop.getProperty("shell.dir").equals("/DATA/project/ADSP_EIF/APP/BIN/")) {
        		SshClientModule client = new SshClientModule(mrs_prop.getProperty("shell.ip"), mrs_prop.getProperty("shell.id"), mrs_prop.getProperty("shell.pwd"));
				client.setPort(Integer.parseInt(mrs_prop.getProperty("shell.port")));     
		        client.connect();
		        SshClientModule client_eif = new SshClientModule(mrs_prop.getProperty("shell.eifip1"), mrs_prop.getProperty("shell.eifid"), mrs_prop.getProperty("shell.pwd"));
		        client_eif.setPort(Integer.parseInt(mrs_prop.getProperty("shell.eifport")));     
		        client_eif.connect();
		        StringBuffer shell = new StringBuffer("cd "+mrs_prop.getProperty("shell.dir")+" \n");
		        shell.append("sh cifp_stop.sh "+s_b_id+"\n");
		        client_eif.executeShell(shell.toString());
		        client_eif.disconnect();
		        
		        client_eif = new SshClientModule(mrs_prop.getProperty("shell.eifip2"), mrs_prop.getProperty("shell.eifid"), mrs_prop.getProperty("shell.pwd"));
		        client_eif.setPort(Integer.parseInt(mrs_prop.getProperty("shell.eifport")));     
		        client_eif.connect();
		        shell = new StringBuffer("cd "+mrs_prop.getProperty("shell.dir")+" \n");
		        shell.append("sh cifp_stop.sh "+s_b_id+"\n");
		        client_eif.executeShell(shell.toString());
		        client_eif.disconnect();
		        client.executeShell(shell.toString());
		        client.disconnect();
        	}else {
        		SshClientModule client = new SshClientModule(mrs_prop.getProperty("shell.ip"), mrs_prop.getProperty("shell.id"), mrs_prop.getProperty("shell.pwd"));
		        client.setPort(Integer.parseInt(mrs_prop.getProperty("shell.port"))); 
		        client.connect();
		        StringBuffer shell = new StringBuffer("cd "+mrs_prop.getProperty("shell.dir")+" \n");
		        shell.append("sh cifp_stop.sh "+s_b_id+"\n");
		        client.executeShell(shell.toString());
		        client.disconnect();
        	}
        }
        			 
        model.addObject("result",result);
        model.addObject("action",action);
		model.addObject("pageNo",pageNo);
		model.addObject("searchFlag",searchFlag);
		model.addObject("bidFlag",bidFlag);
		model.addObject("searchContent", searchContent);
        model.setViewName("redirect:/BranchOffice_main");
        logger.info("<<<<<<<<<<<<<< END deletebranchoffice >>>>>>>>>>>>>>" );
        return model;
    }
	 
	 @RequestMapping(value = "/rechrgbranchoffice", method = { RequestMethod.GET, RequestMethod.POST })
	 public ModelAndView rechrgbranchoffice(ModelAndView model, String b_id, String action, BranchOfficeVO branchoffice, String searchFlag, String searchContent, String pageNo, String bidFlag)
    {
        logger.info("<<<<<<<<<<<<<< START rechrgbranchoffice >>>>>>>>>>>>>>" );
        
        if(branchoffice.getB_balance().equals("")) {
        	branchoffice.setB_balance("0");
        }
        long b_balance_rechrg = Long.parseLong(branchoffice.getB_balance_rechrg());
        
        branchoffice.setB_balance_rechrg(Long.toString(b_balance_rechrg));
        branchoffice.setB_balance_before(Long.parseLong(branchoffice.getB_balance_rechrg())-Long.parseLong(branchoffice.getB_balance()));
        branchoffice.setB_balance_after(Long.toString(b_balance_rechrg));
        
        int result = branchofficeDao.updateb_balance(branchoffice);
        branchofficeDao.insertrechrg_his(branchoffice);
        
        model.addObject("result",result);
        model.addObject("action",action);
		model.addObject("pageNo",pageNo);
		model.addObject("searchFlag",searchFlag);
		model.addObject("bidFlag",bidFlag);
		model.addObject("searchContent", searchContent);
        model.setViewName("redirect:/BranchOffice_main");
        logger.info("<<<<<<<<<<<<<< END rechrgbranchoffice >>>>>>>>>>>>>>" );
        return model;
    }
	 
	
	 
	 @RequestMapping(value = "/iddupchkbranchoffice" , method = {RequestMethod.POST })
		public @ResponseBody int iddupchkbranchoffice(HttpServletRequest request, HttpServletResponse response,String js_sido)
				throws Exception {
			logger.info("<<<<<<<<<<<<<< START iddupchkbranchoffice >>>>>>>>>>>>>>" );
			
			BranchOfficeVO branchoffice = new BranchOfficeVO();
			
			branchoffice.setLogin_id(js_sido);
			
			int js_gugun = branchofficeDao.getloginidCount(branchoffice); 
			
			logger.info("<<<<<<<<<<<<<< END iddupchkbranchoffice >>>>>>>>>>>>>>" );
			return js_gugun;
		} 
	 
	 @RequestMapping(value = "/iddupchkbranchoffice_store" , method = {RequestMethod.POST })
		public @ResponseBody int iddupchkbranchoffice_store(HttpServletRequest request, HttpServletResponse response,String js_sido)
				throws Exception {
			logger.info("<<<<<<<<<<<<<< START iddupchkbranchoffice_store >>>>>>>>>>>>>>" );
			
			BranchOffice_StoreVO branchoffice_store = new BranchOffice_StoreVO();
			
			branchoffice_store.setLogin_id(js_sido);
			
			int js_gugun = branchofficeDao.getloginidCount_store(branchoffice_store); 
			
			logger.info("<<<<<<<<<<<<<< END iddupchkbranchoffice_store >>>>>>>>>>>>>>" );
			return js_gugun;
		} 
	 
	 @RequestMapping(value = "/iddupchkbranchoffice_rider" , method = {RequestMethod.POST })
		public @ResponseBody int iddupchkbranchoffice_rider(HttpServletRequest request, HttpServletResponse response,String js_sido)
				throws Exception {
			logger.info("<<<<<<<<<<<<<< START iddupchkbranchoffice_rider >>>>>>>>>>>>>>" );
			
			BranchOffice_RiderVO branchoffice_rider = new BranchOffice_RiderVO();
			
			branchoffice_rider.setLogin_id(js_sido);
			
			int js_gugun = branchofficeDao.getloginidCount_rider(branchoffice_rider); 
			
			logger.info("<<<<<<<<<<<<<< END iddupchkbranchoffice_rider >>>>>>>>>>>>>>" );
			return js_gugun;
		} 
	 
	 
	 @RequestMapping(value = "/branchoffice_v_account" , method = {RequestMethod.POST })
		public @ResponseBody List<BranchOfficeVO> branchoffice_v_account(HttpServletRequest request, HttpServletResponse response,String js_sido)
				throws Exception {
			logger.info("<<<<<<<<<<<<<< START branchoffice_v_account >>>>>>>>>>>>>>" );
			
			BranchOfficeVO branchoffice = new BranchOfficeVO();
			
			branchoffice.setV_bank(js_sido);
			List<BranchOfficeVO> js_gugun = null;
			js_gugun = branchofficeDao.getBranchOffice_Account(branchoffice);
			
			logger.info("<<<<<<<<<<<<<< END branchoffice_v_account >>>>>>>>>>>>>>" );
			return js_gugun;
		}
	 
	
	 
	
	 /*지사 관할지역 관리 메뉴*/
	@RequestMapping(value = "/BranchOffice_area" , method = {RequestMethod.GET, RequestMethod.POST })
	public ModelAndView BranchOffice_Area(Principal principal, String searchFlag, String coverFlag, String areaFlag, String searchContent, String areaContent, String pageNo,String pageSize, String result, String action) throws UnsupportedEncodingException {
		logger.info("<<<<<<<<<<<<<< START BranchOffice_area >>>>>>>>>>>>>>" );
		ModelAndView model = new ModelAndView();
		BranchOffice_AreaVO branchoffice_area = new BranchOffice_AreaVO();
		BranchOffice_NationVO branchoffice_nation = new BranchOffice_NationVO();
		BranchOffice_AddrVO branchoffice_addr = new BranchOffice_AddrVO();
		
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
			branchoffice_area.setPageNo(Integer.parseInt(pageNo));
		}else {
			branchoffice_area.setPageNo(a);
		}
		if(pageSize != null){
			branchoffice_area.setPageSize(Integer.parseInt(pageSize));
		}else {
			branchoffice_area.setPageSize(b);
		}
		if(Integer.parseInt(pageNo) <= 0) branchoffice_area.setPageNo(1);
        if(Integer.parseInt(pageSize)<= 0)branchoffice_area.setPageSize(10);
        int pageno = branchoffice_area.getPageNo();
			
	        if(searchFlag != null){
	        	
	            if(searchFlag.equals("1")) {    
	            	branchoffice_area.setB_id(searchContent);
	            }
	            if(searchFlag.equals("2")) {    
	            	branchoffice_area.setB_name(searchContent);
	            }
	        } 
	        
	        if(areaFlag != null){
	        	
	            if(areaFlag.equals("1")) {    
	            	branchoffice_area.setCity_code(areaContent);
	            }
	            if(areaFlag.equals("2")) {    
	            	branchoffice_area.setGu_code(areaContent);
	            }
	            if(areaFlag.equals("2")) {    
	            	branchoffice_area.setTown_code(areaContent);
	            }
	        } 
	            
	        if(coverFlag != null){
	        	branchoffice_area.setCover_flag(coverFlag);
	        }
	        
	        List<BranchOffice_AreaVO> list = null;
	        List<BranchOffice_NationVO> nation_list = null;
	        List<BranchOffice_AddrVO> list_bid = null;
	        
	        int totalCount = 0;
	        totalCount = branchofficeDao.getBranchOffice_AreaListCount(branchoffice_area);  
	        list = branchofficeDao.getBranchOffice_AreaList(branchoffice_area);
	        nation_list = branchofficeDao.getBranchOffice_NationList(branchoffice_nation);
	        list_bid = branchofficeDao.getBranchOfficeAddrList_bid(branchoffice_addr); 
	        String name = principal.getName();
			model.addObject("username", name);
			
	        model.addObject("totalCount", totalCount);
	        model.addObject("list", list);
	        model.addObject("nation_list", nation_list);
	        model.addObject("list_bid", list_bid);
	        model.addObject("searchContent", searchContent);
	        model.addObject("areaContent", areaContent);
	        model.addObject("searchFlag", searchFlag);
	        model.addObject("coverFlag", coverFlag);
	        model.addObject("areaFlag", areaFlag);
	        model.addObject("result", result);
	        model.addObject("action", action);
	        model.addObject("pageno", pageno);
	        model.addObject("pageInfo", Page.getPageMap(branchoffice_area.getPageNo(), totalCount , branchoffice_area.getPageSize(), 10));
			model.setViewName(".BranchOffice_main2"); 
			logger.info("<<<<<<<<<<<<<< END BranchOffice_area >>>>>>>>>>>>>>" );
			return model;
	}

	@RequestMapping(value = "/branchoffice_selectgu" , method = {RequestMethod.POST })
	public @ResponseBody List<BranchOffice_NationVO> branchoffice_selectgu(HttpServletRequest request, HttpServletResponse response,String js_sido)
			throws Exception {
		logger.info("<<<<<<<<<<<<<< START branchoffice_selectgu >>>>>>>>>>>>>>" );
		
		BranchOffice_NationVO branchoffice_nation = new BranchOffice_NationVO();
		
		branchoffice_nation.setCity_code(js_sido);
		List<BranchOffice_NationVO> js_gugun = null;
		js_gugun = branchofficeDao.getBranchOffice_GuList(branchoffice_nation);
		
		logger.info("<<<<<<<<<<<<<< END branchoffice_selectgu >>>>>>>>>>>>>>" );
		return js_gugun;
	}
	
	
	
	@RequestMapping(value = "/branchoffice_selectgu2" , method = {RequestMethod.POST })
	public @ResponseBody List<BranchOffice_NationVO> branchoffice_selectgu2(HttpServletRequest request, HttpServletResponse response,String js_sido)
			throws Exception {
		logger.info("<<<<<<<<<<<<<< START branchoffice_selectgu >>>>>>>>>>>>>>" );
		
		BranchOffice_NationVO branchoffice_nation = new BranchOffice_NationVO();
		
		branchoffice_nation.setCity_code(js_sido);
		
		List<BranchOffice_NationVO> js_gugun = null;
		js_gugun = branchofficeDao.getBranchOffice_GuList(branchoffice_nation);
		
		logger.info("<<<<<<<<<<<<<< END branchoffice_selectgu >>>>>>>>>>>>>>" );
		return js_gugun;
	}
	
	
	@RequestMapping(value = "/branchoffice_selecttown" , method = {RequestMethod.POST })
	public @ResponseBody List<BranchOffice_NationVO> branchoffice_selecttown(HttpServletRequest request, HttpServletResponse response,String js_gugun)
			throws Exception {
		logger.info("<<<<<<<<<<<<<< START branchoffice_selecttown >>>>>>>>>>>>>>" );
		BranchOffice_NationVO branchoffice_nation = new BranchOffice_NationVO();
		
		branchoffice_nation.setGu_code(js_gugun);
		List<BranchOffice_NationVO> js_town = null;
		js_town = branchofficeDao.getBranchOffice_TownList(branchoffice_nation); 
		
		logger.info("<<<<<<<<<<<<<< END branchoffice_selecttown >>>>>>>>>>>>>>" );
		return js_town;
	}
	
	
	@RequestMapping(value = "/insertbranchoffice_area", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView inserbranchoffice_area(ModelAndView model, BranchOffice_AreaVO branchoffice_area,BranchOffice_AddrVO branchoffice_addr, String action) throws IllegalStateException, IOException
	{
		logger.info("<<<<<<<<<<<<<< START inserbranchoffice_area >>>>>>>>>>>>>>" );
		
		int maxIdx_Addr = 0;
		int Addr_ck =  0;
		int result = 0;
		
		if(!branchoffice_addr.getGu_code().equals(",")){
			String[] a = branchoffice_addr.getGu_code().split(",");
			branchoffice_area.setGu_code(a[1]);
			branchoffice_addr.setGu_code(a[1]);
		}else{
			branchoffice_area.setGu_code("");
			branchoffice_addr.setGu_code("");
		}
		
		
		maxIdx_Addr = branchofficeDao.insert_getMaxIdx_Addr(branchoffice_addr);
		
		branchoffice_addr.setIdx(String.valueOf(maxIdx_Addr+1));
		
		Addr_ck = branchofficeDao.insert_getAddr_ck(branchoffice_addr);
		if(Addr_ck == 0){
			result = branchofficeDao.insertbranchoffice_area(branchoffice_area);
			branchofficeDao.insertbranchoffice_addr2(branchoffice_addr);
		}else{
			result = 2;
		}
		model.addObject("result",result);
		model.addObject("action",action); 
        model.setViewName("redirect:/BranchOffice_area");
        logger.info("<<<<<<<<<<<<<< END insertbranchoffice_area >>>>>>>>>>>>>>" );
        return model;
    }
	
	
	@RequestMapping(value = "/updatebranchoffice_area", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView updatebranchoffice_area(ModelAndView model, BranchOffice_AreaVO branchoffice_area, String action, String searchFlag, String coverFlag, String areaFlag, String searchContent, String areaContent, String pageNo) throws IllegalStateException, IOException
	{
		logger.info("<<<<<<<<<<<<<< START updatebranchoffice_area >>>>>>>>>>>>>>" );
		String[] a = branchoffice_area.getGu_code().split(",");
		branchoffice_area.setGu_code(a[1]);
		int result = branchofficeDao.updatebranchoffice_area(branchoffice_area);
		
		model.addObject("result",result);   
		model.addObject("action",action);
		model.addObject("pageNo",pageNo);
		model.addObject("searchFlag",searchFlag);
		model.addObject("coverFlag",coverFlag);
		model.addObject("areaFlag",areaFlag);
		model.addObject("searchContent", searchContent);
		model.addObject("areaContent", areaContent);
        model.setViewName("redirect:/BranchOffice_area");
        logger.info("<<<<<<<<<<<<<< END updatebranchoffice_area >>>>>>>>>>>>>>" );
        return model;
    }
	
	 @RequestMapping(value = "/deletebranchoffice_area", method = { RequestMethod.GET, RequestMethod.POST })
	 public ModelAndView deletebranchoffice_area(ModelAndView model, String seq, String b_id, BranchOffice_AreaVO BranchOffice_Area, String action, String searchFlag, String coverFlag, String areaFlag, String searchContent, String areaContent,  String pageNo)
    {
        logger.info("<<<<<<<<<<<<<< START deletebranchoffice_area >>>>>>>>>>>>>>" );
     
        BranchOffice_Area.setB_id(b_id); 
        int result = branchofficeDao.deleteBranchOffice_Area(seq);
        branchofficeDao.deleteBranchOffice_Area2(BranchOffice_Area);
        
        model.addObject("result",result);
        model.addObject("action",action); 
		model.addObject("pageNo",pageNo);
		model.addObject("searchFlag",searchFlag);
		model.addObject("coverFlag",coverFlag);
		model.addObject("areaFlag",areaFlag);
		model.addObject("searchContent", searchContent);
		model.addObject("areaContent", areaContent);
        model.setViewName("redirect:/BranchOffice_area");
        logger.info("<<<<<<<<<<<<<< END deletebranchoffice_area >>>>>>>>>>>>>>" );
        return model;
    }
	 
	 /*상점  관리 메뉴*/
	@RequestMapping(value = "/BranchOffice_store" , method = {RequestMethod.GET, RequestMethod.POST })
	public ModelAndView BranchOffice_Store(Principal principal, String searchFlag, String searchContent, String pageNo,String pageSize, String result, String action) throws UnsupportedEncodingException, InterruptedException {
		logger.info("<<<<<<<<<<<<<< START BranchOffice_store >>>>>>>>>>>>>>" );
		ModelAndView model = new ModelAndView();
		BranchOffice_StoreVO branchoffice_store = new BranchOffice_StoreVO();
		BranchOffice_AddrVO branchoffice_addr = new BranchOffice_AddrVO();
		
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
			branchoffice_store.setPageNo(Integer.parseInt(pageNo));
		}else {
			branchoffice_store.setPageNo(a);
		}
		if(pageSize != null){
			branchoffice_store.setPageSize(Integer.parseInt(pageSize));
		}else {
			branchoffice_store.setPageSize(b);
		}
		
		if(Integer.parseInt(pageNo) <= 0) branchoffice_store.setPageNo(1);
        if(Integer.parseInt(pageSize)<= 0)branchoffice_store.setPageSize(10);
        int pageno = branchoffice_store.getPageNo();
        
	        if(searchFlag != null){
	        	/*
	        	if(action != null && !action.equals("")){
	        	if(action.equals("UPDATE") || action.equals("DELETE")){
	        		if(searchContent != null && !searchContent.equals("")){
	        			searchContent = new String(searchContent.getBytes("iso-8859-1"), "utf-8");
	        		}
	        	}
	        	}else {
	        		searchContent = searchContent;
	        	}
	        	*/
	            if(searchFlag.equals("1")) {    
	            	branchoffice_store.setB_id(searchContent);
	            }
	            if(searchFlag.equals("2")) {    
	            	branchoffice_store.setS_name(searchContent);
	            }
	            if(searchFlag.equals("3")) {    
	            	branchoffice_store.setS_crn(searchContent);
	            }
	            if(searchFlag.equals("5")) {   
	            	branchoffice_store.setS_tel1(searchContent);
	            }
	            if(searchFlag.equals("6")) {    
	            	branchoffice_store.setS_tel2(searchContent);
	            }
	            if(searchFlag.equals("7")) {   
	            	branchoffice_store.setLogin_id(searchContent);
	            }
	            if(searchFlag.equals("8")) {    
	            	branchoffice_store.setActive_status(searchContent);
	            }
	            if(searchFlag.equals("9")) {    
	            	branchoffice_store.setB_name(searchContent);
	            }
	            if(searchFlag.equals("10")) {    
	            	branchoffice_store.setS_id(searchContent);
	            }
	        }    
	            
	        
	        List<BranchOffice_StoreVO> list = null;
	        List<BranchOffice_StoreVO> list_bank = null;
	        List<BranchOffice_AddrVO> list_bid = null;
	        
	        int totalCount = 0;
	        totalCount = branchofficeDao.getBranchOffice_StoreListCount(branchoffice_store);  
	        list = branchofficeDao.getBranchOffice_StoreList(branchoffice_store);  
	        list_bank = branchofficeDao.getBranchOfficeList_bank_store(branchoffice_store); 
	        list_bid = branchofficeDao.getBranchOfficeAddrList_bid(branchoffice_addr);  
	        
	        String name = principal.getName();
	        
			model.addObject("username", name);
			model.addObject("list_bank", list_bank);
			model.addObject("list_bid", list_bid);
	        model.addObject("totalCount", totalCount);
	        model.addObject("list", list);
	        model.addObject("searchContent", searchContent);
	        model.addObject("searchFlag", searchFlag);
	        model.addObject("result", result);
	        model.addObject("action", action);
	        model.addObject("pageno", pageno);
	        model.addObject("pageInfo", Page.getPageMap(branchoffice_store.getPageNo(), totalCount , branchoffice_store.getPageSize(), 10));
			model.setViewName(".BranchOffice_main3"); 
			logger.info("<<<<<<<<<<<<<< END BranchOffice_store >>>>>>>>>>>>>>" );
			
			
			return model;
	}
	
	
	 /*상점  관리 메뉴_CS*/
		@RequestMapping(value = "/BranchOffice_store_CS" , method = {RequestMethod.GET, RequestMethod.POST })
		public ModelAndView BranchOffice_Store_CS(String searchFlag, String searchContent, String pageNo,String pageSize, 
				String result, String action, String b_id) throws UnsupportedEncodingException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
			logger.info("<<<<<<<<<<<<<< START BranchOffice_Store_CS >>>>>>>>>>>>>>" );
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
			ModelAndView model = new ModelAndView();
			if(b_id == null) {
				model.setViewName("error/404");
			}else {
				BranchOffice_StoreVO branchoffice_store = new BranchOffice_StoreVO();
				BranchOffice_AddrVO branchoffice_addr = new BranchOffice_AddrVO();
				//AES256
				CipherAES aes256 = new CipherAES();
				String decText = "";
				String enText = "";
				
				if(action != null){
					if(action.equals(""))pageNo="1";
				}
				
				int a = 1;
				int b = 10;

				if(pageNo != null){
					branchoffice_store.setPageNo(Integer.parseInt(pageNo));
				}else {
					branchoffice_store.setPageNo(a);
				}
				if(pageSize != null){
					branchoffice_store.setPageSize(Integer.parseInt(pageSize));
				}else {
					branchoffice_store.setPageSize(b);
				}
				
				int pageno = branchoffice_store.getPageNo();
				
				if(Integer.parseInt(pageNo) <= 0) branchoffice_store.setPageNo(1); 
		        if(Integer.parseInt(pageSize)<= 0)branchoffice_store.setPageSize(10);
		        
		        if(b_id.length() != 5 && b_id != null) {
					decText = aes256.aesDecode(b_id); //복호화
				} 

		        if(b_id.length() != 5) {
		        	if(decText != null){
		        		branchoffice_store.setB_id(decText);
		        	}
		        }
		        
			        if(searchFlag != null){
			        	
			            if(searchFlag.equals("1")) {    
			            	branchoffice_store.setB_id(searchContent);
			            }
			            if(searchFlag.equals("2")) {    
			            	branchoffice_store.setS_name(searchContent);
			            }
			            if(searchFlag.equals("3")) {    
			            	branchoffice_store.setS_crn(searchContent);
			            }
			            if(searchFlag.equals("5")) {   
			            	branchoffice_store.setS_tel1(searchContent);
			            }
			            if(searchFlag.equals("6")) {    
			            	branchoffice_store.setS_tel2(searchContent);
			            }
			            if(searchFlag.equals("7")) {   
			            	branchoffice_store.setLogin_id(searchContent);
			            }
			            if(searchFlag.equals("8")) {    
			            	branchoffice_store.setActive_status(searchContent);
			            }
			        }    
			            
			        
			        List<BranchOffice_StoreVO> list = null;
			        List<BranchOffice_StoreVO> list_bank = null;
			        List<BranchOffice_AddrVO> list_bid = null;
			        
			        int totalCount = 0;
			        totalCount = branchofficeDao.getBranchOffice_StoreListCount_CS(branchoffice_store);  
			        list = branchofficeDao.getBranchOffice_StoreList_CS(branchoffice_store);  
			        list_bank = branchofficeDao.getBranchOfficeList_bank_store(branchoffice_store); 
			        list_bid = branchofficeDao.getBranchOfficeAddrList_bid(branchoffice_addr);  
			        
					model.addObject("decText", decText);
					model.addObject("list_bank", list_bank);
					model.addObject("list_bid", list_bid);
			        model.addObject("totalCount", totalCount);
			        model.addObject("list", list);
			        model.addObject("searchContent", searchContent);
			        model.addObject("searchFlag", searchFlag);
			        model.addObject("result", result);
			        model.addObject("action", action);
			        model.addObject("b_id", b_id);
			        model.addObject("pageno", pageno);
			        model.addObject("pageInfo", Page.getPageMap(branchoffice_store.getPageNo(), totalCount , branchoffice_store.getPageSize(), 10));
					
			        if(decText != null) {
				        if(decText.equals(branchoffice_store.getB_id())) {
				        	model.setViewName("cs/BranchOffice_store"); 
				        }else {
				        	model.setViewName("error/404"); 
				        }
			        }else {
			        	model.setViewName("error/404");
			        }
			        
			        if(b_id.length() == 5 || b_id.length() == 0) {
			        	model.setViewName("error/404"); 
			        }
			}
				logger.info("<<<<<<<<<<<<<< END BranchOffice_Store_CS >>>>>>>>>>>>>>" );
				return model;
		}
	
		 /*상점  관리 메뉴_CS_GET*/
		@RequestMapping(value = "/BranchOffice_store_CS_get" , method = {RequestMethod.GET})
		public ModelAndView BranchOffice_Store_CS_get(Principal principal, String searchFlag, String searchContent, String pageNo,String pageSize, 
				String result, String action, String b_id) throws UnsupportedEncodingException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
			logger.info("<<<<<<<<<<<<<< START BranchOffice_Store_CS_get >>>>>>>>>>>>>>" );
			ModelAndView model = new ModelAndView();
			if(b_id == null) {
				model.setViewName("error/404");
			}else {
				BranchOffice_StoreVO branchoffice_store = new BranchOffice_StoreVO();
				BranchOffice_AddrVO branchoffice_addr = new BranchOffice_AddrVO();
				//AES256
				CipherAES aes256 = new CipherAES();
				String decText = "";
				String enText = "";
				
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
					branchoffice_store.setPageNo(Integer.parseInt(pageNo));
				}else {
					branchoffice_store.setPageNo(a);
				}
				if(pageSize != null){
					branchoffice_store.setPageSize(Integer.parseInt(pageSize));
				}else {
					branchoffice_store.setPageSize(b);
				}
				
				if(Integer.parseInt(pageNo) <= 0) branchoffice_store.setPageNo(1);
		        if(Integer.parseInt(pageSize)<= 0)branchoffice_store.setPageSize(10);
		        int pageno = branchoffice_store.getPageNo();
		        
		        if(b_id.length() != 5 && b_id != null) {
					decText = aes256.aesDecode(b_id); //복호화
				} 

		        if(b_id.length() != 5) {
		        	if(decText != null){
		        		branchoffice_store.setB_id(decText);
		        	}
		        }
		        
			        if(searchFlag != null){
			        	
			            if(searchFlag.equals("1")) {    
			            	branchoffice_store.setB_id(searchContent);
			            }
			            if(searchFlag.equals("2")) {    
			            	branchoffice_store.setS_name(searchContent);
			            }
			            if(searchFlag.equals("3")) {    
			            	branchoffice_store.setS_crn(searchContent);
			            }
			            if(searchFlag.equals("5")) {   
			            	branchoffice_store.setS_tel1(searchContent);
			            }
			            if(searchFlag.equals("6")) {    
			            	branchoffice_store.setS_tel2(searchContent);
			            }
			            if(searchFlag.equals("7")) {   
			            	branchoffice_store.setLogin_id(searchContent);
			            }
			            if(searchFlag.equals("8")) {    
			            	branchoffice_store.setActive_status(searchContent);
			            }
			        }    
			            
			        
			        List<BranchOffice_StoreVO> list = null;
			        List<BranchOffice_StoreVO> list_bank = null;
			        List<BranchOffice_AddrVO> list_bid = null;
			        
			        int totalCount = 0;
			        totalCount = branchofficeDao.getBranchOffice_StoreListCount_CS(branchoffice_store);  
			        list = branchofficeDao.getBranchOffice_StoreList_CS(branchoffice_store);  
			        list_bank = branchofficeDao.getBranchOfficeList_bank_store(branchoffice_store); 
			        list_bid = branchofficeDao.getBranchOfficeAddrList_bid(branchoffice_addr);  
			        
					model.addObject("decText", decText);
					model.addObject("list_bank", list_bank);
					model.addObject("list_bid", list_bid);
			        model.addObject("totalCount", totalCount);
			        model.addObject("list", list);
			        model.addObject("searchContent", searchContent);
			        model.addObject("searchFlag", searchFlag);
			        model.addObject("result", result);
			        model.addObject("action", action);
			        model.addObject("b_id", b_id);
			        model.addObject("pageno", pageno);
			        model.addObject("pageInfo", Page.getPageMap(branchoffice_store.getPageNo(), totalCount , branchoffice_store.getPageSize(), 10));
					
			        if(decText != null) {
				        if(decText.equals(branchoffice_store.getB_id())) {
				        	model.setViewName("cs/BranchOffice_store"); 
				        }else {
				        	model.setViewName("error/404"); 
				        }
			        }else {
			        	model.setViewName("error/404");
			        }
			        
			        if(b_id.length() == 5 || b_id.length() == 0) {
			        	model.setViewName("error/404"); 
			        }
			}
				logger.info("<<<<<<<<<<<<<< END BranchOffice_Store_CS_get >>>>>>>>>>>>>>" );
				return model;
		}
	
	@RequestMapping(value = "/insertbranchoffice_store", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView inserbranchoffice_store(ModelAndView model, BranchOffice_StoreVO branchoffice_store, String action) throws IllegalStateException, IOException, NumberFormatException, InterruptedException
	{
		logger.info("<<<<<<<<<<<<<< START inserbranchoffice_store >>>>>>>>>>>>>>" );
		String v_account = "";
		String s_seq = "";
		String s_id = "";
		String org_v_bank = "";
		String b_representative = "";
		int s_sequence = 0;
		/*
		v_account = branchofficeDao.getv_account_store(branchoffice_store);
		branchoffice_store.setV_account(v_account);
		*/
		org_v_bank = branchofficeDao.getv_bank_store(branchoffice_store);
		
		s_seq = branchofficeDao.gets_seq(branchoffice_store); 
		s_sequence = Integer.parseInt(s_seq) + 1;
		
		b_representative = branchofficeDao.getb_representative(branchoffice_store);
		branchoffice_store.setV_name(b_representative);
		
		if(s_seq.length() == 1) {
			s_id = branchoffice_store.getB_id()+"S000"+s_seq;
		}else if(s_seq.length() == 2) {
			s_id = branchoffice_store.getB_id()+"S00"+s_seq;
		}else if(s_seq.length() == 3) {
			s_id = branchoffice_store.getB_id()+"S0"+s_seq;
		}else {
			s_id = branchoffice_store.getB_id()+"S"+s_seq;
		}
		
		branchoffice_store.setS_id(s_id);
		branchoffice_store.setS_sequence(s_sequence);
		
		
		
		int result = branchofficeDao.insertbranchoffice_store(branchoffice_store);
					 branchofficeDao.insertvbankchg_store(branchoffice_store); 
					 branchofficeDao.updates_seq(branchoffice_store);
					 branchofficeDao.insertsessioninfo_s1(branchoffice_store);
					 branchofficeDao.insertsessioninfo_s2(branchoffice_store);
					 branchofficeDao.insertsessioninfo_s3(branchoffice_store);
	
		model.addObject("result",result);
		model.addObject("action",action); 
        model.setViewName("redirect:/BranchOffice_store");
        logger.info("<<<<<<<<<<<<<< END insertbranchoffice_store >>>>>>>>>>>>>>" );
        Thread.sleep(Long.parseLong(mrs_prop.getProperty("sleep.count")));
        return model;
    }
	
	/*상점관리_CS 등록*/
	@RequestMapping(value = "/insertbranchoffice_store_CS", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView inserbranchoffice_store_CS(ModelAndView model, BranchOffice_StoreVO branchoffice_store, String action) throws IllegalStateException, IOException, NumberFormatException, InterruptedException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException
	{
		logger.info("<<<<<<<<<<<<<< START inserbranchoffice_store_CS >>>>>>>>>>>>>>" );
		String v_account = "";
		String s_seq = "";
		String s_id = "";
		String org_v_bank = "";
		String b_representative = "";
		int s_sequence = 0;
		
		CipherAES aes256 = new CipherAES();
	    String b_id = aes256.aesEncode(branchoffice_store.getB_id()); //암호화

		/*
		v_account = branchofficeDao.getv_account_store(branchoffice_store);
		branchoffice_store.setV_account(v_account);
		*/
		org_v_bank = branchofficeDao.getv_bank_store(branchoffice_store);
		
		s_seq = branchofficeDao.gets_seq(branchoffice_store); 
		s_sequence = Integer.parseInt(s_seq) + 1;
		
		b_representative = branchofficeDao.getb_representative(branchoffice_store);
		branchoffice_store.setV_name(b_representative);
		
		if(s_seq.length() == 1) {
			s_id = branchoffice_store.getB_id()+"S000"+s_seq;
		}else if(s_seq.length() == 2) {
			s_id = branchoffice_store.getB_id()+"S00"+s_seq;
		}else if(s_seq.length() == 3) {
			s_id = branchoffice_store.getB_id()+"S0"+s_seq;
		}else {
			s_id = branchoffice_store.getB_id()+"S"+s_seq;
		}
		
		branchoffice_store.setS_id(s_id);
		branchoffice_store.setS_sequence(s_sequence);
		
		int result = branchofficeDao.insertbranchoffice_store(branchoffice_store);
					 branchofficeDao.insertvbankchg_store(branchoffice_store); 
					 branchofficeDao.updates_seq(branchoffice_store);
					 branchofficeDao.insertsessioninfo_s1(branchoffice_store);
					 branchofficeDao.insertsessioninfo_s2(branchoffice_store);
					 branchofficeDao.insertsessioninfo_s3(branchoffice_store);
		
		model.addObject("b_id",b_id); 
		model.addObject("result",result);
		model.addObject("action",action); 
        model.setViewName("redirect:/BranchOffice_store_CS_get");
        logger.info("<<<<<<<<<<<<<< END insertbranchoffice_store_CS >>>>>>>>>>>>>>" );
        Thread.sleep(Long.parseLong(mrs_prop.getProperty("sleep.count")));
        return model;
    }
	
	@RequestMapping(value = "/updatebranchoffice_store", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView updatebranchoffice_store(ModelAndView model, BranchOffice_StoreVO branchoffice_store, String action, String searchFlag, String searchContent, String pageNo) throws IllegalStateException, IOException, InterruptedException
	{
		logger.info("<<<<<<<<<<<<<< START updatebranchoffice_store >>>>>>>>>>>>>>" );
		
		String org_v_bank = branchofficeDao.getv_bank_store(branchoffice_store);
		String org_v_account = branchofficeDao.getv_account2_store(branchoffice_store);
		String org_v_name = branchofficeDao.getv_name_store(branchoffice_store);
		String org_contract_sdate = branchofficeDao.getcontract_sdate_store(branchoffice_store);
		String org_contract_edate = branchofficeDao.getcontract_edate_store(branchoffice_store);
		
		branchoffice_store.setOrg_v_bank(org_v_bank);
		branchoffice_store.setOrg_v_account(org_v_account);
		branchoffice_store.setOrg_s_representative(org_v_name);
		branchoffice_store.setOrg_contract_sdate(org_contract_sdate);
		branchoffice_store.setOrg_contract_edate(org_contract_edate);

		int result = branchofficeDao.updatebranchoffice_store(branchoffice_store);
					 branchofficeDao.updatevbankchg_store(branchoffice_store); 
	
		model.addObject("result",result);  
		model.addObject("action",action);  
		model.addObject("pageNo",pageNo);
		model.addObject("searchFlag",searchFlag);
		model.addObject("searchContent", searchContent);
        model.setViewName("redirect:/BranchOffice_store");
        logger.info("<<<<<<<<<<<<<< END updatebranchoffice_store >>>>>>>>>>>>>>" );
        if(org_v_bank != null) {
	        if(!org_v_bank.equals(branchoffice_store.getV_bank())) {
	        	Thread.sleep(Long.parseLong(mrs_prop.getProperty("sleep.count")));
	        }
        }
        return model;
    }
	
	/*상점관리CS 수정*/
	@RequestMapping(value = "/updatebranchoffice_store_CS", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView updatebranchoffice_store_CS(ModelAndView model, BranchOffice_StoreVO branchoffice_store, String action, String searchFlag, String searchContent, String pageNo) throws IllegalStateException, IOException, InterruptedException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException
	{
		logger.info("<<<<<<<<<<<<<< START updatebranchoffice_store_CS >>>>>>>>>>>>>>" );
		
		CipherAES aes256 = new CipherAES();
	    String b_id = aes256.aesEncode(branchoffice_store.getB_id()); //암호화
		
		String org_v_bank = branchofficeDao.getv_bank_store(branchoffice_store);
		String org_v_account = branchofficeDao.getv_account2_store(branchoffice_store);
		String org_v_name = branchofficeDao.getv_name_store(branchoffice_store);
		String org_contract_sdate = branchofficeDao.getcontract_sdate_store(branchoffice_store);
		String org_contract_edate = branchofficeDao.getcontract_edate_store(branchoffice_store);
		
		branchoffice_store.setOrg_v_bank(org_v_bank);
		branchoffice_store.setOrg_v_account(org_v_account);
		branchoffice_store.setOrg_s_representative(org_v_name);
		branchoffice_store.setOrg_contract_sdate(org_contract_sdate);
		branchoffice_store.setOrg_contract_edate(org_contract_edate);

		int result = branchofficeDao.updatebranchoffice_store(branchoffice_store);
					 branchofficeDao.updatevbankchg_store(branchoffice_store); 
	
		model.addObject("b_id",b_id);
		model.addObject("result",result);  
		model.addObject("action",action);  
		model.addObject("pageNo",pageNo);
		model.addObject("searchFlag",searchFlag);
		model.addObject("searchContent", searchContent);
        model.setViewName("redirect:/BranchOffice_store_CS_get");
        logger.info("<<<<<<<<<<<<<< END updatebranchoffice_store_CS >>>>>>>>>>>>>>" );
        if(org_v_bank != null) {
	        if(!org_v_bank.equals(branchoffice_store.getV_bank())) {
	        	Thread.sleep(Long.parseLong(mrs_prop.getProperty("sleep.count")));
	        }
        }
        return model;
    }
	
	 @RequestMapping(value = "/deletebranchoffice_store", method = { RequestMethod.GET, RequestMethod.POST })
	 public ModelAndView deletebranchoffice_store(ModelAndView model, String s_id, String action, BranchOffice_StoreVO branchoffice_store, String searchFlag, String searchContent, String pageNo)
    {
        logger.info("<<<<<<<<<<<<<< START deletebranchoffice_store >>>>>>>>>>>>>>" );
        
        String org_v_bank = branchofficeDao.getv_bank_store(branchoffice_store); 
		String org_v_account = branchofficeDao.getv_account2_store(branchoffice_store);
		String org_v_name = branchofficeDao.getv_name_store(branchoffice_store);
		String contract_sdate = branchofficeDao.getcontract_sdate_store(branchoffice_store);
		String contract_edate = branchofficeDao.getcontract_edate_store(branchoffice_store);
		String org_contract_sdate = branchofficeDao.getorg_contract_sdate_store(branchoffice_store);
		String org_contract_edate = branchofficeDao.getorg_contract_edate_store(branchoffice_store);
		
		branchoffice_store.setOrg_v_bank(org_v_bank);
		branchoffice_store.setOrg_v_account(org_v_account);
		branchoffice_store.setOrg_v_name(org_v_name);
		branchoffice_store.setV_name(org_v_name);
		branchoffice_store.setContract_sdate(contract_sdate);
		branchoffice_store.setContract_edate(contract_edate);
		branchoffice_store.setOrg_contract_sdate(org_contract_sdate);
		branchoffice_store.setOrg_contract_edate(org_contract_edate);
        
        int result = branchofficeDao.afd_deleted_storeinfo(s_id);
        			 branchofficeDao.deleteBranchOffice_Store(s_id);
        			 branchofficeDao.deletevbankchg_store(branchoffice_store); 
        			 branchofficeDao.deletesessioninfo_s(branchoffice_store); 
        			 branchofficeDao.deleteafd_time_extra(s_id);
        			 branchofficeDao.deleteafd_area_extra(s_id);
        			 branchofficeDao.deleteafd_storecoverarea(s_id);
        			 branchofficeDao.deleteafd_fixed_price(s_id);
        			 branchofficeDao.deleteafd_foodcategory(s_id);
        			 branchofficeDao.deleteafd_basemenu(s_id);
        			 
        			 
        model.addObject("result",result);
        model.addObject("action",action); 
		model.addObject("pageNo",pageNo);
		model.addObject("searchFlag",searchFlag);
		model.addObject("searchContent", searchContent);
        model.setViewName("redirect:/BranchOffice_store");
        logger.info("<<<<<<<<<<<<<< END deletebranchoffice_store >>>>>>>>>>>>>>" );
        return model;
    }
	 
	 /*상점관리CS 삭제*/
	 @RequestMapping(value = "/deletebranchoffice_store_CS", method = { RequestMethod.GET, RequestMethod.POST })
	 public ModelAndView deletebranchoffice_store_CS(ModelAndView model, String s_id, String action, BranchOffice_StoreVO branchoffice_store, String searchFlag, String searchContent, String pageNo) throws InvalidKeyException, UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException
    {
        logger.info("<<<<<<<<<<<<<< START deletebranchoffice_store_CS >>>>>>>>>>>>>>" );
        
        CipherAES aes256 = new CipherAES();
	    String b_id = aes256.aesEncode(branchoffice_store.getB_id()); //암호화
	    
        String org_v_bank = branchofficeDao.getv_bank_store(branchoffice_store); 
		String org_v_account = branchofficeDao.getv_account2_store(branchoffice_store);
		String org_v_name = branchofficeDao.getv_name_store(branchoffice_store);
		String contract_sdate = branchofficeDao.getcontract_sdate_store(branchoffice_store);
		String contract_edate = branchofficeDao.getcontract_edate_store(branchoffice_store);
		String org_contract_sdate = branchofficeDao.getorg_contract_sdate_store(branchoffice_store);
		String org_contract_edate = branchofficeDao.getorg_contract_edate_store(branchoffice_store);
		
		branchoffice_store.setOrg_v_bank(org_v_bank);
		branchoffice_store.setOrg_v_account(org_v_account);
		branchoffice_store.setOrg_v_name(org_v_name);
		branchoffice_store.setV_name(org_v_name);
		branchoffice_store.setContract_sdate(contract_sdate);
		branchoffice_store.setContract_edate(contract_edate);
		branchoffice_store.setOrg_contract_sdate(org_contract_sdate);
		branchoffice_store.setOrg_contract_edate(org_contract_edate);
        
        int result = branchofficeDao.afd_deleted_storeinfo(s_id);
        			 branchofficeDao.deleteBranchOffice_Store(s_id);
        			 branchofficeDao.deletevbankchg_store(branchoffice_store); 
        			 branchofficeDao.deletesessioninfo_s(branchoffice_store); 
        			 branchofficeDao.deleteafd_time_extra(s_id);
        			 branchofficeDao.deleteafd_area_extra(s_id);
        			 branchofficeDao.deleteafd_storecoverarea(s_id);
        			 branchofficeDao.deleteafd_fixed_price(s_id);
        			 branchofficeDao.deleteafd_foodcategory(s_id);
        			 branchofficeDao.deleteafd_basemenu(s_id);
        			 
       
        model.addObject("b_id",b_id); 
        model.addObject("result",result);
        model.addObject("action",action); 
		model.addObject("pageNo",pageNo);
		model.addObject("searchFlag",searchFlag);
		model.addObject("searchContent", searchContent);
        model.setViewName("redirect:/BranchOffice_store_CS_get");
        logger.info("<<<<<<<<<<<<<< END deletebranchoffice_store_CS >>>>>>>>>>>>>>" );
        return model;
    }
	 
	 
	//지사 주소 정보 메뉴
			@RequestMapping(value = "/BranchOffice_addr" , method = {RequestMethod.GET, RequestMethod.POST })
			public ModelAndView BranchOffice_addr(Principal principal, String searchFlag, String bidList, String searchContent, String san_flag,String pageNo,String pageSize, String result, String action) {
				logger.info("<<<<<<<<<<<<<< START BranchOffice_addr >>>>>>>>>>>>>>" );
				ModelAndView model = new ModelAndView();
				
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
				
				BranchOffice_AddrVO branchoffice_addr = new BranchOffice_AddrVO();
				BranchOffice_NationVO branchoffice_nation = new BranchOffice_NationVO();
				if(action != null){
					if(action.equals(""))pageNo="1";
				}
				
				int a = 1;
				int b = 10;

				if(pageNo != null){
					branchoffice_addr.setPageNo(Integer.parseInt(pageNo));
				}else {
					branchoffice_addr.setPageNo(a);
				}
				if(pageSize != null){
					branchoffice_addr.setPageSize(Integer.parseInt(pageSize));
				}else {
					branchoffice_addr.setPageSize(b);
				}
				int pageno = branchoffice_addr.getPageNo();
				
				if(Integer.parseInt(pageNo) <= 0) branchoffice_addr.setPageNo(1);
		        if(Integer.parseInt(pageSize)<= 0)branchoffice_addr.setPageSize(50);
		        
			        if(bidList != null){
			        	branchoffice_addr.setB_id(bidList);
			        }
		        
			        if(searchFlag != null){
			            if(searchFlag.equals("1")) {   
			            	branchoffice_addr.setCity_code(searchContent);
			            }
			            if(searchFlag.equals("2")) {   
			            	branchoffice_addr.setGu_code(searchContent);
			            }
			            if(searchFlag.equals("3")) {   
			            	branchoffice_addr.setTown_code(searchContent);
			            }
			            if(searchFlag.equals("4")) {   
			            	branchoffice_addr.setDong_code(searchContent);
			            }
			            if(searchFlag.equals("5")) {   
			            	branchoffice_addr.setLi_code(searchContent);
			            }
			            if(searchFlag.equals("6")) {   
			            	branchoffice_addr.setJi_bonbun(searchContent);
			            }
			            if(searchFlag.equals("7")) {   
			            	branchoffice_addr.setJi_bubun(searchContent);
			            }
			            if(searchFlag.equals("8")) {   
			            	branchoffice_addr.setBuilding_name(searchContent);
			            }
			            if(searchFlag.equals("9")) {   
			            	branchoffice_addr.setBuilding_dongho(searchContent);
			            }
			            if(searchFlag.equals("10")) {   
			            	branchoffice_addr.setRoad_codenum(searchContent);
			            }
			            if(searchFlag.equals("11")) {   
			            	branchoffice_addr.setRoad_code(searchContent);
			            }
			            if(searchFlag.equals("12")) {   
			            	branchoffice_addr.setRoad_bonbun(searchContent);
			            }
			            if(searchFlag.equals("13")) {   
			            	branchoffice_addr.setRoad_bubun(searchContent);
			            }
			            if(searchFlag.equals("14")) {   
			            	branchoffice_addr.setB_id(searchContent);
			            }
			            if(searchFlag.equals("15")) {   
			            	branchoffice_addr.setB_name(searchContent);
			            }
			        }  
			        
			        if(san_flag != null){
			            if(san_flag.equals("0")) {    
			            	branchoffice_addr.setSan_flag(san_flag);
			            }
			            if(san_flag.equals("1")) {   
			            	branchoffice_addr.setSan_flag(san_flag);
			            }
			        }   
			        
			        List<BranchOffice_AddrVO> list = null;
			        List<BranchOffice_AddrVO> list_bid = null;
			        List<BranchOffice_AddrVO> list_bidlist = null;
			        List<BranchOffice_AddrVO> list_citygu = null;
			        List<BranchOffice_NationVO> nation_list = null;
			        
			        int totalCount = 0;
			        totalCount = branchofficeDao.getBranchOfficeAddrListCount(branchoffice_addr);
			        int maxIdx_Addr = 0;
					maxIdx_Addr = branchofficeDao.getMaxIdx_Addr(branchoffice_addr);
			        list = branchofficeDao.getBranchOfficeAddrList(branchoffice_addr);  
			        list_bid = branchofficeDao.getBranchOfficeAddrList_bid(branchoffice_addr); 
			        list_bidlist = branchofficeDao.getBranchOfficeAddrList_bidlist(branchoffice_addr); 
			        nation_list = branchofficeDao.getBranchOffice_NationList(branchoffice_nation);
			        //list_citygu = branchofficeDao.getCityGu_Addr(branchoffice_addr); 
			        String name = principal.getName();
			     
					model.addObject("username", name);
			        model.addObject("totalCount", totalCount);
			        model.addObject("list", list);
			        model.addObject("list_bid", list_bid);
			        model.addObject("list_bidlist", list_bidlist);
			        model.addObject("nation_list", nation_list);
			        model.addObject("searchContent", searchContent);
			        model.addObject("searchFlag", searchFlag);
			        model.addObject("san_flag", san_flag);
			        model.addObject("result", result);
			        model.addObject("action", action);
			        model.addObject("bidList",bidList);
			        model.addObject("maxIdx_Addr", maxIdx_Addr);
			        model.addObject("pageno",pageno);
			        model.addObject("pageInfo", Page.getPageMap(branchoffice_addr.getPageNo(), totalCount , branchoffice_addr.getPageSize(), 10));
					model.setViewName(".BranchOffice_main4"); 
					logger.info("<<<<<<<<<<<<<< END BranchOffice_addr >>>>>>>>>>>>>>" );
					return model;
			}
			
			@RequestMapping(value = "/BranchOffice_addr_CS" , method = {RequestMethod.GET, RequestMethod.POST})
			public ModelAndView BranchOffice_addr_CS(String searchFlag, String searchContent, String san_flag,String pageNo,
					String pageSize, String result, String action, String b_id) throws UnsupportedEncodingException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
				logger.info("<<<<<<<<<<<<<< START BranchOffice_addr_CS >>>>>>>>>>>>>>" );
				ModelAndView model = new ModelAndView();
				if(b_id == null) {
					model.setViewName("error/404");
				}else {
					BranchOffice_AddrVO branchoffice_addr = new BranchOffice_AddrVO();
					BranchOffice_NationVO branchoffice_nation = new BranchOffice_NationVO();
					//AES256
					CipherAES aes256 = new CipherAES();
				    //String encText = aes256.aesEncode(b_id); //암호화
					String decText = "";
					String enText = "";
					
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
						branchoffice_addr.setPageNo(Integer.parseInt(pageNo));
					}else {
						branchoffice_addr.setPageNo(a);
					}
					if(pageSize != null){
						branchoffice_addr.setPageSize(Integer.parseInt(pageSize));
					}else {
						branchoffice_addr.setPageSize(b);
					}
					
					int pageno = branchoffice_addr.getPageNo();
					
					if(Integer.parseInt(pageNo) <= 0) branchoffice_addr.setPageNo(1);
			        if(Integer.parseInt(pageSize)<= 0)branchoffice_addr.setPageSize(50);
				
					
					if(b_id.length() != 5 && b_id != null) {
						decText = aes256.aesDecode(b_id); //복호화
					} 

			        if(b_id.length() != 5) {
			        	if(decText != null){
			        		branchoffice_addr.setB_id(decText);
			        	}
			        }
			        	
				        if(searchFlag != null){
				            if(searchFlag.equals("1")) {   
				            	branchoffice_addr.setCity_code(searchContent);
				            }
				            if(searchFlag.equals("2")) {   
				            	branchoffice_addr.setGu_code(searchContent);
				            }
				            if(searchFlag.equals("3")) {   
				            	branchoffice_addr.setTown_code(searchContent);
				            }
				            if(searchFlag.equals("4")) {   
				            	branchoffice_addr.setDong_code(searchContent);
				            }
				            if(searchFlag.equals("5")) {   
				            	branchoffice_addr.setLi_code(searchContent);
				            }
				            if(searchFlag.equals("6")) {   
				            	branchoffice_addr.setJi_bonbun(searchContent);
				            }
				            if(searchFlag.equals("7")) {   
				            	branchoffice_addr.setJi_bubun(searchContent);
				            }
				            if(searchFlag.equals("8")) {   
				            	branchoffice_addr.setBuilding_name(searchContent);
				            }
				            if(searchFlag.equals("9")) {   
				            	branchoffice_addr.setBuilding_dongho(searchContent);
				            }
				            if(searchFlag.equals("10")) {   
				            	branchoffice_addr.setRoad_codenum(searchContent);
				            }
				            if(searchFlag.equals("11")) {   
				            	branchoffice_addr.setRoad_code(searchContent);
				            }
				            if(searchFlag.equals("12")) {   
				            	branchoffice_addr.setRoad_bonbun(searchContent);
				            }
				            if(searchFlag.equals("13")) {   
				            	branchoffice_addr.setRoad_bubun(searchContent);
				            }
				        }  
				        
				        if(san_flag != null){
				            if(san_flag.equals("0")) {    
				            	branchoffice_addr.setSan_flag(san_flag);
				            }
				            if(san_flag.equals("1")) {   
				            	branchoffice_addr.setSan_flag(san_flag);
				            }
				        }   
				        
				        List<BranchOffice_AddrVO> list = null;
				        List<BranchOffice_AddrVO> list_bid = null;
				        List<BranchOffice_AddrVO> list_citygu = null;
				        List<BranchOffice_NationVO> nation_list = null;
				        
				        int totalCount = 0;
				        totalCount = branchofficeDao.getBranchOfficeAddrListCount_cs(branchoffice_addr);
				        int maxIdx_Addr = 0;
						maxIdx_Addr = branchofficeDao.getMaxIdx_Addr(branchoffice_addr);
				        list = branchofficeDao.getBranchOfficeAddrList_cs(branchoffice_addr);  
				        list_bid = branchofficeDao.getBranchOfficeAddrList_bid(branchoffice_addr); 
				        nation_list = branchofficeDao.getBranchOffice_NationList(branchoffice_nation);
				        
				        model.addObject("totalCount", totalCount);
				        model.addObject("decText", decText);
				        model.addObject("list", list);
				        model.addObject("list_bid", list_bid);
				        model.addObject("nation_list", nation_list);
				        model.addObject("searchContent", searchContent);
				        model.addObject("searchFlag", searchFlag);
				        model.addObject("san_flag", san_flag);
				        model.addObject("result", result);
				        model.addObject("action", action);
				        model.addObject("maxIdx_Addr", maxIdx_Addr);
				        model.addObject("b_id", b_id);
				        model.addObject("pageno",pageno);
				        model.addObject("pageInfo", Page.getPageMap(branchoffice_addr.getPageNo(), totalCount , branchoffice_addr.getPageSize(), 10));
				      
				        if(decText != null) {
					        if(decText.equals(branchoffice_addr.getB_id())) {
					        	model.setViewName("cs/BranchOffice_addr"); 
					        }else {
					        	model.setViewName("error/404"); 
					        }
				        }else {
				        	model.setViewName("error/404");
				        }
				        
				        if(b_id.length() == 5 || b_id.length() == 0) {
				        	model.setViewName("error/404"); 
				        }
				}
				        
				      
				        //SHA256
				        /*
				        if(b_id != null && aes256_cs!= null) {
					        if(aes256_cs.equals(Cipher.encryptSHA256("mrsdelivery", "!alfoths1234"))) {
					        	model.setViewName("cs/BranchOffice_addr"); 
					        }else {
					        	model.setViewName("error/404"); 
					        }
				        }
					*/
				        
				        //암호화안넣을때
				        /*
				        if(b_id != null) {
				        	model.setViewName("cs/BranchOffice_addr"); 
				        }else {
				        	model.setViewName("error/404");
				        }
				        */
					logger.info("<<<<<<<<<<<<<< END BranchOffice_addr_CS >>>>>>>>>>>>>>" );
					return model;
			}
			
			@RequestMapping(value = "/BranchOffice_addr_CS_get" , method = {RequestMethod.GET})
			public ModelAndView BranchOffice_addr_CS_get(String searchFlag, String searchContent, String san_flag,String pageNo,
					String pageSize, String result, String action, String b_id) throws UnsupportedEncodingException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
				logger.info("<<<<<<<<<<<<<< START BranchOffice_addr_CS_get >>>>>>>>>>>>>>" );
				ModelAndView model = new ModelAndView();
				if(b_id == null) {
					model.setViewName("error/404");
				}else {
					BranchOffice_AddrVO branchoffice_addr = new BranchOffice_AddrVO();
					BranchOffice_NationVO branchoffice_nation = new BranchOffice_NationVO();
					//AES256
					CipherAES aes256 = new CipherAES();
				    //String encText = aes256.aesEncode(b_id); //암호화
					String decText = "";
					
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
					
					if(b_id.length() != 5 && b_id != null) {
						decText = aes256.aesDecode(b_id); //복호화
					} 
				
					if(action != null){
						if(action.equals(""))pageNo="1";
					}
					
					int a = 1;
					int b = 10;

					if(pageNo != null){
						branchoffice_addr.setPageNo(Integer.parseInt(pageNo));
					}else {
						branchoffice_addr.setPageNo(a);
					}
					if(pageSize != null){
						branchoffice_addr.setPageSize(Integer.parseInt(pageSize));
					}else {
						branchoffice_addr.setPageSize(b);
					}
					
					int pageno = branchoffice_addr.getPageNo();
					
					if(Integer.parseInt(pageNo) <= 0) branchoffice_addr.setPageNo(1);
			        if(Integer.parseInt(pageSize)<= 0)branchoffice_addr.setPageSize(50);
				
					
			        if(b_id.length() != 5) {
			        	if(decText != null){
			        		branchoffice_addr.setB_id(decText);
			        	}
			        }
			        	
				        if(searchFlag != null){
				            if(searchFlag.equals("1")) {   
				            	branchoffice_addr.setCity_code(searchContent);
				            }
				            if(searchFlag.equals("2")) {   
				            	branchoffice_addr.setGu_code(searchContent);
				            }
				            if(searchFlag.equals("3")) {   
				            	branchoffice_addr.setTown_code(searchContent);
				            }
				            if(searchFlag.equals("4")) {   
				            	branchoffice_addr.setDong_code(searchContent);
				            }
				            if(searchFlag.equals("5")) {   
				            	branchoffice_addr.setLi_code(searchContent);
				            }
				            if(searchFlag.equals("6")) {   
				            	branchoffice_addr.setJi_bonbun(searchContent);
				            }
				            if(searchFlag.equals("7")) {   
				            	branchoffice_addr.setJi_bubun(searchContent);
				            }
				            if(searchFlag.equals("8")) {   
				            	branchoffice_addr.setBuilding_name(searchContent);
				            }
				            if(searchFlag.equals("9")) {   
				            	branchoffice_addr.setBuilding_dongho(searchContent);
				            }
				            if(searchFlag.equals("10")) {   
				            	branchoffice_addr.setRoad_codenum(searchContent);
				            }
				            if(searchFlag.equals("11")) {   
				            	branchoffice_addr.setRoad_code(searchContent);
				            }
				            if(searchFlag.equals("12")) {   
				            	branchoffice_addr.setRoad_bonbun(searchContent);
				            }
				            if(searchFlag.equals("13")) {   
				            	branchoffice_addr.setRoad_bubun(searchContent);
				            }
				        }  
				        
				        if(san_flag != null){
				            if(san_flag.equals("0")) {    
				            	branchoffice_addr.setSan_flag(san_flag);
				            }
				            if(san_flag.equals("1")) {   
				            	branchoffice_addr.setSan_flag(san_flag);
				            }
				        }   
				        
				        List<BranchOffice_AddrVO> list = null;
				        List<BranchOffice_AddrVO> list_bid = null;
				        List<BranchOffice_AddrVO> list_citygu = null;
				        List<BranchOffice_NationVO> nation_list = null;
				        
				        int totalCount = 0;
				        totalCount = branchofficeDao.getBranchOfficeAddrListCount_cs(branchoffice_addr);
				        int maxIdx_Addr = 0;
						maxIdx_Addr = branchofficeDao.getMaxIdx_Addr(branchoffice_addr);
				        list = branchofficeDao.getBranchOfficeAddrList_cs(branchoffice_addr);  
				        list_bid = branchofficeDao.getBranchOfficeAddrList_bid(branchoffice_addr); 
				        nation_list = branchofficeDao.getBranchOffice_NationList(branchoffice_nation);
				        
				        model.addObject("totalCount", totalCount);
				        model.addObject("decText", decText);
				        model.addObject("list", list);
				        model.addObject("list_bid", list_bid);
				        model.addObject("nation_list", nation_list);
				        model.addObject("searchContent", searchContent);
				        model.addObject("searchFlag", searchFlag);
				        model.addObject("san_flag", san_flag);
				        model.addObject("result", result);
				        model.addObject("action", action);
				        model.addObject("maxIdx_Addr", maxIdx_Addr);
				        model.addObject("b_id", b_id);
				        model.addObject("pageno", pageno);
				        model.addObject("pageInfo", Page.getPageMap(branchoffice_addr.getPageNo(), totalCount , branchoffice_addr.getPageSize(), 10));
				      
				        if(decText != null) {
					        if(decText.equals(branchoffice_addr.getB_id())) {
					        	model.setViewName("cs/BranchOffice_addr"); 
					        }else {
					        	model.setViewName("error/404"); 
					        }
				        }else {
				        	model.setViewName("error/404");
				        }
				        
				        if(b_id.length() == 5 || b_id.length() == 0) {
				        	model.setViewName("error/404"); 
				        }
				}
				        
				      
				        //SHA256
				        /*
				        if(b_id != null && aes256_cs!= null) {
					        if(aes256_cs.equals(Cipher.encryptSHA256("mrsdelivery", "!alfoths1234"))) {
					        	model.setViewName("cs/BranchOffice_addr"); 
					        }else {
					        	model.setViewName("error/404"); 
					        }
				        }
					*/
				        
				        //암호화안넣을때
				        /*
				        if(b_id != null) {
				        	model.setViewName("cs/BranchOffice_addr"); 
				        }else {
				        	model.setViewName("error/404");
				        }
				        */
					logger.info("<<<<<<<<<<<<<< END BranchOffice_addr_CS_get >>>>>>>>>>>>>>" );
					return model;
			}
			
			
			@RequestMapping(value = "/insertbranchoffice_addr", method = { RequestMethod.POST })
			public ModelAndView insertbranchoffice_addr(ModelAndView model, BranchOffice_AddrVO branchoffice_addr, String action) throws IllegalStateException, IOException
			{
				logger.info("<<<<<<<<<<<<<< START insertbranchoffice_addr >>>>>>>>>>>>>>" );
				
				//String[] a = branchoffice_addr.getGu_code().split(",");
				//branchoffice_addr.setGu_code(a[1]);
				
				String city_code = branchofficeDao.getCity_code2(branchoffice_addr);
				
				if(city_code != null) {
					branchoffice_addr.setCity_code(city_code);
				}

				
				int result = branchofficeDao.insertbranchoffice_addr(branchoffice_addr);
				model.addObject("result",result);   
				model.addObject("action",action);
		        model.setViewName("redirect:/BranchOffice_addr");
		        logger.info("<<<<<<<<<<<<<< END insertbranchoffice_addr >>>>>>>>>>>>>>" );
		        return model;
		    }
			
			@RequestMapping(value = "/insertbranchoffice_addr_CS", method = { RequestMethod.POST })
			public ModelAndView insertbranchoffice_addr_CS(ModelAndView model, BranchOffice_AddrVO branchoffice_addr, String action)
					 throws UnsupportedEncodingException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException
			{
				logger.info("<<<<<<<<<<<<<< START insertbranchoffice_addr_CS >>>>>>>>>>>>>>" );
				
				String city_code = branchofficeDao.getCity_code2(branchoffice_addr);
				
				if(city_code != null) {
					branchoffice_addr.setCity_code(city_code);
				}
				
				int result = branchofficeDao.insertbranchoffice_addr(branchoffice_addr);

				CipherAES aes256 = new CipherAES();
			    String b_id = aes256.aesEncode(branchoffice_addr.getB_id()); //암호화
			    
			    model.addObject("b_id",b_id); 
				model.addObject("result",result);   
				model.addObject("action",action);
		        model.setViewName("redirect:BranchOffice_addr_CS_get");
		        logger.info("<<<<<<<<<<<<<< END insertbranchoffice_addr_CS >>>>>>>>>>>>>>" );
		        return model;
		    }
			
			
			@RequestMapping(value = "/verupbranchoffice_addr", method = { RequestMethod.POST })
			public ModelAndView verupbranchoffice_addr(ModelAndView model, BranchOffice_VerVO branchoffice_ver, String action)
					 throws UnsupportedEncodingException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException
			{
				logger.info("<<<<<<<<<<<<<< START verupbranchoffice_addr >>>>>>>>>>>>>>" );
				String version = branchofficeDao.getversion(branchoffice_ver); 
				int version_1=0,version_2=0,version_3=0,version_4=0;
				int result = 0;
				String tot_version = "";
				SimpleDateFormat formatter = new SimpleDateFormat ( "yyyyMMdd", Locale.KOREA );
				Date currentTime = new Date ( );
				String dTime = formatter.format ( currentTime );
				
				if(version != null && !version.equals("")) {
					String[] version_kmj = version.toString().split("[.]");
					
			
					version_1 = Integer.parseInt(version_kmj[0].toString());
					version_2 = Integer.parseInt(version_kmj[1].toString());
					version_3 = Integer.parseInt(version_kmj[2].toString());
					version_4 = Integer.parseInt(version_kmj[3].toString());
					
					if((version_4 != 99) && (version_3 != 99) && (version_2 != 99) ){
						version_4 = version_4+1;
					}
					
					if(version_4 == 99 && (version_3 != 99) && (version_2 != 99) ){
						version_3 = version_3 +1;
						version_4 = 0;
					}
					
					if(version_4 == 99 && version_3 == 99 && (version_2 != 99) ){
						version_2 = version_2 +1;
						version_3 = 0;
						version_4 = 0;
					}
					
					if(version_4 == 99 && version_3 == 99 && version_2 == 99 ){
						version_1 = version_1 +1;
						version_2 = 0;
						version_3 = 0;
						version_4 = 0;
					}
					
					tot_version = String.valueOf(version_1)+"."+String.valueOf(version_2)+"."+String.valueOf(version_3)+"."+String.valueOf(version_4);
					
					branchoffice_ver.setBranch_address_version(tot_version);
					result = branchofficeDao.updateversion(branchoffice_ver);
				}else{
					
					branchoffice_ver.setBranch_address_version("1.0.0.1");
					branchoffice_ver.setBranch_address_update(dTime);
					result = branchofficeDao.insertversion(branchoffice_ver);
				}
				model.addObject("result",result);
				model.addObject("action",action);
		        model.setViewName("redirect:BranchOffice_addr");
		        logger.info("<<<<<<<<<<<<<< END verupbranchoffice_addr >>>>>>>>>>>>>>" );
		        return model;
		    }
			
			@RequestMapping(value = "/updateversion_CS", method = { RequestMethod.GET, RequestMethod.POST })
			public ModelAndView updateversion_CS(ModelAndView model, BranchOffice_VerVO branchoffice_ver, String action, String b_id)
					 throws UnsupportedEncodingException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException
			{
				logger.info("<<<<<<<<<<<<<< START updateversion_CS >>>>>>>>>>>>>>" );
				
				int version_1=0,version_2=0,version_3=0,version_4=0;
				int result = 0;
				String tot_version = "";
				CipherAES aes256 = new CipherAES();
			    String b_id_Enc_aes = b_id; //암호화
				String b_id_dec_aes = aes256.aesDecode(b_id); //복호화
				SimpleDateFormat formatter = new SimpleDateFormat ( "yyyyMMdd", Locale.KOREA );
				Date currentTime = new Date ( );
				String dTime = formatter.format ( currentTime );
			
				
				
				branchoffice_ver.setB_id(b_id_dec_aes);
				String version = branchofficeDao.getversion(branchoffice_ver); 
				
				if(version != null && !version.equals("")) {
					String[] version_kmj = version.toString().split("[.]");
					
			
					version_1 = Integer.parseInt(version_kmj[0].toString());
					version_2 = Integer.parseInt(version_kmj[1].toString());
					version_3 = Integer.parseInt(version_kmj[2].toString());
					version_4 = Integer.parseInt(version_kmj[3].toString());
					
					if((version_4 != 99) && (version_3 != 99) && (version_2 != 99) ){
						version_4 = version_4+1;
					}
					
					if(version_4 == 99 && (version_3 != 99) && (version_2 != 99) ){
						version_3 = version_3 +1;
						version_4 = 0;
					}
					
					if(version_4 == 99 && version_3 == 99 && (version_2 != 99) ){
						version_2 = version_2 +1;
						version_3 = 0;
						version_4 = 0;
					}
					
					if(version_4 == 99 && version_3 == 99 && version_2 == 99 ){
						version_1 = version_1 +1;
						version_2 = 0;
						version_3 = 0;
						version_4 = 0;
					}
					
					tot_version = String.valueOf(version_1)+"."+String.valueOf(version_2)+"."+String.valueOf(version_3)+"."+String.valueOf(version_4);
					
					branchoffice_ver.setBranch_address_version(tot_version);
					result = branchofficeDao.updateversion(branchoffice_ver);
				}else{
					
					branchoffice_ver.setBranch_address_version("1.0.0.1");
					branchoffice_ver.setBranch_address_update(dTime);
					result = branchofficeDao.insertversion(branchoffice_ver);
				}
				model.addObject("result",result);
				model.addObject("b_id",b_id_Enc_aes);
				model.addObject("action",action);
		        model.setViewName("redirect:BranchOffice_addr_CS_get");
		        logger.info("<<<<<<<<<<<<<< END updateversion_CS >>>>>>>>>>>>>>" );
		        return model;
		    }
			
			@RequestMapping(value = "/updatebranchoffice_addr", method = { RequestMethod.POST })
			public ModelAndView updatebranchoffice_addr(ModelAndView model, BranchOffice_AddrVO branchoffice_addr, String action, String searchFlag, String bidList, String searchContent, String pageNo) throws IllegalStateException, IOException
			{
				logger.info("<<<<<<<<<<<<<< START updatebranchoffice_addr >>>>>>>>>>>>>>" );
				
				String city_code = branchofficeDao.getCity_code2(branchoffice_addr);
				
				if(city_code != null) {
					branchoffice_addr.setCity_code(city_code);
				}

				
				int result = branchofficeDao.updatebranchoffice_addr(branchoffice_addr);
				
				model.addObject("result",result); 
				model.addObject("action",action);
				model.addObject("pageNo",pageNo);
				model.addObject("searchFlag",searchFlag);
				model.addObject("searchContent",searchContent);
				model.addObject("bidList",bidList);
				
		        model.setViewName("redirect:/BranchOffice_addr");
		        logger.info("<<<<<<<<<<<<<< END updatebranchoffice_addr >>>>>>>>>>>>>>" );
		        return model;
		    }
			
			@RequestMapping(value = "/updatebranchoffice_addr_CS", method = { RequestMethod.GET, RequestMethod.POST })
			public ModelAndView updatebranchoffice_addr_CS(ModelAndView model, BranchOffice_AddrVO branchoffice_addr, String action, String searchFlag, String searchContent, String pageNo)  throws UnsupportedEncodingException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException
			{
				logger.info("<<<<<<<<<<<<<< START updatebranchoffice_addr_CS >>>>>>>>>>>>>>" );
				
				String city_code = branchofficeDao.getCity_code2(branchoffice_addr);
				
				if(city_code != null) {
					branchoffice_addr.setCity_code(city_code);
				}
				int result = branchofficeDao.updatebranchoffice_addr(branchoffice_addr);
				
				CipherAES aes256 = new CipherAES();
			    String b_id = aes256.aesEncode(branchoffice_addr.getB_id()); //암호화
			    
			    model.addObject("b_id",b_id); 
				model.addObject("result",result); 
				model.addObject("action",action);
				model.addObject("pageNo",pageNo);
				model.addObject("searchFlag",searchFlag);
				model.addObject("searchContent",searchContent);
		        model.setViewName("redirect:/BranchOffice_addr_CS_get");
		        logger.info("<<<<<<<<<<<<<< END updatebranchoffice_addr_CS >>>>>>>>>>>>>>" );
		        return model;
		    }
			
			
			 @RequestMapping(value = "/deletebranchoffice_addr", method = { RequestMethod.GET, RequestMethod.POST })
			 public ModelAndView deletebranchoffice_addr(ModelAndView model, String idx, String b_id, String action, String searchFlag, String bidList, String searchContent, String pageNo) throws UnsupportedEncodingException
		    {
		     
				 logger.info("<<<<<<<<<<<<<< START deletebranchoffice_addr >>>>>>>>>>>>>>" );
				BranchOffice_AddrVO branchoffice_addr = new BranchOffice_AddrVO();
				String originalStr = searchContent; // 테스트 
				String [] charSet = {"utf-8","euc-kr","ksc5601","iso-8859-1","x-windows-949"};
				  
				for (int i=0; i<charSet.length; i++) {
				 for (int j=0; j<charSet.length; j++) {
				  try {
				   System.out.println("[" + charSet[i] +"," + charSet[j] +"] = " + new String(originalStr.getBytes(charSet[i]), charSet[j]));
				  } catch (UnsupportedEncodingException e) {
				   e.printStackTrace();
				  }
				 }
				}
				
				branchoffice_addr.setIdx(idx);
				branchoffice_addr.setB_id(b_id);
		        int result = branchofficeDao.deleteBranchOffice_addr(branchoffice_addr);
		        model.addObject("result",result);
				model.addObject("action",action);
				model.addObject("pageNo",pageNo);
				model.addObject("searchFlag",searchFlag);
				model.addObject("searchContent", searchContent);
				model.addObject("bidList",bidList);
				
		        model.setViewName("redirect:/BranchOffice_addr");
		        logger.info("<<<<<<<<<<<<<< END deletebranchoffice_addr >>>>>>>>>>>>>>" );
		        return model;
		    }
			 
			 @RequestMapping(value = "/ck_deletebranchoffice_addr", method = { RequestMethod.GET, RequestMethod.POST })
			 public ModelAndView ck_deletebranchoffice_addr(ModelAndView model, String idx,String b_id, String action, String searchFlag, String searchContent, String pageNo)
		    {
				 logger.info("<<<<<<<<<<<<<< START deletebranchoffice_addr >>>>>>>>>>>>>>" );
				 BranchOffice_AddrVO branchoffice_addr = new BranchOffice_AddrVO();
					
					String[] idx_ck;
					String [] b_id_ck;
					int result = 0; 
					idx_ck = idx.split(",");
					b_id_ck = b_id.split(",");
					
					for(int i =0; i<idx_ck.length; i++){
						branchoffice_addr.setIdx(idx_ck[i]);
						branchoffice_addr.setB_id(b_id_ck[i]);
						result = branchofficeDao.ck_deleteBranchOffice_addr(branchoffice_addr);
					}

					
		        model.addObject("result",result);
				model.addObject("action",action);
				model.addObject("pageNo",pageNo);
				model.addObject("searchFlag",searchFlag);
				model.addObject("searchContent",searchContent);
				
		        model.setViewName("redirect:/BranchOffice_addr");
		        logger.info("<<<<<<<<<<<<<< END deletebranchoffice_addr >>>>>>>>>>>>>>" );
		        return model;
		    }
			 @RequestMapping(value = "/ck_deletebranchoffice_addr_CS", method = { RequestMethod.GET, RequestMethod.POST })
			 public ModelAndView ck_deletebranchoffice_addr_CS(ModelAndView model, String idx,String b_id, String action, String searchFlag, String searchContent, String pageNo)
		    throws UnsupportedEncodingException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
				 logger.info("<<<<<<<<<<<<<< START deletebranchoffice_addr >>>>>>>>>>>>>>" );
				 BranchOffice_AddrVO branchoffice_addr = new BranchOffice_AddrVO();
					
					String[] idx_ck;
					String [] b_id_ck;
					int result = 0; 
					idx_ck = idx.split(",");
					b_id_ck = b_id.split(",");
					
					for(int i =0; i<idx_ck.length; i++){
						branchoffice_addr.setIdx(idx_ck[i]);
						branchoffice_addr.setB_id(b_id_ck[i]);
						result = branchofficeDao.ck_deleteBranchOffice_addr(branchoffice_addr);
					}
					CipherAES aes256 = new CipherAES();
					String b_id_dec = "";
					b_id_dec = aes256.aesEncode(branchoffice_addr.getB_id());
		        model.addObject("result",result);
		        model.addObject("b_id",b_id_dec);
				model.addObject("action",action);
				model.addObject("pageNo",pageNo);
				model.addObject("searchFlag",searchFlag);
				model.addObject("searchContent",searchContent);
				
		        model.setViewName("redirect:/BranchOffice_addr_CS");
		        logger.info("<<<<<<<<<<<<<< END deletebranchoffice_addr >>>>>>>>>>>>>>" );
		        return model;
		    }
		    
			 
		
			 
			 @RequestMapping(value = "/deletebranchoffice_addr_CS", method = { RequestMethod.GET, RequestMethod.POST })
			 public ModelAndView deletebranchoffice_addr_CS(ModelAndView model, String idx, String b_id, String action, String searchFlag, String searchContent, String pageNo)
		   throws UnsupportedEncodingException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException
			 {
		        logger.info("<<<<<<<<<<<<<< START deletebranchoffice_addr_CS >>>>>>>>>>>>>>" );
		        BranchOffice_AddrVO branchoffice_addr = new BranchOffice_AddrVO();
				branchoffice_addr.setIdx(idx);
				branchoffice_addr.setB_id(b_id);
		        int result = branchofficeDao.deleteBranchOffice_addr(branchoffice_addr);
		        CipherAES aes256 = new CipherAES();
			    String b_id_aes = aes256.aesEncode(b_id); //암호화

			    model.addObject("b_id",b_id_aes);
		        model.addObject("result",result);
				model.addObject("action",action);
				model.addObject("pageNo",pageNo);
				model.addObject("searchFlag",searchFlag);
				model.addObject("searchContent",searchContent);
		        model.setViewName("redirect:BranchOffice_addr_CS_get");
		        logger.info("<<<<<<<<<<<<<< END deletebranchoffice_addr_CS >>>>>>>>>>>>>>" );
		        return model;
		    }
			 
		 
		 @RequestMapping(value = "/store_csv_upload")
			public ModelAndView store_csv_upload(ModelAndView model,String result, String action, String cnt, String succ_cnt, String dup_cnt) throws IllegalStateException, IOException
			{
				logger.info("<<<<<<<<<<<<<< START store_csv_upload >>>>>>>>>>>>>>" );
				model.addObject("cnt", cnt);
				model.addObject("succ_cnt", succ_cnt);
				model.addObject("dup_cnt", dup_cnt);
				model.addObject("result",result);
				model.addObject("action",action);
		        model.setViewName("BranchOffice/store_csv_upload");
		        logger.info("<<<<<<<<<<<<<< END store_csv_upload >>>>>>>>>>>>>>" );
		        return model;
		    }
		 
		 @RequestMapping(value = "/store_csv_upload_CS")
			public ModelAndView store_csv_upload_CS(ModelAndView model,String result, String action, String cnt, String succ_cnt, String dup_cnt) throws IllegalStateException, IOException
			{
				logger.info("<<<<<<<<<<<<<< START store_csv_upload_CS >>>>>>>>>>>>>>" );
				model.addObject("cnt", cnt);
				model.addObject("succ_cnt", succ_cnt);
				model.addObject("dup_cnt", dup_cnt);
				model.addObject("result",result);
				model.addObject("action",action);
		        model.setViewName("cs/cs_popup/store_csv_upload");
		        logger.info("<<<<<<<<<<<<<< END store_csv_upload_CS >>>>>>>>>>>>>>" );
		        return model;
		    }
		 
		 
		

		 @RequestMapping(value = "/store_csv_insert", method = {RequestMethod.POST })
		    public ModelAndView fileSubmit(FileVO FileVo,ModelAndView model) throws FileNotFoundException,IOException {
			 logger.info("<<<<<<<<<<<<<< START store_csv_insert >>>>>>>>>>>>>>" );
			  	StoreCsvManager dMng      = new StoreCsvManager();
			 	List<BranchOffice_StoreVO> data = null;
			 	int result =0;
			 	CSVReader reader = null;
			 	Map<String, Object> map = null;
			 	String tbl_name="afd_storeinfo";
			 	String filerename="afd_storeinfo.csv";
		 		int insertCountInfo[] = new int[4];
		 		String jdbcdiver[] = new String[4];
			 	int start = 0;
			 	final int LIMIT = 4;
			 	Map<String, Object> paramMap = null;
		        String path =  mrs_prop.getProperty("csv.filepath");
		        
		        MultipartFile uploadfile = FileVo.getFile();
		        if (uploadfile != null) {
		            String fileName = uploadfile.getOriginalFilename();
		            FileVo.setFileName(filerename);
		            try {
		                // File 사용
		                File file = new File(path+filerename);
		                uploadfile.transferTo(file);
		            } catch (IOException e) {
		                e.printStackTrace();
		            } // try - catch
		        } // if
		        
		        
		        /*
		 		 * java ver
		 		 */
				reader = new CSVReader(new FileReader(path+FileVo.getFileName()));
				ColumnPositionMappingStrategy<BranchOffice_Store_CsvVO> addrBean = new ColumnPositionMappingStrategy<BranchOffice_Store_CsvVO>();
				addrBean.setType(BranchOffice_Store_CsvVO.class);
	
				 String[] nextLine;
				 List<String[]> list_data = new ArrayList<String[]>();
	
				int n = 0;                                                                                   
     	    while((nextLine = reader.readNext()) != null)                                                
     	    {                                                                                         
     	          n++;                                                                                   
     	          if(n == 1) continue; //제목은 skip                                                                                                                                           
     	        /* 라인 단위로 List에 저장 */                                                            
     	          list_data.add(nextLine);           
     	    }   
	        	 // 파일 닫기
					reader.close();
					
      		
		 		 for(int i=0; i<insertCountInfo.length; i++){
		 	        insertCountInfo[i] = 0;
		 		 }
		 		try {
		 			
		 			 for(int i=0; i<jdbcdiver.length; i++){
		 				jdbcdiver[0] = mybatis_prop.getProperty("jdbc.driverClass");
		 				jdbcdiver[1] = mybatis_prop.getProperty("jdbc.url");
		 				jdbcdiver[2] = mybatis_prop.getProperty("jdbc.username");
		 				jdbcdiver[3] = mybatis_prop.getProperty("jdbc.password");
		 				
				 	}
		 
					result = dMng.doCSVInsert("admin", tbl_name, list_data, -1, insertCountInfo,jdbcdiver);
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}     
			
		 		
		 		
		 		/*
		 		 * mybatis ver
		 		 */
				
		 		/*
		   		reader = new CSVReader(new FileReader(path+FileVo.getFileName()));
				ColumnPositionMappingStrategy<BranchOffice_Store_CsvVO> addrBean = new ColumnPositionMappingStrategy<BranchOffice_Store_CsvVO>();
				addrBean.setType(BranchOffice_Store_CsvVO.class);
	
				// Bean에 선언되어 있는 필드 명을 정의 한다.
				  
				  String[] columns = new String[] { 
					"B_ID", "S_ID","S_NAME","ACTIVE_STATUS", "S_TEL1", 
					"S_TEL2","S_BALANCE", "COOK_TIME", "S_ADDR1", "S_ADDR2", 
					"S_ADDR_BUILDING", "S_ADDR_NUM","S_ADDR_APPENDIX","S_CRN","LOGIN_ID",
					"LOGIN_PASSWD","CONTRACT_SDATE","CONTRACT_EDATE","SERVICE_START_DATE","OPEN_TIME",
					"CLOSE_TIME","NOTI_FLAG","NOTI_RIDER_ASSIGN","NOTI_CARD_PAY",\"SERVICE_TYPE",
					"CHARGE_TYPE","CHARGE_METHOD","CHARGE_OPTION","CID_ID","CID_PORT",
					"CID_PORT_SPEED","PRINTER_ID","PRINTER_PORT","PRINTER_PORT_SPEED","CAT_ID",
					"VAN_ID","V_BANK","V_ACCOUNT","V_NAME","BASIC_DISTANCE",
					"BASIC_CHARGE","ADD_DISTANCE","ADD_CHARGE","S_REPRESENTATIVE","MONTHLY_OPTION",
					"MONTHLY_CHARGE"
			      };
		 
				// 컬럼을 맵핑 시킴
				addrBean.setColumnMapping(columns);
		 
				CsvToBean<BranchOffice_Store_CsvVO> csv = new CsvToBean<BranchOffice_Store_CsvVO>();
				// 어드레스 리스트
				List<BranchOffice_Store_CsvVO> resultList = csv.parse(addrBean, reader);
	 
				// 파일 닫기
				reader.close();
				
			 	try {
			 		int result = branchofficeDao.insertbranchoffice_addr_Batch(resultList);
			 		//String tbl_name="afd_storeinfo_test";
			 		//int insertCountInfo[] = new int[4];
			 		//for(int i=0; i<insertCountInfo.length; i++){
			 	    //insertCountInfo[i] = 0;
			 	// }
			 	//	int result = dMng.doCSVInsert("admin", tbl_name, resultList, -1, insertCountInfo);               
			 	     
			 		
			 	} catch (Exception e) {
			 		e.printStackTrace();
			 	} finally {
			 		if (resultList != null) resultList.clear();
			 	}	
				
		  	*/			
				
		 	 /*
				// 표준 출력해 확인
				for (BranchOffice_Store_CsvVO addr : resultList) {
					System.out.println(addr.getB_id());
				}
			 */
				model.addObject("cnt", list_data.size());
				model.addObject("succ_cnt", insertCountInfo[0]);
				model.addObject("dup_cnt", insertCountInfo[3]);
				model.addObject("result", result);
				model.addObject("action","fileupload");
				model.setViewName("redirect:store_csv_upload");
		        logger.info("<<<<<<<<<<<<<< END store_csv_insert >>>>>>>>>>>>>>" );
		        // 데이터 베이스 처리를 현재 위치에서 처리
		        return model;
		 }	  
		 
		 @RequestMapping(value = "/store_csv_insert_CS", method = {RequestMethod.POST })
		    public ModelAndView fileSubmit_CS(FileVO FileVo,ModelAndView model) throws FileNotFoundException,IOException {
			 logger.info("<<<<<<<<<<<<<< START store_csv_insert_CS >>>>>>>>>>>>>>" );
			  	StoreCsvManager dMng      = new StoreCsvManager();
			 	List<BranchOffice_StoreVO> data = null;
			 	int result =0;
			 	CSVReader reader = null;
			 	Map<String, Object> map = null;
			 	String tbl_name="afd_storeinfo";
			 	String filerename="afd_storeinfo.csv";
		 		int insertCountInfo[] = new int[4];
		 		String jdbcdiver[] = new String[4];
			 	int start = 0;
			 	final int LIMIT = 4;
			 	Map<String, Object> paramMap = null;
		        String path =  mrs_prop.getProperty("csv.filepath");
		        
		        MultipartFile uploadfile = FileVo.getFile();
		        if (uploadfile != null) {
		            String fileName = uploadfile.getOriginalFilename();
		            FileVo.setFileName(filerename);
		            try {
		                // File 사용
		                File file = new File(path+filerename);
		                uploadfile.transferTo(file);
		            } catch (IOException e) {
		                e.printStackTrace();
		            } // try - catch
		        } // if
		        
		        
		        /*
		 		 * java ver
		 		 */
				reader = new CSVReader(new FileReader(path+FileVo.getFileName()));
				ColumnPositionMappingStrategy<BranchOffice_Store_CsvVO> addrBean = new ColumnPositionMappingStrategy<BranchOffice_Store_CsvVO>();
				addrBean.setType(BranchOffice_Store_CsvVO.class);
	
				 String[] nextLine;
				 List<String[]> list_data = new ArrayList<String[]>();
	
				int n = 0;                                                                                   
		  	    while((nextLine = reader.readNext()) != null)                                                
		  	    {                                                                                         
		  	          n++;                                                                                   
		  	          if(n == 1) continue; //제목은 skip                                                                                                                                           
		  	        /* 라인 단위로 List에 저장 */                                                            
		  	          list_data.add(nextLine);           
		  	    }   
	        	 // 파일 닫기
					reader.close();
					
   		
		 		 for(int i=0; i<insertCountInfo.length; i++){
		 	        insertCountInfo[i] = 0;
		 		 }
		 		try {
		 			
		 			 for(int i=0; i<jdbcdiver.length; i++){
		 				jdbcdiver[0] = mybatis_prop.getProperty("jdbc.driverClass");
		 				jdbcdiver[1] = mybatis_prop.getProperty("jdbc.url");
		 				jdbcdiver[2] = mybatis_prop.getProperty("jdbc.username");
		 				jdbcdiver[3] = mybatis_prop.getProperty("jdbc.password");
		 				
				 	}
		 
					result = dMng.doCSVInsert("admin", tbl_name, list_data, -1, insertCountInfo,jdbcdiver);
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}   
		 	
				model.addObject("cnt", list_data.size());
				model.addObject("succ_cnt", insertCountInfo[0]);
				model.addObject("dup_cnt", insertCountInfo[3]);
				model.addObject("result", result);
				model.addObject("action","fileupload");
				model.setViewName("redirect:store_csv_upload_CS");
		        logger.info("<<<<<<<<<<<<<< END store_csv_insert_CS >>>>>>>>>>>>>>" );
		        // 데이터 베이스 처리를 현재 위치에서 처리
		        return model;
		 }	 
		 
		 @RequestMapping(value = "/sample_csv", method = {RequestMethod.GET,RequestMethod.POST })
		    public ModelAndView sample_csv(ModelAndView model) {
			 logger.info("<<<<<<<<<<<<<< START sample_csv >>>>>>>>>>>>>>" );
			 	String fullPath = mrs_prop.getProperty("filedown.file");
			 	System.out.println(fullPath);
				File downloadFile = new File(fullPath);

		        logger.info("<<<<<<<<<<<<<< END sample_csv >>>>>>>>>>>>>>" );
		        return new ModelAndView("download", "downloadFile", downloadFile);
		        
		        
		 }	 
		 
		 @RequestMapping(value = "/sample_csv_CS", method = {RequestMethod.GET,RequestMethod.POST })
		    public ModelAndView sample_csv_CS(ModelAndView model) {
			 logger.info("<<<<<<<<<<<<<< START sample_csv_CS >>>>>>>>>>>>>>" );
			 	String fullPath = mrs_prop.getProperty("filedown.file");
			 	System.out.println(fullPath);
				File downloadFile = new File(fullPath);

		        logger.info("<<<<<<<<<<<<<< END sample_csv_CS >>>>>>>>>>>>>>" );
		        return new ModelAndView("download", "downloadFile", downloadFile);
		        
		        
		 }	 
		 
		 /*기사 정보 관리 메뉴*/
			@RequestMapping(value = "/BranchOffice_rider" , method = {RequestMethod.GET, RequestMethod.POST })
			public ModelAndView BranchOffice_rider(Principal principal, String searchFlag, String bidFlag, String searchContent, String pageNo,String pageSize, String result, String action) throws UnsupportedEncodingException, InterruptedException {
				logger.info("<<<<<<<<<<<<<< START BranchOffice_rider >>>>>>>>>>>>>>" );
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
				ModelAndView model = new ModelAndView();
				BranchOffice_RiderVO branchoffice_rider = new BranchOffice_RiderVO();
				int a = 1;
				int b = 10;
				if(action != null){
					if(action.equals(""))pageNo="1";
				}
				if(pageNo != null){
					branchoffice_rider.setPageNo(Integer.parseInt(pageNo));
				}else {
					branchoffice_rider.setPageNo(a);
				}
				if(pageSize != null){
					branchoffice_rider.setPageSize(Integer.parseInt(pageSize));
				}else {
					branchoffice_rider.setPageSize(b);
				}
				if(Integer.parseInt(pageNo) <= 0) branchoffice_rider.setPageNo(1);
		        if(Integer.parseInt(pageSize)<= 0)branchoffice_rider.setPageSize(10);
		        int pageno = branchoffice_rider.getPageNo();
		        
			        if(searchFlag != null){
			            if(searchFlag.equals("1")) {    
			            	branchoffice_rider.setR_id(searchContent);
			            }
			            if(searchFlag.equals("2")) {    
			            	branchoffice_rider.setR_name(searchContent);
			            }
			        }    
			        
			        List<BranchOffice_RiderVO> list = null;
			        List<BranchOffice_RiderVO> list_bid = null;
			      
			        int totalCount = 0;
			        totalCount = branchofficeDao.getBranchOffice_riderListCount(branchoffice_rider);
			        list = branchofficeDao.getBranchOffice_riderList(branchoffice_rider);  
			        list_bid = branchofficeDao.getBranchOfficeAddrList_bid(branchoffice_rider); 
			        
			        String name = principal.getName();
			        
					model.addObject("username", name);
			        model.addObject("totalCount", totalCount);
			        model.addObject("list", list);
			        model.addObject("list_bid", list_bid);
			        model.addObject("searchContent", searchContent);
			        model.addObject("searchFlag", searchFlag);
			        model.addObject("bidFlag", bidFlag);
			        model.addObject("action", action);
			        model.addObject("result", result);
			        //model.addObject("b_seq", b_seq);
			        model.addObject("pageno", pageno);
			        model.addObject("pageInfo", Page.getPageMap(branchoffice_rider.getPageNo(), totalCount , branchoffice_rider.getPageSize(), 10));
					model.setViewName(".BranchOffice_rider"); 
					logger.info("<<<<<<<<<<<<<< END BranchOffice_rider >>>>>>>>>>>>>>" );
					return model;
			}
			
			@RequestMapping(value = "/insertbranchoffice_rider", method = { RequestMethod.GET, RequestMethod.POST })
			public ModelAndView insertbranchoffice_rider(ModelAndView model, BranchOffice_RiderVO branchoffice_rider, String action) throws IllegalStateException, IOException, NumberFormatException, InterruptedException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException
			{
				
				logger.info("<<<<<<<<<<<<<< START insertbranchoffice_rider >>>>>>>>>>>>>>" );
				
				int r_seq = 0;
		        int r_seq1 = 0;
		        String bid_seq = "";
		        String s_b_id = "";
				r_seq = branchofficeDao.getR_seq2(branchoffice_rider);    
				r_seq1 = r_seq+1;
				
					bid_seq = branchofficeDao.getR_seq(branchoffice_rider);
					
					if(bid_seq.length() == 1){
						bid_seq = branchoffice_rider.getB_id() + "R000"+bid_seq;
					}else if(bid_seq.length() == 2) {
						bid_seq = branchoffice_rider.getB_id() + "R00"+bid_seq;
					}else if(bid_seq.length() == 3) {
						bid_seq = branchoffice_rider.getB_id() + "R0"+bid_seq;
					}else if(bid_seq.length() == 4) {
						bid_seq = branchoffice_rider.getB_id() + "R"+bid_seq;
					}
					
					branchoffice_rider.setR_id(bid_seq);
					
					String city_code = branchofficeDao.getCity_code(branchoffice_rider);
					
					if(city_code != null) {
						branchoffice_rider.setR_city_code(city_code);
					}
					
				int result = branchofficeDao.insertbranchoffice_rider(branchoffice_rider);
							 branchofficeDao.insertsessioninfo_rider(branchoffice_rider);
							 branchofficeDao.updateR_seq(r_seq);
				
				model.addObject("result",result);   
		        model.addObject("action",action);
		        model.setViewName("redirect:/BranchOffice_rider");
		        logger.info("<<<<<<<<<<<<<< END insertbranchoffice_rider >>>>>>>>>>>>>>" );
		        return model;
		    }
			
			@RequestMapping(value = "/deletebranchoffice_rider", method = { RequestMethod.GET, RequestMethod.POST })
			 public ModelAndView deletebranchoffice_rider(ModelAndView model, String idx, String r_id, String action, String searchFlag, String searchContent, String pageNo)
		   throws UnsupportedEncodingException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException
			 {
		        logger.info("<<<<<<<<<<<<<< START deletebranchoffice_rider >>>>>>>>>>>>>>" );
		        
		        int result = branchofficeDao.afd_deleted_riderinfo(r_id); 
		        			 branchofficeDao.deleteBranchOffice_rider(r_id);
		        			 

		        model.addObject("result",result);
				model.addObject("action",action);
				model.addObject("pageNo",pageNo);
				model.addObject("searchFlag",searchFlag);
				model.addObject("searchContent",searchContent);
		        model.setViewName("redirect:BranchOffice_rider");
		        logger.info("<<<<<<<<<<<<<< END deletebranchoffice_rider >>>>>>>>>>>>>>" );
		        return model;
		    }
			
			@RequestMapping(value = "/updatebranchoffice_rider", method = { RequestMethod.GET, RequestMethod.POST })
			public ModelAndView updatebranchoffice_rider(ModelAndView model, BranchOffice_RiderVO branchoffice_rider, String action, String searchFlag, String searchContent, String pageNo) throws IllegalStateException, IOException, InterruptedException
			{
				logger.info("<<<<<<<<<<<<<< START updatebranchoffice_rider >>>>>>>>>>>>>>" );
				
				String city_code = branchofficeDao.getCity_code(branchoffice_rider);
				
				if(city_code != null) {
					branchoffice_rider.setR_city_code(city_code);
				}

				int result = branchofficeDao.updateBranchOffice_Rider(branchoffice_rider);
			
				model.addObject("result",result);  
				model.addObject("action",action);  
				model.addObject("pageNo",pageNo);
				model.addObject("searchFlag",searchFlag); 
				model.addObject("searchContent", searchContent);
		        model.setViewName("redirect:/BranchOffice_rider");
		        logger.info("<<<<<<<<<<<<<< END updatebranchoffice_rider >>>>>>>>>>>>>>" );
		        return model;
		    }
}