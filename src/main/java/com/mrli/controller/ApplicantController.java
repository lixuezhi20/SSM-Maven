package com.mrli.controller;

import com.mrli.entity.Applicant;
import com.mrli.service.ApplicantService;
import com.mrli.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.crypto.MacSpi;
import java.util.List;

/**
 * @author Kevin
 * @ClassName ApplicantController.java
 * @createTime 2022年05月20日 10:26:00
 * 申报人控制器
 * 控制器作用：
 * 将请求信息发给service，然后service发送给dao，dao去访问数据库
 * 将返回的数据响应给请求界面
 */
@Controller
public class ApplicantController {

	//自动装配业务层组件
	@Autowired
	private ApplicantService applicantService;

	/**
	 * @author Kevin
	 * @updateTime 2022-05-20 10:30
	 * 查询所有申报人，返回的事json数据
	 */
	@RequestMapping("/applicants")
	@ResponseBody
	public Msg getApplicants(){
		// 调用业务层,得到结果
		List<Applicant> list =  applicantService.getApplicants();

		// 将结果放到成功的数据包中，以json的方式返回给前台
		return Msg.success().add("applicants",list);
	}

}
