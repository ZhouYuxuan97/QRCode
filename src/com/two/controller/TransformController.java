package com.two.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.google.gson.Gson;
import com.two.po.Transform;
import com.two.po.User;
import com.two.service.TransformService;
import com.two.util.QRCodeEncoderHandler;

/**
 * 
 * @ClassName TransformController.java
 * @Description 二维码转换的Controller层
 * @Author 赵焜松
 * @Time 2017年7月22日 上午10:29:29
 * 
 */

@Controller
@RequestMapping(value = "/transformControl")
public class TransformController {
	
	@Autowired 
	private TransformService transformService;
	
	/**
	 * 
	 * @Title: getURLQRCode
	 * @Author: 赵焜松
	 * @Description: 产生URL的二维码
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 * @throws IOException String
	 *
	 */
	@RequestMapping(value = "/getURLQRCode", produces = { "application/json;charset=utf-8" })
	@ResponseBody
	public String getURLQRCode(HttpServletRequest request,
			HttpServletResponse response,HttpSession session) throws IOException {

		Gson gson = new Gson();
		//获取要跳转到的页面
		String url = request.getParameter("toUrl");	
		System.out.println(url+"***************");
		
		if("http://".equals(url))
			return gson.toJson("0");
		//获取当前登录的用户
		User currentUser = (User) request.getSession().getAttribute("currentUser");
		
		//存入数据库
		Transform transform = new Transform();
		String id = UUID.randomUUID().toString(); //生成唯一的UUID值

		System.out.println(request.getSession().getAttribute("myuuid"));
		if(currentUser != null)
			transform.setUserid(currentUser.getId());
		
		transform.setType("url");   
		transform.setDetail(url);
		transform.setUuid(id);
		transformService.saveData(transform);		
		
		// 生成二维码
		QRCodeEncoderHandler encoderHandler = new QRCodeEncoderHandler();
		String content = "1l8u025289.iok.la:15465/qrcode/transformControl/jumpToTransform.action?id="+id;
		//String content = "http://123.206.209.98:8080/qrcode/transformControl/jumpToTransform.action?id="+id;
		encoderHandler.encoderQRCoder(content, request, response);
		System.out.println("URL二维码转换完成");
		
		return gson.toJson(id);
	}
	
	/**
	 * 
	 * @Title: getFileQRCode
	 * @Author: 赵焜松
	 * @Description: 产生文件的二维码
	 * @param uploadFile
	 * @param request
	 * @param response
	 * @return String
	 *
	 */
	@RequestMapping(value = "/getFileQRCode", produces = { "application/json;charset=utf-8" })
	@ResponseBody
	public String getFileQRCode(@RequestParam(value="uploadFile",required=false) CommonsMultipartFile uploadFile, 
			HttpServletRequest request,
			HttpServletResponse response) {
		
		Gson gson = new Gson();
		if(uploadFile==null) 
			gson.toJson("0");
		 //文件保存路径
		String path = request.getServletContext().getRealPath("/") + "/files/upload/"; 
		//文件名字 
		String fileName = new Date().getTime() + uploadFile.getOriginalFilename();  //需要优化
		String realPath = path + fileName;
		
		//保存文件 
	    File file = new File(realPath); 
	    try {
			uploadFile.transferTo(file);
		} catch (IllegalStateException e) {
			e.printStackTrace();
			request.setAttribute("message", "格式异常");
			return null;				
		} catch (IOException e) {
			e.printStackTrace();
			request.setAttribute("message", "IO异常");
			return null;
		}
		
	    //存入数据库
		Transform transform = new Transform();
		User currentUser = (User) request.getSession().getAttribute("currentUser");
		if(currentUser != null)
			transform.setUserid(currentUser.getId());
		String id = UUID.randomUUID().toString();
		transform.setUuid(id);
		transform.setType("file");   
		transform.setDetail(fileName);
		transformService.saveData(transform);
		
		//产生二维码
		QRCodeEncoderHandler encoderHandler = new QRCodeEncoderHandler();
		String content = "1l8u025289.iok.la:15465/qrcode/transformControl/jumpToTransform.action?id="+id;
		//String content = "http://123.206.209.98:8080/qrcode/transformControl/jumpToTransform.action?id="+id;
		encoderHandler.encoderQRCoder(content, request, response);
		System.out.println("生成文件二维码成功");
		
		return gson.toJson(id);
	}

	
	/**
	 * 
	 * @Title: Transform
	 * @Author: 赵焜松
	 * @Description: 二维码解析跳转
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException String
	 *
	 */
	@RequestMapping(value = "/jumpToTransform")
	public String Transform(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		//二维码路径
		String uuid = (String) request.getParameter("id");
		System.out.println("id = " + uuid);

		//在数据库中查询详细信息		
		Transform transform = transformService.findByUUID(uuid);
		String type = transform.getType();
		System.out.println("type = " + type);
		String detail = transform.getDetail();
		System.out.println("url == type ? " + "url".equals(type));
		System.out.println("file == type ? " + "file".equals(type));
		//如果是url
		if("url".equals(type))
		{
			return "redirect:http://" + detail ;
		}
		//如果是文件
		else if("file".equals(type))
		{
			return "redirect:download.action?fileName=" + detail;			
		}
		else
		{
			System.out.println("错误了=============");
			//错误页面
			return "transform/error";
		}
	}

	/**
	 * 
	 * @Title: download
	 * @Author: 赵焜松
	 * @Description: 文件下载
	 * @param fileName
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException String
	 *
	 */
	@RequestMapping(value = "/download")
	public String download(@RequestParam(value="fileName",required=false) String fileName, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		System.out.println(fileName);
		if (fileName != null) {
			System.out.println("***************文件名字不为空************");
			String realPath = request.getServletContext().getRealPath("/") + "/files/";
			//下载文件
			if(fileName.indexOf(".")!=-1) {
				realPath = realPath + "upload/";				
			}				
			//下载二维码
			else {
				realPath = realPath + "QRCode/";
				fileName = fileName + ".jpg";
				System.out.println(fileName);
			}		
			File file= new File(realPath, fileName);
			System.out.println(file);
            if (file.exists()) {
            	System.out.println("有这个文件");
                response.setContentType("application/force-download");// 设置强制下载不打开
                response.addHeader("Content-Disposition",
                        "attachment;fileName=" + fileName);// 设置文件名
                byte[] buffer = new byte[1024];
                FileInputStream fis = null;
                BufferedInputStream bis = null;
                OutputStream os = null;
                try {
                    fis = new FileInputStream(file);
                    bis = new BufferedInputStream(fis);
                    os = response.getOutputStream();
                    int i = bis.read(buffer);
                    while (i != -1) {
                        os.write(buffer, 0, i);
                        i = bis.read(buffer);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (bis != null) {
                        try {
                            bis.close();
                        } catch (IOException e) {                            
                            e.printStackTrace();
                        }
                    }
                    if (fis != null) {
                        try {
                            fis.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                    if (os != null) {
                        try {
                            os.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        }
        return null;
	}

	/**
	 * 
	 * @Title: jumpToMain
	 * @Author: 赵焜松
	 * @Description: 跳转到主页面
	 * @return String
	 *
	 */
	@RequestMapping(value = "/jumpToMain")
	public String jumpToMain() {
		return "transform/main";
	}
	
	/**
	 * 
	 * @Title: getFileList
	 * @Author: 赵焜松
	 * @Description: 获取文件二维码列表
	 * @param request
	 * @param response
	 * @return String
	 *
	 */
	@RequestMapping(value = "/getFileList")
	public String getFileList(HttpServletRequest request, HttpServletResponse response) {
		//获取当前用户
		User currentUser = (User) request.getSession().getAttribute("currentUser");
		if(currentUser == null)
				return "user/fail_login";   //登录页面
		
		List<Transform> list = transformService.findByUserid(currentUser.getId());
		//List<Transform> list = transformService.findByUserid(9);
		List<Transform> filelist = new ArrayList<Transform>();
		//拿到文件类型的信息
		for(Transform transform : list) {
			if("file".equals(transform.getType())) {
				filelist.add(transform);
			}
		}
		request.setAttribute("filelist", filelist);
		
		return "/transform/file_recode";
	}
	
	/**
	 * 
	 * @Title: getURLList
	 * @Author: 赵焜松
	 * @Description: 获取URL二维码列表
	 * @param request
	 * @param response
	 * @return String
	 *
	 */
	@RequestMapping(value = "/getURLList")
	public String getURLList(HttpServletRequest request, HttpServletResponse response) {
		//获取当前用户
		User currentUser = (User) request.getSession().getAttribute("currentUser");
		if(currentUser == null)
				return "user/fail_login";   //登录超时
		
		List<Transform> list = transformService.findByUserid(currentUser.getId());
		//List<Transform> list = transformService.findByUserid(9);
		List<Transform> urllist = new ArrayList<Transform>();
		//拿到文件类型的信息
		for(Transform transform : list) {
			if("url".equals(transform.getType())) {
				urllist.add(transform);
			}
		}
		request.setAttribute("urllist", urllist);
		
		return "/transform/web_recode";
	}
	
	/**
	 * 
	 * @Title: edit
	 * @Author: 赵焜松
	 * @Description: 编辑二维码里面的信息
	 * @param id
	 * @param type
	 * @param request
	 * @param response
	 * @return String
	 *
	 */
	@RequestMapping(value = "/edit")
	public String edit(@RequestParam(value="id",required=false) String id,
			@RequestParam(value="type",required=false)String type,
			HttpServletRequest request, HttpServletResponse response) {
		Transform transform = transformService.get(Integer.parseInt(id));
		request.setAttribute("transform", transform);
		
		if("file".equals(type))
			return "transform/edit_file_recode";
		else if("url".equals(type))
			return "transform/edit_web_recode";
		else
			return "transform/error";
	}
	
	/**
	 * 
	 * @Title: saveURLEdit
	 * @Author: 赵焜松
	 * @Description: 保存URL二维码信息的修改
	 * @param request
	 * @param response
	 * @return String
	 *
	 */
	@RequestMapping(value = "/saveURLEdit")
	@ResponseBody
	public String saveURLEdit(HttpServletRequest request, HttpServletResponse response) {
		
		Gson gson = new Gson();
		
		String uuid = request.getParameter("uuid");
		if("".equals(uuid))
			return gson.toJson("error");
		
		String detail = request.getParameter("detail");   //新路径
		Transform transform = transformService.findByUUID(uuid);
		
		//保存到数据库
		transform.setDetail(detail);
		transformService.update(transform);
		
		return gson.toJson("success");
	}
	
	/**
	 * 
	 * @Title: saveFileEdit
	 * @Author: 赵焜松
	 * @Description: 保存文件二维码信息的修改
	 * @param request
	 * @param response
	 * @param uploadFile
	 * @return String
	 *
	 */
	@RequestMapping(value = "/saveFileEdit")
	@ResponseBody
	public String saveFileEdit(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="uploadFile",required=false) CommonsMultipartFile uploadFile) {
		
		Gson gson = new Gson();
		String rootPath = request.getServletContext().getRealPath("/") + "/files/upload/";
		
		String uuid = request.getParameter("uuid");
		if("".equals(uuid))
			return gson.toJson("error");
		
		Transform transform = transformService.findByUUID(uuid);
		String oldDetail = transform.getDetail();   //原来的文件	
		
		//删除旧文件
		File oldFile = new File(rootPath+oldDetail);
		if(oldFile.exists() && oldFile.isFile())
			oldFile.delete();
		
		String newDetail = new Date().getTime() + uploadFile.getOriginalFilename(); //新的文件	
		//保存新文件
	    File newFile = new File(rootPath+newDetail); 
	    try {
			uploadFile.transferTo(newFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
			return gson.toJson("error");				
		} catch (IOException e) {
			e.printStackTrace();
			return gson.toJson("error");
		}
		
		//保存到数据库
		transform.setDetail(newDetail);
		transformService.update(transform);
		
		return gson.toJson("success");		
	}
	
	/**
	 * 
	 * @Title: deleteQRCode
	 * @Author: 赵焜松
	 * @Description: 删除二维码
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException String
	 *
	 */
	@RequestMapping(value = "/deleteQRCode")
	@ResponseBody
	public String deleteQRCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		Gson gson = new Gson();
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		
		if(id == null) {
			//response.getWriter().print("error");
			//return ;
			return gson.toJson("error");
		}
	
		Transform transform = transformService.get(Integer.parseInt(id));
		if("file".equals(type)) {
			//删除二维码文件
			String QRCodePath = request.getServletContext().getRealPath("/") + 
					"files/QRCode/" + transform.getUuid() + ".jpg";
			System.out.println(QRCodePath);
			File QRCodeFile = new File(QRCodePath);
			if(QRCodeFile.exists() && QRCodeFile.isFile()) {
				QRCodeFile.delete();
			}
			//删除源文件
			String filePath = request.getServletContext().getRealPath("/") + 
					"files/upload/" + transform.getDetail();
			System.out.println(filePath);
			File sourceFile = new File(filePath);
			if(sourceFile.exists() && sourceFile.isFile()) {
				sourceFile.delete();
			}
			//删除数据库
			transformService.delete(transform);
		}
		else if("url".equals(type)) {
			//删除二维码
			String urlPath = request.getServletContext().getRealPath("/") + 
					"/files/QRCode/" + transform.getUuid() + ".jpg";
			System.out.println(urlPath);
			File urlFile = new File(urlPath);
			if(urlFile.exists() && urlFile.isFile()) {
				urlFile.delete();
			}
			//删除数据库
			transformService.delete(transform);
		}
		else {
			//response.getWriter().print("error");
			return gson.toJson("error");
		}
		//response.getWriter().print("success");
		return gson.toJson("success");
	}
	
	/**
	 * 
	 * @Title: jumpToAddQRCode
	 * @Author: 赵焜松
	 * @Description: 登录的用户添加二维码
	 * @param request
	 * @return String
	 *
	 */
	@RequestMapping(value = "/jumpToAddQRCode")
	public String jumpToAddQRCode(HttpServletRequest request) {
		
		String type = request.getParameter("type");
		if("url".equals(type))
			return "transform/add_web_recode";
		else if("file".equals(type))
			return "transform/add_file_recode";
		else 
			return "transform/error";
	}
	
	/**
	 * 
	 * @Title: previewQRCode
	 * @Author: 赵焜松
	 * @Description: 预览二维码
	 * @param request
	 * @return String
	 *
	 */
	@RequestMapping(value = "/previewQRCode")
	public String previewQRCode(HttpServletRequest request) {
		String myid = request.getParameter("id");
		String myuuid = transformService.get(Integer.parseInt(myid)).getUuid();
		request.setAttribute("myuuid", myuuid);
		return "transform/previewQRCode";
	}
}
