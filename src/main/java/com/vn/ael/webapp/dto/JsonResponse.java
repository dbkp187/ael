package com.vn.ael.webapp.dto;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class JsonResponse {
	
	public static final String SUCCESS= "success";
	public static final String ERROR = "error";
	
	private String status;
	private String messages;
	
	public JsonResponse(String status,String messages){
		this.status = status;
		this.messages =messages;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMessages() {
		return messages;
	}
	public void setMessages(String messages) {
		this.messages = messages;
	}
	
	/**
	 * Create a error response
	 * @param message
	 * @return
	 */
	public static JsonResponse getErrorMessage(String message){
		return new JsonResponse(JsonResponse.ERROR, message);
	}
	
	/**
	 * Create a success message
	 * @param message
	 * @return
	 */
	public static JsonResponse getSuccessMessage(String message){
		return new JsonResponse(JsonResponse.SUCCESS, message);
	}
	
}
