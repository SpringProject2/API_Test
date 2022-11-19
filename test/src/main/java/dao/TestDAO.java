package dao;

import org.apache.ibatis.session.SqlSession;

import vo.TestVO;

public class TestDAO {
	SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int insert(TestVO vo) {
		int res = sqlSession.insert("t.insert1", vo);
		return res;
	}
	
	public TestVO selectEmail(String email) {
		TestVO vo = sqlSession.selectOne("t.select1", email);
		return vo;
	}
}
