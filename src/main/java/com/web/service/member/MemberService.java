package com.web.service.member;

import java.sql.SQLException;
import java.util.List;

import com.web.controller.member.Member;


public interface MemberService {

	List<Member> getList() throws ClassNotFoundException, SQLException;
	Member getOne() throws ClassNotFoundException, SQLException;
	public int getCount() throws ClassNotFoundException, SQLException;
	public int insert(Member member) throws SQLException, ClassNotFoundException;
	public int update(Member member) throws SQLException, ClassNotFoundException;
	int delete(int pId) throws ClassNotFoundException, SQLException;
	
}
