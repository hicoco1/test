
import java.security.NoSuchAlgorithmException;
import java.util.Properties;

import javax.annotation.Resource;

import com.insford.ssh.SshClientModule;

public class test {
	public static String ssh() {

		// 프로퍼티 객체 주입
		/*
		@Resource(name = "mrs_prop")
		private Properties mrs_prop; // vxml_url
		String ip =  mrs_prop.getProperty("shell.ipaddr");
		String id =  mrs_prop.getProperty("shell.id");
		String pwd =  mrs_prop.getProperty("shell.pwd");
		
		SshClientModule client = new SshClientModule(ip, id, pwd);
		*/
		SshClientModule client = new SshClientModule("192.168.10.44", "tb_eif", "!alfoths123");
        client.setPort(22);    //수정된부분
        client.connect();
        StringBuffer shell = new StringBuffer("cd /home/ADSP_EIF/APP/BIN \n");
        shell.append("sh cifp_start.sh \n");
        client.executeShell(shell.toString());
      
        client.disconnect();
        
        return shell.toString();
   }
	
   public static void main(String[] args) {
      System.out.println( ssh());
   }
   
}