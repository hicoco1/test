
package com.mrs.Dao;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mrs.Vo.*;

public class CalcDao extends SqlSessionDaoSupport
{
    private static final Logger logger = LoggerFactory.getLogger(StatisticsDao.class);

    /*지사 정산*/
    public List<Calc_BranchVO>  getBranchList(Calc_BranchVO vo)
    { 
        List<Calc_BranchVO> list = new ArrayList<Calc_BranchVO>();
        try
        {
            list = getSqlSession().selectList("Calc.getBranchList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public List<Calc_BranchVO>  getBranchList_all(Calc_BranchVO vo)
    { 
        List<Calc_BranchVO> list = new ArrayList<Calc_BranchVO>();
        try
        {
            list = getSqlSession().selectList("Calc.getBranchList_all", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public int  getBranchListCount(Calc_BranchVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("Calc.getBranchListCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    /*가맹점 정산*/
    public List<Calc_StoreVO>  getStoreList(Calc_StoreVO vo)
    { 
        List<Calc_StoreVO> list = new ArrayList<Calc_StoreVO>();
        try
        {
            list = getSqlSession().selectList("Calc.getStoreList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public List<Calc_StoreVO>  getStoreList_all(Calc_StoreVO vo)
    { 
        List<Calc_StoreVO> list = new ArrayList<Calc_StoreVO>();
        try
        {
            list = getSqlSession().selectList("Calc.getStoreList_all", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public int  getStoreListCount(Calc_StoreVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("Calc.getStoreListCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    /*배달기사 정산*/
    public List<Calc_RiderVO>  getRiderList(Calc_RiderVO vo)
    { 
        List<Calc_RiderVO> list = new ArrayList<Calc_RiderVO>();
        try
        {
            list = getSqlSession().selectList("Calc.getRiderList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public List<Calc_RiderVO>  getRiderList_all(Calc_RiderVO vo)
    { 
        List<Calc_RiderVO> list = new ArrayList<Calc_RiderVO>();
        try
        {
            list = getSqlSession().selectList("Calc.getRiderList_all", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public int  getRiderListCount(Calc_RiderVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("Calc.getRiderListCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    /*상점 별 배달기사 정산*/
    public List<Calc_StoreRiderVO>  getStoreRiderList(Calc_StoreRiderVO vo)
    { 
        List<Calc_StoreRiderVO> list = new ArrayList<Calc_StoreRiderVO>();
        try
        {
            list = getSqlSession().selectList("Calc.getStoreRiderList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public List<Calc_StoreRiderVO>  getStoreRiderList_all(Calc_StoreRiderVO vo)
    { 
        List<Calc_StoreRiderVO> list = new ArrayList<Calc_StoreRiderVO>();
        try
        {
            list = getSqlSession().selectList("Calc.getStoreRiderList_all", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public int  getStoreRiderListCount(Calc_StoreRiderVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("Calc.getStoreRiderListCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    /*솔루션사 정산*/
    public List<Calc_SoluVO>  getSoluList(Calc_SoluVO vo)
    { 
        List<Calc_SoluVO> list = new ArrayList<Calc_SoluVO>();
        try
        {
            list = getSqlSession().selectList("Calc.getSoluList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public List<Calc_SoluVO>  getSoluList_all(Calc_SoluVO vo)
    { 
        List<Calc_SoluVO> list = new ArrayList<Calc_SoluVO>();
        try
        {
            list = getSqlSession().selectList("Calc.getSoluList_all", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public int  getSoluListCount(Calc_SoluVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("Calc.getSoluListCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
   
}
