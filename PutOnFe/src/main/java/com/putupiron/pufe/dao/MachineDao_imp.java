package com.putupiron.pufe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.putupiron.pufe.dto.Machine;

@Repository
public class MachineDao_imp implements MachineDao {
	@Autowired SqlSession session;
	String namespace="com.putupiron.machine.";
	
	@Override
	public List<Machine> selectAllMachines() throws Exception {
		return session.selectList(namespace+"selectAllMachines");
	}

}
