package Practice;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.catalina.Context;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import Music.musicDTO;

public class DaoJNDI {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private DataSource dataFactory;
	private InitialContext ctx;
	
	
	static private DaoJNDI dao = new DaoJNDI();
	
	public DaoJNDI() {
		try {
		ctx = new InitialContext();
		Context envCtx = (Context) ctx.lookup("java:comp/env");
		
		dataFactory = (DataSource) ((InitialContext) envCtx).lookup("jdbc/Project");
		
		
		} catch(Exception e) {
			System.out.println("데이터베이스 오류입니다");
			e.printStackTrace();
		}
	}
	
	static public DaoJNDI getInstance() {
		return dao;
	}
	
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
			conn = (Connection) dataFactory.getConnection();
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
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
	
	public static void main(String[] args) {
		
		DaoJNDI dao = getInstance();
		
		ArrayList<musicDTO> list = dao.getProperty("겨울");
		
		for(int i=0; i<list.size(); i++) {
			musicDTO dto = list.get(i);
			System.out.print(dto.getMovieTitle()+" ");
			System.out.println(dto.getMusicName());
		}
		
	}
	
	
	
	
}
