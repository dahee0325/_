package com.project.member.service;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.member.dao.MemberDaoInterface;
import com.project.member.dao.MemberJdbcTemplateDao;

@Service("deleteService3")
public class MemberDeleteService3 {

	// 자동 메퍼를 이용해서 생성할 dao
	private MemberDaoInterface dao;

	// 자동 메퍼를 위한 sqlSessionTemplate 객체 주입
	// @Inject : 타입에 맞는 주입 ( java 에서 지원 : 특정 프레임워크에 의존하지 않음 )
	@Inject
	private SqlSessionTemplate template;

	public int memberDelete(int id) {

		dao = template.getMapper(MemberDaoInterface.class);

		return dao.memberDelete(id);
	}

}