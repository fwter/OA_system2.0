package com.oa.service.fwt;

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
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oa.dao.jpa.IOaContractDao;
import com.oa.pojos.OaContract;
import com.oa.pojos.OaDept;
import com.oa.pojos.OaEmp;
import com.oa.vo.fwt.OaContractvo;

@Service
@Transactional
public class Contractservice {
	@Autowired
	IOaContractDao condao;
	
	/**
	 * 查询合同信息
	 * @param page
	 * @param limit
	 * @param dept
	 * @param name
	 * @param type
	 * @param state
	 * @param enddate
	 * @return
	 */
	public Map<String,Object> queryContract(int page,int limit,String dept,String name,String type,String state,String enddate){
		Pageable pageable = new PageRequest(page-1, limit);
		Specification<OaContract> specification=new Specification<OaContract>(){
			
			@Override
			public Predicate toPredicate(Root<OaContract> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				// TODO Auto-generated method stub
				List<Predicate> list = new ArrayList<Predicate>();
				if(dept != null && !dept.equals("")){
					Join<OaContract,OaEmp> join = root.join("oaEmp", JoinType.INNER);
					Join<OaEmp, OaDept> join2 = join.join("oaDept",JoinType.INNER);
		            Path<String> exp4 = join2.get("deptId");
		            list.add(cb.equal(exp4,dept));
				}
				if(name != null && !name.equals("")){
					Join<OaContract,OaEmp> join = root.join("oaEmp", JoinType.INNER);
					list.add(cb.like(join.get("empName").as(String.class), "%"+name+"%"));
				}
				if(type != null && !type.equals("")){
					list.add(cb.equal(root.get("conType").as(String.class), type));
				}
				if(state != null && !state.equals("")){
					list.add(cb.equal(root.get("conState").as(String.class), state));
				}
				if(!("".equals(enddate)) && enddate != null){
					list.add(cb.like(root.get("conEnddate").as(String.class), enddate+"%"));
				}
				
				
				return cb.and(list.toArray(new Predicate[list.size()]));
			}
			
		};
		Page<OaContract> pa= condao.findAll(specification, pageable);
		List<OaContractvo> list = empToVolist(pa.getContent());
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("code", 0);
		map.put("count", condao.count(specification));
		map.put("data", list);
		return map;
	}
	
	/**
	 * 查询单条合同记录
	 * @param id
	 * @return
	 */
	public OaContract queryOne(String id){
		return condao.findOne(id);
		
	}
	
	/**
	 * 修改结束日期
	 * @param id
	 * @param date
	 * @return
	 * @throws Exception
	 */
	public Boolean editEnddate(String id,String date) throws Exception{
		try{
			OaContract contract = condao.findOne(id);
			contract.setConEnddate(new SimpleDateFormat("yyyy-MM-dd").parse(date));
			contract.setConState(1);
			return true;
		}catch(Exception e){
			throw new Exception("续签失败"+e.getMessage());
		}
	}
	
	/**
	 * 终止
	 * @param id
	 * @param date
	 * @return
	 * @throws Exception
	 */
	public Boolean editStopdate(String id) throws Exception{
		try {
			OaContract contract = condao.findOne(id);
			contract.setConStopdate(new Date());
			contract.setConState(0);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new Exception("终止有误"+e.getMessage());
		}
	}
	
	/**
	 * List<OaContract>  转 List<OaContractvo>
	 * @param list2
	 * @return
	 */
	private List<OaContractvo> empToVolist(List<OaContract> list2) {
		// TODO Auto-generated method stub
		List<OaContractvo> list = new ArrayList<OaContractvo>();
		for(OaContract o:list2){
			if(o.getConState() == 1 && null != o.getConEnddate() && (new Date()).after(o.getConEnddate())){
				o.setConState(2);
			}
			list.add(toVo(o));
		}
		return list;
	}

	/**
	 * OaContract 转 OaContractvo
	 * @param o
	 * @return
	 */
	private OaContractvo toVo(OaContract o) {
		// TODO Auto-generated method stub
		OaContractvo con = new OaContractvo();
		OaEmp emp = o.getOaEmp();
		OaDept dept = emp.getOaDept();
		con.setConId(o.getConId());
		con.setDeptName(dept.getDeptName());
		con.setEmpName(emp.getEmpName());
		con.setConType(o.getConType() == 1?"无固定期限":"有固定期限");
		con.setConSigndate(o.getConSigndate()+"");
		con.setConEnddate(o.getConEnddate() == null?"无":o.getConEnddate()+"");
		con.setConStopdate(o.getConStopdate() == null?"无":o.getConStopdate()+"");
		con.setConState(o.getConState() == 0?"解除":(o.getConState() == 1?"有效":"过期"));
		return con;
		
	}
}
