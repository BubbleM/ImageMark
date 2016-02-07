package com.spring.po;

public class ResultOfUser {
	
	String username = "";//用户名
	
	int imageNum;//标记图片的个数
	
	String[] imageName;//标记图片的名称

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getImageNum() {
		return imageNum;
	}

	public void setImageNum(int imageNum) {
		this.imageNum = imageNum;
	}

	public String[] getImageName() {
		return imageName;
	}

	public void setImageName(String[] imageName) {
		this.imageName = imageName;
	}

}
