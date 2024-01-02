package com.fc.v2.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.time.Duration;
/**
 * 基于Redis的邮箱验证码服务
 * */
@Service
public class BasicService {
	@Autowired
	private RedisTemplate<Object,Object> rt;
	
	
	public String setEmailCode(String key,String value) {
		//邮箱验证码有效时间为5分钟
		return setEmailCode(key, value, 5);
		
	};
	public String setEmailCode(String key,String value,long timeout) {
		//邮箱验证码有效时间为5分钟
		rt.opsForValue().set(key, value, Duration.ofMinutes(timeout));
		return rt.opsForValue().get(key).toString();
		
	};
	
	public String getEmailCode(String key) {
		return rt.opsForValue().get(key).toString();
	};
	
}
