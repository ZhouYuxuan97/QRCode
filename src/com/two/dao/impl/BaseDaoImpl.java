package com.two.dao.impl;
 
import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.ScrollableResults;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.two.util.PageResults;


 
/**
 * @ClassName: BaseDao
 * @Description: baseDao实现
 * @author Ck
 *
 */
@SuppressWarnings("unchecked")
@Transactional
@Repository("baseDao")
@Lazy(true)
public class BaseDaoImpl<T, ID extends Serializable>{//implements BaseService<T, ID>
     
	@Resource
	private SessionFactory sessionFactory ;
	
	
    protected Session getSession(){	
    	System.out.println("getCurrentSession");
    	return sessionFactory.getCurrentSession();
    }
    
    private  Class<T> clazz;
 
	
	public BaseDaoImpl() {

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
 
  /**
   * <保存实体>
   * <完整保存实体>
   */
    public void save(T t) {
        this.getSession().save(t);
 
    }
     
    /**
     * <保存或者更新实体>
     * @param t 实体
     */
    public void saveOrUpdate(T t) {
        this.getSession().saveOrUpdate(t);
    }
     
    /**
     * <load>
     * <加载实体的load方法>
     * @param id 实体的id
     * @return 查询出来的实体
     */
    public T load(ID id) {
        T load = (T) this.getSession().load(clazz.getName(), id);
        return load;
    }
     
    /**
     * <get>
     * <查找的get方法>
     * @param id 实体的id
     * @return 查询出来的实体
     */
    public T get(ID id) {
        T load = (T) this.getSession().get(clazz.getName(), id);
        return load;
    }
     
    /**
     * <contains>
     * @param t 实体
     * @return 是否包含
     */
    public boolean contains(T t) {
        return this.getSession().contains(t);
    }
 
    /**
     * <delete>
     * <删除表中的t数据>
     * @param t 实体
     */
    public void delete(T t) {
        this.getSession().delete(t);
    }
     
    /**
     * <根据ID删除数据>
     * @param Id 实体id
     * @return 是否删除成功
     */
    public boolean deleteById(ID Id) {
         T t = get(Id);
         if(t == null){
             return false;
         }
         delete(t);
        return true;
    }
 
    /**
     * <删除所有>
     * @param entities 实体的Collection集合
     */
    public void deleteAll(Collection<T> entities) {
        for(Object entity : entities) {
            this.getSession().delete(entity);
        }
    }
 
    /**
     * <执行Hql语句>
     * @param hqlString hql
     * @param values 不定参数数组
     */
    public void queryHql(String hqlString, Object... values) {
        Query query = this.getSession().createQuery(hqlString);
        if (values != null)
        {
            for (int i = 0; i < values.length; i++)
            {
                query.setParameter(i, values[i]);
            }
        }
        query.executeUpdate();
    }
    
    /**
     * <根据HQL语句查找唯一实体>
     * @param hqlString HQL语句
     * @param values 不定参数的Object数组
     * @return 查询实体
     */
  
    public T getByHQL(String hqlString, Object... values) {
    	
        Query query = this.getSession().createQuery(hqlString);
        if (values != null)
        {
            for (int i = 0; i < values.length; i++)
            {
                query.setParameter(i, values[i]);
            }
        }
        return (T) query.uniqueResult();
    }
 
   /* *//**
     * <根据SQL语句查找唯一实体>
     * @param sqlString SQL语句
     * @param values 不定参数的Object数组
     * @return 查询实体
     *//*
    public T getBySQL(String sqlString, Object... values) {
    	
        Query query = this.getSession().createSQLQuery(sqlString);
        if (values != null)
        {
            for (int i = 0; i < values.length; i++)
            {
                query.setParameter(i, values[i]);
            }
        }
        return (T) query.uniqueResult();
    }*/
 
    /**
     * <根据HQL语句，得到对应的list>
     * @param hqlString HQL语句
     * @param values 不定参数的Object数组
     * @return 查询多个实体的List集合
     */
    public List<T> getListByHQL(String hqlString, Object... values) {
    	
        Query query = this.getSession().createQuery(hqlString);
        
        if (values != null)
        {
            for (int i = 0; i < values.length; i++)
            {
                query.setParameter(i, values[i]);
            }
        }
        return query.list();
    }
 
    /**
     * <根据SQL语句，得到对应的list>
     * @param sqlString HQL语句
     * @param values 不定参数的Object数组
     * @return 查询多个实体的List集合
     */
    public List<T> getListBySQL(String sqlString, Object... values ) {
        Query query = this.getSession().createSQLQuery(sqlString);
        if (values != null)
        {
            for (int i = 0; i < values.length; i++)
            {
                query.setParameter(i, values[i]);
            }
        }
        return query.list();
    }
     
  
    /**
     * <refresh>
     * @param t 实体
     */
    public void refresh(T t) {
        this.getSession().refresh(t);
    }
 
    /**
     * <update>
     * @param t 实体
     */
    public void update(T t) {
        this.getSession().update(t);
    }
     
    /**
     * <根据HQL得到记录数>
     * @param hql HQL语句
     * @param values 不定参数的Object数组
     * @return 记录总数
     */
    public Long countByHql(String hql, Object... values) {
        Query query = this.getSession().createQuery(hql);
        if(values != null){
            for(int i = 0; i < values.length; i++) {
                query.setParameter(i, values[i]);
            }
        }
        return (Long) query.uniqueResult();
    }
 
    /**
     * <HQL分页查询>
     * @param hql HQL语句
     * @param countHql 查询记录条数的HQL语句
     * @param pageNo 下一页
     * @param pageSize 一页总条数
     * @param values 不定Object数组参数
     * @return PageResults的封装类，里面包含了页码的信息以及查询的数据List集合
     */
    public PageResults<T> findPageByFetchedHql(String hql, String countHql,
            int pageNo, int pageSize, Object... values) {
    	
        PageResults<T> retValue = new PageResults<T>();
        
        Query query = this.getSession().createQuery(hql);
        
        if(values != null){
            for(int i = 0; i < values.length; i++) {
                query.setParameter(i, values[i]);
            }
        }
        
        int currentPage = pageNo > 1 ? pageNo : 1;
        retValue.setCurrentPage(currentPage);
        retValue.setPageSize(pageSize);
        if (countHql == null)
        {
            ScrollableResults results = query.scroll();
            results.last();
            retValue.setTotalCount(results.getRowNumber() + 1);// 设置总记录数
        }
        else
        {
            Long count = countByHql(countHql, values);
            retValue.setTotalCount(count.intValue());
        }
        retValue.resetPageNo();
        List<T> itemList = query.setFirstResult((currentPage - 1) * pageSize).setMaxResults(pageSize).list();
        if (itemList == null)
        {
            itemList = new ArrayList<T>();
        }
        retValue.setResults(itemList);
         
        return retValue;
    }
}