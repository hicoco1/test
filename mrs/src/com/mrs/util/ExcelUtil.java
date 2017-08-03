/**
 * <pre>
 * 1. 프로젝트명    : iscc
 * 2. 패키지명		: com.colmes.iscc.common.util
 * 3. 파일명        : ExcelUtil.java
 * 4. 작성일        : 2014. 5. 8. 오후 2:17:23
 * 5. 작성자        : dukwon ( dukwon81@gmail.com )
 * 6. 설명          :
 * </pre>
 */
package com.mrs.util;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.util.*;
import java.io.*;

public class ExcelUtil
{   
    public static String getExcelFileType(String fullFilename)
    {       
        String result = "";
        
        //2003
        try {           
            new HSSFWorkbook(new FileInputStream(new File(fullFilename)));
            result = "2003";
        } catch (Exception e) {             
        }
        
        //2007
        if("".equals(result))
        {
            try {           
                new XSSFWorkbook(new FileInputStream(new File(fullFilename)));
                result = "2007";
            } catch (Exception e) {             
            }
        }
        
        return result;
    }
    
    public static List<?> getList(String excelType, String fullFilename, long limit) throws Exception
    {       
        List<?> result = null;
        
        if("2003".equals(excelType))    
            result = get2003List(fullFilename, limit);
        else
            result = get2007List(fullFilename, limit);
        
        return result;
    }
    
    public static List<?> get2003List(String fullFilename, long limit) throws Exception
    {       
        long totalCnt = 1;
        List result = new ArrayList();
        
        HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream(new File(fullFilename)));
        
        //book
        if(workbook != null)
        {
            int sheetNum = workbook.getNumberOfSheets();
            
            for(int i=0; i<sheetNum; i++)
            {
                if(limit > 0 && totalCnt > limit) break;
                
                HSSFSheet sheet = workbook.getSheetAt(i);
                
                //sheet
                if(sheet != null)
                {
                    int totalRows = sheet.getPhysicalNumberOfRows();
                    
                    for(int j=0; j<totalRows; j++)
                    {       
                        if(limit > 0 && totalCnt > limit) break;
                        
                        HSSFRow row = sheet.getRow(j);
                        
                        //rows
                        if(row != null)
                        {                           
                            int totalCells = row.getPhysicalNumberOfCells();
                            Map cellData = new HashMap();
                            
                            for(int k=0; k<totalCells; k++)
                            {                               
                                HSSFCell cell = row.getCell(k);
                                
                                String value = "";
                                
                                //cell
                                if(cell != null && totalCnt <= limit)
                                {                                   
                                    value = get2003CellStringData(cell);
                                    
                                    cellData.put("CELL_"+k, value);
                                }
                            }                       
                            
                            result.add(cellData);
                                                   
                            totalCnt++;
                        }
                        
                        if(limit > 0 && totalCnt > limit) break;
                    }
                }
            }
        }
        
        return result;
    }
    
    public static List<?> get2007List(String fullFilename, long limit) throws Exception
    {       
        long totalCnt = 1;
        List result = new ArrayList();
        XSSFWorkbook workbook = new XSSFWorkbook(new FileInputStream(new File(fullFilename)));
        
        //book
        if(workbook != null)
        {
            int sheetNum = workbook.getNumberOfSheets();
            
            for(int i=0; i<sheetNum; i++)
            {
                if(limit > 0 && totalCnt > limit) break;
                
                XSSFSheet sheet = workbook.getSheetAt(i);
                
                //sheet
                if(sheet != null)
                {
                    int totalRows = sheet.getPhysicalNumberOfRows();
                    
                    for(int j=0; j<totalRows; j++)
                    {       
                        if(limit > 0 && totalCnt > limit) break;
                        
                        XSSFRow row = sheet.getRow(j);
                        
                        //rows
                        if(row != null)
                        {                           
                            int totalCells = row.getPhysicalNumberOfCells();
                            Map cellData = new HashMap();
                            
                            for(int k=0; k<totalCells; k++)
                            {                               
                                XSSFCell cell = row.getCell(k);
                                
                                String value = "";
                                
                                //cell
                                if(cell != null && totalCnt <= limit)
                                {                                   
                                    value = get2007CellStringData(cell);
                                    
                                    cellData.put("CELL_"+k, value);
                                }
                            }                       
                            
                            result.add(cellData);
                                                        
                            totalCnt++;
                        }
                        
                        if(limit > 0 && totalCnt > limit) break;
                    }
                }
            }
        }
        
        return result;
    }
    
    public static String get2003CellStringData(HSSFCell cell)
    {       
        String value = "";
        
        switch(cell.getCellType())
        {
            case HSSFCell.CELL_TYPE_FORMULA:
                value = cell.getCellFormula();
                break;
            case HSSFCell.CELL_TYPE_NUMERIC:
                value = ""+cell.getNumericCellValue();
                break;
            case HSSFCell.CELL_TYPE_STRING:
                value = ""+cell.getStringCellValue();
                break;
            case HSSFCell.CELL_TYPE_BLANK:
                value = "";
                break;
            case HSSFCell.CELL_TYPE_ERROR:
                value = ""+cell.getErrorCellValue();
                break;
            default:
        }
        
        return value;
    }
    
    public static String get2007CellStringData(XSSFCell cell)
    {       
        String value = "";
        
        switch(cell.getCellType())
        {
            case HSSFCell.CELL_TYPE_FORMULA:
                value = cell.getCellFormula();
                break;
            case HSSFCell.CELL_TYPE_NUMERIC:
                value = ""+cell.getNumericCellValue();
                break;
            case HSSFCell.CELL_TYPE_STRING:
                value = ""+cell.getStringCellValue();
                break;
            case HSSFCell.CELL_TYPE_BLANK:
                value = "";
                break;
            case HSSFCell.CELL_TYPE_ERROR:
                value = ""+cell.getErrorCellValue();
                break;
            default:
        }   
        
        return value;
    }
}