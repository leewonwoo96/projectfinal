package com.putupiron.pufe.dao;

import java.util.List;

import com.putupiron.pufe.dto.Rec_Comment;

public interface CommentDao {

	int count(Integer rec_num) throws Exception;

	int remove(Integer rec_com_num, String user_email) throws Exception;

	int write(Rec_Comment rec_comment);

	List<Rec_Comment> selectAll(Integer rec_num) throws Exception;

	Rec_Comment select(Integer rec_num);

	int update(Rec_Comment rec_comment);

}