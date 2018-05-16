package com.two.po;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Entity;

@Entity
@Table(name="transform",catalog="qrcode")
public class Transform implements java.io.Serializable{
	
	private Integer id;
	private String type;
	private String detail;
	private Integer userid;
	private String uuid;
	
	@Id
	@GeneratedValue
	@Column(name="id",unique=true,nullable=false)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name="type")
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	@Column(name="detail")
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	@Column(name = "userid")
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	
	@Column(name = "uuid")
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	
	public Transform() {
		
	}
		
	public Transform(Integer id, String type, String detail, Integer userid,
			String uuid) {
		super();
		this.id = id;
		this.type = type;
		this.detail = detail;
		this.userid = userid;
		this.uuid = uuid;
	}
	
	@Override
	public String toString() {
		return "Transform [id=" + id + ", type=" + type + ", detail=" + detail
				+ ", userid=" + userid + ", uuid=" + uuid + "]";
	}
	
}
