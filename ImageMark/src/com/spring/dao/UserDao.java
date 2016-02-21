package com.spring.dao;

import java.io.File;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.base.JDBCConnection;
import com.spring.po.Team;
import com.spring.po.UserInfo;
import com.spring.po.UserRole;

public class UserDao {
	
	Connection conn = JDBCConnection.getConn();
	Statement st;
	
	
	public String getPassword(String username){
		String sql = "select * from user where username='"+username+"'";     // 查询数据的sql语句  
		String password = "";
		try {
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);    //执行sql查询语句，返回查询数据的结果集  
	        while (rs.next()) { // 判断是否还有下一个数据  
	            // 根据字段名获取相应的值  
	            password = rs.getString("password");  
	        }  
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}    //创建用于执行静态sql语句的Statement对象，st属局部变量  
		return password;
	}
	
	//插入用户
	public void insertUser(UserInfo user){
		String sql = "insert into user(username,password,status,descn) "
				+ "values('"+user.getUsername()+"','"+user.getPassword()+"',"+user.getStatus()+",'"+user.getDescn()+"')";
		System.out.println(sql);
		
		try {
			st = (Statement) conn.createStatement();
			st.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	//查询userID
	public int getUserId(String username){
		int userId = 0;
		String sql = "select * from user where username='"+username+"'";     // 查询数据的sql语句  
		try {
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);    //执行sql查询语句，返回查询数据的结果集  
	        while (rs.next()) { // 判断是否还有下一个数据  
	            // 根据字段名获取相应的值  
	            userId = rs.getInt("id");  
	        }  
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}    //创建用于执行静态sql语句的Statement对象，st属局部变量  
		
		return userId;
	}

	//插入用户权限
	public void insertUserRole(UserRole ur){
		String sql = "insert user_role (user_id,role_id) values("+ur.getUserId()+","+ur.getRoleId()+")";
		System.out.println(sql);
		
		try {
			st = (Statement) conn.createStatement();
			st.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//获取当前登录用户的信息
	public UserDetails getNowUser(){
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    return userDetails;
	}
	
	//获取当前用户的id
	public int getNowUserId(){
		int userId;
		String username = this.getNowUser().getUsername();
		userId = this.getUserId(username);
		return userId;
	}
	//获取本组的用户信息
	public List<UserInfo> getUsersByTeamid(int teamId){
		List<UserInfo> users = new ArrayList<UserInfo>();
		String sql = "select * from user where id in (select user_id from team_user where team_id= "+teamId+" )";
		System.out.println(sql);
		try {
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);    
	        while (rs.next()) { // 判断是否还有下一个数据  
	           UserInfo user = new UserInfo();
	           user.setUserid(rs.getInt("id"));
	           user.setUsername(rs.getString("username"));
	           user.setPassword(rs.getString("password"));
	           user.setStatus(rs.getInt("status"));
	           user.setDescn(rs.getString("descn"));
	           users.add(user);
	        }  
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}    
		
		return users;
		
	}
	
	//插入用户
		public void insertTeam(Team team){
			String sql = "insert into team(team_name,team_owner,team_password) "
					+ "values('"+team.getTeamName()+"','"+team.getTeamOwner()+"',"+team.getTeamPassword()+")";
			System.out.println(sql);
			
			try {
				st = (Statement) conn.createStatement();
				st.executeUpdate(sql);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		
		public boolean teamIsExist(String teamName){
			String sql = "select * from team where team_name = '"+teamName+"'";
			try {
				st = conn.createStatement();
				ResultSet rs = st.executeQuery(sql);    //执行sql查询语句，返回查询数据的结果集  
		        while (rs.next()) { // 判断是否还有下一个数据  
		            // 根据字段名获取相应的值  
		           return true; 
		        }  
			} catch (SQLException e) {
			
				e.printStackTrace();
			}   
			
			return false;
		}
		
		
	   //查询相对应管理员的群组信息
		public List<Team> getAllTeam(int teamOwner){
			String sql="select * from team where team_owner = "+teamOwner+"";
			List<Team> teams = new ArrayList<Team>();
			try {
				st = conn.createStatement();
				ResultSet rs = st.executeQuery(sql);    //执行sql查询语句，返回查询数据的结果集  
		        while (rs.next()) { // 判断是否还有下一个数据  
		           Team team = new Team();
		           team.setTeamId(rs.getInt("team_id"));
		           team.setTeamName(rs.getString("team_name"));
		           team.setTeamOwner(rs.getInt("team_owner"));
		           team.setTeamPassword(rs.getString("team_password"));
		           
		           teams.add(team);		         
		        }  
			} catch (SQLException e) {
				
				e.printStackTrace();
			}   
			
			return teams;
		}
		
		 /**
		  * 对应用户，参加的team
		  * @return
		  */
		public List<Team> getAllTeamJoined(int userId){
			String sql="select * from team where team_id in (select team_id from team_user where user_id = "+userId+" ) ";
			List<Team> teams = new ArrayList<Team>();
			try {
				st = conn.createStatement();
				ResultSet rs = st.executeQuery(sql);    //执行sql查询语句，返回查询数据的结果集  
		        while (rs.next()) { // 判断是否还有下一个数据  
		           Team team = new Team();
		           team.setTeamId(rs.getInt("team_id"));
		           team.setTeamName(rs.getString("team_name"));
		           team.setTeamOwner(rs.getInt("team_owner"));
		           team.setTeamPassword(rs.getString("team_password"));
		           
		           teams.add(team);		         
		        }  
			} catch (SQLException e) {
				
				e.printStackTrace();
			}   
			
			return teams;
		}
		
		//根据teamid查询team的信息
		public Team getTeamById(int teamId){
			String sql = "select * from team where team_id = "+teamId+"";
			System.out.println(sql);
			Team team = new Team();
			try {
				st = conn.createStatement();
				ResultSet rs = st.executeQuery(sql);    //执行sql查询语句，返回查询数据的结果集  
		        while (rs.next()) { // 判断是否还有下一个数据  
		           team.setTeamId(rs.getInt("team_id"));
		           team.setTeamName(rs.getString("team_name"));
		           team.setTeamOwner(rs.getInt("team_owner"));
		           team.setTeamPassword(rs.getString("team_password"));         
		        }  
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}   
			
			return team;
		}

		//修改team的口令
		public void alterTeam(int teamId,String teamPassword){
			String sql = "update team set team_password ='"+teamPassword+"' where team_id ="+teamId+" ";
			System.out.println(sql);
			
			try {
				st = conn.createStatement();
				st.executeUpdate(sql);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//将制定用户从team指定team中移除
		public void removeUser(int userId,int teamId){
			String sql="delete from team_user where team_id="+teamId+" and user_id="+userId+" ";
			try {
				st = conn.createStatement();
				st.executeUpdate(sql);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//查询当前用户还未加入的群
		public List<Team> getTeamNotJoin(int userId){
			String sql = "select * from team where team_id not in (select team_id from team_user where user_id="+userId+")";
			System.out.println(sql);
			List<Team> teams = new ArrayList<Team>();
			try {
				st = conn.createStatement();
				ResultSet rs = st.executeQuery(sql);    //执行sql查询语句，返回查询数据的结果集  
		        while (rs.next()) { // 判断是否还有下一个数据  
		        	Team team = new Team();
		           team.setTeamId(rs.getInt("team_id"));
		           team.setTeamName(rs.getString("team_name"));
		           team.setTeamOwner(rs.getInt("team_owner"));
		           team.setTeamPassword(rs.getString("team_password"));   
		           teams.add(team);
		        }  
			} catch (SQLException e) {
				
				e.printStackTrace();
			}   
			
			return teams;
		}
		
		//获取群password
		public  String getTeamPassword(int teamId){
			String sql = "select team_password from team where team_id = "+teamId+"";
			String password ="";
			try {
				st = conn.createStatement();
				ResultSet rs = st.executeQuery(sql);    //执行sql查询语句，返回查询数据的结果集  
		        while (rs.next()) { // 判断是否还有下一个数据  
		            // 根据字段名获取相应的值  
		           password = rs.getString("team_password");
		        }  
			} catch (SQLException e) {
				e.printStackTrace();
			}   
			
			return password;
		}
		
		//加入群组
		public void insertTeamUser(int teamId,int userId){
			String sql="insert into team_user values("+teamId+","+userId+")";
			try {
				st = conn.createStatement();
				st.executeUpdate(sql);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		//获取指定群组的成员数
		public int getTeamUserNum(int teamId){
			int userNum = 0;
			String sql="select count(user_id) as userNum from team_user where team_id ="+teamId+"";
			try {
				st = conn.createStatement();
				ResultSet rs = st.executeQuery(sql);    //执行sql查询语句，返回查询数据的结果集  
		        while (rs.next()) { // 判断是否还有下一个数据  
		            // 根据字段名获取相应的值  
		           userNum = rs.getInt("userNum");
		        }  
			} catch (SQLException e) {
				e.printStackTrace();
			}   
			return userNum;
		}
		
		//获取群Id 根据群名
		public int getTeamIdByName(String teamName){
			String sql = "select team_id from team where team_name = '"+teamName+"';";
			int teamId = 0;
			try {
				st = conn.createStatement();
				ResultSet rs = st.executeQuery(sql);    
		        while (rs.next()) { // 判断是否还有下一个数据  
		          teamId = rs.getInt(1);  
		        }  
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}   
			
			return teamId;
		}
	
		//根据用户Id获取用户标记次数
		public int getUserMarkTimes(int userId){
			String sql = "select count(*) as markTimes from mark where user_id = "+userId+";";
			int times=0;
			
			try {
				st = conn.createStatement();
				ResultSet rs = st.executeQuery(sql);
				while(rs.next()){
					times = rs.getInt("markTimes");
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			return times;
		}
		
		//修改密码
		public void modifyPassword(String userName,String password){
			String sql = "update user set password='"+password+"' where username ='"+userName+"'";
			try {
				st=conn.createStatement();
				st.executeUpdate(sql);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

        //判断用户是否有删除此小组的权限
		public boolean ifUserDeleteTeam(int teamId,int userId){
			String sql = "select * from team where team_id="+teamId+" and team_owner = "+userId+"";
			 try {
					st = conn.createStatement();
					ResultSet rs = st.executeQuery(sql);
					while(rs.next()){
						return true;
					}
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
				return false;
		}
		
		
		
		//删除小组
		public void deleteTeam(int teamId){
			//删除对应群组的硬盘上的照片
			String sql = "select * from image where image_id in (select image_id from team_image where team_id="+teamId+")";
			String sql2 = "delete from team where  team_id = "+teamId+"; ";
			String sql3 = "delete from image where image_id in (select image_id from team_image where team_id="+teamId+")";
			try {
				st = conn.createStatement();
				ResultSet rs = st.executeQuery(sql);
				while(rs.next()){
					String path = rs.getString("image_path");
					File file = new File("D:/tomcat/webapps/ImageMark/"+path);
					if(file.exists()){
						file.delete();
					}
					
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			//删除图片
			try {
				st = conn.createStatement();
				st.executeUpdate(sql3);
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		
		//删除群
		try {
			st = conn.createStatement();
			st.executeUpdate(sql2);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}
		
		
}
