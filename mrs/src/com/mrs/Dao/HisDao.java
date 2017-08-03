
package com.mrs.Dao;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mrs.Vo.*;

public class HisDao extends SqlSessionDaoSupport
{
    private static final Logger logger = LoggerFactory.getLogger(HisDao.class);

    /*상점 잔액 충전 이력*/
    public List<His_RechargeVO> getRechargeHisList(His_RechargeVO vo)
    { 
        List<His_RechargeVO> list = new ArrayList<His_RechargeVO>();
        try
        {
            list = getSqlSession().selectList("His.getRechargeHisList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public List<His_RechargeVO> getRechargeHisList_all(His_RechargeVO vo)
    { 
        List<His_RechargeVO> list = new ArrayList<His_RechargeVO>();
        try
        {
            list = getSqlSession().selectList("His.getRechargeHisList_all", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public int  getRechargeHisListCount(His_RechargeVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("His.getRechargeHisListCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    /*지사 잔액 충전 이력*/
    public List<His_RechargeVO> getRechargeHisList_branch(His_RechargeVO vo)
    { 
        List<His_RechargeVO> list = new ArrayList<His_RechargeVO>();
        try
        {
            list = getSqlSession().selectList("His.getRechargeHisList_branch", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public List<His_RechargeVO> getRechargeHisList_all_branch(His_RechargeVO vo)
    { 
        List<His_RechargeVO> list = new ArrayList<His_RechargeVO>();
        try
        {
            list = getSqlSession().selectList("His.getRechargeHisList_all_branch", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public int  getRechargeHisListCount_branch(His_RechargeVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("His.getRechargeHisListCount_branch", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    /*카드결제실패이력*/
    public List<His_CardfailVO> getRechargeHisList_cardfail(His_CardfailVO vo)
    { 
        List<His_CardfailVO> list = new ArrayList<His_CardfailVO>();
        try
        {
            list = getSqlSession().selectList("His.getRechargeHisList_cardfail", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public List<His_CardfailVO> getRechargeHisList_all_cardfail(His_CardfailVO vo)
    { 
        List<His_CardfailVO> list = new ArrayList<His_CardfailVO>();
        try
        {
            list = getSqlSession().selectList("His.getRechargeHisList_all_cardfail", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public int  getRechargeHisListCount_cardfail(His_CardfailVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("His.getRechargeHisListCount_cardfail", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
}
