package com.two.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.two.dao.BaseDao;
import com.two.dao.TransformDao;
import com.two.po.Transform;
import com.two.service.TransformService;


/**
 * 
 * @ClassName TransformServiceImpl.java
 * @Description 转换的service层实现
 * @Author 赵焜松
 * @Time 2017年7月23日 上午9:28:15
 *
 */
@Service("transformService")
@Transactional
public class TransformServiceImpl extends BaseServiceImpl<Transform, Integer> implements TransformService{

	@Resource
	private TransformDao transformDao;
	
	//这步很关键，否则，该Service不能调用其父类的方法，即BaseServiceImpl
	@Resource(name="transformDao")
	public void setDao(BaseDao<Transform, Integer> baseDao) {
		super.setDao(baseDao);
	}
	
	@Override
	public Transform findByUUID(String uuid) {
		
		return transformDao.findByUUID(uuid);
	}

	@Override
	public void saveData(Transform transform) {
		
		transformDao.saveData(transform);
	}

	@Override
	public List<Transform> findByUserid(Integer userid) {
		
		return transformDao.findByUserid(userid);
	}

	@Override
	public void updateByUUID(Transform transform) {
		
		transformDao.updateByUUID(transform);
	}
	
	
}
