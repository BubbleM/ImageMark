package com.spring.imgcontroller;

import java.sql.SQLException;
import java.util.List;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;











import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;





import org.springframework.web.context.ServletConfigAware;
import org.springframework.web.context.ServletContextAware;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.spring.dao.ImgDao;
import com.spring.dao.UserDao;
import com.spring.po.ImgInfo;
import com.spring.po.MarkInfo;
import com.spring.po.Pager;
import com.spring.po.ResultOfImage;
import com.spring.po.ResultOfMark;

@Controller
public class imgcomtroller implements ServletConfigAware,ServletContextAware {
	
	private ServletContext servletContext;
	private ServletConfig servletConfig;
	
	ImgDao imgDao = new ImgDao();
	UserDao userDao = new UserDao();
	
//	@RequestMapping("/image.do")
//	public void Image(Model model){
//		System.out.println(id.getImgPath());
//		model.addAttribute("imagepath", id.getImgPath());
//	
//	}
	
	@RequestMapping("/image.do")
	public @ResponseBody Pager<ImgInfo> Image(int pageNum,Model model,HttpServletRequest request,HttpServletResponse response){
		
		response.setContentType("text/html;charset=utf-8"); 
		model.addAttribute("image_path", imgDao.getImgPath());
		List<ImgInfo> imgs = new ArrayList<ImgInfo>();
		
		//获取当前用户ID
		String username = userDao.getNowUser().getUsername();
		System.out.println(username);
		int userId = userDao.getUserId(username);
		//获取图片总数
		int totalNum = imgDao.getImgNumByUser(userId);
		//每页应显示的图片数量
		int imageNum = 6;
		//总页数
		int totalPage = totalNum/imageNum+1;
		//查询数据的起始位置
		int fromInt = (pageNum-1)*imageNum;
		
		
		imgs = imgDao.getAllImgPage(userId,fromInt,imageNum);
		
		Pager<ImgInfo> result =new Pager<ImgInfo>(imageNum,pageNum,totalNum,totalPage,imgs);
		
		return result;
	/*	使用response的方法返回数据
		try {
			PrintWriter out= response.getWriter();
            out.print(id.getImgPath());
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JSONArray jsonObject = JSONArray.fromObject(id.getAllImg());
		System.out.println(jsonObject);
		*/	
	}
	
	@RequestMapping("/imageFirst.do")
	public @ResponseBody List<ImgInfo> imageFirst(){
		
		String username = userDao.getNowUser().getUsername();
		int userId = userDao.getUserId(username);
		List<ImgInfo> img = new ArrayList<ImgInfo>();
		img = imgDao.getAllImgUnmarked(userId);
		return img;
	}
	
	@RequestMapping("/mark.do")
	public String mark(int imageId,String markContent,Model model){
		
		MarkInfo mark = new MarkInfo();
		//获取当前用户ID
		String username = userDao.getNowUser().getUsername();
		mark.setUserId(userDao.getUserId(username));
		mark.setImageId(imageId);
		mark.setMarkContent(markContent);
		
		imgDao.insertMark(mark);
		
		System.out.println(imageId+"---"+markContent+"--"+username);
		
		return "success";
 	}
	
	
	
	@RequestMapping("/selectImage.do")
	public @ResponseBody List<ImgInfo> selectImage(int imageId){
		
		
		return imgDao.getImgDetail(imageId);
	}
	
	@RequestMapping("/smartupload.do")
	public String smartUpload(int teamid,String teamname,Model model,HttpServletRequest request,HttpServletResponse response) throws SQLException{
		
		model.addAttribute("teamid", teamid);
	    model.addAttribute("teamname", teamname);
	    
	    String filePath = servletContext.getRealPath("/")+"image"; 
		System.out.println(filePath);
		File file = new File(filePath);
		if(!file.exists()){
			file.mkdir();
		}
		
		String result = "";
		SmartUpload su = new SmartUpload();
		//初始化smartupload 对象
		try {
			su.initialize(servletConfig, request, response);
		} catch (ServletException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		//设置上传文件大小
		su.setMaxFileSize(1024*1024*10);
		//设置所有上传文件的大小
		su.setTotalMaxFileSize(1024*1024*100);
		
		//设置上传文件的类型
		su.setAllowedFilesList("jpg,gif,png,JPG,jpeg");
		
	 try {
			
			//上传文件
			su.upload();
			int count = su.save(filePath);
			
			System.out.println("上传成功了"+count+"个文件");
		    result = "上传成功了"+count+"个文件!";
		} catch (SmartUploadException e) {
			result="上传失败！";
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("result", result);
		
		
		for(int i=0; i<su.getFiles().getCount();i++){
		    //获取图片信息并插入
			ImgInfo img = new ImgInfo();
			com.jspsmart.upload.File tempFile = su.getFiles().getFile(i);
			if(tempFile.getSize()>0){
				String imgPath = "image/"+tempFile.getFileName();
				img.setImage_path(imgPath);
				img.setImage_min(10);
				img.setImage_now(0);
				imgDao.insertImage(img);
				//获取图片id，并将其插入到team_iamge
				int imageId = imgDao.getImgIdByPath(imgPath);
				imgDao.insertTeamImage(imageId, teamid);
			}
			
		}
	    
	    
		return "team-file";
		
	}

	@Override
	public void setServletContext(ServletContext arg0) {
		this.servletContext = arg0;
		
	}

	@Override
	public void setServletConfig(ServletConfig arg0) {
		this.servletConfig = arg0;
		
	}
	//未完
	@RequestMapping("getteaminfo.do")
	public @ResponseBody ResultOfMark getTeamMarkResult(String teamName){
		//获取群Id
		int teamId = userDao.getTeamIdByName(teamName);
		
		ResultOfMark result = new ResultOfMark();
		//设置群组文件总数
		result.setImageSum(imgDao.getTeamImgNum(teamId));
		//设置成员总数
		result.setUserSum(userDao.getTeamUserNum(teamId));
		if(result.getImageSum() >0){
		//设置标记情况
		int[] threeNum = imgDao.getAllImgMarkResult(teamId);
		result.setImageMarked(threeNum[0]);
		result.setImageMarking(threeNum[1]);
		result.setImageUnmark(threeNum[2]);
		//设置标记进度
		result.setMarkProgress((float)result.getImageMarked()/result.getImageSum());
		//设置标记准确度
		List<ImgInfo> imgs = new ArrayList<ImgInfo>();
		imgs = imgDao.getTeamImgMarked(teamId);
		if(imgs.size() >= 0 || imgs != null){
			float sum =0;
			for(ImgInfo img: imgs){
				sum += imgDao.getResultOfImage(img.getImage_id()).getMarkAccuracyOne();
			}
			
			result.setMarkAccuracy(sum/imgs.size());
		}
		}else{
			result.setImageMarked(0);
			result.setImageMarking(0);
			result.setImageUnmark(0);
			
		}
		
		return result;
	}
	
	
	@RequestMapping("/selectimageresult.do")
	public @ResponseBody ResultOfImage selectImageResult(int imageId){
		ResultOfImage result = new ResultOfImage();
		result = imgDao.getResultOfImage(imageId);
		
		return result;
	}
	
	//判断小组是否 
	@RequestMapping("/isTeamNull.do")
	public @ResponseBody boolean isTeamNull(int teamId){
		boolean b = imgDao.isTeamNull(teamId);
		return b;
	}	
   //判断用户是否有权限删除这个小组
	@RequestMapping("/ifUserDeleteTeam.do")
	public @ResponseBody boolean ifUserDeleteTeam(int teamId){
		int userId = userDao.getNowUserId();
		boolean b = userDao.ifUserDeleteTeam(teamId, userId);
		return b;
	}	
	
	//删除小组
	@RequestMapping("/deleteTeam.do")
	public String deleteTeam(int teamId){
		userDao.deleteTeam(teamId);
		return "myteam";
	}	
	
	//删除指定文件
	@RequestMapping("/deleteImage.do")
	public String deleteImage(int imageId,int teamId,String teamName,Model model){
		imgDao.deleteImage(imageId);
	    model.addAttribute("teamid", teamId);
	    model.addAttribute("teamname", teamName);
		model.addAttribute("result", "删除成功！");
		return "team-file";
	}	
	
	
}
