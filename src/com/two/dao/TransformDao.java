package com.two.dao;

import java.util.List;

import com.two.po.Transform;

/**
 * 
 * @ClassName TransformDao.java
 * @Description 二维码转换信息
 * @Author 赵焜松
 * @Time 2017年7月21日 下午12:36:06
 *
 */
public interface TransformDao extends BaseDao<Transform,Integer>{

	/**
	 * 
	 * @Title: findByUUID
	 * @Author: 赵焜松
	 * @Description: 根据uuid查询Transform对象的信息
	 * @param id
	 * @return Transform
	 *
	 */
	public Transform findByUUID(String uuid);
	
	/**
	 * 
	 * @Title: saveData
	 * @Author: 赵焜松
	 * @Description: 保存二维码转换的数据
	 * @param transform void
	 *
	 */
	public void saveData(Transform transform);
	
	/**
	 * 
	 * @Title: findByUserid
	 * @Author: 赵焜松
	 * @Description: 根据userid查询转换信息
	 * @param userid
	 * @return Transform
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
