package Music;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class musicDao {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	static private musicDao dao = new musicDao();


	//DB연결 JNDI 방식으로 교체
	public musicDao() {
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/Project");
			conn = ds.getConnection();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try{
				pstmt.close();
				rs.close();
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public static musicDao getInstance() {
		return dao;
	}
	
	
	//음악가져오기
	public ArrayList<musicDTO> getProperty(String movie) {

		String sql = "SELECT music_name, artist_name, movie_title, board_id FROM music WHERE movie_title LIKE ?";
		
		ArrayList<musicDTO> list = new ArrayList<>();
		char[] text = new char[17];
		movie = movie.replaceAll(" ", "");
		text = movie.toCharArray();
		String str = "";
		for(int i=0; i<text.length; i++) {
			str += String.valueOf(text[i]+"%");
		}
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, str);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				musicDTO dto = new musicDTO();
				dto.setMusicName(rs.getString(1));
				dto.setArtistName(rs.getString(2));
				dto.setMovieTitle(rs.getString(3));
				dto.setBoardID(rs.getInt(4));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public String getProperty2(String movie) {

		String sql = "SELECT music_name, artist_name, movie_title, board_id FROM music WHERE movie_title LIKE ?";
		
		ArrayList<musicDTO> list = new ArrayList<>();
		char[] text = new char[17];
		movie = movie.replaceAll(" ", "");
		text = movie.toCharArray();
		String str = "";
		for(int i=0; i<text.length; i++) {
			str += String.valueOf(text[i]+"%");
		}
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, str);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				musicDTO dto = new musicDTO();
				dto.setMusicName(rs.getString(1));
				dto.setArtistName(rs.getString(2));
				dto.setMovieTitle(rs.getString(3));
				dto.setBoardID(rs.getInt(4));
				list.add(dto);
			}
			return "0";
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "-1";
	}
	
	public String goStraight(String movie) {

		String sql = "SELECT music_name, artist_name, movie_title, board_id FROM music WHERE movie_title LIKE ?";
		
		ArrayList<musicDTO> list = new ArrayList<>();
		char[] text = new char[50];
		movie = movie.replaceAll(" ", ""); //검색어 공백제거
		text = movie.toCharArray();
		String str = "";
		for(int i=0; i<text.length; i++) {
			str += String.valueOf(text[i]+"%");
		}
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, str);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				musicDTO dto = new musicDTO();
				dto.setMusicName(rs.getString(1));
				dto.setArtistName(rs.getString(2));
				dto.setMovieTitle(rs.getString(3));
				dto.setBoardID(rs.getInt(4));
				list.add(dto);
			}
			return "0";
		} catch (SQLException e) {
			e.printStackTrace();
			return "-1";
		}
	}
	
	public static void main(String[] args) {
		
		musicDao dao = musicDao.getInstance();
		ArrayList<musicDTO> list = dao.getProperty("겨울");
		
		for(int i=0; i<list.size(); i++) {
			musicDTO dto = list.get(i);
			System.out.print(dto.getMovieTitle()+" ");
			System.out.println(dto.getMusicName());
		}
		
		
		
	}
	
}
