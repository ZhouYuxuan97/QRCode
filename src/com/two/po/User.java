package com.two.po;

import java.util.Calendar;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;



@Entity
@Table(name="user", catalog="qrcode")
public class User implements java.io.Serializable{
	
	 private Integer id;
	 private String username;
	 private String password;
	 private String email;//注册账号
	 private String status;//激活状态
	 private String validateCode;//激活码
	 private Date registerTime;//注册时间
	 private String phone;
	// private Date lastActivateTime; //上一次激活的时间
	 
	 @Id
	 @GeneratedValue
	 @Column(name="id",unique=true,nullable=false)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name="username")
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	@Column(name="password")
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Column(name="email")
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Column(name="status" ,length=2)
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Column(name="validateCode")
	public String getValidateCode() {
		return validateCode;
	}
	public void setValidateCode(String validateCode) {
		this.validateCode = validateCode;
	}
	
	@Column(name="registerTime")
	public Date getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}
	
	@Column(name="phone")
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public User() {
		
	}
	
	public User(Integer id, String username, String password, String email,
			String status, String validateCode, Date registerTime, String phone) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.email = email;
		this.status = status;
		this.validateCode = validateCode;
		this.registerTime = registerTime;
		this.phone = phone;
	}
	
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password="
				+ password + ", email=" + email + ", status=" + status
				+ ", validateCode=" + validateCode + ", registerTime="
				+ registerTime + ", phone=" + phone + "]";
	}
	
	
	@Transient
    public java.util.Date getLastActivateTime() {
        Calendar cl = Calendar.getInstance();
        cl.setTime(registerTime);
        cl.add(Calendar.DATE , 2);

        return cl.getTime();
    } 
}
