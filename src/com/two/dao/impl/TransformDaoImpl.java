package com.two.dao.impl;


import java.util.List;

import org.hibernate.Query;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

import com.two.dao.TransformDao;
import com.two.po.Transform;

/**
 * 
 * @ClassName TransformDaoImpl.java
 * @Description Transform的Dao实现
 * @Author 赵焜松
 * @Time 2017年7月23日 上午9:17:06
 *
 */
@Repository("transformDao")
@Lazy(true)
public class TransformDaoImpl extends BaseDaoImpl<Transform, Integer> implements TransformDao {

	@Override
	public Transform findByUUID(String uuid) {
		String hql = "from Transform where uuid = ?";
		Query query = this.getSession().createQuery(hql);
		query.setString(0, uuid);
		return (Transform) query.uniqueResult();
	}
	
	@Override
	public void saveData(Transform transform) {
		this.save(transform);
	}
	
	@Override
	public List<Transform> findByUserid(Integer userid) {
		String hql = "from Transform where userid = ?";
		Query query = this.getSession().createQuery(hql);
		query.setLong(0, userid);
		return query.list();
	}
	
	@Override
	public void updateByUUID(Transform transform) {
		this.update(transform);
	}

}
