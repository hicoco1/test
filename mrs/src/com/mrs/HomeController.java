package com.mrs;
 
import java.security.Principal;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mrs.Dao.BranchOfficeDao;
import com.mrs.Dao.HeadOfficeDao;
import com.mrs.Vo.BranchOfficeVO;
import com.mrs.Vo.HeadOfficeVO;
import com.mrs.util.Page;




@Controller
public class HomeController  {
	
	@Resource(name="HeadOfficeDao")                 
    private HeadOfficeDao headofficeDao;
	
	@Resource(name="BranchOfficeDao")                 
    private BranchOfficeDao branchofficeDao; 

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	
	@RequestMapping(value = "/welcome**" , method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView defaultPage(Principal principal, HttpSession session, HttpServletRequest request) {
            logger.info("<<<<<<<<<<<<<< START welcome >>>>>>>>>>>>>>" );
            ModelAndView model = new ModelAndView();
            String name = principal.getName();
            HeadOfficeVO headoffice = new HeadOfficeVO();
            BranchOfficeVO branchoffice = new BranchOfficeVO();
            
            branchoffice.setUsername(name);
            String auth = branchofficeDao.getauth(branchoffice); 

		    if(auth.equals("ROLE_ADMIN")) {
		        model.setViewName("redirect:/HeadOffice_main");         
		    }else {
				model.setViewName("redirect:/BranchOffice_main");                                                                                                                                                         
		    }                                                                                                                                                                                                                  
	    		session.setAttribute("CSRF_TOKEN", UUID.randomUUID().toString());                                                                                                                                         
	            logger.info("<<<<<<<<<<<<<< END welcome >>>>>>>>>>>>>>" );                                                                                                                                                 
	            return model;                                                                                                                                                                                              
		    }  

	@RequestMapping(value = "/admin**", method = { RequestMethod.GET, RequestMethod.POST } )
	public ModelAndView adminPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Login Form - Database Authentication");
		model.addObject("message", "This page is for ROLE_ADMIN only!");
		model.setViewName("admin");
 
		return model;

	}

	@RequestMapping(value = {"/","/login","/logout"},method = { RequestMethod.GET, RequestMethod.POST } )
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, HttpSession session, HttpServletRequest request) {
		logger.info("<<<<<<<<<<<<<< START login >>>>>>>>>>>>>>" );
		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Invalid username and password!");
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		session.setAttribute("CSRF_TOKEN", UUID.randomUUID().toString());
		System.out.println("UUID.randomUUID().toString()====="+UUID.randomUUID().toString()); 
		model.setViewName("Login/login");
		logger.info("<<<<<<<<<<<<<< END login >>>>>>>>>>>>>>" );
		return model;

	}

	//for 403 access denied page 
	@RequestMapping(value = "/403", method = { RequestMethod.GET, RequestMethod.POST } )
	public ModelAndView accesssDenied() {

		ModelAndView model = new ModelAndView();
		
		//check if user is login
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			model.addObject("username", userDetail.getUsername());
			
		}
		
		model.setViewName("error/403");
		return model;

	}
}