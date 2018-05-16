package com.two.dao.impl;


import java.text.ParseException;

import org.hibernate.Query;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

import com.two.dao.UserDao;
import com.two.po.User;

/**
 * 
 * @ClassName UserDaoImpl.java
 * @Description User的Dao层实现
 * @Author 赵焜松
 * @Time 2017年7月21日 下午12:51:08
 *
 */

@Repository("userDao")
@Lazy(true)
public class UserDaoImpl extends BaseDaoImpl<User,Integer> implements UserDao{

	@Override
	public User login(String username) {
		String hql = "from User where username = ?";
		Query query = this.getSession().createQuery(hql);
		query.setString(0,username);
		return (User)query.uniqueResult();
	}
	
	// public HashMap<String, String> map=new HashMap<String, String>();
	//保存
	public void saveUser(User user){
		
	        System.out.println("------------------------------");
	        this.save(user);
	        System.out.println("=======s========="+user.getStatus());
	        
	        /*    map.put("id", String.valueOf(user.getId()));
	        map.put("email", user.getEmail());
	        map.put("validateCode", user.getValidateCode());
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
	        String time = sdf.format(user.getRegisterTime());
	        map.put("registerTime", time);
	        String status = user.getStatus();
	        map.put("status", status);
	        map.put("name", user.getUsername());
	        String t2=sdf.format(user.getLastActivateTime());
	        map.put("activeLastTime", String.valueOf(t2));*/

	    }

	//更新状态
	public void updateUser(User user){
	    
		this.update(user);
	    System.out.println("=======st========="+user.getStatus());
	    
	    //map.put("email", user.getEmail());
        //map.put("validateCode", user.getValidateCode());
        //Date time=user.getRegisterTime();
        //map.put("registerTime", String.valueOf(time));
        //String status=user.getStatus();
        //map.put("status", status);
	}

	//根据email查找信息
	public User findUser(String email) throws ParseException{
	       
		String hql = "from User where email = ?";
		Query query = this.getSession().createQuery(hql);
		query.setString(0, email);
		return (User)query.uniqueResult();
		
		
		 /*User user=new User();
        user.setEmail(map.get("email"));
        user.setUsername(map.get("name"));
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddhhmmss");
        Date day=sdf.parse(map.get("registerTime"));
        user.setRegisterTime(day);
        user.setStatus(map.get("status"));
        user.setValidateCode(map.get("validateCode"));*/
	}
	    
}
