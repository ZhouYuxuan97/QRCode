package com.two.service;

import java.util.List;

import com.two.po.Transform;


/**
 * 
 * @ClassName TransformService.java
 * @Description 二维码转换数据的service层
 * @Author 赵焜松
 * @Time 2017年7月23日 上午9:19:02
 *
 */
public interface TransformService extends BaseService<Transform, Integer>{
	
	/**
	 * 
	 * @Title: findById
	 * @Author: 赵焜松
	 * @Description: 根据id查询转换信息
	 * @param id
	 * @return Transform
	 *
	 */
	public Transform findByUUID(String uuid);
	
	/**
	 * 
	 * @Title: saveData
	 * @Author: 赵焜松
	 * @Description: 保存转换信息
	 * @param transform void
	 *
	 */
	public void saveData(Transform transform);
	
	/**
	 * 
	 * @Title: findByUserid
	 * @Author: 赵焜松
	 * @Description: 根据userid查询
	 * @param userid
	 * @return List<Transform>
	 *
	 */
	public List<Transform> findByUserid(Integer userid);
	
	/**
	 * 
	 * @Title: updateByUUID
	 * @Author: 赵焜松
	 * @Description: 根据uuid修改detail
	 * @param transform void
	 *
	 */
	public void updateByUUID(Transform transform);
}
