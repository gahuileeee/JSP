package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.catalina.User;

import db.DBHelper;
import dto.User2DTO;

public class User2DAO extends DBHelper {
	private static User2DAO instance = new User2DAO();
	public static User2DAO getInstance() {
		return instance;
	}
	
	private User2DAO(){}
	
	//기본 CRUD
	public void insertUser2(User2DTO user) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("Insert Into `User2` values (?,?,?,?)");
			psmt.setString(1, user.getUid());
			psmt.setString(2, user.getName());
			psmt.setString(3, user.getBirth());
			psmt.setString(4, user.getAddr());
			psmt.executeUpdate();
			closeAll();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public User2DTO selectUser2(String uid) {
		User2DTO user = null;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("select * from `User2` where `uid` =?");
			psmt.setString(1, uid);
			rs = psmt.executeQuery();

			if(rs.next()) {
				user = new User2DTO();
				user.setUid(rs.getString(1));
				user.setName(rs.getString(2));
				user.setBirth(rs.getString(3));
				user.setAddr(rs.getString(4));
			}
			
			closeAll();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public List<User2DTO> selectUser2s() {
		List<User2DTO> users = new ArrayList<User2DTO>();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from `User2`");
			
			while(rs.next()) {
				User2DTO user = new User2DTO();
				user.setUid(rs.getString(1));
				user.setName(rs.getString(2));
				user.setBirth(rs.getString(3));
				user.setAddr(rs.getString(4));
				users.add(user);
			}
			
			closeAll();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}
	
	public void updateUser2(User2DTO user) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("update `user2` set `name` = ? , `birth` = ? ,"
					+ " `addr`=? where `uid` = ?");
			psmt.setString(1, user.getName());
			psmt.setString(2, user.getBirth());
			psmt.setString(3, user.getAddr());
			psmt.setString(4, user.getUid());
			psmt.executeUpdate();
			closeAll();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void deleteUser2(String uid) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("delete from `User2` where `uid` = ?");
			psmt.setString(1, uid);
			psmt.executeUpdate();
			closeAll();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
