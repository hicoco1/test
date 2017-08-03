package com.mrs.Vo;

import org.springframework.context.annotation.Primary;

public class BranchOffice_StoreVO extends PagingVO
{
	private String b_id;
	private String s_name;
	private String s_id;
	private String s_crn;
	private String s_addr1;
	private String s_addr2;
	private String location_x;
	private String location_y;
	private String s_tel1;
	private String s_tel2;
	private String login_id;
	private String login_passwd;
	private String active_status;
	private String cook_time;
	private String terminal_type;
	private String cid_id;
	private String cid_connect_status;
	private String cid_port;
	private String printer_id;
	private String printer_connect_status;
	private String printer_port;
	private String monthly_fee;
	private String basic_distance;
	private String basic_charge;
	private String add_distance;
	private String add_charge;
	private String service_type;
	private String charge_method;
	private String s_balance;
	private String rider_delay_duration;
	private String batch_extra_amount;
	private String last_recharge_amount;
	private String last_recharge_date;
	private String charge_type;
	private String charge_option;
	private String credit_used_flag;
	private String credit_member_id;
	private String noti_flag;
	private String noti_rider_assign;
	private String noti_card_pay;
	private String open_time;
	private String close_time;
	private String monthly_order_count;
	private String daily_order_count;
	private String cat_id;
	private String van_id;
	private String v_bank;
	private String v_account;
	private String v_name;
	private String contract_sdate;
	private String contract_edate;
	private String insert_date;
	private String service_start_date;
	private String update_date;
	private String r_op_id;
	private String u_op_id;
	private String store_statement;
	private String kitchen_statement;
	private String customer_statement;
	private String connect_status;
	private String bank_id;
	private String org_v_bank;
	private String org_v_account;
	private String org_v_name;
	private String org_contract_sdate;
	private String org_contract_edate;
	private int s_sequence;
	private String b_name;
	private String s_representative;
	private String org_s_representative;
	private String store_type;
	private String s_addr_building;
	private String s_addr_num;
	private String s_addr_appendix;
	
	public String getDaily_order_count() {
		return daily_order_count;
	}
	public void setDaily_order_count(String daily_order_count) {
		this.daily_order_count = daily_order_count;
	}
	public String getS_addr_building() {
		return s_addr_building;
	}
	public void setS_addr_building(String s_addr_building) {
		this.s_addr_building = s_addr_building;
	}
	public String getS_addr_num() {
		return s_addr_num;
	}
	public void setS_addr_num(String s_addr_num) {
		this.s_addr_num = s_addr_num;
	}
	public String getS_addr_appendix() {
		return s_addr_appendix;
	}
	public void setS_addr_appendix(String s_addr_appendix) {
		this.s_addr_appendix = s_addr_appendix;
	}
	public String getStore_type() {
		return store_type;
	}
	public void setStore_type(String store_type) {
		this.store_type = store_type;
	}
	public String getOrg_s_representative() {
		return org_s_representative;
	}
	public void setOrg_s_representative(String org_s_representative) {
		this.org_s_representative = org_s_representative;
	}
	public String getS_representative() {
		return s_representative;
	}
	public void setS_representative(String s_representative) {
		this.s_representative = s_representative;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public int getS_sequence() {
		return s_sequence;
	}
	public void setS_sequence(int s_sequence) {
		this.s_sequence = s_sequence;
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
	public String getB_id() {
		return b_id;
	}
	public void setB_id(String b_id) {
		this.b_id = b_id;
	}
	public String getS_id() {
		return s_id;
	}
	public void setS_id(String s_id) {
		this.s_id = s_id;
	}
	public String getS_crn() {
		return s_crn;
	}
	public void setS_crn(String s_crn) {
		this.s_crn = s_crn;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_addr1() {
		return s_addr1;
	}
	public void setS_addr1(String s_addr1) {
		this.s_addr1 = s_addr1;
	}
	public String getS_addr2() {
		return s_addr2;
	}
	public void setS_addr2(String s_addr2) {
		this.s_addr2 = s_addr2;
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
	public String getS_tel1() {
		return s_tel1;
	}
	public void setS_tel1(String s_tel1) {
		this.s_tel1 = s_tel1;
	}
	public String getS_tel2() {
		return s_tel2;
	}
	public void setS_tel2(String s_tel2) {
		this.s_tel2 = s_tel2;
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
	public String getCook_time() {
		return cook_time;
	}
	public void setCook_time(String cook_time) {
		this.cook_time = cook_time;
	}
	public String getTerminal_type() {
		return terminal_type;
	}
	public void setTerminal_type(String terminal_type) {
		this.terminal_type = terminal_type;
	}
	public String getCid_id() {
		return cid_id;
	}
	public void setCid_id(String cid_id) {
		this.cid_id = cid_id;
	}
	public String getCid_connect_status() {
		return cid_connect_status;
	}
	public void setCid_connect_status(String cid_connect_status) {
		this.cid_connect_status = cid_connect_status;
	}
	public String getCid_port() {
		return cid_port;
	}
	public void setCid_port(String cid_port) {
		this.cid_port = cid_port;
	}
	public String getPrinter_id() {
		return printer_id;
	}
	public void setPrinter_id(String printer_id) {
		this.printer_id = printer_id;
	}
	public String getPrinter_connect_status() {
		return printer_connect_status;
	}
	public void setPrinter_connect_status(String printer_connect_status) {
		this.printer_connect_status = printer_connect_status;
	}
	public String getPrinter_port() {
		return printer_port;
	}
	public void setPrinter_port(String printer_port) {
		this.printer_port = printer_port;
	}
	public String getMonthly_fee() {
		return monthly_fee;
	}
	public void setMonthly_fee(String monthly_fee) {
		this.monthly_fee = monthly_fee;
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
	public String getS_balance() {
		return s_balance;
	}
	public void setS_balance(String s_balance) {
		this.s_balance = s_balance;
	}
	public String getRider_delay_duration() {
		return rider_delay_duration;
	}
	public void setRider_delay_duration(String rider_delay_duration) {
		this.rider_delay_duration = rider_delay_duration;
	}
	public String getBatch_extra_amount() {
		return batch_extra_amount;
	}
	public void setBatch_extra_amount(String batch_extra_amount) {
		this.batch_extra_amount = batch_extra_amount;
	}
	public String getLast_recharge_amount() {
		return last_recharge_amount;
	}
	public void setLast_recharge_amount(String last_recharge_amount) {
		this.last_recharge_amount = last_recharge_amount;
	}
	public String getLast_recharge_date() {
		return last_recharge_date;
	}
	public void setLast_recharge_date(String last_recharge_date) {
		this.last_recharge_date = last_recharge_date;
	}
	public String getCharge_type() {
		return charge_type;
	}
	public void setCharge_type(String charge_type) {
		this.charge_type = charge_type;
	}
	public String getCharge_option() {
		return charge_option;
	}
	public void setCharge_option(String charge_option) {
		this.charge_option = charge_option;
	}
	public String getCredit_used_flag() {
		return credit_used_flag;
	}
	public void setCredit_used_flag(String credit_used_flag) {
		this.credit_used_flag = credit_used_flag;
	}
	public String getCredit_member_id() {
		return credit_member_id;
	}
	public void setCredit_member_id(String credit_member_id) {
		this.credit_member_id = credit_member_id;
	}
	public String getNoti_flag() {
		return noti_flag;
	}
	public void setNoti_flag(String noti_flag) {
		this.noti_flag = noti_flag;
	}
	public String getNoti_rider_assign() {
		return noti_rider_assign;
	}
	public void setNoti_rider_assign(String noti_rider_assign) {
		this.noti_rider_assign = noti_rider_assign;
	}
	public String getNoti_card_pay() {
		return noti_card_pay;
	}
	public void setNoti_card_pay(String noti_card_pay) {
		this.noti_card_pay = noti_card_pay;
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
	public String getMonthly_order_count() {
		return monthly_order_count;
	}
	public void setMonthly_order_count(String monthly_order_count) {
		this.monthly_order_count = monthly_order_count;
	}
	public String getCat_id() {
		return cat_id;
	}
	public void setCat_id(String cat_id) {
		this.cat_id = cat_id;
	}
	public String getVan_id() {
		return van_id;
	}
	public void setVan_id(String van_id) {
		this.van_id = van_id;
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
	public String getStore_statement() {
		return store_statement;
	}
	public void setStore_statement(String store_statement) {
		this.store_statement = store_statement;
	}
	public String getKitchen_statement() {
		return kitchen_statement;
	}
	public void setKitchen_statement(String kitchen_statement) {
		this.kitchen_statement = kitchen_statement;
	}
	public String getCustomer_statement() {
		return customer_statement;
	}
	public void setCustomer_statement(String customer_statement) {
		this.customer_statement = customer_statement;
	}
	public String getConnect_status() {
		return connect_status;
	}
	public void setConnect_status(String connect_status) {
		this.connect_status = connect_status;
	}
	public String getBank_id() {
		return bank_id;
	}
	public void setBank_id(String bank_id) {
		this.bank_id = bank_id;
	}
	
	
}