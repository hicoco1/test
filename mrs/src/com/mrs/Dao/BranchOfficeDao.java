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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mrs.Vo.*;

public class BranchOfficeDao extends SqlSessionDaoSupport
{
    private static final Logger logger = LoggerFactory.getLogger(BranchOfficeDao.class);

    /*지사 정보 관리*/
    public List<BranchOfficeVO>  getBranchOfficeList(BranchOfficeVO vo)
    { 
        List<BranchOfficeVO> list = new ArrayList<BranchOfficeVO>();
        try
        {
            list = getSqlSession().selectList("BranchOffice.getBranchOfficeList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public List<BranchOfficeVO>  getBranchOfficeList_bank(BranchOfficeVO vo)
    { 
        List<BranchOfficeVO> list = new ArrayList<BranchOfficeVO>();
        try
        {
            list = getSqlSession().selectList("BranchOffice.getBranchOfficeList_bank", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public List<BranchOfficeVO>  getBranchOfficeList_b_bank(BranchOfficeVO vo)
    { 
        List<BranchOfficeVO> list = new ArrayList<BranchOfficeVO>();
        try
        {
            list = getSqlSession().selectList("BranchOffice.getBranchOfficeList_b_bank", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public List<BranchOffice_StoreVO>  getBranchOfficeList_bank_store(BranchOffice_StoreVO vo)
    { 
        List<BranchOffice_StoreVO> list = new ArrayList<BranchOffice_StoreVO>();
        try
        {
            list = getSqlSession().selectList("BranchOffice.getBranchOfficeList_bank_store", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public List<BranchOfficeVO>  getBranchOffice_Account(BranchOfficeVO vo)
    { 
        List<BranchOfficeVO> list = new ArrayList<BranchOfficeVO>();
        try
        {
            list = getSqlSession().selectList("BranchOffice.getBranchOffice_Account", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public String  getB_seq(BranchOfficeVO vo)
    {
        String b_seq = "";
        try
        {
        	b_seq = getSqlSession().selectOne("BranchOffice.getB_seq", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return b_seq;
    }
    
    public String  getModule_id(BranchOfficeVO vo)
    {
        String m_id = "";
        try
        {
        	m_id = getSqlSession().selectOne("BranchOffice.getModule_id", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return m_id;
    }
    
    public int  getB_seq2(BranchOfficeVO vo)
    {
        int b_seq = 0;
        try
        {
        	b_seq = getSqlSession().selectOne("BranchOffice.getB_seq2", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return b_seq;
    }
    
    
    public String  getv_account(BranchOfficeVO vo)
    {
    	String v_account = "";
        try
        {
        	v_account = getSqlSession().selectOne("BranchOffice.getv_account", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return v_account;
    }
    
    public String  getv_account_store(BranchOffice_StoreVO vo)
    {
    	String v_account = "";
        try
        {
        	v_account = getSqlSession().selectOne("BranchOffice.getv_account_store", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return v_account;
    }
    
    public String  getv_bank(BranchOfficeVO vo)
    {
    	String v_bank = "";
        try
        {
        	v_bank = getSqlSession().selectOne("BranchOffice.getv_bank", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return v_bank;
    }
    
    public String  getv_account2(BranchOfficeVO vo)
    {
    	String v_account = "";
        try
        {
        	v_account = getSqlSession().selectOne("BranchOffice.getv_account2", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return v_account;
    }
    
    public String  getv_name(BranchOfficeVO vo)
    {
    	String v_name = "";
        try
        {
        	v_name = getSqlSession().selectOne("BranchOffice.getv_name", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return v_name;
    }
    
    public String  getorg_v_name(BranchOfficeVO vo)
    {
    	String org_v_name = "";
        try
        {
        	org_v_name = getSqlSession().selectOne("BranchOffice.getorg_v_name", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return org_v_name;
    }
    
    public String  getorg_contract_sdate(BranchOfficeVO vo)
    {
    	String org_contract_sdate = "";
        try
        {
        	org_contract_sdate = getSqlSession().selectOne("BranchOffice.getorg_contract_sdate", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return org_contract_sdate;
    }
    
    public String  getorg_contract_edate(BranchOfficeVO vo)
    {
    	String org_contract_edate = "";
        try
        {
        	org_contract_edate = getSqlSession().selectOne("BranchOffice.getorg_contract_edate", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return org_contract_edate;
    }
    
    public String  getcontract_sdate(BranchOfficeVO vo)
    {
    	String contract_sdate = "";
        try
        {
        	contract_sdate = getSqlSession().selectOne("BranchOffice.getcontract_sdate", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return contract_sdate;
    }
    
    public String  getcontract_edate(BranchOfficeVO vo)
    {
    	String contract_edate = "";
        try
        {
        	contract_edate = getSqlSession().selectOne("BranchOffice.getcontract_edate", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return contract_edate;
    }
    
    public String  getv_bank_store(BranchOffice_StoreVO vo)
    {
    	String v_bank = "";
        try
        {
        	v_bank = getSqlSession().selectOne("BranchOffice.getv_bank_store", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return v_bank;
    }
    
    public String  getb_representative(BranchOffice_StoreVO vo)
    {
    	String b_representative = "";
        try
        {
        	b_representative = getSqlSession().selectOne("BranchOffice.getb_representative", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return b_representative;
    }
    
    public String  gets_seq(BranchOffice_StoreVO vo) 
    {
    	String s_id = "";
        try
        {
        	s_id = getSqlSession().selectOne("BranchOffice.gets_seq", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return s_id;
    }
    
    public String  getv_account2_store(BranchOffice_StoreVO vo)
    {
    	String v_account = "";
        try
        {
        	v_account = getSqlSession().selectOne("BranchOffice.getv_account2_store", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return v_account;
    }
    
    public String  getv_name_store(BranchOffice_StoreVO vo)
    {
    	String v_name = "";
        try
        {
        	v_name = getSqlSession().selectOne("BranchOffice.getv_name_store", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return v_name;
    }
    
    public String  getorg_v_name_store(BranchOffice_StoreVO vo)
    {
    	String org_v_name = "";
        try
        {
        	org_v_name = getSqlSession().selectOne("BranchOffice.getorg_v_name_store", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return org_v_name;
    }
    
    public String  getorg_contract_sdate_store(BranchOffice_StoreVO vo)
    {
    	String org_contract_sdate = "";
        try
        {
        	org_contract_sdate = getSqlSession().selectOne("BranchOffice.getorg_contract_sdate_store", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return org_contract_sdate;
    }
    
    public String  getorg_contract_edate_store(BranchOffice_StoreVO vo)
    {
    	String org_contract_edate = "";
        try
        {
        	org_contract_edate = getSqlSession().selectOne("BranchOffice.getorg_contract_edate_store", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return org_contract_edate;
    }
    
    public String  getcontract_sdate_store(BranchOffice_StoreVO vo)
    {
    	String contract_sdate = "";
        try
        {
        	contract_sdate = getSqlSession().selectOne("BranchOffice.getcontract_sdate_store", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return contract_sdate;
    }
    
    public String  getcontract_edate_store(BranchOffice_StoreVO vo)
    {
    	String contract_edate = "";
        try
        {
        	contract_edate = getSqlSession().selectOne("BranchOffice.getcontract_edate_store", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return contract_edate;
    }
    
    public List<BranchOffice_NationVO>  getBranchOffice_NationList(BranchOffice_NationVO vo)
    { 
        List<BranchOffice_NationVO> list = new ArrayList<BranchOffice_NationVO>();
        try
        {
            list = getSqlSession().selectList("BranchOffice.getBranchOffice_NationList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public List<BranchOffice_NationVO>  getBranchOffice_GuList(BranchOffice_NationVO vo)
    { 
        List<BranchOffice_NationVO> list = new ArrayList<BranchOffice_NationVO>();
        try
        {
            list = getSqlSession().selectList("BranchOffice.getBranchOffice_GuList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }

    
    public List<BranchOffice_NationVO>  getBranchOffice_TownList(BranchOffice_NationVO vo)
    { 
        List<BranchOffice_NationVO> list = new ArrayList<BranchOffice_NationVO>();
        try
        {
            list = getSqlSession().selectList("BranchOffice.getBranchOffice_TownList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public int  getBranchOfficeListCount(BranchOfficeVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("BranchOffice.getBranchOfficeListCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    public String  getauth(BranchOfficeVO vo)
    {
        String count = "";
        try
        {
            count = getSqlSession().selectOne("BranchOffice.getauth", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    public int  getloginidCount(BranchOfficeVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("BranchOffice.getloginidCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    public int  getloginidCount_store(BranchOffice_StoreVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("BranchOffice.getloginidCount_store", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    public int  getloginidCount_rider(BranchOffice_RiderVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("BranchOffice.getloginidCount_rider", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    public int insertbranchoffice(BranchOfficeVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.insertBranchOffice", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int insertnetworkinfo(BranchOfficeVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.insertnetworkinfo", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int insertaddrver(String b_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.insertaddrver", b_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int insertsessioninfo1(String b_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.insertsessioninfo1", b_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int insertsessioninfo2(String b_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.insertsessioninfo2", b_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int insertvbankchg(BranchOfficeVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.insertvbankchg", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }

    public int updatebranchoffice(BranchOfficeVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().update("BranchOffice.updateBranchOffice", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int updateb_balance(BranchOfficeVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().update("BranchOffice.updateb_balance", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int insertrechrg_his(BranchOfficeVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.insertrechrg_his", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int updateB_seq(int b_seq)
    {
        int result = 0;
        try
        {
            result = getSqlSession().update("BranchOffice.updateB_seq", b_seq);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int updatevbankchg(BranchOfficeVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.updatevbankchg", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }

    public int deleteBranchOffice(String b_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().delete("BranchOffice.deleteBranchOffice", b_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int deletevbankchg(BranchOfficeVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.deletevbankchg", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }

    public int deletenetworkinfo(String b_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.deletenetworkinfo", b_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int deleteaddrver(String b_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.deleteaddrver", b_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int deletesessioninfo(String b_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.deletesessioninfo", b_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int deletebranchcoverarea(String b_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.deletebranchcoverarea", b_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int deletebranchaddress(String b_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.deletebranchaddress", b_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int deletesharedbranch(String b_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.deletesharedbranch", b_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int deletesharedbranchs(String b_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.deletesharedbranchs", b_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int deletestoreinfo(String b_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.deletestoreinfo", b_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int deleteareaextra(String b_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.deleteareaextra", b_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int deletebasemenu(String b_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.deletebasemenu", b_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int deletefixedprice(String b_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.deletefixedprice", b_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int deletefoodcategory(String b_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.deletefoodcategory", b_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int deletestoresessioninfo(String b_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.deletestoresessioninfo", b_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int deletestorecoverarea(String b_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.deletestorecoverarea", b_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int deletetimeextra(String b_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.deletetimeextra", b_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int deleteriderinfo(String b_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.deleteriderinfo", b_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int deletesharedrider(String b_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.deletesharedrider", b_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int deletesharedriders(String b_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.deletesharedriders", b_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int deleteridersessioninfo(String b_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.deleteridersessioninfo", b_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int deleteridercatchcancel(String b_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.deleteridercatchcancel", b_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int deleteannounce(String b_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.deleteannounce", b_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int deleteannounced(String b_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.deleteannounced", b_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int afd_deleted_branchinfo(String b_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.afd_deleted_branchinfo", b_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int afd_deleted_storeinfo(String s_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.afd_deleted_storeinfo", s_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int afd_deleted_riderinfo(String r_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.afd_deleted_riderinfo", r_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    /*지사 관할지역 관리*/
    public List<BranchOffice_AreaVO>  getBranchOffice_AreaList(BranchOffice_AreaVO vo)
    { 
        List<BranchOffice_AreaVO> list = new ArrayList<BranchOffice_AreaVO>();
        try
        {
            list = getSqlSession().selectList("BranchOffice.getBranchOffice_AreaList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public int  getBranchOffice_AreaListCount(BranchOffice_AreaVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("BranchOffice.getBranchOffice_AreaListCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    public int insertbranchoffice_area(BranchOffice_AreaVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.insertBranchOffice_Area", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int insertbranchoffice_addr2(BranchOffice_AddrVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.insertBranchOffice_Area2", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }

    public int updatebranchoffice_area(BranchOffice_AreaVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().update("BranchOffice.updateBranchOffice_Area", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }

    public int deleteBranchOffice_Area(String seq)
    {
        int result = 0;
        try
        {
            result = getSqlSession().delete("BranchOffice.deleteBranchOffice_Area", seq);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int deleteBranchOffice_Area2(BranchOffice_AreaVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().delete("BranchOffice.deleteBranchOffice_Area2",vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    /*상점 정보 관리*/
    public List<BranchOffice_StoreVO>  getBranchOffice_StoreList(BranchOffice_StoreVO vo)
    { 
        List<BranchOffice_StoreVO> list = new ArrayList<BranchOffice_StoreVO>();
        try
        {
            list = getSqlSession().selectList("BranchOffice.getBranchOffice_StoreList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public int  getBranchOffice_StoreListCount(BranchOffice_StoreVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("BranchOffice.getBranchOffice_StoreListCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    /*상점 정보 관리_CS*/
    public List<BranchOffice_StoreVO>  getBranchOffice_StoreList_CS(BranchOffice_StoreVO vo)
    { 
        List<BranchOffice_StoreVO> list = new ArrayList<BranchOffice_StoreVO>();
        try
        {
            list = getSqlSession().selectList("BranchOffice.getBranchOffice_StoreList_CS", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public int  getBranchOffice_StoreListCount_CS(BranchOffice_StoreVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("BranchOffice.getBranchOffice_StoreListCount_CS", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    public int insertbranchoffice_store(BranchOffice_StoreVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.insertBranchOffice_Store", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int insertvbankchg_store(BranchOffice_StoreVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.insertvbankchg_store", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int updatevbankchg_store(BranchOffice_StoreVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.updatevbankchg_store", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
  
    
    public int deletevbankchg_store(BranchOffice_StoreVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.deletevbankchg_store", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }

    public int updatebranchoffice_store(BranchOffice_StoreVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().update("BranchOffice.updateBranchOffice_Store", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int updates_seq(BranchOffice_StoreVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().update("BranchOffice.updates_seq", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }

    public int deleteBranchOffice_Store(String s_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().delete("BranchOffice.deleteBranchOffice_Store", s_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int deleteafd_time_extra(String s_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().delete("BranchOffice.deleteafd_time_extra", s_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int deleteafd_area_extra(String s_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().delete("BranchOffice.deleteafd_area_extra", s_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int deleteafd_storecoverarea(String s_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().delete("BranchOffice.deleteafd_storecoverarea", s_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int deleteafd_fixed_price(String s_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().delete("BranchOffice.deleteafd_fixed_price", s_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int deleteafd_foodcategory(String s_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().delete("BranchOffice.deleteafd_foodcategory", s_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int deleteafd_basemenu(String s_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().delete("BranchOffice.deleteafd_basemenu", s_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    /*지사 주소 정보 메뉴*/
    public int  getMaxIdx_Addr(BranchOffice_AddrVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("BranchOffice.getMaxIdx_Addr", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    /*지사 주소 정보 메뉴*/
    public int  insert_getMaxIdx_Addr(BranchOffice_AddrVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("BranchOffice.insert_getMaxIdx_Addr", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    /*지사 주소 정보  중복체크 */
    public int  insert_getAddr_ck(BranchOffice_AddrVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("BranchOffice.Addr_ck", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    public List<BranchOffice_AddrVO>  getBranchOfficeAddrList(BranchOffice_AddrVO vo)
    { 
        List<BranchOffice_AddrVO> list = new ArrayList<BranchOffice_AddrVO>();
        try
        {
            list = getSqlSession().selectList("BranchOffice.getBranchOfficeAddrList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public List<BranchOffice_AddrVO>  getBranchOfficeAddrList_cs(BranchOffice_AddrVO vo)
    { 
        List<BranchOffice_AddrVO> list = new ArrayList<BranchOffice_AddrVO>();
        try
        {
            list = getSqlSession().selectList("BranchOffice.getBranchOfficeAddrList_cs", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public List<BranchOffice_AddrVO>  getBranchOfficeAddrList_bid(BranchOffice_AddrVO vo)
    { 
        List<BranchOffice_AddrVO> list = new ArrayList<BranchOffice_AddrVO>();
        try
        {
            list = getSqlSession().selectList("BranchOffice.getBranchOfficeAddrList_bid", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public List<BranchOffice_RiderVO>  getBranchOfficeAddrList_bid(BranchOffice_RiderVO vo)
    { 
        List<BranchOffice_RiderVO> list = new ArrayList<BranchOffice_RiderVO>();
        try
        {
            list = getSqlSession().selectList("BranchOffice.getBranchOfficeAddrList_bid", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public List<BranchOffice_AddrVO>  getBranchOfficeAddrList_bidlist(BranchOffice_AddrVO vo)
    { 
        List<BranchOffice_AddrVO> list = new ArrayList<BranchOffice_AddrVO>();
        try
        {
            list = getSqlSession().selectList("BranchOffice.getBranchOfficeAddrList_bidlist", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public List<BranchOffice_AddrVO>  getCityGu_Addr(BranchOffice_AddrVO vo)
    { 
        List<BranchOffice_AddrVO> list = new ArrayList<BranchOffice_AddrVO>();
        try
        {
            list = getSqlSession().selectList("BranchOffice.getCityGu_Addr", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public int  getBranchOfficeAddrListCount(BranchOffice_AddrVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("BranchOffice.getBranchOfficeAddrListCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    public int  getBranchOfficeAddrListCount_cs(BranchOffice_AddrVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("BranchOffice.getBranchOfficeAddrListCount_cs", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    public int insertbranchoffice_addr(BranchOffice_AddrVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.insertBranchOffice_addr", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public String getversion(BranchOffice_VerVO vo)
    {
        String result = "";
        try
        {
            result = getSqlSession().selectOne("BranchOffice.getversion", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int updateversion(BranchOffice_VerVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().update("BranchOffice.updateversion", vo);

        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int insertversion(BranchOffice_VerVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().update("BranchOffice.insertversion", vo);
      
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    

    public int updatebranchoffice_addr(BranchOffice_AddrVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().update("BranchOffice.updateBranchOffice_addr", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    
    public int deleteBranchOffice_addr(BranchOffice_AddrVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().delete("BranchOffice.deleteBranchOffice_addr", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int ck_deleteBranchOffice_addr(BranchOffice_AddrVO vo)
    {
        int result = 0;
        try
        {
       
            result = getSqlSession().delete("BranchOffice.ck_deleteBranchOffice_addr", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    
    
    
    
    
    public int insertbranchoffice_addr_Batch(List<BranchOffice_Store_CsvVO> resultList)
    {
        int result = 0; 
        try
        {
        	
        	for (BranchOffice_Store_CsvVO BranchOffice_Store_CsvVO : resultList) {
        		 result = getSqlSession().insert("BranchOffice.insertbranchoffice_addr_Batch", BranchOffice_Store_CsvVO);
        	}
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
   
    
    
    
    
    /*
    public Object batchInsertData(final Vector dataVector) throws Exception {
    	// ibatis의 SqlExecutor을 사용
    	return getSqlMapClientTemplate().execute(
    		new SqlMapClientCallback<Object> () {
    			int dataCount = 0;	// 저장한 데이터 건수
    			int batchCount = 0;	// 30건씩 배치 처리한 건수
    			int totalCount = dataVector.size();	// 전체 데이터의 건수
    			/* (non-Javadoc)

    			 * @see org.springframework.orm.ibatis.SqlMapClientCallback#doInSqlMapClient(com.ibatis.sqlmap.client.SqlMapExecutor)

    		/*	 
    			@Override
    			public Object doInSqlMapClient(SqlMapExecutor executor) throws SQLException {
    				try {
    					// 배치처리 시작
    					executor.startBatch ();
    					Map<String, Object> eachData;
    					for (int idx = 0; idx < totalCount; idx++) {
    						eachData = dataVector.elementAt(idx);
    						// 데이터 저장
    						executor.insert("sqlQuery.batchInsert", eachData);
    						dataCount++;
    						// 저장건수 10건 마다 배치 처리
    						if ((dataCount % 30) == 0) {
    							executor.executeBatch();
    							batchCount++;
    						}					
    					}
    					// 저장하지 않은 데이터 건수가 남아있다면 남은거 처리
    					if ((batchCount * 30) < totalCount) {
    						executor.executeBatch();
    					}
    				} catch (Exception e) {
    					throw new SQLException(e.getMessage());
    				}
    				return dataCount;
    			}
    		}
    	);
    }

    */
    
    public List<BranchOfficeVO>  getBranchOfficeList_config(BranchOfficeVO vo)
    { 
        List<BranchOfficeVO> list = new ArrayList<BranchOfficeVO>();
        try
        {
            list = getSqlSession().selectList("BranchOffice.getBranchOfficeList_config", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    
    public int insertsessioninfo_s1(BranchOffice_StoreVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.insertsessioninfo_s1", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int insertsessioninfo_s2(BranchOffice_StoreVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.insertsessioninfo_s2", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int insertsessioninfo_s3(BranchOffice_StoreVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.insertsessioninfo_s3", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int deletesessioninfo_s(BranchOffice_StoreVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.deletesessioninfo_s", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
  
    /*기사 정보 관리*/
    public List<BranchOffice_RiderVO>  getBranchOffice_riderList(BranchOffice_RiderVO vo)
    { 
        List<BranchOffice_RiderVO> list = new ArrayList<BranchOffice_RiderVO>();
        try
        {
            list = getSqlSession().selectList("BranchOffice.getBranchOffice_riderList", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return list;
    }
    
    public int  getBranchOffice_riderListCount(BranchOffice_RiderVO vo)
    {
        int count = 0;
        try
        {
            count = getSqlSession().selectOne("BranchOffice.getBranchOffice_riderListCount", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return count;
    }
    
    public int insertbranchoffice_rider(BranchOffice_RiderVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.insertbranchoffice_rider", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public String  getR_seq(BranchOffice_RiderVO vo)
    {
        String r_seq = "";
        try
        {
        	r_seq = getSqlSession().selectOne("BranchOffice.getR_seq", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return r_seq;
    }
    
    public int  getR_seq2(BranchOffice_RiderVO vo)
    {
        int r_seq = 0;
        try
        {
        	r_seq = getSqlSession().selectOne("BranchOffice.getR_seq2", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return r_seq;
    }
    
    public int updateR_seq(int r_seq)
    {
        int result = 0;
        try
        {
            result = getSqlSession().update("BranchOffice.updateR_seq", r_seq);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int deleteBranchOffice_rider(String r_id)
    {
        int result = 0;
        try
        {
            result = getSqlSession().delete("BranchOffice.deleteBranchOffice_rider", r_id);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int updateBranchOffice_Rider(BranchOffice_RiderVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().update("BranchOffice.updateBranchOffice_Rider", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public int insertsessioninfo_rider(BranchOffice_RiderVO vo)
    {
        int result = 0;
        try
        {
            result = getSqlSession().insert("BranchOffice.insertsessioninfo_rider", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }
        return result;
    }
    
    public String  getCity_code(BranchOffice_RiderVO vo)
    {
    	String city_code = "";
        try
        {
        	city_code = getSqlSession().selectOne("BranchOffice.getCity_code", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return city_code;
    }
    
    public String  getB_City_code(BranchOfficeVO vo)
    {
    	String city_code = "";
        try
        {
        	city_code = getSqlSession().selectOne("BranchOffice.getB_City_code", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return city_code;
    }
    
    public String  getCity_code2(BranchOffice_AddrVO vo)
    {
    	String city_code = "";
        try
        {
        	city_code = getSqlSession().selectOne("BranchOffice.getCity_code2", vo);
        } catch (Exception e)
        {
            logger.debug("ERROR : " + e.toString());
        }        
        return city_code;
    }
}
