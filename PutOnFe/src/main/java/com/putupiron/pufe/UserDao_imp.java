package com.putupiron.pufe;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao_imp implements UserDao {
	@Autowired
	SqlSession session;
	String namespace="com.putupiron.pufe.";
	
	@Override
	public User selectUser(String user_email) throws Exception{
		return session.selectOne(namespace+"selectUser",user_email);
	}
	@Override
	public int join(JoinData joinData) throws Exception {
		return session.insert(namespace+"join",joinData);
	}
}
