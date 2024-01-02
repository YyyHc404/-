package com.fc.v2.controller.gen;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fc.v2.common.base.BaseController;
import com.fc.v2.common.domain.AjaxResult;
import com.fc.v2.model.auto.TSysEmail;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

import com.fc.v2.service.BasicService;
import com.fc.v2.util.SimpleEmailUtil;
import com.fc.v2.util.StringUtils;

@Controller
@Api(value = "")
@RequestMapping("/BasicController")
public class BasicController extends BaseController{
	private String prefix = "gen/basic";
	@Autowired
	private BasicService bs;
	
	
	@GetMapping("/editphone")
    public String editPhone()
    {
        return prefix+"/editphone";
    }
	
	
	@GetMapping("/editpassword")
    public String editPassWord()
    {
        return prefix + "/editpassword";
    }
	//获取验证码，Redis中以邮箱、验证码(字母数字随机组合的6位验证码)为键值对
	@ApiOperation(value = "生成验证码", notes = "生成")
	@PostMapping("/setEmailCode")
	@ResponseBody
	public AjaxResult setEmailCode(String email) {
//		String code = bs.getEmailCode(email);
//		if ( StringUtils.isNull(code) && code.isEmpty() ) {
//			
//		}else {
//			return success();
//		}
		String code = bs.setEmailCode(email, StringUtils.randomCode(6));
		TSysEmail te = new TSysEmail();
		te.setReceiversEmail(email);
		te.setTitle("信学网 学生学籍管理系统");
		te.setContent(":) 你的验证码为"+code);
		try {
			SimpleEmailUtil.sendEmail(te);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return error();
		}
		return success();
		
	}
	
	
	
	
	
	@ApiOperation(value = "验证码验证", notes = "验证码验证")
	@PostMapping("/vertifyCode")
	@ResponseBody
	public AjaxResult vertifyCode(String email,String code) {
		if (bs.getEmailCode(email).toLowerCase().equals(code.toLowerCase()) ) {
			return success("verify success");
		}else {
			return error("verify failed");
		}
		
		
	}
}
