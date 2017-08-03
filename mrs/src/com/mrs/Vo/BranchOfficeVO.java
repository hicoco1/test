package com.mrs.Vo;

public class BranchOfficeVO extends PagingVO 
{
	private String b_id;
	private String bid_flag;
	private String b_name;
	private String b_address;
	private String b_crn;
	private String b_tel1;
	private String b_tel2;
	private String login_id;
	private String login_passwd;
	private String active_status;
	private String bc_type;
	private String warning_amount;
	private String suspend_amount;
	private String max_call;
	private String callcatch_penalty_value;
	private String rider_delay_set;
	private String rider_delay_duration;
	private String alarm_limit_duration;
	private String batch_extra_flag;
	private String batch_extra_amount;
	private String service_type;
	private String charge_method;
	private String basic_distance;
	private String basic_charge;
	private String add_distance;
	private String add_charge;
	private String open_time;
	private String close_time;
	private String v_bank;
	private String v_account;
	private String calculatepercall;
	private String v_name;
	private String contract_sdate;
	private String contract_edate;
	private String insert_date;
	private String service_start_date;
	private String update_date;
	private String r_op_id;
	private String u_op_id;
	private String calculate_period;
	private String calculate_date;
	private String bank_id;
	private String org_v_bank;
	private String org_v_account;
	private String org_v_name;
	private String org_contract_sdate;
	private String org_contract_edate;
	private String b_balance;
	private String h_name;
	private String ip_addr;
	private String module_id;
	private String http_port;
	private String tcp_port;
	private String cs_heartbeat_period;
	private String app_heartbeat_period;
	private String app_polling_period;
	private String b_representative;
	private String b_balance_rechrg;
	private String b_balance_after;
	private long b_balance_before;
	private String username;
	private String org_b_representative;
	private String location_x;
	private String location_y;
	private String b_addr_appendix;
	private String b_city_code;
	private String b_gu_code;
	private String b_dong_code;
	private String b_town_code;
	private String account_flag;
	private String b_bank;
	private String b_account;
	private String ridercard_flag;
	
	public String getAccount_flag() {
		return account_flag;
	}
	public void setAccount_flag(String account_flag) {
		this.account_flag = account_flag;
	}
	public String getB_city_code() {
		return b_city_code;
	}
	public void setB_city_code(String b_city_code) {
		this.b_city_code = b_city_code;
	}
	public String getB_gu_code() {
		return b_gu_code;
	}
	public void setB_gu_code(String b_gu_code) {
		this.b_gu_code = b_gu_code;
	}
	public String getB_dong_code() {
		return b_dong_code;
	}
	public void setB_dong_code(String b_dong_code) {
		this.b_dong_code = b_dong_code;
	}
	public String getB_town_code() {
		return b_town_code;
	}
	public void setB_town_code(String b_town_code) {
		this.b_town_code = b_town_code;
	}
	public String getB_addr_appendix() {
		return b_addr_appendix;
	}
	public void setB_addr_appendix(String b_addr_appendix) {
		this.b_addr_appendix = b_addr_appendix;
	}
	public String getLocation_x() {
		return location_x;
	}
	public void setLocation_x(String location_x) {
		this.location_x = location_x;
	}
	public String getLocation_y() {
		return location_y;
	}
	public void setLocation_y(String location_y) {
		this.location_y = location_y;
	}
	public String getOrg_b_representative() {
		return org_b_representative;
	}
	public void setOrg_b_representative(String org_b_representative) {
		this.org_b_representative = org_b_representative;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public long getB_balance_before() {
		return b_balance_before;
	}
	public void setB_balance_before(long b_balance_before) {
		this.b_balance_before = b_balance_before;
	}
	public String getB_balance_after() {
		return b_balance_after;
	}
	public void setB_balance_after(String b_balance_after) {
		this.b_balance_after = b_balance_after;
	}
	public String getB_balance_rechrg() {
		return b_balance_rechrg;
	}
	public void setB_balance_rechrg(String b_balance_rechrg) {
		this.b_balance_rechrg = b_balance_rechrg;
	}
	public String getB_representative() {
		return b_representative;
	}
	public void setB_representative(String b_representative) {
		this.b_representative = b_representative;
	}
	public String getIp_addr() {
		return ip_addr;
	}
	public void setIp_addr(String ip_addr) {
		this.ip_addr = ip_addr;
	}
	public String getModule_id() {
		return module_id;
	}
	public void setModule_id(String module_id) {
		this.module_id = module_id;
	}
	public String getHttp_port() {
		return http_port;
	}
	public void setHttp_port(String http_port) {
		this.http_port = http_port;
	}
	public String getTcp_port() {
		return tcp_port;
	}
	public void setTcp_port(String tcp_port) {
		this.tcp_port = tcp_port;
	}
	public String getCs_heartbeat_period() {
		return cs_heartbeat_period;
	}
	public void setCs_heartbeat_period(String cs_heartbeat_period) {
		this.cs_heartbeat_period = cs_heartbeat_period;
	}
	public String getApp_heartbeat_period() {
		return app_heartbeat_period;
	}
	public void setApp_heartbeat_period(String app_heartbeat_period) {
		this.app_heartbeat_period = app_heartbeat_period;
	}
	public String getApp_polling_period() {
		return app_polling_period;
	}
	public void setApp_polling_period(String app_polling_period) {
		this.app_polling_period = app_polling_period;
	}
	public String getH_name() {
		return h_name;
	}
	public void setH_name(String h_name) {
		this.h_name = h_name;
	}
	public String getService_type() {
		return service_type;
	}
	public void setService_type(String service_type) {
		this.service_type = service_type;
	}
	public String getCharge_method() {
		return charge_method;
	}
	public void setCharge_method(String charge_method) {
		this.charge_method = charge_method;
	}
	public String getBasic_distance() {
		return basic_distance;
	}
	public void setBasic_distance(String basic_distance) {
		this.basic_distance = basic_distance;
	}
	public String getBasic_charge() {
		return basic_charge;
	}
	public void setBasic_charge(String basic_charge) {
		this.basic_charge = basic_charge;
	}
	public String getAdd_distance() {
		return add_distance;
	}
	public void setAdd_distance(String add_distance) {
		this.add_distance = add_distance;
	}
	public String getAdd_charge() {
		return add_charge;
	}
	public void setAdd_charge(String add_charge) {
		this.add_charge = add_charge;
	}
	public String getB_id() {
		return b_id;
	}
	public void setB_id(String b_id) {
		this.b_id = b_id;
	}
	public String getBid_flag() {
		return bid_flag;
	}
	public void setBid_flag(String bid_flag) {
		this.bid_flag = bid_flag;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String getB_address() {
		return b_address;
	}
	public void setB_address(String b_address) {
		this.b_address = b_address;
	}
	public String getB_crn() {
		return b_crn;
	}
	public void setB_crn(String b_crn) {
		this.b_crn = b_crn;
	}
	public String getB_tel1() {
		return b_tel1;
	}
	public void setB_tel1(String b_tel1) {
		this.b_tel1 = b_tel1;
	}
	public String getB_tel2() {
		return b_tel2;
	}
	public void setB_tel2(String b_tel2) {
		this.b_tel2 = b_tel2;
	}
	public String getLogin_id() {
		return login_id;
	}
	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}
	public String getLogin_passwd() {
		return login_passwd;
	}
	public void setLogin_passwd(String login_passwd) {
		this.login_passwd = login_passwd;
	}
	public String getActive_status() {
		return active_status;
	}
	public void setActive_status(String active_status) {
		this.active_status = active_status;
	}
	public String getBc_type() {
		return bc_type;
	}
	public void setBc_type(String bc_type) {
		this.bc_type = bc_type;
	}
	public String getWarning_amount() {
		return warning_amount;
	}
	public void setWarning_amount(String warning_amount) {
		this.warning_amount = warning_amount;
	}
	public String getSuspend_amount() {
		return suspend_amount;
	}
	public void setSuspend_amount(String suspend_amount) {
		this.suspend_amount = suspend_amount;
	}
	public String getMax_call() {
		return max_call;
	}
	public void setMax_call(String max_call) {
		this.max_call = max_call;
	}
	public String getCallcatch_penalty_value() {
		return callcatch_penalty_value;
	}
	public void setCallcatch_penalty_value(String callcatch_penalty_value) {
		this.callcatch_penalty_value = callcatch_penalty_value;
	}
	public String getRider_delay_set() {
		return rider_delay_set;
	}
	public void setRider_delay_set(String rider_delay_set) {
		this.rider_delay_set = rider_delay_set;
	}
	public String getRider_delay_duration() {
		return rider_delay_duration;
	}
	public void setRider_delay_duration(String rider_delay_duration) {
		this.rider_delay_duration = rider_delay_duration;
	}
	public String getAlarm_limit_duration() {
		return alarm_limit_duration;
	}
	public void setAlarm_limit_duration(String alarm_limit_duration) {
		this.alarm_limit_duration = alarm_limit_duration;
	}
	public String getBatch_extra_flag() {
		return batch_extra_flag;
	}
	public void setBatch_extra_flag(String batch_extra_flag) {
		this.batch_extra_flag = batch_extra_flag;
	}
	public String getBatch_extra_amount() {
		return batch_extra_amount;
	}
	public void setBatch_extra_amount(String batch_extra_amount) {
		this.batch_extra_amount = batch_extra_amount;
	}
	public String getOpen_time() {
		return open_time;
	}
	public void setOpen_time(String open_time) {
		this.open_time = open_time;
	}
	public String getClose_time() {
		return close_time;
	}
	public void setClose_time(String close_time) {
		this.close_time = close_time;
	}
	public String getV_bank() {
		return v_bank;
	}
	public void setV_bank(String v_bank) {
		this.v_bank = v_bank;
	}
	public String getV_account() {
		return v_account;
	}
	public void setV_account(String v_account) {
		this.v_account = v_account;
	}
	public String getCalculatepercall() {
		return calculatepercall;
	}
	public void setCalculatepercall(String calculatepercall) {
		this.calculatepercall = calculatepercall;
	}
	public String getV_name() {
		return v_name;
	}
	public void setV_name(String v_name) {
		this.v_name = v_name;
	}
	public String getContract_sdate() {
		return contract_sdate;
	}
	public void setContract_sdate(String contract_sdate) {
		this.contract_sdate = contract_sdate;
	}
	public String getContract_edate() {
		return contract_edate;
	}
	public void setContract_edate(String contract_edate) {
		this.contract_edate = contract_edate;
	}
	public String getInsert_date() {
		return insert_date;
	}
	public void setInsert_date(String insert_date) {
		this.insert_date = insert_date;
	}
	public String getService_start_date() {
		return service_start_date;
	}
	public void setService_start_date(String service_start_date) {
		this.service_start_date = service_start_date;
	}
	public String getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}
	public String getR_op_id() {
		return r_op_id;
	}
	public void setR_op_id(String r_op_id) {
		this.r_op_id = r_op_id;
	}
	public String getU_op_id() {
		return u_op_id;
	}
	public void setU_op_id(String u_op_id) {
		this.u_op_id = u_op_id;
	}
	public String getCalculate_date() {
		return calculate_date;
	}
	public void setCalculate_date(String calculate_date) {
		this.calculate_date = calculate_date;
	}
	public String getCalculate_period() {
		return calculate_period;
	}
	public void setCalculate_period(String calculate_period) {
		this.calculate_period = calculate_period;
	}
	public String getBank_id() {
		return bank_id;
	}
	public void setBank_id(String bank_id) {
		this.bank_id = bank_id;
	}
	public String getOrg_v_bank() {
		return org_v_bank;
	}
	public void setOrg_v_bank(String org_v_bank) {
		this.org_v_bank = org_v_bank;
	}
	public String getOrg_v_account() {
		return org_v_account;
	}
	public void setOrg_v_account(String org_v_account) {
		this.org_v_account = org_v_account;
	}
	public String getOrg_v_name() {
		return org_v_name;
	}
	public void setOrg_v_name(String org_v_name) {
		this.org_v_name = org_v_name;
	}
	public String getOrg_contract_sdate() {
		return org_contract_sdate;
	}
	public void setOrg_contract_sdate(String org_contract_sdate) {
		this.org_contract_sdate = org_contract_sdate;
	}
	public String getOrg_contract_edate() {
		return org_contract_edate;
	}
	public void setOrg_contract_edate(String org_contract_edate) {
		this.org_contract_edate = org_contract_edate;
	}
	public String getB_balance() {
		return b_balance;
	}
	public void setB_balance(String b_balance) {
		this.b_balance = b_balance;
	}
	public String getB_bank() {
		return b_bank;
	}
	public void setB_bank(String b_bank) {
		this.b_bank = b_bank;
	}
	public String getB_account() {
		return b_account;
	}
	public void setB_account(String b_account) {
		this.b_account = b_account;
	}
	public String getRidercard_flag() {
		return ridercard_flag;
	}
	public void setRidercard_flag(String ridercard_flag) {
		this.ridercard_flag = ridercard_flag;
	}
	
	
}