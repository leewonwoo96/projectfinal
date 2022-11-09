package com.putupiron.pufe.dao;

import java.util.List;

import com.putupiron.pufe.dto.Machine;

public interface MachineDao {
	List<Machine> selectAllMachines() throws Exception;
}
