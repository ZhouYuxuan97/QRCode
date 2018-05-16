package com.two.service.impl;

import java.text.ParseException;
import java.sql.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.two.dao.BaseDao;
import com.two.dao.UserDao;
import com.two.po.User;
import com.two.service.UserService;
import com.two.util.MD5Util;
import com.two.util.SendEmail;
import com.two.util.ServiceException;

/**
 * 
 * @ClassName UserServiceImpl.java
 * @Description User的业务逻辑层实现
 * @Author 赵焜松
 * @Time 2017年7月21日 下午12:51:30
 *
 */

@Service("userService")
@Transactional
public class UserServiceImpl extends BaseServiceImpl<User, Integer> implements UserService{

	@Resource
	private UserDao userDao;
	
	//这步很关键，否则，该Service不能调用其父类的方法，即BaseServiceImpl
	@Resource(name="userDao")
	public void setDao(BaseDao<User, Integer> baseDao) {
		super.setDao(baseDao);
	}	

	@Override
	public User login(String username) {
		return userDao.login(username);
	}
	
	 /**
     * 处理注册
     */
    public void processregister(User user/*String email*/) {

        user.setRegisterTime(new Date(new java.util.Date().getTime()));
        user.setStatus(null);
        ///如果处于安全，可以将激活码处理的更复杂点
        //user.setValidateCode(MD5Tool.MD5Encrypt(email));
        String email = user.getEmail();
        user.setValidateCode(MD5Util.encode2hex(email));

        userDao.saveUser(user);//保存注册信息

        ///邮件的内容
        StringBuffer sb=new StringBuffer("点击下面链接激活账号，48小时生效，否则重新注册账号，链接只能使用一次，请尽快激活！</br>");
        sb.append("<a href=\"1l8u025289.iok.la:15465/qrcode/userControl/addUser?action=activate&email=");
        //sb.append("<a href=\"http://123.206.209.98:8080/qrcode/userControl/addUser?action=activate&email=");
        sb.append(email);
        sb.append("&validateCode=");
        sb.append(user.getValidateCode());
        sb.append("\">http://1l8u025289.iok.la:15465/qrcode/userControl/addUser?action=activate&email=");
        //sb.append("<a href=\"http://123.206.209.98:8080/qrcode/userControl/addUser?action=activate&email=");
        sb.append(email);
        sb.append("&validateCode=");
        sb.append(user.getValidateCode());
        sb.append("</a>");

        //发送邮件
        SendEmail.send(email, sb.toString());
        System.out.println("发送邮件");

    }

    /**
     * 处理激活
     */
    //传递激活码和email过来
    public void processActivate(String email , String validateCode)throws ServiceException, ParseException{ 
         //数据访问层，通过email获取用户信息
        User user=userDao.findUser(email);
        //验证用户是否存在
        if(user!=null) { 
            //验证用户激活状态 
            if(user.getStatus()==null) {
                ///没激活
                Date currentTime = new Date(new java.util.Date().getTime());//获取当前时间 
                //验证链接是否过期
                currentTime.before(user.getRegisterTime());
                if(currentTime.before(user.getLastActivateTime())) { 
                    //验证激活码是否正确 
                    if(validateCode.equals(user.getValidateCode())) { 
                        //激活成功， //并更新用户的激活状态，为已激活
                        System.out.println("==sq==="+user.getStatus());
                        user.setStatus("1");//把状态改为激活
                        System.out.println("==sh==="+user.getStatus());
                        userDao.updateUser(user);
                    } else { 
                       throw new ServiceException("激活码不正确"); 
                    } 
                } else { throw new ServiceException("激活码已过期！"); 
                } 
            } else {
               throw new ServiceException("邮箱已激活，请登录！"); 
            } 
        } else {
            throw new ServiceException("该邮箱未注册（邮箱地址不存在）！"); 
        } 

    } 

}
