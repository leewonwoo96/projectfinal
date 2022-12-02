package com.putupiron.pufe.dao;

import java.util.List;

import com.putupiron.pufe.dto.Goods;

public interface GoodsDao {

	List<Goods> allGoods(String option) throws Exception;
	int purchase(String user_email, String prod_name) throws Exception;
	int modifygoods(Goods goods) throws Exception;
	List<Goods> Goodscor() throws Exception;
	int write(Goods goods) throws Exception;
	int remove(Integer goods_no) throws Exception;
}