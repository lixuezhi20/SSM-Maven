package com.mrli.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mrli.entity.ProjectInfo;
import com.mrli.service.ProjectInfoService;
import com.mrli.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author Kevin
 * @ClassName ProjectInfoController.java
 * @createTime 2022年05月20日 10:36:00
 * 项目信息控制器
 */

@Controller
public class ProjectInfoController {
	//自动装配业务层组件
	@Autowired
	private ProjectInfoService projectInfoService;

	//请求分页查询页面数据,返回json格式信息
	@RequestMapping("projectInfos")
	@ResponseBody    //将放回结果变成json格式
	public Msg getProjectInfosWithJson(@RequestParam(value = "pn",defaultValue = "1") Integer pn){

		/**
		 * @title getProjectInfosWithJson
		 * @param: pn 查询第几页    defaultValue,给前面value设置的默认值
		 * @return: com.mrli.utils.Msg 返回json格式的数据，保存成功与否的结果
		 */
		//先使用插件进行分页   两个参数：第几页，页容量
		PageHelper.startPage(pn,5);
		//调用service层查询数据,将查询结果放到infos中
		List<ProjectInfo> infos = projectInfoService.getAll();
		//将infos放到分页对象(分页插件提供)中
		PageInfo page = new PageInfo(infos, 5);
		System.out.println("Test:=====>"+page.getList().toString());
		//向前台返回结果
		return Msg.success().add("pageInfo", page);
	}

	/**
	 * @title saveProjectInfo
	 * @author Kevin 
	 * @updateTime 2022-06-08 12:18 
	 * @throws
	 */
	@RequestMapping(value = "/projectInfo",method = RequestMethod.POST)
	@ResponseBody
	public Msg saveProjectInfo(ProjectInfo projectInfo){
		projectInfoService.saveProjectInfo(projectInfo);
		return Msg.success();
	}

	@RequestMapping("/checkProjectInfo")
	@ResponseBody
	public Msg checkProjectInfo(@RequestParam("projectName") String projectName){
		//判断项目名是否合理
		String regProjectName = "(^[a-zA-Z0-9_-]{6,64}$)|(^[\\u4e00-\\u9fa5]{2,32}$)";
		//判断是否符合规则
		if (!projectName.matches(regProjectName)){
			return Msg.fail().add("validate_msg","后台校验:项目名为2~32位中文,或者6~64位大小写字母,数字,下划线,横杠");
		}
		//执行查询
		boolean flag = projectInfoService.checkProjectInfo(projectName);
		if (flag){
			return Msg.success();
		}else {
			return Msg.fail().add("validate_msg","× 不可用");
		}

	}



}
