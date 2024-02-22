package service;

import java.util.List;

import dao.User1DAO;
import dao.User2DAO;
import dao.User3DAO;
import dao.User4DAO;
import dao.User5DAO;
import dto.User1DTO;
import dto.User2DTO;
import dto.User3DTO;
import dto.User4DTO;
import dto.User5DTO;

public class User1Service {
	private static User1Service instance = new User1Service();
	
	public static User1Service getInstance () {
		return instance;
	}
	
	private User1Service() {}
	
	private User1DAO dao = User1DAO.getInstance();
	private User2DAO dao2 = User2DAO.getInstance();
	private User3DAO dao3 = User3DAO.getInstance();
	private User4DAO dao4 = User4DAO.getInstance();
	private User5DAO dao5 = User5DAO.getInstance();
	
	//기본 CRUD
	public void insertUser1(User1DTO user) {
		dao.insertUser1(user);
	}
	
	public User1DTO selectUser1(String uid) {
		return dao.selectUser1(uid);
	}
	
	public List<User1DTO> selectUser1s() {
		return dao.selectUser1s();
	}
	
	public void updateUser1(User1DTO user) {
		dao.updateUser1(user);
	}
	
	public void deleteUser1(String uid) {
		dao.deleteUser1(uid);
	}
	
	//기본 CRUD user2
		public void insertUser2(User2DTO user) {
			dao2.insertUser2(user);
		}
		
		public User2DTO selectUser2(String uid) {
			return dao2.selectUser2(uid);
		}
		
		public List<User2DTO> selectUser2s() {
			return dao2.selectUser2s();
		}
		
		public void updateUser2(User2DTO user) {
			dao2.updateUser2(user);
		}
		
		public void deleteUser2(String uid) {
			dao2.deleteUser2(uid);
		}
		
	//기본 CRUD user3
		public void insertUser3(User3DTO user) {
			dao3.insertUser3(user);
		}
		
		public User3DTO selectUser3(String uid) {
			return dao3.selectUser3(uid);
		}
		
		public List<User3DTO> selectUser3s() {
			return dao3.selectUser3s();
		}
		
		public void updateUser3(User3DTO user) {
			dao3.updateUser3(user);
		}
		
		public void deleteUser3(String uid) {
			dao3.deleteUser3(uid);
		}
		
	//기본 CRUD user4
		public void insertUser4(User4DTO user) {
			dao4.insertUser4(user);
		}
		
		public User4DTO selectUser4(String uid) {
			return dao4.selectUser4(uid);
		}
		
		public List<User4DTO> selectUser4s() {
			return dao4.selectUser4s();
		}
		
		public void updateUser4(User4DTO user) {
			dao4.updateUser4(user);
		}
		
		public void deleteUser4(String uid) {
			dao4.deleteUser4(uid);
		}
	//기본 CRUD user5
		public void insertUser5(User5DTO user) {
			dao5.insertUser5(user);
		}
		
		public User5DTO selectUser5(String uid) {
			return dao5.selectUser5(uid);
		}
		
		public List<User5DTO> selectUser5s() {
			return dao5.selectUser5s();
		}
		
		public void updateUser5(User5DTO user) {
			dao5.updateUser5(user);
		}
		
		public void deleteUser5(String uid) {
			dao5.deleteUser5(uid);
		}
}
