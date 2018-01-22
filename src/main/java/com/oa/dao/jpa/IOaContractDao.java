package com.oa.dao.jpa;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.oa.pojos.OaContract;

public interface IOaContractDao extends JpaRepository<OaContract, String>,JpaSpecificationExecutor<OaContract>{
	
}
