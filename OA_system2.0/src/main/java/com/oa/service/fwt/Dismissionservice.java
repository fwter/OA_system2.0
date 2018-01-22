package com.oa.service.fwt;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oa.dao.jpa.IOaDeptDao;
import com.oa.dao.jpa.IOaDismissionDao;
import com.oa.dao.jpa.IOaJobDao;
import com.oa.pojos.OaDept;
import com.oa.pojos.OaDismission;
import com.oa.pojos.OaEmp;
import com.oa.pojos.OaJob;
import com.oa.vo.fwt.OaDismissionvo;

@Service
@Transactional
public class Dismissionservice {

	@Autowired
	IOaDismissionDao disdao;
	
	@Autowired
	IOaDeptDao deptdao;
	
	@Autowired
	IOaJobDao jobdao;
	
	/**
	 * 查询所有部门
	 * @return
	 */
	public List<OaDept> queryDept(){
		return (List<OaDept>)deptdao.findAll();
	}
	
	/**
	 * 查询所有职位
	 * @return
	 */
	public List<OaJob> queryJob(){
		return (List<OaJob>)jobdao.findAll();
	}
	
	/**
	 * 查询离职记录
	 * @param page
	 * @param limit
	 * @param dept
	 * @param name
	 * @param job
	 * @param begindate
	 * @param enddate
	 * @return
	 */
	public Map<String,Object> queryDis(int page,int limit,String dept,String name,String job,String begindate,String enddate){
		Sort sort = new Sort(Direction.DESC,"disId");
		Pageable p = new PageRequest(page-1, limit,sort);
		Specification<OaDismission> specification=new Specification<OaDismission>(){
			
			@Override
			public Predicate toPredicate(Root<OaDismission> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				// TODO Auto-generated method stub
				List<Predicate> list = new ArrayList<Predicate>();
				if(dept != null && !dept.equals("")){
					Join<OaDismission,OaEmp> join = root.join("oaEmp", JoinType.INNER);
					Join<OaEmp, OaDept> join2 = join.join("oaDept",JoinType.INNER);
		            Path<String> exp4 = join2.get("deptId");
		            list.add(cb.equal(exp4,dept));
				}
				if(name != null && !name.equals("")){
					Join<OaDismission,OaEmp> join = root.join("oaEmp", JoinType.INNER);
					list.add(cb.like(join.get("empName").as(String.class), "%"+name+"%"));
				}
				if(job != null && !job.equals("")){
					Join<OaDismission,OaEmp> join = root.join("oaEmp", JoinType.INNER);
					Join<OaEmp,OaJob> join2 = join.join("oaJob",JoinType.INNER);
					list.add(cb.equal(join2.get("jobId").as(String.class), job));
				}
				if(!("".equals(begindate)) && begindate != null){
					list.add(cb.greaterThanOrEqualTo(root.get("disDate"), toDate(begindate)));
				}
				if(!("".equals(enddate)) && enddate != null){
					list.add(cb.lessThanOrEqualTo(root.get("disDate"), toDate(enddate)));
				}
				
				
				return cb.and(list.toArray(new Predicate[list.size()]));
			}
			
		};
		Page<OaDismission> pa= disdao.findAll(specification, p);
		Map<String, Object> dataMap=new HashMap<>();
		dataMap.put("code", 0);
		dataMap.put("count", disdao.count(specification));
		dataMap.put("data", disToVolist(pa.getContent()));
		return dataMap;
	}
	
	/**
	 * List<OaDismission>转List<OaDismissionvo>
	 * @param list2
	 * @return
	 */
	private List<OaDismissionvo> disToVolist(List<OaDismission> list2) {
		// TODO Auto-generated method stub
		List<OaDismissionvo> list = new ArrayList<OaDismissionvo>();
		for(OaDismission o:list2){
			list.add(toVo(o));
		}
		return list;
	}

	/**
	 * OaDismission转OaDismissionvo
	 * @param o
	 * @return
	 */
	private OaDismissionvo toVo(OaDismission o) {
		// TODO Auto-generated method stub
		OaDismissionvo odv = new OaDismissionvo();
		OaEmp emp = o.getOaEmp();
		OaDept dept = emp.getOaDept();
		odv.setDeptName(dept.getDeptName());
		OaJob oaJob = emp.getOaJob();
		odv.setJobName(oaJob.getJobName());
		odv.setEmpName(emp.getEmpName());
		odv.setDisApplaydate(o.getDisApplydate()+"");
		odv.setDisInworkdate(o.getDisInworkdate()+"");
		odv.setDisDate(o.getDisDate()+"");
		odv.setDisType(o.getDisType() == 1?"自动离职":(o.getDisType() == 2?"病退":"辞退"));
		odv.setDisReason(o.getDisReason());
		return odv;
	}

	/**
	 * String转Date
	 * @param date
	 * @return
	 */
	private Date toDate(String date){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			return sdf.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
}
