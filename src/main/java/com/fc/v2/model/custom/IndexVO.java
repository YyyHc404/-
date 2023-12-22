package com.fc.v2.model.custom;
/**
 * 该类作为渲染学生和管理员用户主页的参数
 * */
public class IndexVO {
	/**
	 * 0: lable + input
	 * 1: 0 + button
	 * */
	private String type;
	//event name
	private String callback;
	//text in button
	private String buttonText;
	
	
	//text in lable tag 
	private String attribute;
	//value
	private String value;
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCallback() {
		return callback;
	}
	public void setCallback(String callback) {
		this.callback = callback;
	}
	public String getButtonText() {
		return buttonText;
	}
	public void setButtonText(String buttonText) {
		this.buttonText = buttonText;
	}
	public String getAttribute() {
		return attribute;
	}
	public void setAttribute(String attribute) {
		this.attribute = attribute;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	
}
