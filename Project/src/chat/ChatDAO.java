package chat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class ChatDAO {
	
		DataSource dataSource;

		static private ChatDAO dao = new ChatDAO();

		public ChatDAO() {
			try {
				InitialContext initContext = new InitialContext();
				Context envContext = (Context) initContext.lookup("java:/comp/env");
				dataSource = (DataSource) envContext.lookup("jdbc/Project");

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		//싱글톤 객체 리턴
		public static ChatDAO getInstance() {
			return dao;
		}

		public ArrayList<userChatDTO> getChatList(String fromID, String toID, String chatID) {
			
			ArrayList<userChatDTO> chatList = null;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			StringBuffer sql  = new StringBuffer();
			
			sql.append("SELECT*FROM CHAT WHERE  ");
			sql.append(" SELECT*FROM CHAT WHERE ((fromID = ? AND toID = ?) ");
			sql.append(" OR (fromID = ? AND toID = ?)) AND chatID > ? ORDER BY chatTime	  ");
			
			
			
			
			try {
				conn = (Connection) dataSource.getConnection();
				pstmt = conn.prepareStatement(String.valueOf(sql));
				pstmt.setString(1, fromID);
				pstmt.setString(2, toID);
				pstmt.setString(3, toID);
				pstmt.setString(4, fromID); //순서를 뒤바꿔서 넣어줌.(자신이받든 보내든 항상 가져올수있도록)
				pstmt.setInt(5, Integer.parseInt(chatID));
				chatList = new ArrayList<userChatDTO>();
				
				while(rs.next()) {
					userChatDTO dto = new userChatDTO();
					dto.setChatID(rs.getInt("chatID"));
					dto.setFromID(rs.getString("fromID").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll("<", "&gt;").replaceAll("\n", "<br>"));
					dto.setToID(rs.getString("toID").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll("<", "&gt;").replaceAll("\n", "<br>"));
					dto.setChatContent(rs.getString("chatContent").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll("<", "&gt;").replaceAll("\n", "<br>"));
					int chatTime = Integer.parseInt(rs.getString("chatTime").substring(11, 13));
					String timeType = "오전";
					if(chatTime>12) {
						timeType = "오후";
						chatTime -= 12;
						
					}
					dto.setChatTime(rs.getString("chatTime").substring(0, 11) + " " + timeType + " " + chatTime + ":" + rs.getString("chatTime").substring(14, 16)+ "");
					chatList.add(dto);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {if(conn!=null) conn.close();} catch (Exception e2) {e2.printStackTrace();}
				try {if(pstmt!=null) pstmt.close();} catch (Exception e2) {e2.printStackTrace();}
				try {if(rs!=null) rs.close();} catch (Exception e2) {e2.printStackTrace();}
			}
			
			return chatList; //리스트 반환
			
		}
		
		
		
		public ArrayList<userChatDTO> getChatListByRecent(String fromID, String toID, int number) {
			
			ArrayList<userChatDTO> chatList = null;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			StringBuffer sql  = new StringBuffer();
			
			sql.append("SELECT*FROM CHAT WHERE  ");
			sql.append(" SELECT*FROM CHAT WHERE ((fromID = ? AND toID = ?) ");
			sql.append(" OR (fromID = ? AND toID = ?)) AND chatID > (SELECT MAX(chatID) - ? FROM CHAT) ORDER BY chatTime	  ");
			
			
			
			
			try {
				conn = (Connection) dataSource.getConnection();
				pstmt = conn.prepareStatement(String.valueOf(sql));
				pstmt.setString(1, fromID);
				pstmt.setString(2, toID);
				pstmt.setString(3, toID);
				pstmt.setString(4, fromID); //순서를 뒤바꿔서 넣어줌.(자신이받든 보내든 항상 가져올수있도록)
				pstmt.setInt(5, number);
				chatList = new ArrayList<userChatDTO>();
				
				while(rs.next()) {
					userChatDTO dto = new userChatDTO();
					dto.setChatID(rs.getInt("chatID"));
					dto.setFromID(rs.getString("fromID").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll("<", "&gt;").replaceAll("\n", "<br>"));
					dto.setToID(rs.getString("toID").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll("<", "&gt;").replaceAll("\n", "<br>"));
					dto.setChatContent(rs.getString("chatContent").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll("<", "&gt;").replaceAll("\n", "<br>"));
					int chatTime = Integer.parseInt(rs.getString("chatTime").substring(11, 13));
					String timeType = "오전";
					if(chatTime>12) {
						timeType = "오후";
						chatTime -= 12;
						
					}
					dto.setChatTime(rs.getString("chatTime").substring(0, 11) + " " + timeType + " " + chatTime + ":" + rs.getString("chatTime").substring(14, 16)+ "");
					chatList.add(dto);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {if(conn!=null) conn.close();} catch (Exception e2) {e2.printStackTrace();}
				try {if(pstmt!=null) pstmt.close();} catch (Exception e2) {e2.printStackTrace();}
				try {if(rs!=null) rs.close();} catch (Exception e2) {e2.printStackTrace();}
			}
			
			return chatList; //리스트 반환
			
		}
		
		
			public int submit(String fromID, String toID, String chatContent) {
			
			ArrayList<userChatDTO> chatList = null;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			StringBuffer sql  = new StringBuffer();
			
			sql.append("INSERT INTO user_chat VALUES (NULL, ?, ?, ?, NOW())");
			
			
			
			try {
				conn = (Connection) dataSource.getConnection();
				pstmt = conn.prepareStatement(String.valueOf(sql));
				pstmt.setString(1, fromID);
				pstmt.setString(2, toID);
				pstmt.setString(3, chatContent);
				return pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {if(conn!=null) conn.close();} catch (Exception e2) {e2.printStackTrace();}
				try {if(pstmt!=null) pstmt.close();} catch (Exception e2) {e2.printStackTrace();}
				try {if(rs!=null) rs.close();} catch (Exception e2) {e2.printStackTrace();}
			}
			
			return -1; //데이터베이스 오류
			
		}
		public static void main(String[] args) {
			ChatDAO dao = ChatDAO.getInstance();
			
			ArrayList<userChatDTO> list = dao.getChatList("simazeri", "khm2456", "4");
			
			for (int i = 0; i < list.size(); i++) {
				System.out.println(list.get(i));
			}
		}
		
	}
	
