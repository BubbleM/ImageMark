package com.spring.dao;

import java.io.File;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;











import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.base.JDBCConnection;
import com.spring.po.ImgInfo;
import com.spring.po.MarkInfo;
import com.spring.po.ResultOfImage;
import com.spring.po.UserInfo;

public class ImgDao {
	Connection conn = JDBCConnection.getConn();
	Statement st;
	public String getImgPath(){
		String sql = "select * from image ";     // 查询数据的sql语句  
		String image_path = "";
		try {
			st = (Statement) conn.createStatement();
			ResultSet rs = st.executeQuery(sql);    //执行sql查询语句，返回查询数据的结果集  
	        while (rs.next()) { // 判断是否还有下一个数据  
	            // 根据字段名获取相应的值  
	            image_path = rs.getString("image_path"); 
	        }  
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}    //创建用于执行静态sql语句的Statement对象，st属局部变量  
		return image_path;
	}
	
	//获取没有被当前用户标记的图片,只获取第一张
public List<ImgInfo> getAllImgUnmarked(int userId){	
//	    String sql ="select * from image where image_id not in (select image_id from mark where user_id = "+userId+")";
	    String sql = "select * from image where image_id in "
            +" (select image_id from team_image where team_id in"
              +"        (select team_id from team where team_owner ="+userId+" )" 
              +"        or" 
            		  +"     team_id in (select team_id from team_user where user_id = "+userId+"))" 
            				  +"   and image_id not in " 
            						  +"    (select image_id from mark where user_id ="+userId+")";
	    int image_id;
		String image_path = "";
		int image_min;
		int image_now;
		List<ImgInfo> imgs = new ArrayList<ImgInfo>();
		
		try {
			st = (Statement) conn.createStatement();
			ResultSet rs = st.executeQuery(sql);    //执行sql查询语句，返回查询数据的结果集  
	        if(rs.next()) { // 判断是否还有下一个数据  
	            // 根据字段名获取相应的值  
	        	ImgInfo img = new ImgInfo();
	            image_id = rs.getInt("image_id");
	        	
//	        	System.out.println(imagename);
	        	image_path = rs.getString("image_path");
//	        	System.out.println(imagepath);
	            image_min = rs.getInt("image_min");  
	            image_now = rs.getInt("image_now");  
	            img.setImage_id(image_id);
	            img.setImage_path(image_path);
	            img.setImage_min(image_min);
	            img.setImage_now(image_now);
	           
	            imgs.add(img);
	        }  
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}    //创建用于执行静态sql语句的Statement对象，st属局部变量  
		return imgs;
	}

  
	//获取分页 
public List<ImgInfo> getAllImgPage(int userId,int from,int num){
		
		//String sql = "select * from image where image_now = 0";     // 查询数据的sql语句  
	    String sql ="select * from image where image_id in "
             +"(select image_id from team_image where team_id in"
                       +"(select team_id from team where team_owner = "+userId+" ))  limit "+from+","+num+"";
		System.out.println(sql);
	    int image_id;
		String image_path = "";
		int image_min;
		int image_now;
		List<ImgInfo> imgs = new ArrayList<ImgInfo>();
		
		try {
			st = (Statement) conn.createStatement();
			ResultSet rs = st.executeQuery(sql);    //执行sql查询语句，返回查询数据的结果集  
	        while (rs.next()) { // 判断是否还有下一个数据  
	            // 根据字段名获取相应的值  
	        	ImgInfo img = new ImgInfo();
	            image_id = rs.getInt("image_id");
	        	
//	        	System.out.println(imagename);
	        	image_path = rs.getString("image_path");
//	        	System.out.println(imagepath);
	            image_min = rs.getInt("image_min");  
	            image_now = rs.getInt("image_now");  
	            img.setImage_id(image_id);
	            img.setImage_path(image_path);
	            img.setImage_min(image_min);
	            img.setImage_now(image_now);
	           
	            imgs.add(img);
	        }  
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}    //创建用于执行静态sql语句的Statement对象，st属局部变量  
		return imgs;
	}

public List<ImgInfo> getAllImgPageByTeam(int teamId,int userId,int from,int num){
	
    String sql ="select * from image where image_id in (select image_id from team_image where team_id ="+teamId+")  limit "+from+","+num+"";
	System.out.println(sql);
    int image_id;
	String image_path = "";
	int image_min;
	int image_now;
	List<ImgInfo> imgs = new ArrayList<ImgInfo>();
	
	try {
		st = (Statement) conn.createStatement();
		ResultSet rs = st.executeQuery(sql);    //执行sql查询语句，返回查询数据的结果集  
        while (rs.next()) { // 判断是否还有下一个数据  
            // 根据字段名获取相应的值  
        	ImgInfo img = new ImgInfo();
            image_id = rs.getInt("image_id");
        	image_path = rs.getString("image_path");
            image_min = rs.getInt("image_min");  
            image_now = rs.getInt("image_now");  
            img.setImage_id(image_id);
            img.setImage_path(image_path);
            img.setImage_min(image_min);
            img.setImage_now(image_now);
           
            imgs.add(img);
        }  
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}    //创建用于执行静态sql语句的Statement对象，st属局部变量  
	return imgs;
}
    //获取所有的图片信息
	public List<ImgInfo> getAllImg(){
		
		String sql = "select * from image";     // 查询数据的sql语句  
		
		int image_id;
		String image_path = "";
		int image_min;
		int image_now;
		List<ImgInfo> imgs = new ArrayList<ImgInfo>();
		
		try {
			st = (Statement) conn.createStatement();
			ResultSet rs = st.executeQuery(sql);    //执行sql查询语句，返回查询数据的结果集  
	        while (rs.next()) { // 判断是否还有下一个数据  
	            // 根据字段名获取相应的值  
	        	ImgInfo img = new ImgInfo();
	            image_id = rs.getInt("image_id");
	        	
//	        	System.out.println(imagename);
	        	image_path = rs.getString("image_path");
//	        	System.out.println(imagepath);
	            image_min = rs.getInt("image_min");  
	            image_now = rs.getInt("image_now");  
	            img.setImage_id(image_id);
	            img.setImage_path(image_path);
	            img.setImage_min(image_min);
	            img.setImage_now(image_now);
	           
	            imgs.add(img);
	        }  
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}    //创建用于执行静态sql语句的Statement对象，st属局部变量  
		return imgs;
	}
	//插入标记
	public void insertMark(MarkInfo mark){
		String sql = "insert into mark(user_id,image_id,mark_content) "
				+ "values("+mark.getUserId()+","+mark.getImageId()+",'"+mark.getMarkContent()+"')";
		//插入mark的同时，使其image 的  被标记的次数+1
		String sql2 = "update image set image_now = (image_now+1) where image_id = "+mark.getImageId()+"";
		System.out.println(sql);
		System.out.println(sql2);
		
		try {
			st = (Statement) conn.createStatement();
			st.executeUpdate(sql);
			st.executeUpdate(sql2);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//获取指定图片
	public ImgInfo getImg(int imageId){
		ImgInfo img = new ImgInfo();
		String sql="select * from image where image_id ="+imageId+"";
		String imagePath = "";
		int imageMin = 0;
		int imageNow = 0;
	    try {
			st = (Statement)conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				imagePath = rs.getString("image_path");
				imageMin = rs.getInt("image_min");
				imageNow = rs.getInt("image_now");
				
				img.setImage_id(imageId);
				img.setImage_path(imagePath);
				img.setImage_min(imageMin);
				img.setImage_now(imageNow);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
		return img;
	}
	//获取指定图片的详细信息
public List<ImgInfo> getImgDetail(int imageId){
		
		String sql = "select * from image where image_id="+imageId;     // 查询数据的sql语句  
		System.out.println(sql);
		
		List<ImgInfo> imgs = new ArrayList<ImgInfo>();
		
		try {
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);    //执行sql查询语句，返回查询数据的结果集  
	        while (rs.next()) { // 判断是否还有下一个数据  
	        	 String path="";
	        	 int min = 0;
	        	 int now = 0;
	        	ImgInfo img = new ImgInfo();
	           img.setImage_id(imageId); 
	            path =rs.getString("image_path");
	        	img.setImage_path(path);
	             min = rs.getInt("image_min");
	            img.setImage_min(min); 
	            now = rs.getInt("image_now");
	            img.setImage_now(now);
	           
	            imgs.add(img);
	        }  
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}    //创建用于执行静态sql语句的Statement对象，st属局部变量  
		return imgs;
	}
	//获取当前用户应该看到的图片的总数  【这是一个错误的方法】
	public int getImgNumByUser(int userId){
//		 String sql ="select count(image_id) as totalNum from (select * from image where image_id not in (select image_id from mark where user_id = "+userId+")) as total";
	    String sql = "select count(image_id) as totalNum from image"; 
		int totalNum = 0;
	     
		 try {
			st = (Statement) conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
			totalNum = rs.getInt("totalNum");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		 return totalNum;
	}
	
	//获取当前用户在群组中应该看到的图片的总数
		public int getImgNumByTeam(int teamId){
//			 String sql ="select count(image_id) as totalNum from (select * from image where image_id not in (select image_id from mark where user_id = "+userId+")) as total";
		    String sql = "select count(image_id) as totalNum from team_image where team_id = "+teamId+""; 
			int totalNum = 0;
		     
			 try {
				st = (Statement) conn.createStatement();
				ResultSet rs = st.executeQuery(sql);
				while(rs.next()){
				totalNum = rs.getInt("totalNum");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			 return totalNum;
		}
	//插入图片
	public void insertImage(ImgInfo img){
		String sql="insert into image(image_path,image_min,image_now) values('"+img.getImage_path()+"',"+img.getImage_min()+","+img.getImage_now()+")";
		try {
			st = (Statement) conn.createStatement();
			st.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//根据路径获取图片的id
	public int getImgIdByPath(String path){
		int imageId = 0;
		String sql="select image_id from image where image_path='"+path+"'";
		 try {
				st = (Statement) conn.createStatement();
				ResultSet rs = st.executeQuery(sql);
				while(rs.next()){
					imageId = rs.getInt("image_id");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return imageId;
	}
	
	//将图片与群组关系插入到数据库
	public void insertTeamImage(int imageId,int teamId){
		String sql="insert into team_image values("+imageId+","+teamId+")";
		try {
			st = (Statement) conn.createStatement();
			st.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//获取指定群组的文件数
	
			public int getTeamImgNum(int teamId){
				int imgNum = 0;
				String sql="select count(image_id) as userNum from team_image where team_id ="+teamId+"";
				try {
					st = conn.createStatement();
					ResultSet rs = st.executeQuery(sql);    //执行sql查询语句，返回查询数据的结果集  
			        while (rs.next()) { // 判断是否还有下一个数据  
			            // 根据字段名获取相应的值  
			           imgNum = rs.getInt("userNum");
			        }  
			        
				} catch (SQLException e) {
					e.printStackTrace();
				}   
				return imgNum;
			}
			
			 //获取指定群的图片的标记概况
			public int[] getAllImgMarkResult(int teamId){
				
				String sql = "select * from image where image_id in (select image_id from team_image where team_id="+teamId+")";     // 查询数据的sql语句  
				int[] result = new int[3];//result三个值，result[0],表示暂时标记完成的，result[1],表示正在被标记的，result[2],表示暂时标记完成的，表示还未被标记的
				
				int image_id;
				String image_path = "";
				int image_min;
				int image_now;
				try {
					st = (Statement) conn.createStatement();
					ResultSet rs = st.executeQuery(sql);    //执行sql查询语句，返回查询数据的结果集  
			        while (rs.next()) { // 判断是否还有下一个数据  
			            image_min = rs.getInt("image_min");  
			            image_now = rs.getInt("image_now"); 
			            if(image_now>=image_min){
			            	result[0]+=1;
			            }else{
			            	if(image_now<=0){
			            		result[2]+=1;
			            	}else{
			            		result[1]+=1;
			            	}
			            }
			        }  
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}    //创建用于执行静态sql语句的Statement对象，st属局部变量  
				return result;
			}
			
			//获取指定图片的标记准确率和结果
			
			public ResultOfImage getResultOfImage(int imageId){
				ResultOfImage result = new ResultOfImage();
				String sql="select distinct mark_content from mark where image_id = "+imageId+"";
				String sql2="select mark_content from mark where image_id = "+imageId+"";
				int i=0;
				ArrayList content = new ArrayList() ;
				
				//首先获取不重复的标记的数目，和其内容
				try {
					st = conn.createStatement();
					ResultSet rs = st.executeQuery(sql);    
			        while (rs.next()) { // 判断是否还有下一个数据  
			          content.add(rs.getString("mark_content"));
			        }  
			       
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
				System.out.println("content size"+content.size());
				int[] contentNum = new int[content.size()];
				//获取每一个标记内容的个数
				try {
					st = conn.createStatement();
					ResultSet rs = st.executeQuery(sql2);    //执行sql查询语句，返回查询数据的结果集  
			        while (rs.next()) { // 判断是否还有下一个数据  
			          for(int j=0;j<content.size();j++){
			        	  if(rs.getString("mark_content").equals(content.get(j))){
			        		  contentNum[j]++;
			        	  }
			          }
			        }
			        String one = "";
			        for(int m = 0;m<contentNum.length;m++)
			        	one+=contentNum[m]+"  ";
			        System.out.println("contentNum"+one);
			      
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
				
				//获取出现次数最多的值，并记录其位置
				if(content == null||content.size()==0){
					result.setImageId(imageId);
					result.setMarkAccuracyOne(0);
					result.setMarkResult(null);
				}else{
					
					
					int[] arrnew=new int[2];//设置一个 长度为2的数组 用作记录 规定第一个元素存储最大值 第二个元素存储下标
					if(contentNum.length>0 || contentNum != null){
						arrnew[0]=contentNum[0];
						arrnew[1]=0;//假设第一个元素为最大值 那么下标设为0
					}
					for(int k =0;i<contentNum.length;i++){
					    if(arrnew[0]<contentNum[k]){
					        arrnew[0]=contentNum[k];
					        arrnew[1]=k;
					        }
					}
					result.setImageId(imageId);
				    int now = getImgDetail(imageId).get(0).getImage_now();//获取当前图片的被标记次数
				    System.out.println("now:"+now);
					result.setMarkAccuracyOne((float)arrnew[0]/now);
					System.out.println("arrnew:"+arrnew[0]);
					result.setMarkResult((String)content.get(arrnew[1]));
				}
				return result;
			}
			
			//获取指定组中被标记完成的图片
			public List<ImgInfo> getTeamImgMarked(int teamId){
				
				String sql="select * from image where image_id in (select image_id from team_image where team_id="+teamId+")";
				List<ImgInfo> imgs = new ArrayList<ImgInfo>();
				int imageId = 0;
				String imagePath = "";
				int imageMin = 0;
				int imageNow = 0;
			    try {
					st = (Statement)conn.createStatement();
					ResultSet rs = st.executeQuery(sql);
					while(rs.next()){
						ImgInfo img = new ImgInfo();
						imageId = rs.getInt("image_id");
						imagePath = rs.getString("image_path");
						imageMin = rs.getInt("image_min");
						imageNow = rs.getInt("image_now");
						
						img.setImage_id(imageId);
						img.setImage_path(imagePath);
						img.setImage_min(imageMin);
						img.setImage_now(imageNow);
						if(imageMin<=imageNow){
							imgs.add(img);
						}
					}
					
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			    
				return imgs;
			}
			
		  //查询小组的文件是否为空
		 public boolean isTeamNull(int teamId){
			 String sql = "select * from team_image where team_id ="+teamId+";";
			 try {
				st = conn.createStatement();
				ResultSet rs = st.executeQuery(sql);
				while(rs.next()){
					return false;
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			return true;
			 
		 }
		 
		 //删除指定图片
		//删除小组
			public void deleteImage(int imageId){
				//删除对应群组的硬盘上的照片
				String sql = "select * from image where image_id ="+imageId+"";
				String sql2 = "delete from image where image_id ="+imageId+"";
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
					st.executeUpdate(sql2);
					
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			
			
		}
		
	public static void main(String[] args){
		ImgDao imgDao = new ImgDao();
		System.out.println(imgDao.getResultOfImage(1).toString());
		System.out.println(imgDao.getResultOfImage(2).toString());
		System.out.println(imgDao.getResultOfImage(3).toString());
		System.out.println(imgDao.getResultOfImage(1).toString());
		System.out.println(imgDao.getResultOfImage(5).toString());
	}
}
