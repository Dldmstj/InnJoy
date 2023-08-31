package com.web.innjoy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.web.innjoy.vo.Bsn_user;
import com.web.innjoy.vo.User;

@Mapper
public interface AdmDao {
	//일반회원
	public List<User> ijList();
	public User getId(String user_id);
	public int ijuserDelete(String user_id);
	//사업자회원
	public List<Bsn_user> bsnList();
	public Bsn_user getBsnId(String bsn_id);
	public int bsnuserDelete(String bsn_id);
}
