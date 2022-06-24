package com.mrli.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mrli.entity.ProjectInfo;
import com.mrli.service.ProjectInfoService;
import com.mrli.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
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

	/**
	 * @title deleteProjectInfoById
	 * @author Kevin
	 * @updateTime 2022-06-18 17:25
	 * 根据传递的参数进行业务层调用
	 * 单个 ： 5
	 * 多个 ： 5-6-7
	 */
	@RequestMapping(value = "/projectInfo/{ids}",method = RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteProjectInfoById(@PathVariable("ids")String ids){
		//判断有没有"-"
		if(ids.contains("-")){//多个删除
			//存放数字的集合
			List<Integer> int_ids = new ArrayList<>();
			//根据-拆分传进来的数据
			String[] str_ids = ids.split("-");
			//循环将拆分的字符串转化为数字,放到集合中
			for (String str_id:str_ids) {
				int_ids.add(Integer.valueOf(str_id));
			}
			//调用多个删除的业务方法
			projectInfoService.deleteProjectInfosAny(int_ids);
		}else {//单个删除
			//将字符串转化为数字
			Integer id = Integer.valueOf(ids);
			//调用单个删除业务方法
			projectInfoService.deleteProjectInfo(id);
		}
		return Msg.success();
	}

	//根据id主键两表联查单个数据
	@RequestMapping(value = "/projectInfo/{id}",method = RequestMethod.GET)
	@ResponseBody
	public Msg getProjectInfo(@PathVariable("id") Integer pi_Id){
		//查询得到ProjectInfo对象
		ProjectInfo projectInfo = projectInfoService.getProjectInfo(pi_Id);
		return Msg.success().add("projectInfo",projectInfo);
	}

	//根据id修改数据
	@RequestMapping(value = "/projectInfo/{piId}",method = RequestMethod.PUT)
	@ResponseBody
	public Msg updateProjectInfo(ProjectInfo projectInfo){
		projectInfoService.updateProjectInfo(projectInfo);
		return Msg.success();
	}
}
