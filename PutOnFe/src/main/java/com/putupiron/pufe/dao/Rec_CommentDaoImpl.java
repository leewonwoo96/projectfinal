package com.putupiron.pufe.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.putupiron.pufe.dto.Rec_Comment;

@Repository
public class Rec_CommentDaoImpl implements CommentDao {
	@Autowired
	SqlSession session; // session 주입, sql명령을 수행하는데 필요한 메서드 제공 
	String namespace ="com.putupiron.recommend_comment.";
	

	@Override
	public int count(Integer rec_num )throws Exception{
		return session.selectOne(namespace+"count", rec_num);
	}
	
	
	@Override
	public int remove(Integer rec_com_num, String user_email) throws Exception {
		Map map = new HashMap();
		map.put("rec_com_num", rec_com_num);
		map.put("user_email", user_email);
		return session.delete(namespace+"delete",map);
	}
	
	
	@Override
	public int write(Rec_Comment rec_comment) {
		return session.insert(namespace+"insert", rec_comment);
	}
	
	@Override
	public List<Rec_Comment> selectAll(Integer rec_num) throws Exception{
		return session.selectList(namespace+"selectAll", rec_num);
	}
	
	@Override
	public Rec_Comment select (Integer rec_num) {
		return session.selectOne(namespace+"select", rec_num);
	}
	
	@Override
	public int update(Rec_Comment rec_comment) {
		return session.update(namespace+"update", rec_comment);
	}
}
