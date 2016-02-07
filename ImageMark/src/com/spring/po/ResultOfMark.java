package com.spring.po;

public class ResultOfMark {
	
	int imageSum;//图片的总数
	
	int userSum;//群组成员的总数
	
	int imageMarked;//标记完成的的图片的个数
	
	int imageMarking;//正在被标记的图片的个数
	
	int imageUnmark;//还未被标记的图片的个数	
	
	float markProgress;//标记进度
	
    float markAccuracy;//标记准确度
    
	
	public int getUserSum() {
		return userSum;
	}

	public void setUserSum(int userSum) {
		this.userSum = userSum;
	}

	public float getMarkProgress() {
		return markProgress;
	}

	public void setMarkProgress(float markProgress) {
		this.markProgress = markProgress;
	}

	public float getMarkAccuracy() {
		return markAccuracy;
	}

	public void setMarkAccuracy(float markAccuracy) {
		this.markAccuracy = markAccuracy;
	}

	public int getImageSum() {
		return imageSum;
	}

	public void setImageSum(int imageSum) {
		this.imageSum = imageSum;
	}

	public int getImageMarked() {
		return imageMarked;
	}

	public void setImageMarked(int imageMarked) {
		this.imageMarked = imageMarked;
	}

	public int getImageMarking() {
		return imageMarking;
	}

	public void setImageMarking(int imageMarking) {
		this.imageMarking = imageMarking;
	}

	public int getImageUnmark() {
		return imageUnmark;
	}

	public void setImageUnmark(int imageUnmark) {
		this.imageUnmark = imageUnmark;
	}



}
