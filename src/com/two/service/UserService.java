package com.two.service;

import java.text.ParseException;

import com.two.po.User;
import com.two.util.ServiceException;

/**
 * 
 * @ClassName UserService.java
 * @Description 登录注册Service接口
 * @Author 赵焜松
 * @Time 2017年7月21日 下午12:37:49
 *
 */
public interface UserService extends BaseService<User, Integer>{
	
	/**
	 * 
	 * @Title: login
	 * @Author: 赵焜松
	 * @Description: 登录
	 * @param username
	 * @return User
	 *
	 */
	public User login(String username);
	/**
	 * 
	 * @Title: processregister
	 * @Author: 赵焜松
	 * @Description: 处理注册
	 * @param email void
	 *
	 */
	 public void processregister(User user/*String email*/);
	 /**
	  * 
	  * @Title: processActivate
	  * @Author: 赵焜松
	  * @Description: 处理激活
	  * @param email
	  * @param validateCode
	  * @throws ServiceException
	  * @throws ParseException void
	  *
	  */
	 public void processActivate(String email , String validateCode)throws ServiceException, ParseException;
}
