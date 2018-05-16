package com.two.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.two.po.User;
import com.two.service.UserService;
import com.two.util.ServiceException;


/**
 * 
 * @ClassName UserController.java
 * @Description User的Controller层
 * @Author 赵焜松
 * @Time 2017年7月21日 下午1:16:52
 *
 */

@Controller
@RequestMapping(value = "/userControl")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	/**
	 * 
	 * @Title: register
	 * @Author: 赵焜松
	 * @Description: 转到注册页面
	 * @return String
	 *
	 */
	@RequestMapping(value = "/register")
	public String register() {
		return "user/registerEmailValidae";
	}
	
	/**
	 * 
	 * @Title: load
	 * @Author: 赵焜松
	 * @Description: 注册 --缺少对于username,password,emai的唯一性的判断
	 * @param request
	 * @param response
	 * @param user
	 * @return
	 * @throws ParseException
	 * @throws ServiceException ModelAndView
	 *
	 */
	@RequestMapping(value="/addUser",method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView load(HttpServletRequest request,HttpServletResponse response,User user) throws ParseException, ServiceException{
        String action = request.getParameter("action");
        System.out.println("-----r----"+action);
        ModelAndView mav=new ModelAndView();

        if("register".equals(action)) {
            //注册
            //String email = request.getParameter("email");
            userService.processregister(user);//发邮箱激活
            mav.addObject("text","注册成功");
            mav.setViewName("transform/to_activation");
        }
        else if("activate".equals(action)) {
            //激活
            String email = request.getParameter("email");//获取email
            String validateCode = request.getParameter("validateCode");//激活码

            userService.processActivate(email , validateCode);//调用激活方法
			mav.setViewName("user/activate_success");

        }
        return mav;
    }
 
	/**
	 * 
	 * @Title: jumpToLogin
	 * @Author: 赵焜松
	 * @Description: 转到登录页面
	 * @param request
	 * @return String
	 *
	 */
	@RequestMapping(value = "/jumpToLogin")
	public String jumpToLogin(HttpServletRequest request) {
		
		if(request.getSession().getAttribute("currentUser") != null)
				return "transform/after_login_main";  //当前已经登录，则跳到后台页面
		return "user/login";
	}
	
	/**
	 * 
	 * @Title: login
	 * @Author: 赵焜松
	 * @Description: 登录
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException String
	 *
	 */
	@RequestMapping(value = "/login", produces = { "application/json;charset=utf-8" })
	@ResponseBody
	public String login(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Gson gson = new Gson();
		//System.out.println(username+"---------------"+password);
		User user = userService.login(username);

		if(user==null || !(user.getPassword().equals(password))) {
			return gson.toJson("error");
		}			
		
		if(user.getStatus() == null)
			return gson.toJson("noactivate");
		
		request.getSession().setAttribute("currentUser", user); //当前登录的用户放入session中
		//response.getWriter().print(result);
		return gson.toJson("1");
	}
	
	/**
	 * 
	 * @Title: jumpToCenter
	 * @Author: 赵焜松
	 * @Description: 跳转到个人中心页面
	 * @return String
	 *
	 */
	@RequestMapping(value = "/jumpToCenter")
	public String jumpToCenter() {
		return "transform/after_login_main";
	}
	
	/**
	 * 
	 * @Title: logoff
	 * @Author: 赵焜松
	 * @Description: 退出登录
	 * @return String
	 *
	 */
	@RequestMapping(value = "/logoff")
	public String logoff(HttpServletRequest request) {
		
		HttpSession session = request.getSession(false);
		
		if(session == null)
			return "transform/main";
		
		session.removeAttribute("currentUser");
		return "transform/main";
	}
}
