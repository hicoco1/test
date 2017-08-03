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

public class HeadOfficeDao extends SqlSessionDaoSupport
{
    private static final Logger logger = LoggerFactory.getLogger(HeadOfficeDao.class);

    public List<HeadOfficeVO>  getHeadOfficeList(HeadOfficeVO vo)
    { 
        List<HeadOfficeVO> list = new ArrayList<HeadOfficeVO>();
        try
        {
            list = getSqlSession().selectList("HeadOffice.getHeadOfficeList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    
    public List<HeadOfficeVO>  getHeadOfficeUpdate(HeadOfficeVO vo)
    { 
        List<HeadOfficeVO> list = new ArrayList<HeadOfficeVO>();
        try
        {
            list = getSqlSession().selectList("HeadOffice.getHeadOfficeUpdate", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    
    public int  getHeadOfficeListCount(HeadOfficeVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("HeadOffice.getHeadOfficeListCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    public int insertheadoffice(HeadOfficeVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("HeadOffice.insertHeadOffice", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }

    public int insertHeadOffice_authority(HeadOfficeVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("HeadOffice.insertHeadOffice_authority", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int updateheadoffice(HeadOfficeVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().update("HeadOffice.updateHeadOffice", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }

    public int updateHeadOffice_authority(HeadOfficeVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().update("HeadOffice.updateHeadOffice_authority", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int deleteHeadOffice(String login_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().delete("HeadOffice.deleteHeadOffice", login_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int deleteHeadOffice_authority(String login_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().delete("HeadOffice.deleteHeadOffice_authority", login_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    //전국 주소 정보 메뉴
    public List<HeadOffice_AddrVO>  getHeadOfficeAddrList(HeadOffice_AddrVO vo)
    { 
        List<HeadOffice_AddrVO> list = new ArrayList<HeadOffice_AddrVO>();
        try
        {
            list = getSqlSession().selectList("HeadOffice.getHeadOfficeAddrList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    
    
    public int  getHeadOfficeAddrListCount(HeadOffice_AddrVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("HeadOffice.getHeadOfficeAddrListCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    public int insertheadoffice_addr(HeadOffice_AddrVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("HeadOffice.insertHeadOffice_addr", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }

    public int updateheadoffice_addr(HeadOffice_AddrVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().update("HeadOffice.updateHeadOffice_addr", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    
    public int deleteHeadOffice_addr(String seq)
    {
        int result = 0;
        try
        {
            result = getSqlSession().delete("HeadOffice.deleteHeadOffice_addr", seq);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    //전국 시/도 시군구 정보 메뉴
    public List<HeadOffice_CityguVO>  getHeadOfficeCityguList(HeadOffice_CityguVO vo)
    { 
        List<HeadOffice_CityguVO> list = new ArrayList<HeadOffice_CityguVO>();
        try
        {
            list = getSqlSession().selectList("HeadOffice.getHeadOfficeCityguList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    
    
    public int  getHeadOfficeCityguListCount(HeadOffice_CityguVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("HeadOffice.getHeadOfficeCityguListCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    public int insertheadoffice_citygu(HeadOffice_CityguVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("HeadOffice.insertHeadOffice_citygu", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }

    public int updateheadoffice_citygu(HeadOffice_CityguVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().update("HeadOffice.updateHeadOffice_citygu", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    
    public int deleteHeadOffice_citygu(String seq)
    {
        int result = 0;
        try
        {
            result = getSqlSession().delete("HeadOffice.deleteHeadOffice_citygu", seq);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    //전국 동 코드 정보 메뉴
    public List<HeadOffice_DongVO>  getHeadOfficeDongList(HeadOffice_DongVO vo)
    { 
        List<HeadOffice_DongVO> list = new ArrayList<HeadOffice_DongVO>();
        try
        {
            list = getSqlSession().selectList("HeadOffice.getHeadOfficeDongList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    
    
    public int  getHeadOfficeDongListCount(HeadOffice_DongVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("HeadOffice.getHeadOfficeDongListCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    public int insertheadoffice_dong(HeadOffice_DongVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("HeadOffice.insertHeadOffice_dong", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }

    public int updateheadoffice_dong(HeadOffice_DongVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().update("HeadOffice.updateHeadOffice_dong", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    
    public int deleteHeadOffice_dong(String seq)
    {
        int result = 0;
        try
        {
            result = getSqlSession().delete("HeadOffice.deleteHeadOffice_dong", seq);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
  //가상계좌 은행 관리 메뉴
    public List<HeadOffice_BankVO>  getHeadOfficeBankList(HeadOffice_BankVO vo)
    { 
        List<HeadOffice_BankVO> list = new ArrayList<HeadOffice_BankVO>();
        try
        {
            list = getSqlSession().selectList("HeadOffice.getHeadOfficeBankList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    
    
    public int  getHeadOfficeBankListCount(HeadOffice_BankVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("HeadOffice.getHeadOfficeBankListCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    public int updatebank(String bank_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().update("HeadOffice.updatebank", bank_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int deletebank(String bank_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().delete("HeadOffice.deletebank", bank_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    /* 모 계좌 정보 관리 */
    public List<HeadOffice_ConfigVO>  getHead_ConfigList(HeadOffice_ConfigVO vo)
    { 
        List<HeadOffice_ConfigVO> list = new ArrayList<HeadOffice_ConfigVO>();
        try
        {
            list = getSqlSession().selectList("HeadOffice.getHead_ConfigList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    
    
    public int  getHead_ConfigListCount(HeadOffice_ConfigVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("HeadOffice.getHead_ConfigListCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    public int insertheadoffice_config(HeadOffice_ConfigVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("HeadOffice.insertHeadOffice_config", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }

    public int updateheadoffice_config(HeadOffice_ConfigVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().update("HeadOffice.updateHeadOffice_config", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    
    public int deleteHeadOffice_config(String b_seqeunce)
    {
        int result = 0;
        try
        {
            result = getSqlSession().delete("HeadOffice.deleteHeadOffice_config", b_seqeunce);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
}
