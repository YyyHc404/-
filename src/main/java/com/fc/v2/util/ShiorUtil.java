package com.fc.v2.util;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

import com.fc.v2.model.auto.TsysUser;

public class ShiorUtil {
	public static TsysUser getCurrentUser() {
		Subject currentUser = SecurityUtils.getSubject();
		return (TsysUser)currentUser.getPrincipal();
	}
	
}
