package com.putupiron.pufe;

public interface UserDao {
	User	selectUser(String user_email) throws Exception;
	int		join(JoinData joinData) throws Exception;
}