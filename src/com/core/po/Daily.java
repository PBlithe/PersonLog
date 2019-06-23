package com.core.po;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
/**
 * 用户持久化类
 */
public class Daily implements Serializable{
	private static final long serialVersionUID = 1L;
	//用来表明类的不同版本间的兼容性，说白了：就是来比较版本用的，为了不让程序报出版本不一致错误
	/*	序列化时为了保持版本的兼容性，即在版本升级时反序列化仍保持对象的唯一性。
	有两种生成方式：
	一个是默认的1L，比如：private static final long serialVersionUID = 1L;
	一个是根据类名、接口名、成员方法及属性等来生成一个64位的哈希字段，比如：
	private static final long serialVersionUID = xxxxL;*/
	
	private Integer daily_id;      //用户id 
	private String daily_details;     //用户账号
	private String daily_author;     //用户名称
	private Date daily_createtime; //用户密码
	private Integer user_id;
	private String daily_picture;//用户头像
	private String privacy;
	private List<Comment> comments;
	
	public Integer getDaily_id() {
		return daily_id;
	}
	public void setDaily_id(Integer daily_id) {
		this.daily_id = daily_id;
	}
	public String getDaily_details() {
		return daily_details;
	}
	public void setDaily_details(String daily_details) {
		this.daily_details = daily_details;
	}
	public String getDaily_author() {
		return daily_author;
	}
	public void setDaily_author(String daily_author) {
		this.daily_author = daily_author;
	}
	public Date getDaily_createtime() {
		return daily_createtime;
	}
	public void setDaily_createtime(Date daily_createtime) {
		this.daily_createtime = daily_createtime;
	}
	
	public String getDaily_picture() {
	    return daily_picture;
	}
	public void setDaily_picture(String daily_picture) {
	    this.daily_picture = daily_picture;
	}
	public Integer getUser_id() {
	    return user_id;
	}
	public void setUser_id(Integer user_id) {
	    this.user_id = user_id;
	}
	public String getPrivacy() {
	    return privacy;
	}
	public void setPrivacy(String privacy) {
	    this.privacy = privacy;
	}
	public List<Comment> getComments() {
	    return comments;
	}
	public void setComments(List<Comment> comments) {
	    this.comments = comments;
	}
}
