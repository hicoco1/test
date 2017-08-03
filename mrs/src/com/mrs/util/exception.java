package com.mrs.util; 

import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;


public class exception implements HandlerExceptionResolver {
      // 프로퍼티 객체 주입
      @Resource(name = "mrs_prop")
      private Properties mrs_prop; 

     public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
     Exception e) {
     if (e instanceof MaxUploadSizeExceededException) {
        String path =  mrs_prop.getProperty("web.localpath");
        String REFERER = request.getHeader("REFERER").replace(path, "");
        System.out.println("aa");
        return new ModelAndView("redirect:"+REFERER);

     } else {
     return null;
     }
     }
        

   }