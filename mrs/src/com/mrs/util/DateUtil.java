package com.mrs.util; 

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class DateUtil
{
    


    /* 현재 시각 yyyyMMddHHmmss (DB에 들어가는 형식) 으로 리턴 */
    public String getToday(int type){   // type 0:, 1: , 2:, 3: ,
        Calendar cal = Calendar.getInstance();
        Date d = cal.getTime();
        DateFormat df;
        
        SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");   // 기본 데이타베이스 저장 타입
        String str = sf.format(d);
        
        switch(type)
        {
            case 0: // Year
                str = str.substring(0, 4);
                break;
            case 1: // Month
                str = str.substring(4, 6);
                break;
            case 2: // Date
                str = str.substring(6, 8);
                break;
            case 3: // Time
                str = str.substring(8, str.length());
                break;
            case 123: // YearMonthDateTime
                str = str.substring(0, 4) + str.substring(4, 6) + str.substring(6, 8) + str.substring(8, str.length());
                break;
            
            case 5: // YearMonthDate
                str = str.substring(0, 8);
                break;                
            case 51: // Year-Month-Date
                str = str.substring(0, 4) + "-" + str.substring(4, 6) + "-" + str.substring(6, 8);
                break;                
            case 6: // YearMonth
                str = str.substring(0, 6);
                break;
            case 7: // Year
                str = str.substring(0, 4);
                break;
            default:
                
        }
        
        return str;
    }
    
    public String getToday(){
        Calendar cal = Calendar.getInstance();
        Date d = cal.getTime();
        DateFormat df;
        
        SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");   // 기본 데이타베이스 저장 타입
        String str = sf.format(d);
        return str;
    }
}
