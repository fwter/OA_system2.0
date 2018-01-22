package com.oa.dao.jpa;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.oa.pojos.OaDismission;

public interface IOaDismissionDao extends JpaRepository<OaDismission, String>,JpaSpecificationExecutor<OaDismission>{

}
