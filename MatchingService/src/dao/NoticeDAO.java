package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.Notice;

public class NoticeDAO {

   SqlSession sqlSession;

   public void insertNotice(Notice notice){
      sqlSession=MybatisConfig.getSqlSessionFactory().openSession();
      sqlSession.delete("mapper.MatchingMapper.insertNotice", notice);
      sqlSession.commit();
   }
   
   public List<Notice> getNotices(String user_Id){
      List<Notice> result = new ArrayList<Notice>();
      sqlSession=MybatisConfig.getSqlSessionFactory().openSession();
      result = sqlSession.selectList("mapper.NoticeMapper.getNoticeList", user_Id);
      return result;
   }

   public void deleteNotices(int noticenum){
      sqlSession=MybatisConfig.getSqlSessionFactory().openSession();
      sqlSession.delete("mapper.NoticeMapper.deleteNotice", noticenum);
      sqlSession.commit();
   }
   
   
   
}