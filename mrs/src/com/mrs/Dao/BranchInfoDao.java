/**
 * <pre>
 * 1. 프로젝트명    : pacs
 * 2. 패키지명		: com.colmes.pacs.Dao
 * 3. 파일명        : CardDao.java
 * 4. 작성일        : 2014. 5. 27. 오전 11:59:38
 * 5. 작성자        : dukwon ( dukwon81@gmail.com )
 * 6. 설명          : 게시판 DAO
 * </pre>
 */
package com.mrs.Dao;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mrs.Vo.*;

public class BranchInfoDao extends SqlSessionDaoSupport
{
    private static final Logger logger = LoggerFactory.getLogger(BranchInfoDao.class);

    /*프린터 단말기 정보*/
    public List<BranchOfficeInfo_PrinterVO>  getBranchOfficeInfoList(BranchOfficeInfo_PrinterVO vo)
    { 
        List<BranchOfficeInfo_PrinterVO> list = new ArrayList<BranchOfficeInfo_PrinterVO>();
        try
        {
            list = getSqlSession().selectList("BranchInfo.getBranchOfficeInfoList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public int  getBranchOfficeInfoListCount(BranchOfficeInfo_PrinterVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("BranchInfo.getBranchOfficeInfoListCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    public int  getMaxIdx_Printer(BranchOfficeInfo_PrinterVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("BranchInfo.getMaxIdx_Printer", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    public int insertbranchofficeinfo(BranchOfficeInfo_PrinterVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchInfo.insertBranchOfficeinfo", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }

    public int updatebranchofficeinfo(BranchOfficeInfo_PrinterVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().update("BranchInfo.updateBranchOfficeinfo", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }

    public int deleteBranchOfficeInfo(String idx)
    {
        int result = 0;
        try
        {
            result = getSqlSession().delete("BranchInfo.deleteBranchOfficeinfo", idx);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    
    /*CID 단말기 정보*/
    public List<BranchOfficeInfo_CidVO>  getBranchOfficeInfo_CidList(BranchOfficeInfo_CidVO vo)
    { 
        List<BranchOfficeInfo_CidVO> list = new ArrayList<BranchOfficeInfo_CidVO>();
        try
        {
            list = getSqlSession().selectList("BranchInfo.getBranchOfficeInfo_CidList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public int  getBranchOfficeInfo_CidListCount(BranchOfficeInfo_CidVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("BranchInfo.getBranchOfficeInfo_CidListCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    public int  getMaxIdx_Cid(BranchOfficeInfo_CidVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("BranchInfo.getMaxIdx_Cid", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    public int insertbranchofficeinfo_cid(BranchOfficeInfo_CidVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchInfo.insertBranchOfficeInfo_cid", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }

    public int updatebranchofficeinfo_cid(BranchOfficeInfo_CidVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().update("BranchInfo.updateBranchOfficeInfo_cid", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }

    public int deleteBranchOfficeInfo_Cid(String idx)
    {
        int result = 0;
        try
        {
            result = getSqlSession().delete("BranchInfo.deleteBranchOfficeInfo_cid", idx);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    /*지사 프로그램 관리*/
    public List<BranchOfficeInfo_Sw_VerVO>  getBranchOfficeInfo_Sw_VerList(BranchOfficeInfo_Sw_VerVO vo)
    { 
        List<BranchOfficeInfo_Sw_VerVO> list = new ArrayList<BranchOfficeInfo_Sw_VerVO>();
        try
        {
            list = getSqlSession().selectList("BranchInfo.getBranchOfficeInfo_Sw_VerList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
   
    public int  getBranchOfficeInfo_Sw_VerListCount(BranchOfficeInfo_Sw_VerVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("BranchInfo.getBranchOfficeInfo_Sw_VerListCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    /*지사 프로그램 관리 이력*/
    public List<BranchOfficeInfo_Sw_HisVO>  getBranchOfficeInfo_Sw_HisList(BranchOfficeInfo_Sw_HisVO vo)
    { 
        List<BranchOfficeInfo_Sw_HisVO> list = new ArrayList<BranchOfficeInfo_Sw_HisVO>();
        try
        {
            list = getSqlSession().selectList("BranchInfo.getBranchOfficeInfo_Sw_HisList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
   
    public int  getBranchOfficeInfo_Sw_HisListCount(BranchOfficeInfo_Sw_HisVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("BranchInfo.getBranchOfficeInfo_Sw_HisListCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    
    /*상점 프로그램 관리 이력*/
    public List<BranchOfficeInfo_Sw_HisVO>  getBranchOfficeInfo_S_Sw_HisList(BranchOfficeInfo_Sw_HisVO vo)
    { 
        List<BranchOfficeInfo_Sw_HisVO> list = new ArrayList<BranchOfficeInfo_Sw_HisVO>();
        try
        {
            list = getSqlSession().selectList("BranchInfo.getBranchOfficeInfo_S_Sw_HisList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
   
    public int  getBranchOfficeInfo_S_Sw_HisListCount(BranchOfficeInfo_Sw_HisVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("BranchInfo.getBranchOfficeInfo_S_Sw_HisListCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    /*지사APP 프로그램 관리 이력*/
    public List<BranchOfficeInfo_Sw_HisVO>  getBranchOfficeInfo_B_Sw_HisList(BranchOfficeInfo_Sw_HisVO vo)
    { 
        List<BranchOfficeInfo_Sw_HisVO> list = new ArrayList<BranchOfficeInfo_Sw_HisVO>();
        try
        {
            list = getSqlSession().selectList("BranchInfo.getBranchOfficeInfo_B_Sw_HisList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
   
    public int  getBranchOfficeInfo_B_Sw_HisListCount(BranchOfficeInfo_Sw_HisVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("BranchInfo.getBranchOfficeInfo_B_Sw_HisListCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    /*상점 app 프로그램 관리 이력*/
    public List<BranchOfficeInfo_Sw_HisVO>  getBranchOfficeInfo_Sapp_Sw_HisList(BranchOfficeInfo_Sw_HisVO vo)
    { 
        List<BranchOfficeInfo_Sw_HisVO> list = new ArrayList<BranchOfficeInfo_Sw_HisVO>();
        try
        {
            list = getSqlSession().selectList("BranchInfo.getBranchOfficeInfo_Sapp_Sw_HisList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
   
    public int  getBranchOfficeInfo_Sapp_Sw_HisListCount(BranchOfficeInfo_Sw_HisVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("BranchInfo.getBranchOfficeInfo_Sapp_Sw_HisListCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    /*기사APP 프로그램 관리 이력*/
    public List<BranchOfficeInfo_Sw_HisVO>  getBranchOfficeInfo_R_Sw_HisList(BranchOfficeInfo_Sw_HisVO vo)
    { 
        List<BranchOfficeInfo_Sw_HisVO> list = new ArrayList<BranchOfficeInfo_Sw_HisVO>();
        try
        {
            list = getSqlSession().selectList("BranchInfo.getBranchOfficeInfo_R_Sw_HisList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
   
    public int  getBranchOfficeInfo_R_Sw_HisListCount(BranchOfficeInfo_Sw_HisVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("BranchInfo.getBranchOfficeInfo_R_Sw_HisListCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    /*상점CID 프로그램 관리 이력*/
    public List<BranchOfficeInfo_Sw_HisVO>  getBranchOfficeInfo_Cid_Sw_HisList(BranchOfficeInfo_Sw_HisVO vo)
    { 
        List<BranchOfficeInfo_Sw_HisVO> list = new ArrayList<BranchOfficeInfo_Sw_HisVO>();
        try
        {
            list = getSqlSession().selectList("BranchInfo.getBranchOfficeInfo_Cid_Sw_HisList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
   
    
    public int  getBranchOfficeInfo_Cid_Sw_HisListCount(BranchOfficeInfo_Sw_HisVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("BranchInfo.getBranchOfficeInfo_Cid_Sw_HisListCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    public int insertbranchofficeinfo_sw_ver(BranchOfficeInfo_Sw_VerVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchInfo.insertbranchofficeinfo_sw_ver", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }

    public int updatebranchofficeinfo_sw_ver(BranchOfficeInfo_Sw_VerVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().update("BranchInfo.updatebranchofficeinfo_sw_ver", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int applybranchofficeinfo_sw_ver(BranchOfficeInfo_Sw_VerVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().update("BranchInfo.applybranchofficeinfo_sw_ver", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int applybranchofficeinfo_s_sw_ver(BranchOfficeInfo_S_Sw_VerVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().update("BranchInfo.applybranchofficeinfo_s_sw_ver", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int applybranchofficeinfo_cid_sw_ver(BranchOfficeInfo_Cid_Sw_VerVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().update("BranchInfo.applybranchofficeinfo_cid_sw_ver", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int applybranchofficeinfo_r_sw_ver(BranchOfficeInfo_R_Sw_VerVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().update("BranchInfo.applybranchofficeinfo_r_sw_ver", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int applybranchofficeinfo_sapp_sw_ver(BranchOfficeInfo_Sapp_Sw_VerVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().update("BranchInfo.applybranchofficeinfo_sapp_sw_ver", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int applybranchofficeinfo_b_sw_ver(BranchOfficeInfo_B_Sw_VerVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().update("BranchInfo.applybranchofficeinfo_b_sw_ver", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int insertsw_his(BranchOfficeInfo_Sw_HisVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchInfo.insertsw_his", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int inserts_sw_his(BranchOfficeInfo_Sw_HisVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchInfo.inserts_sw_his", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int insertcid_sw_his(BranchOfficeInfo_Sw_HisVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchInfo.insertcid_sw_his", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int insertr_sw_his(BranchOfficeInfo_Sw_HisVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchInfo.insertr_sw_his", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int insertsapp_sw_his(BranchOfficeInfo_Sw_HisVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchInfo.insertsapp_sw_his", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int insertb_sw_his(BranchOfficeInfo_Sw_HisVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchInfo.insertb_sw_his", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }

    public int deleteBranchOfficeInfo_Sw_Ver(String branch_sw_version)
    {
        int result = 0;
        try
        {
            result = getSqlSession().delete("BranchInfo.deleteBranchOfficeInfo_Sw_Ver", branch_sw_version);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    /*상점 프로그램 관리*/
    public List<BranchOfficeInfo_S_Sw_VerVO>  getBranchOfficeInfo_S_Sw_VerList(BranchOfficeInfo_S_Sw_VerVO vo)
    { 
        List<BranchOfficeInfo_S_Sw_VerVO> list = new ArrayList<BranchOfficeInfo_S_Sw_VerVO>();
        try
        {
            list = getSqlSession().selectList("BranchInfo.getBranchOfficeInfo_S_Sw_VerList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public int  getBranchOfficeInfo_S_Sw_VerListCount(BranchOfficeInfo_S_Sw_VerVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("BranchInfo.getBranchOfficeInfo_S_Sw_VerListCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    
    public int insertbranchofficeinfo_s_sw_ver(BranchOfficeInfo_S_Sw_VerVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchInfo.insertbranchofficeinfo_s_sw_ver", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }

    public int updatebranchofficeinfo_s_sw_ver(BranchOfficeInfo_S_Sw_VerVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().update("BranchInfo.updatebranchofficeinfo_s_sw_ver", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }

    public int deleteBranchOfficeInfo_S_Sw_Ver(String store_sw_version)
    {
        int result = 0;
        try
        {
            result = getSqlSession().delete("BranchInfo.deleteBranchOfficeInfo_S_Sw_Ver", store_sw_version);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    /*상점CID 프로그램 관리*/
    public List<BranchOfficeInfo_Cid_Sw_VerVO>  getBranchOfficeInfo_Cid_Sw_VerList(BranchOfficeInfo_Cid_Sw_VerVO vo)
    { 
        List<BranchOfficeInfo_Cid_Sw_VerVO> list = new ArrayList<BranchOfficeInfo_Cid_Sw_VerVO>();
        try
        {
            list = getSqlSession().selectList("BranchInfo.getBranchOfficeInfo_Cid_Sw_VerList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public int  getBranchOfficeInfo_Cid_Sw_VerListCount(BranchOfficeInfo_Cid_Sw_VerVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("BranchInfo.getBranchOfficeInfo_Cid_Sw_VerListCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    
    public int insertbranchofficeinfo_cid_sw_ver(BranchOfficeInfo_Cid_Sw_VerVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchInfo.insertbranchofficeinfo_cid_sw_ver", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }

    public int updatebranchofficeinfo_cid_sw_ver(BranchOfficeInfo_Cid_Sw_VerVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().update("BranchInfo.updatebranchofficeinfo_cid_sw_ver", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }

    public int deleteBranchOfficeInfo_Cid_Sw_Ver(String store_cid_sw_version)
    {
        int result = 0;
        try
        {
            result = getSqlSession().delete("BranchInfo.deleteBranchOfficeInfo_Cid_Sw_Ver", store_cid_sw_version);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    /*지사 APP SW 버전 관리*/
    public List<BranchOfficeInfo_B_Sw_VerVO>  getBranchOfficeInfo_B_Sw_VerList(BranchOfficeInfo_B_Sw_VerVO vo)
    { 
        List<BranchOfficeInfo_B_Sw_VerVO> list = new ArrayList<BranchOfficeInfo_B_Sw_VerVO>();
        try
        {
            list = getSqlSession().selectList("BranchInfo.getBranchOfficeInfo_B_Sw_VerList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public int  getBranchOfficeInfo_B_Sw_VerListCount(BranchOfficeInfo_B_Sw_VerVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("BranchInfo.getBranchOfficeInfo_B_Sw_VerListCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    
    public int insertbranchofficeinfo_b_sw_ver(BranchOfficeInfo_B_Sw_VerVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchInfo.insertbranchofficeinfo_b_sw_ver", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }

    public int updatebranchofficeinfo_b_sw_ver(BranchOfficeInfo_B_Sw_VerVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().update("BranchInfo.updatebranchofficeinfo_b_sw_ver", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }

    public int deleteBranchOfficeInfo_B_Sw_Ver(String branchapp_sw_version)
    {
        int result = 0;
        try
        {
            result = getSqlSession().delete("BranchInfo.deleteBranchOfficeInfo_B_Sw_Ver", branchapp_sw_version);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }

    /*기사 APP SW 버전 관리*/
    public List<BranchOfficeInfo_R_Sw_VerVO>  getBranchOfficeInfo_R_Sw_VerList(BranchOfficeInfo_R_Sw_VerVO vo)
    { 
        List<BranchOfficeInfo_R_Sw_VerVO> list = new ArrayList<BranchOfficeInfo_R_Sw_VerVO>();
        try
        {
            list = getSqlSession().selectList("BranchInfo.getBranchOfficeInfo_R_Sw_VerList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public int  getBranchOfficeInfo_R_Sw_VerListCount(BranchOfficeInfo_R_Sw_VerVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("BranchInfo.getBranchOfficeInfo_R_Sw_VerListCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    
    public int insertbranchofficeinfo_r_sw_ver(BranchOfficeInfo_R_Sw_VerVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchInfo.insertbranchofficeinfo_r_sw_ver", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }

    public int updatebranchofficeinfo_r_sw_ver(BranchOfficeInfo_R_Sw_VerVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().update("BranchInfo.updatebranchofficeinfo_r_sw_ver", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }

    public int deleteBranchOfficeInfo_R_Sw_Ver(String riderapp_sw_version)
    {
        int result = 0;
        try
        {
            result = getSqlSession().delete("BranchInfo.deleteBranchOfficeInfo_R_Sw_Ver", riderapp_sw_version);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    /*상점 APP SW 버전 관리*/
    public List<BranchOfficeInfo_Sapp_Sw_VerVO>  getBranchOfficeInfo_Sapp_Sw_VerList(BranchOfficeInfo_Sapp_Sw_VerVO vo)
    { 
        List<BranchOfficeInfo_Sapp_Sw_VerVO> list = new ArrayList<BranchOfficeInfo_Sapp_Sw_VerVO>();
        try
        {
            list = getSqlSession().selectList("BranchInfo.getBranchOfficeInfo_Sapp_Sw_VerList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public int  getBranchOfficeInfo_Sapp_Sw_VerListCount(BranchOfficeInfo_Sapp_Sw_VerVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("BranchInfo.getBranchOfficeInfo_Sapp_Sw_VerListCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    
    public int insertbranchofficeinfo_sapp_sw_ver(BranchOfficeInfo_Sapp_Sw_VerVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchInfo.insertbranchofficeinfo_sapp_sw_ver", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }

    public int updatebranchofficeinfo_sapp_sw_ver(BranchOfficeInfo_Sapp_Sw_VerVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().update("BranchInfo.updatebranchofficeinfo_sapp_sw_ver", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }

    public int deleteBranchOfficeInfo_Sapp_Sw_Ver(String storeapp_sw_version)
    {
        int result = 0;
        try
        {
            result = getSqlSession().delete("BranchInfo.deleteBranchOfficeInfo_Sapp_Sw_Ver", storeapp_sw_version);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    /*업데이트 공지 등록*/
    public int insertann_branch(BranchOfficeInfo_AnnVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchInfo.insertann_branch", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int insertann_store(BranchOfficeInfo_AnnVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchInfo.insertann_store", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int insertann_rider(BranchOfficeInfo_AnnVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchInfo.insertann_rider", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    /*업데이트 공지*/
    public List<BranchOfficeInfo_AnnVO>  getBranchOfficeInfo_AnnList(BranchOfficeInfo_AnnVO vo)
    { 
        List<BranchOfficeInfo_AnnVO> list = new ArrayList<BranchOfficeInfo_AnnVO>();
        try
        {
            list = getSqlSession().selectList("BranchInfo.getBranchOfficeInfo_AnnList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public int  getBranchOfficeInfo_AnnListCount(BranchOfficeInfo_AnnVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("BranchInfo.getBranchOfficeInfo_AnnListCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*상점CID 프로그램 관리 이력*/
    public List<developer_Fee_ConfigVO>  getdeveloper_Fee_Config(developer_Fee_ConfigVO vo)
    { 
        List<developer_Fee_ConfigVO> list = new ArrayList<developer_Fee_ConfigVO>();
        try
        {
            list = getSqlSession().selectList("BranchInfo.getdeveloper_Fee_Config", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public int  getdeveloper_Fee_ConfigCount(developer_Fee_ConfigVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("BranchInfo.getdeveloper_Fee_ConfigCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    public int developer_Fee_Config_insert(developer_Fee_ConfigVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchInfo.developer_Fee_Config_insert", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int developer_Fee_Config_update(developer_Fee_ConfigVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().update("BranchInfo.developer_Fee_Config_update", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int  getpasswd_chk(Afd_userinfoVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("BranchInfo.getpasswd_chk", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    
    
}
