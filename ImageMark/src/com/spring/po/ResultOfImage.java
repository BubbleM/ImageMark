package com.spring.po;

public class ResultOfImage {
	int imageId;//图片id
	float markAccuracyOne;//一张图片的准确率
	@Override
	public String toString() {
		return "ResultOfImage [imageId=" + imageId + ", markAccuracyOne="
				+ markAccuracyOne + ", markResult=" + markResult + "]";
	}
	String markResult;//图片的标记结果
	public int getImageId() {
		return imageId;
	}
	public void setImageId(int imageId) {
		this.imageId = imageId;
	}
	public float getMarkAccuracyOne() {
		return markAccuracyOne;
	}
	public void setMarkAccuracyOne(float markAccuracyOne) {
		this.markAccuracyOne = markAccuracyOne;
	}
	public String getMarkResult() {
		return markResult;
	}
	public void setMarkResult(String markResult) {
		this.markResult = markResult;
	}
	
	

}
