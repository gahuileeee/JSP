package kr.co.jboard1.dao;

import java.util.ArrayList;
import java.util.List;

import kr.co.jboard1.db.DBHelper;
import kr.co.jboard1.db.SQL;
import kr.co.jboard1.dto.ArticleDTO;

public class ArticleDAO extends DBHelper {
	//싱글톤
		private static ArticleDAO instance = new ArticleDAO();
		public static ArticleDAO getInstance() {
			return instance;
		}
		private ArticleDAO (){}
	
	public void inserArticle(ArticleDTO article) {
		try {
			conn= getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_ARTICLE);
			psmt.setString(1, article.getTitle());
			psmt.setString(2, article.getContent());
			psmt.setString(3, article.getWriter());
			psmt.setString(4, article.getRegip());
			psmt.executeUpdate();
			closeAll();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public ArticleDTO selectArticle(String no) {
		ArticleDTO article = new ArticleDTO();
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_ARTICLE);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				article = new ArticleDTO();
				article.setNo(rs.getString(1));
				article.setParent(rs.getString(2));
				article.setComment(rs.getString(3));
				article.setCate(rs.getString(4));
				article.setTitle(rs.getString(5));
				article.setContent(rs.getString(6));
				article.setFile(rs.getString(7));
				article.setHit(rs.getString(8));
				article.setWriter(rs.getString(9));
				article.setRegip(rs.getString(10));
				article.setRdate(rs.getString(11));
			}
			closeAll();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return article;
	}
	
	public List<ArticleDTO> selectArticles(int start){
		List<ArticleDTO> lists = new ArrayList<ArticleDTO>();
		try {
			conn = getConnection();
			psmt= conn.prepareStatement(SQL.SELECT_ARTICLES+SQL.SELECT_ARTICLES_ORDER_LIMIT);
			psmt.setInt(1, start);
			rs=psmt.executeQuery();
			while(rs.next()) {
				ArticleDTO dto = new ArticleDTO();
				dto.setNo(rs.getString(1));
				dto.setParent(rs.getString(2));
				dto.setComment(rs.getString(3));
				dto.setCate(rs.getString(4));
				dto.setTitle(rs.getString(5));
				dto.setContent(rs.getString(6));
				dto.setFile(rs.getString(7));
				dto.setHit(rs.getString(8));
				dto.setWriter(rs.getString(9));
				dto.setRegip(rs.getString(10));
				dto.setRdate(rs.getString(11));
				dto.setNick(rs.getString(12));
				lists.add(dto);
			}
			closeAll();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return lists;
	}
	
	//검색
	public List<ArticleDTO> selectArticlesForSearch(String serchType, String keyword, int start) {
		List<ArticleDTO> lists = new ArrayList<ArticleDTO>();
		//String의 불변성으로 인해 builder를 써주는 것이 좋다.
		StringBuilder sql=new StringBuilder(SQL.SELECT_ARTICLES);
		
		if(serchType.equals("title")) {
			sql.append(SQL.SELECT_ARTICLES_WHERE_TITLE) ;
		}else if(serchType.equals("content")) {
			sql.append(SQL.SELECT_ARTICLES_WHERE_CONTENT);
		}else if(serchType.equals("title_content")) {
			sql.append(SQL.SELECT_ARTICLES_WHERE_TITLE_CONTENT);
		}else if(serchType.equals("writer")) {
			sql.append(SQL.SELECT_ARTICLES_WHERE_WRITER);
		}
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql+SQL.SELECT_ARTICLES_ORDER_LIMIT);
			if(serchType.equals("title_content")) {
				psmt.setString(1, "%"+keyword+"%");
				psmt.setString(2, "%"+keyword+"%");
				psmt.setInt(3, start);	
			}else {
				psmt.setString(1, "%"+keyword+"%");	
				psmt.setInt(2, start);	
			}
			rs=psmt.executeQuery();
			while(rs.next()) {
				ArticleDTO dto = new ArticleDTO();
				dto.setNo(rs.getString(1));
				dto.setParent(rs.getString(2));
				dto.setComment(rs.getString(3));
				dto.setCate(rs.getString(4));
				dto.setTitle(rs.getString(5));
				dto.setContent(rs.getString(6));
				dto.setFile(rs.getString(7));
				dto.setHit(rs.getString(8));
				dto.setWriter(rs.getString(9));
				dto.setRegip(rs.getString(10));
				dto.setRdate(rs.getString(11));
				dto.setNick(rs.getString(12));
				lists.add(dto);
			}
			closeAll();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lists;
	}
	
	public void updateArticle(ArticleDTO article) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.UPDATE_ARTICLE);
			psmt.setString(1, article.getTitle());
			psmt.setString(2, article.getContent());
			psmt.setString(3, article.getNo());
			
			psmt.executeUpdate();
			closeAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void deleteArticle(String no) {
		try {
			conn = getConnection();
			psmt= conn.prepareStatement(SQL.DELETE_ARTICLE);
			psmt.setString(1, no);
			psmt.setString(2, no);
			psmt.executeUpdate();
			closeAll();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//사용자 정의 CRUD 메서드
	
	//댓글 등록
		public void insertComment(ArticleDTO dto) {
			try {
				// 댓글 등록하고, 부모글의 comment를 ++ 해야함. 동시에 할 것이라, 트랜잭션 처리하겠음.
				conn = getConnection();
				conn.setAutoCommit(false);
				psmt = conn.prepareStatement(SQL.INSERT_COMMENT);
				psmtEtc1 = conn.prepareStatement(SQL.UPDATE_COMMENT_PLUS);
				psmtEtc1.setString(1, dto.getParent());
				psmt.setString(1, dto.getParent());
				psmt.setString(2, dto.getContent());
				psmt.setString(3, dto.getWriter());
				psmt.setString(4, dto.getRegip());
				psmt.executeUpdate();
				psmtEtc1.executeUpdate();
				
				conn.commit();
				closeAll();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	//댓글 삭제
		public void deleteComment(String parent, String no) {
			try {
				// 댓글 등록하고, 부모글의 comment를 ++ 해야함. 동시에 할 것이라, 트랜잭션 처리하겠음.
				conn = getConnection();
				conn.setAutoCommit(false);
				psmtEtc1 = conn.prepareStatement(SQL.UPDATE_COMMENT_MINUS);
				psmtEtc1.setString(1, parent);
				
				psmt = conn.prepareStatement(SQL.DELETE_COMMENT);
				psmt.setString(1, no);
				psmt.executeUpdate();
				psmtEtc1.executeUpdate();
				conn.commit();
				closeAll();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	//댓글 조회
		public List<ArticleDTO> selectComments(String parent) {
			List<ArticleDTO> comments = new ArrayList<ArticleDTO>();
			try {
				conn = getConnection();
				psmt= conn.prepareStatement(SQL.SELECT_COMMENTS);
				psmt.setString(1, parent);
				rs = psmt.executeQuery();
				while(rs.next()) {
					ArticleDTO dto = new ArticleDTO();
					dto.setNo(rs.getString(1));
					dto.setParent(rs.getString(2));
					dto.setContent(rs.getString(6));
					dto.setWriter(rs.getString(9));
					dto.setRegip(rs.getString(10));
					dto.setNick(rs.getString("nick"));
					dto.setRdate(rs.getString("rdate"));
					comments.add(dto);
				}
				closeAll();
			}catch(Exception e) {
				e.printStackTrace();
			}
			return comments;
		}
		
		
	public int selectCountTotal() {
		int total=0;
		try {
			conn = getConnection();
			psmt= conn.prepareStatement(SQL.SELECT_COUNT_TOTAL);
			rs = psmt.executeQuery();
			if(rs.next()) {
			 total = rs.getInt(1);
			}
			closeAll();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return total;
	}
	
	public int  selectCountTotalSearch(String searchType, String keyword) {
		int total=0;
		StringBuilder sql=new StringBuilder(SQL.SELECT_COUNT_TOTAL) ;
		
		if(searchType.equals("title")) {
			sql.append(SQL.SELECT_ARTICLES_WHERE_TITLE) ;
		}else if(searchType.equals("content")) {
			sql.append(SQL.SELECT_ARTICLES_WHERE_CONTENT);
		}else if(searchType.equals("title_content")) {
			sql.append(SQL.SELECT_ARTICLES_WHERE_TITLE_CONTENT);
		}else if(searchType.equals("writer")) {
			sql.append(SQL.SELECT_ARTICLES_WHERE_WRITER);
		}
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql.toString());
			if(searchType.equals("title_content")) {
				psmt.setString(1, "%"+keyword+"%");
				psmt.setString(2, "%"+keyword+"%");
			}else {
				psmt.setString(1, "%"+keyword+"%");	
			}
			rs=psmt.executeQuery();
			if(rs.next()) {
				 total = rs.getInt(1);
			}
			closeAll();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return total;
	}
	

	public void updateHitCount(String no) {
		try {
			conn = getConnection();
			psmt= conn.prepareStatement(SQL.UPDATE_HIT_COUNT);
			psmt.setString(1, no);
			psmt.executeUpdate();
			closeAll();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//댓글 수정
	public void updateComment(ArticleDTO comment) {
		try {
			conn=getConnection();
			psmt =conn.prepareStatement(SQL.UPDATE_COMMENT);
			psmt.setString(1, comment.getContent());
			psmt.setString(2, comment.getNo());
			psmt.executeUpdate();
			closeAll();
		} catch (Exception e) {
			e.printStackTrace();
			}
	}
	
}
