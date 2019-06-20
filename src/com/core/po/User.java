package com.core.po;
import java.io.Serializable;
/**
 * 用户持久化类
 */
public class User implements Serializable{
	private static final long serialVersionUID = 1L;
	//用来表明类的不同版本间的兼容性，说白了：就是来比较版本用的，为了不让程序报出版本不一致错误
	/*	序列化时为了保持版本的兼容性，即在版本升级时反序列化仍保持对象的唯一性。
	有两种生成方式：
	一个是默认的1L，比如：private static final long serialVersionUID = 1L;
	一个是根据类名、接口名、成员方法及属性等来生成一个64位的哈希字段，比如：
	private static final long serialVersionUID = xxxxL;*/
	
	private Integer user_id;      //用户id 
	private String user_code;     //用户账号
	private String user_name;     //用户名称
	private String user_password; //用户密码
	private String daily_picture;//用户头像
	

	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public String getUser_code() {
		return user_code;
	}
	public void setUser_code(String user_code) {
		this.user_code = user_code;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getDaily_picture() {
	    return daily_picture;
	}
	public void setDaily_picture(String daily_picture) {
	    this.daily_picture = daily_picture;
	}
}
