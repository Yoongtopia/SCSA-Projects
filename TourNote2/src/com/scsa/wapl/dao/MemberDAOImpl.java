package com.scsa.wapl.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scsa.wapl.entity.Member;

@Repository
public class MemberDAOImpl implements MemberDAO {

	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	public void setSqlSessiontemplate(SqlSessionTemplate sqlSessiontemplate) {
		this.sqlSessionTemplate = sqlSessiontemplate;
	}
	
	@Override
	public void insertMember(Member member) {
		sqlSessionTemplate.insert("Member.insertMember", member);
	}

	@Override
	public Member login(String memberId, String password) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("password", password);
		return sqlSessionTemplate.selectOne("Member.login", map);
	}

	@Override
	public void updateMember(Member member) {
		sqlSessionTemplate.update("Member.updateMember", member);
	}

	@Override
	public void updateMemberStatus(String memberId) {
		sqlSessionTemplate.update("Member.updateMemberStatus", memberId);
	}

	@Override
	public void deleteMember(String memberId) {
		sqlSessionTemplate.delete("Member.deleteMember", memberId);
	}

	@Override
	public Member selectMember(String memberId) {
		return sqlSessionTemplate.selectOne("Member.selectMember", memberId);
	}

	@Override
	public List<Member> selectMemberList() {
		return sqlSessionTemplate.selectList("Member.selectMemberList");
	}

	@Override
	public List<Member> selectMemberListByStatus(String status) {
		return sqlSessionTemplate.selectList("Member.selectMemberListByStatus", status);
	}

	@Override
	public String selectMemberId(String memberId) {		
		return sqlSessionTemplate.selectOne("Member.selectMemberId",memberId);
	}

	@Override
	public String selectMemberEmail(String memberEmail) {
		return sqlSessionTemplate.selectOne("Member.selectMemberEmail",memberEmail);
	}

}//end class