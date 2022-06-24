package com.mrli.service;

import com.mrli.dao.ProjectInfoMapper;
import com.mrli.entity.ProjectInfo;
import com.mrli.entity.ProjectInfoExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Kevin
 * @ClassName ProjectInfoService.java
 * @createTime 2022年05月20日 08:58:00
 * 项目业务操作
 */
@Service
public class ProjectInfoService {

	@Autowired
	private ProjectInfoMapper projectInfoMapper;

	//查询所有项目(两表联查)
	public List<ProjectInfo> getAll(){
		/*调用dao层中已经写好的两表联查接口，参数传递为null，代表没有查询条件*/
		return projectInfoMapper.selectByExampleWithApplicant(null);
	}

	//添加项目
	public void saveProjectInfo(ProjectInfo projectInfo){
		projectInfoMapper.insertSelective(projectInfo);
	}

	//验证申报的项目是否存在
	public boolean checkProjectInfo(String projectName){
		//创建查询
		ProjectInfoExample example = new ProjectInfoExample();
		//得到条件
		ProjectInfoExample.Criteria criteria = example.createCriteria();
		criteria.andPiProjectnameEqualTo(projectName);
		long count = projectInfoMapper.countByExample(example);
		return count == 0;//没有查询出来,返回true
	}

	//查询单个项目(两表联查)
	public ProjectInfo getProjectInfo(Integer pi_Id){
		return projectInfoMapper.selectByPrimaryKeyWithApplicant(pi_Id);
	}

	//修改项目
	public void updateProjectInfo(ProjectInfo projectInfo){
		projectInfoMapper.updateByPrimaryKeySelective(projectInfo);
	}

	//删除单个项目
	public void deleteProjectInfo(Integer id){
		projectInfoMapper.deleteByPrimaryKey(id);
	}

	//批量删除项目
	public void deleteProjectInfosAny(List<Integer> ids){
		//创建删除对象
		ProjectInfoExample example = new ProjectInfoExample();
		//得到删除对象的条件
		ProjectInfoExample.Criteria criteria = example.createCriteria();
		//将参数放到条件中
		criteria.andPiIdIn(ids);
		//根据条件删除
		projectInfoMapper.deleteByExample(example);
	}
}
