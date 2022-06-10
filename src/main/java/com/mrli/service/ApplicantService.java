package com.mrli.service;

import com.mrli.dao.ApplicantMapper;
import com.mrli.entity.Applicant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Kevin
 * @ClassName ApplicantService.java
 * @createTime 2022年05月20日 08:57:00
 * 申报人业务操作类
 */
@Service //业务类注解
public class ApplicantService {
	//自动注入spring容器中
	@Autowired
	private ApplicantMapper applicantMapper;

	/**
	 * @title getApplicants
	 * @author Kevin
	 * @updateTime 2022-05-20 9:05
	 * @return : java.util.List<com.mrli.entity.Applicant></>
	 * 查询所有申报人
	 */
	public List<Applicant> getApplicants(){
		return applicantMapper.selectByExample(null);
	}


}
