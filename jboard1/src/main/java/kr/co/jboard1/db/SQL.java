package kr.co.jboard1.db;

public class SQL {

	
	public static final String SELECT_TERMS = "SELECT * FROM `terms`";
	
	public static final String SELECT_COUNT_UID= "select count(*) from `user` ";
	public static final String WHERE_UID= "where `uid`=? ";
	public static final String WHERE_NICK= "where `nick`=? ";
	public static final String WHERE_HP= "where `hp`=? ";
	public static final String WHERE_EMAIL= "where `email`=? ";
	
	public static final String INSERT_USER = "INSERT INTO `User` SET "
										   + "`uid`=?,"
										   + "`pass`=SHA2(?, 256),"
										   + "`name`=?,"
										   + "`nick`=?,"
										   + "`email`=?,"
										   + "`hp`=?,"
										   + "`regip`=?,"
										   + " `sms`=?, "
										   + "`rdate`=NOW()";
	
	public static final String SELECT_USER_FOR_LOGIN = "SELECT * FROM `User` WHERE `uid`=? AND `pass`=SHA2(?, 256)";

	public static final String INSERT_ARTICLE= "insert into `article` set"
			+ " `title`=?,"
			+ "`content`=?,"
			+ "`writer`=?,"
			+ "`regip`=?,"
			+ "`rdate`=now()";
	
	public static final String SELECT_COUNT_TOTAL="SELECT COUNT(*) FROM `article` as a "
			+ " join `User` as b on a.writer=b.uid where parent=0 ";
	
	public static final String SELECT_COUNT_TOTAL_SEARCH = "select count(*) from `article` where parent=0 ";
	
	public static final String SELECT_ARTICLES = "select a.*, b.`nick` from `article` as a"
			+ " join `User` as b on a.writer=b.uid "
			+ " where parent=0 ";
	
	public static final String SELECT_ARTICLES_WHERE_TITLE="and `title` like ? ";
	public static final String SELECT_ARTICLES_WHERE_CONTENT="and `content` like ? ";
	public static final String SELECT_ARTICLES_WHERE_TITLE_CONTENT="and `title` like ? or `content` like ? ";
	public static final String SELECT_ARTICLES_WHERE_WRITER="and `nick` like ? ";
	
	public static final String SELECT_ARTICLES_ORDER_LIMIT = "ORDER by `no` desc LIMIT ? , 10";
	
	public static final String SELECT_ARTICLE="SELECT * FROM `Article` WHERE `no`=? ";
	
	public static final String UPDATE_HIT_COUNT="update `article` set `hit`=`hit`+1 where `no`=? ";
	
	public static final String INSERT_COMMENT = "INSERT INTO `article` set "
			+ " `parent`=?, "
			+ " `content`=?, "
			+ " `writer`=?, "
			+ " `regip`=?, "
			+ " `rdate`=now() ";
	public static final String UPDATE_COMMENT_PLUS ="update `article` set "
			+ "`comment` = `comment` +1 where `no`=? ";
	
	public static final String UPDATE_COMMENT_MINUS ="update `article` set "
			+ "`comment` = `comment` -1 where `no`=? ";
	
	public static final String SELECT_COMMENTS = "select * from `article` as a join `user` as b"
			+ " on a.writer=b.uid where `parent`=? order by `no` asc ";
	
	public static final String DELETE_COMMENT= "delete from `article` where `no` = ?";
	
	public static final String DELETE_ARTICLE ="delete from `article` where `no` = ? or `parent`=? ";
	
	public static final String UPDATE_COMMENT="update `article` set `content` = ? where `no` = ?";

	public static final String UPDATE_ARTICLE="update `article` set `title`=?, `content`=? where `no`=? "; 


}