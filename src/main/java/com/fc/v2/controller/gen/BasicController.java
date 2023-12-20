package com.fc.v2.controller.gen;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fc.v2.common.base.BaseController;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
@Controller
@Api(value = "")
@RequestMapping("/BasicController")
public class BasicController extends BaseController{
	private String prefix = "gen/basic";
	
	
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
	
}
