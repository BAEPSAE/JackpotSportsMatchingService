package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.Board;
import vo.Player;

public class BoardDAO {
/*
 * 글쓰기 insert() Board
 * 글목록 select() Board
 * 글삭제 delete() Board
 * 글수정 update() Board
 * 리플달기 insert() Reply
 * 리플 삭제 delete() Reply
 * 리플 수정 update() Reply
 * 리플 목록 select() Board
*/	
	SqlSession sqlSession = null;
	public ArrayList<Board> getBoardList(){
		sqlSession=MybatisConfig.getSqlSessionFactory().openSession();
		List<Board> list= sqlSession.selectList("mapper.BoardMapper.getBoardList");
		sqlSession.commit();
		sqlSession.close();
		return (ArrayList<Board>) list;
	}
	public int insertBoard(Board board){
		sqlSession=MybatisConfig.getSqlSessionFactory().openSession();
		int result=sqlSession.insert("mapper.BoardMapper.insertBoard",board);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	public Board getBoard(int boardNum){
		sqlSession=MybatisConfig.getSqlSessionFactory().openSession();
		Board result=sqlSession.selectOne("mapper.BoardMapper.getBoard",boardNum);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	public void deleteBoard(int boardNum) {
		sqlSession=MybatisConfig.getSqlSessionFactory().openSession();
		sqlSession.delete("mapper.BoardMapper.deleteBoard",boardNum);
		sqlSession.commit();
		System.out.println("삭제끝");
		sqlSession.close();
	}
	public int updateBoard(Board board){
		sqlSession=MybatisConfig.getSqlSessionFactory().openSession();
		int result=sqlSession.update("mapper.BoardMapper.updateBoard",board);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	
}
