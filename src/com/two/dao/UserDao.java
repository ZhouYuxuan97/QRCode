package com.two.dao;

import java.text.ParseException;

import com.two.po.User;


/**
 * 
 * @ClassName UserDao.java
 * @Description 登录注册Dao接口
 * @Author 赵焜松
 * @Time 2017年7月21日 下午12:28:06
 *
 */
public interface UserDao extends BaseDao<User, Integer>{
		
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
	 * @Title: saveUser
	 * @Author: 赵焜松
	 * @Description: 保存注册信息
     * id;
     * username;
     * password;
     * email;//注册账号
     * status;//激活状态
     * validateCode;//激活码
     * registerTime;//注册时间
	 * @param user void
	 *
	 */
	public void saveUser(User user);
	
	/**
	 * 
	 * @Title: updateUser
	 * @Author: 赵焜松
	 * @Description: 更新状态
	 * @param user void
	 *
	 */
    public void updateUser(User user);
    
    /**
     * 
     * @Title: findUser
     * @Author: 赵焜松
     * @Description: 根据email查询
     * @param email
     * @return
     * @throws ParseException User
     *
     */
    public User findUser(String email) throws ParseException;
}
