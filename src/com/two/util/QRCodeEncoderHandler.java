package com.two.util;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.swetake.util.Qrcode;

/*
 * 生成二维码
 */
public class QRCodeEncoderHandler {
	
	//生成的二维码的路径
	public static final String CREATE_QRCODE_PATH = "/files/QRCode/";
	
	public void encoderQRCoder(String content, HttpServletRequest request, HttpServletResponse response) {  
        try {  
            Qrcode handler = new Qrcode();  
            handler.setQrcodeErrorCorrect('M');  
            handler.setQrcodeEncodeMode('B');  
            
            //二维码的分辨率
            handler.setQrcodeVersion(12);  
              
            System.out.println(content);  
            byte[] contentBytes = content.getBytes("UTF-8");  
              
            BufferedImage bufImg = new BufferedImage(200, 200, BufferedImage.TYPE_INT_RGB);  
              
            Graphics2D gs = bufImg.createGraphics();  
              
            gs.setBackground(Color.WHITE);  
            
            //二维码的大小
            gs.clearRect(0, 0, 200, 200);  
              
            //设定图像颜色：BLACK  
            gs.setColor(Color.BLACK);  
              
            //设置偏移量  不设置肯能导致解析出错  
            int pixoff = 2;  
            //输出内容：二维码  
            if(contentBytes.length > 0 && contentBytes.length < 124) {  
                boolean[][] codeOut = handler.calQrcode(contentBytes);  
                for(int i = 0; i < codeOut.length; i++) {  
                    for(int j = 0; j < codeOut.length; j++) {  
                        if(codeOut[j][i]) {  
                            gs.fillRect(j * 3 + pixoff, i * 3 + pixoff,3, 3);  
                        }  
                    }  
                }  
            } else {  
                System.err.println("QRCode content bytes length = " + contentBytes.length + " not in [ 0,120 ]. ");  
            }  
              
            gs.dispose();  
            bufImg.flush();  
            
            //根路径
            String rootPath = request.getServletContext().getRealPath("/");
            //相对路径
            String realPath = CREATE_QRCODE_PATH + content.substring(content.indexOf("=")+1) +".jpg";
            //保存二维码
            File qrFile = new File(rootPath,realPath);
            if(!qrFile.exists())
            		qrFile.createNewFile();
           // BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(qrFile));
           // bos.write(contentBytes);
            //String suffix = qrFile.getName().substring(qrFile.getName().indexOf(".")+1, qrFile.getName().length());            
          
            //生成二维码QRCode图片  
            ImageIO.write(bufImg, "jpg", qrFile); //保存在文件中
     
          //ImageIO.write(bufImg, "jpg", response.getOutputStream()); //页面显示
           
            
            System.out.println("二维码输出成功！！"+qrFile.getAbsolutePath());
              
              
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    }  
}  

