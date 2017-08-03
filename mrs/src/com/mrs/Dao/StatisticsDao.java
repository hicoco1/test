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

public class StatisticsDao extends SqlSessionDaoSupport
{
    private static final Logger logger = LoggerFactory.getLogger(StatisticsDao.class);

    /*지사별 배달 통계*/
    public List<StatisticsVO>  getStatisticsList(StatisticsVO vo)
    { 
        List<StatisticsVO> list = new ArrayList<StatisticsVO>();
        try
        {
            list = getSqlSession().selectList("Statistics.getStatisticsList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public List<StatisticsVO>  getStatisticsList_all(StatisticsVO vo)
    { 
        List<StatisticsVO> list_all = new ArrayList<StatisticsVO>();
        try
        {
        	list_all = getSqlSession().selectList("Statistics.getStatisticsList_all", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list_all;
    }
    
    public int  getStatisticsListCount(StatisticsVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("Statistics.getStatisticsListCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    /*지사별 배달기사 등록 통계*/
    public List<Statistics_RiderVO>  getStatistics_RiderList(Statistics_RiderVO vo)
    { 
        List<Statistics_RiderVO> list = new ArrayList<Statistics_RiderVO>();
        try
        {
            list = getSqlSession().selectList("Statistics.getStatistics_RiderList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public List<Statistics_RiderVO>  getStatistics_RiderList_all(Statistics_RiderVO vo)
    { 
        List<Statistics_RiderVO> list = new ArrayList<Statistics_RiderVO>();
        try
        {
            list = getSqlSession().selectList("Statistics.getStatistics_RiderList_all", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public int  getStatistics_RiderListCount(Statistics_RiderVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("Statistics.getStatistics_RiderListCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
   
    /*상점별 배달 통계*/
    public List<Statistics_StoreVO>  getStatistics_storeList(Statistics_StoreVO vo)
    { 
        List<Statistics_StoreVO> list = new ArrayList<Statistics_StoreVO>();
        try
        {
            list = getSqlSession().selectList("Statistics.getStatistics_storeList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public List<Statistics_StoreVO>  getStatisticsList_store_all(Statistics_StoreVO vo)
    { 
        List<Statistics_StoreVO> list_all = new ArrayList<Statistics_StoreVO>();
        try
        {
        	list_all = getSqlSession().selectList("Statistics.getStatisticsList_store_all", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list_all;
    }
    
    public int  getStatistics_storeListCount(Statistics_StoreVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("Statistics.getStatistics_storeListCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
}
