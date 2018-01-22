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
import com.oa.dao.jpa.IOaEmpDao;
import com.oa.dao.jpa.IOaJobDao;
import com.oa.pojos.OaDept;
import com.oa.pojos.OaEmp;
import com.oa.pojos.OaJob;
import com.oa.vo.fwt.OaEmpformvo;
import com.oa.vo.fwt.OaEmpvo;

@Service
@Transactional
public class Empservice {
	@Autowired
	IOaEmpDao empdao;
	
	@Autowired
	IOaDeptDao deptdao;
	
	@Autowired
	IOaJobDao jobdao;
	
	public List<OaJob> findJob(){
		return jobdao.queryJob();
	}
	
	/**
	 * 获取所有部门
	 * @return
	 */
	public List<OaDept> findDept(){
		List<OaDept> list = deptdao.queryDept();
		return list;
 	}
	
	public void editImg(String id,String img){
		try {
			OaEmp emp = empdao.findOne(id);
			emp.setEmpPhoto(img);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
	}
	
	public Boolean editEmp(OaEmpformvo empvo) throws Exception{
		try {
			OaEmp emp = empdao.findOne(empvo.getEmpId());
			OaEmp emp2 = topo(empvo, emp);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new Exception("编辑员工错误"+e.getMessage());
		}
	}

	private OaEmp topo(OaEmpformvo empvo, OaEmp emp) throws Exception {
		emp.setEmpName(empvo.getEmpName());
		emp.setEmpAddress(empvo.getEmpAddress());
		emp.setEmpBank(empvo.getEmpBank());
		emp.setEmpBankid(empvo.getEmpBankid());
		emp.setEmpBirth(empvo.getEmpBirth().equals("")?null:new SimpleDateFormat("yyyy-MM-dd").parse(empvo.getEmpBirth()));
		emp.setEmpCardid(empvo.getEmpCardid());
		emp.setEmpDismission(empvo.getEmpDismission().equals("")?null:new SimpleDateFormat("yyyy-MM-dd").parse(empvo.getEmpDismission()));
		emp.setEmpEmail(empvo.getEmpEmail());
		emp.setEmpEme(empvo.getEmpEme());
		emp.setEmpEmetel(empvo.getEmpEmetel());
		emp.setEmpEntrydate(empvo.getEmpEntrydate().equals("")?null:new SimpleDateFormat("yyyy-MM-dd").parse(empvo.getEmpEntrydate()));
		emp.setEmpFileid(empvo.getEmpFileid());
		emp.setEmpGraduation(empvo.getEmpGraduation().equals("")?null:new SimpleDateFormat("yyyy-MM-dd").parse(empvo.getEmpGraduation()));
		emp.setEmpHealthy(empvo.getEmpHealthy());
		emp.setEmpHigh(empvo.getEmpHigh());
		emp.setEmpLike(empvo.getEmpLike());
		emp.setEmpMajor(empvo.getEmpMajor());
		emp.setEmpMaxdegree(empvo.getEmpMaxdegree());
		emp.setEmpMaxeducation(empvo.getEmpMaxeducation());
		emp.setEmpMgr(empvo.getEmpMgr());
		emp.setEmpNation(empvo.getEmpNation());
		emp.setEmpNationality(empvo.getEmpNationality());
		emp.setEmpNative(empvo.getEmpNative());
		emp.setEmpOldname(empvo.getEmpOldname());
		emp.setEmpPhone(empvo.getEmpPhone());
		emp.setEmpPhoto(empvo.getEmpPhoto());
		emp.setEmpQq(empvo.getEmpQq());
		emp.setEmpRemark(empvo.getEmpRemark());
		emp.setEmpSchool(empvo.getEmpSchool());
		emp.setEmpSex(Integer.valueOf(empvo.getEmpSex()));
		emp.setEmpStation(empvo.getEmpStation());
		emp.setEmpTel(empvo.getEmpTel());
		emp.setEmpWeight(empvo.getEmpWeight());
		return emp;
	}
	
	/**
	 * 获取员工信息
	 * @param page
	 * @param limit
	 * @return
	 */
	public Map<String,Object> findEmppage(int page,int limit,String dept,String name,String type,String state,String begindate,String enddate){
		Sort sort = new Sort(Direction.DESC,"empId");
		Pageable p = new PageRequest(page-1, limit,sort);
		Specification<OaEmp> specification=new Specification<OaEmp>(){
			
			@Override
			public Predicate toPredicate(Root<OaEmp> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				// TODO Auto-generated method stub
				List<Predicate> list = new ArrayList<Predicate>();
				if(dept != null && !dept.equals("")){
					Join<OaEmp,OaDept> join = root.join("oaDept", JoinType.INNER);
		            Path<String> exp4 = join.get("deptId");
		            list.add(cb.equal(exp4,dept));
				}
				if(name != null && !name.equals("")){
					list.add(cb.like(root.get("empName").as(String.class), "%"+name+"%"));
				}
				if(type != null && !type.equals("")){
					list.add(cb.equal(root.get("empType").as(String.class), type));
				}
				if(state != null && !state.equals("")){
					list.add(cb.equal(root.get("empWorkstate").as(String.class), state));
				}
				if(!("".equals(begindate)) && begindate != null){
					list.add(cb.greaterThanOrEqualTo(root.get("empEntrydate"), toDate(begindate)));
				}
				if(!("".equals(enddate)) && enddate != null){
					list.add(cb.lessThanOrEqualTo(root.get("empEntrydate"), toDate(enddate)));
				}
				
				
				return cb.and(list.toArray(new Predicate[list.size()]));
			}
			
		};
		Page<OaEmp> pa= empdao.findAll(specification, p);
		List<OaEmpvo> list = empToVolist(pa.getContent());
		Map<String, Object> dataMap=new HashMap<>();
		dataMap.put("code", 0);
		dataMap.put("count", empdao.count(specification));
		dataMap.put("data", list);
		return dataMap;
	}
	
	public List<OaEmp> findAll(){
		return empdao.findAll();
	}
	
	
	/**
	 * 查询单个员工
	 * @param empId
	 * @return
	 */
	public OaEmp findOne(String empId){
		 OaEmp emp = empdao.findOne(empId);
		 return emp;
	}

	private List<OaEmpvo> empToVolist(List<OaEmp> list2) {
		// TODO Auto-generated method stub
		List<OaEmpvo> list = new ArrayList<OaEmpvo>();
		for(OaEmp o:list2){
			list.add(toVo(o));
		}
		return list;
	}

	private OaEmpvo toVo(OaEmp o) {
		// TODO Auto-generated method stub
		OaEmpvo vo = new OaEmpvo();
		OaDept dept = o.getOaDept();
		vo.setDeptName(dept.getDeptName());
		vo.setEmpName(o.getEmpName());
		vo.setEmpId(o.getEmpId());
		vo.setEmpSex(o.getEmpSex() == 1?"男":"女");
		vo.setEmpBirth(o.getEmpBirth()+"");
		vo.setEmpType(o.getEmpType() == 0?"临时工":(o.getEmpType() == 1?"合同工":"正式工"));
		vo.setEmpWorkstate(o.getEmpWorkstate() == 0?"离职":"在职");
		OaJob job = o.getOaJob();
		vo.setJobName(job.getJobName());
		vo.setJobLevel(job.getJobLevel());
		vo.setEmpEntrydate(o.getEmpEntrydate()+"");
		return vo;
	}
	
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