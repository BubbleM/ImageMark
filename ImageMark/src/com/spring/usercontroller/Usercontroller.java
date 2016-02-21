package com.spring.usercontroller;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.dao.ImgDao;
import com.spring.dao.UserDao;
import com.spring.po.ImgInfo;
import com.spring.po.Pager;
import com.spring.po.Team;
import com.spring.po.UserInfo;
import com.spring.po.UserRole;


@Controller
public class Usercontroller {
	
	UserDao ud = new UserDao();
	ImgDao id = new ImgDao();
	
	
	@RequestMapping("/user.do")
	public String User(String username,String password,Model model){
		
		System.out.println("username:"+username+"password:"+password+"\n");
		
		if(password.equals(ud.getPassword(username))){
			model.addAttribute("username", username);
			model.addAttribute("imagepath",id.getImgPath());
			return "success";
		}else{
			return "fail";
		}
	}
	 
	
	
	@RequestMapping("/select.do")
	public void username(String username,HttpServletResponse response){
		System.out.println(username);
		
		try {
			//响应
			
			response.setContentType("text/html");
			response.setCharacterEncoding("utf-8");
			
			PrintWriter out = response.getWriter();
			if("hello".equals(username)){
				out.println("登录成功！");
			}else{
				out.println("请重新输入用户名！");
			}
			out.flush();
			out.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	//@ResponseBody  表示将内容或者对象当成http正文返回
	@RequestMapping("/ajaxuser.do")
	public @ResponseBody UserInfo ajaxuser(Integer userid){
		UserInfo user = new UserInfo();
		
		System.out.println("userid:"+userid);
		if(userid==null)
		{
			user.setUserid(11);
		}else{
			user.setUserid(userid);
		}
		user.setUsername("marry");
		user.setPassword("123456");
		return user;
	}
	
	@RequestMapping("/adduser.do")
	public String addUser(String login_id,String login_password){
		UserInfo user = new UserInfo();
		UserRole ur = new UserRole();
//		String username = login_id;
//		String password = login_password;
		
		//创建user
		user.setUsername(login_id);
		user.setPassword(login_password);
		user.setStatus(1);
		user.setDescn("用户");
		ud.insertUser(user);
		
		//查询插入用户的ID
		
		int userId = ud.getUserId(login_id);
		//创建userrole
		ur.setUserId(userId);
		ur.setRoleId(2);
		ud.insertUserRole(ur);
		
		System.out.println("用户名："+login_id+"---密码："+login_password);
		
	    return "login";
	}
	
	@RequestMapping("/addteam.do")
	public @ResponseBody String addTeam(String teamName,String teamPassword){
		//获取当前用户ID
		String username = ud.getNowUser().getUsername();
		int userId = ud.getUserId(username);
		
		//封装team
		Team team = new Team();
		team.setTeamName(teamName);
		team.setTeamOwner(userId);
		team.setTeamPassword(teamPassword);
		
		ud.insertTeam(team);
		
	    return "success";
	}
	
	//检测群组名是否已经存在
	@RequestMapping("/isteamexist.do")
	public @ResponseBody boolean isTeamExist(String teamName){
		
		boolean result = ud.teamIsExist(teamName);
		return result;
	}
	
	//显示群组列表
	@RequestMapping("/teamlist.do")
	public @ResponseBody List<Team> teamList(){
		int userId = ud.getNowUserId();
		List<Team> teams = new ArrayList<Team>();
		teams = ud.getAllTeam(userId);
		
		return teams;
	} 
	
	@RequestMapping("/teamlistJoined.do")
	public @ResponseBody List<Team> teamListJoined(){
		int userId = ud.getNowUserId();
		List<Team> teams = new ArrayList<Team>();
		teams = ud.getAllTeamJoined(userId);
		
		return teams;
	} 
	
	@RequestMapping("/team-member.do")
	public String teamMember(int teamid,String teamname,Model model){
		List<UserInfo> users = new ArrayList<UserInfo>();
		users = ud.getUsersByTeamid(teamid);
	    model.addAttribute("teamid", teamid);
	    model.addAttribute("teamname", teamname);
	    model.addAttribute("users",users);
		return "team-member";
	}

	
	@RequestMapping("/team-file-page.do")
	public @ResponseBody Pager<ImgInfo> teamFile(int pageNum,int teamid,String teamname,Model model,HttpServletRequest request,HttpServletResponse response){
		model.addAttribute("teamid", teamid);
	    model.addAttribute("teamname", teamname);
	    
	    response.setContentType("text/html;charset=utf-8"); 
		model.addAttribute("image_path", id.getImgPath());
		
		List<ImgInfo> imgs = new ArrayList<ImgInfo>();
		//获取当前用户ID
		String username = ud.getNowUser().getUsername();
		System.out.println(username);
		int userId = ud.getUserId(username);
		//获取图片总数
		int totalNum = id.getImgNumByTeam(teamid);
		//每页应显示的图片数量
		int imageNum = 6;
		//总页数
		int totalPage = totalNum/imageNum+1;
		//查询数据的起始位置
		int fromInt = (pageNum-1)*imageNum;
		
		//获取当前用户名
		String userName = ud.getNowUser().getUsername();
		
		imgs = id.getAllImgPageByTeam(teamid,userId,fromInt,imageNum);
		Pager<ImgInfo> result =new Pager<ImgInfo>(imageNum,pageNum,totalNum,totalPage,userName,imgs);
		model.addAttribute("result", result);
		
		return result;
		
	}
	
	@RequestMapping("/team-file.do")
	public String teamFile(int teamid,String teamname,Model model){
		model.addAttribute("teamid", teamid);
	    model.addAttribute("teamname", teamname);
		return "team-file";
		
	}
	
	@RequestMapping("/team-setting.do")
	public String teamSetting(int teamid,String teamname,Model model){
		Team team = new Team();
		team = ud.getTeamById(teamid);
		model.addAttribute(team);
		model.addAttribute("teamid", teamid);
	    model.addAttribute("teamname", teamname);
		return "team-setting";
		
	}
	
	@RequestMapping("/alterteam.do")
	public @ResponseBody String alterTeam(int teamId,String teamPassword){
		ud.alterTeam(teamId, teamPassword);
		
		return "success";
	}
	
	@RequestMapping("/removeuser.do")
	public String removeUser(int teamid,int userid,String teamname,Model model){
		model.addAttribute("teamid", teamid);
	    model.addAttribute("teamname", teamname);
		ud.removeUser(userid, teamid);
		return "team-member";
	}
	
	@RequestMapping("/getteam-notjoin.do")
	public @ResponseBody List<Team> getTeamNotJoin(){
		List<Team> teams = new ArrayList<Team>();
		int userId = ud.getNowUserId();
		teams = ud.getTeamNotJoin(userId);
		return teams;
	}
	
	@RequestMapping("/getteampassword.do")
	public @ResponseBody String getTeamPassword(int teamId){
		String teamPassword = ud.getTeamPassword(teamId);
		return teamPassword;
	}
	
	@RequestMapping("/jointeam.do")
	public @ResponseBody String joinTeam(int teamId){
		int userId = ud.getNowUserId();
		ud.insertTeamUser(teamId, userId);
		return "success";
	}
	
	@RequestMapping("/selectMarkTimes.do")
	public @ResponseBody int selectMarkTimes(int userId){
		int markTimes = 0;
		
		markTimes = ud.getUserMarkTimes(userId);
		
		return markTimes;
	}
	
	@RequestMapping("/getUserPassword.do")
	public @ResponseBody String getUserPassword(){ 
		String password = "";
		String userName = ud.getNowUser().getUsername();
		password = ud.getPassword(userName);
		return password;
	}
	
	@RequestMapping("/modifyPassword.do")
	public  String modifyPassword(String password){ 
		
		String userName = ud.getNowUser().getUsername();
		ud.modifyPassword(userName, password);
		
		return "myinformation";
	}
}
