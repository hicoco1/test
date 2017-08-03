package com.mrs.util; 
import java.util.Enumeration; 

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse; 

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

 

public class CSRFInterceptor extends HandlerInterceptorAdapter{
 @Override
 public boolean preHandle(HttpServletRequest request,
                 HttpServletResponse response, Object handler) throws Exception {
 
  if ( ! request.getMethod().equalsIgnoreCase("post")) {
     return true;
  } else {
     if( request instanceof MultipartHttpServletRequest) {
             Enumeration<String> names =
                               request.getParameterNames();
             while( names.hasMoreElements()) {
                String param=names.nextElement();
                if( param.equals("csrf")) {
                    String value=request.getParameter(param);
                    if ( value != null &&
                        value.equals(request.getSession()
                            .getAttribute("CSRF_TOKEN"))) {
                         return true;
                    } 
                 }
              } 

       }
  }
  request.getSession().setAttribute("csrfError", "true");
  response.sendRedirect("write.do");
  return false;
 } 
}
