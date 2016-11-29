package dao;

import org.apache.ibatis.session.SqlSession;

import vo.Grounds;

public class GroundDAO {
	SqlSession sqlSession = null;
	
	//그라운드를 뒤져서 위도, 경도, GroundID를 가지고 오기
	public Grounds getLaLo(String ground_name) {
		sqlSession=MybatisConfig.getSqlSessionFactory().openSession();
		Grounds getGrounds=new Grounds();
		getGrounds=sqlSession.selectOne("mapper.MatchingMapper.getLaLo", ground_name);
		sqlSession.close();
		return getGrounds;
	}
}
