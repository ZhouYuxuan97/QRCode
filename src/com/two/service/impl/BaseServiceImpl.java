package com.two.service.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.Collection;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import com.two.dao.BaseDao;
import com.two.service.BaseService;
import com.two.util.PageResults;


@Transactional
public class BaseServiceImpl<T, ID extends Serializable> 
		implements BaseService<T, ID> {

	
	private BaseDao<T, ID> baseDao;	
	
	@Resource  
    public void setDao(BaseDao<T,ID> baseDao) {  
        this.baseDao = baseDao;  
    }  
	
	private  Class<T> clazz;
	
	public BaseServiceImpl() {

		if (clazz == null) {
			System.out.println("=============BaseDaoImpl 构造方法执行============");
			// 如果子类调用当前构造方法,this代表的是子类对象
			System.out.println(this);
			System.out.println("获取父类信息:" + this.getClass().getSuperclass());
			System.out.println("获取父类信息包括泛型信息:" + this.getClass().getGenericSuperclass());
			ParameterizedType type=(ParameterizedType)this.getClass().getGenericSuperclass();
			clazz=(Class<T>)type.getActualTypeArguments()[0];
			System.out.println("clazz:" + clazz);
		}else {
			System.out.println("clazz 不为空");
		}
		
	}	
	


	@Override
	public void save(T t) {
		baseDao.save(t);
	}

	@Override
	public void saveOrUpdate(T t) {
		baseDao.saveOrUpdate(t);
	}

	@Override
	public T load(ID id) {
		return baseDao.load(id);
	}

	@Override
	public T get(ID id) {
		System.out.println(baseDao);
		return baseDao.get(id);
	}

	@Override
	public boolean contains(T t) {
		return baseDao.contains(t);
	}

	@Override
	public void delete(T t) {
		baseDao.delete(t);
	}

	@Override
	public boolean deleteById(ID Id) {
		return baseDao.deleteById(Id);
	}

	@Override
	public void deleteAll(Collection<T> entities) {
		baseDao.deleteAll(entities);
	}

	@Override
	public void queryHql(String hqlString, Object... values) {
		baseDao.queryHql(hqlString, values);
	}


	@Override
	public T getByHQL(String hqlString, Object... values) {
		return baseDao.getByHQL(hqlString, values);
	}

	@Override
	public List<T> getListByHQL(String hqlString, Object... values) {
		return baseDao.getListByHQL(hqlString, values);
	}

	@Override
	public void refresh(T t) {
		baseDao.refresh(t);
	}

	@Override
	public void update(T t) {
		baseDao.update(t);
	}

	@Override
	public Long countByHql(String hql, Object... values) {
		return baseDao.countByHql(hql, values);
	}

	@Override
	public PageResults<T> findPageByFetchedHql(String hql, String countHql,
			int pageNo, int pageSize, Object... values) {
		return baseDao.findPageByFetchedHql(hql, countHql, pageNo, pageSize, values);
	}

}
