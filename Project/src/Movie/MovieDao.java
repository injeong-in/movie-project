package Movie;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MovieDao {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	static private MovieDao dao = new MovieDao();

	public MovieDao() {
		
		/* JNDI 연결방식으로 교체 */
		try {
			
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/Project");
			conn = ds.getConnection();
		} catch(Exception e) {
			e.printStackTrace();
		} 
			finally {
			try{
				pstmt.close();
				rs.close();
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
		
	
	
	public static MovieDao getInstance() {
		return dao;
	}
	
	public int insertProperty(MovieDTO dto) {
		
		String sql = "INSERT INTO movie_inform VALUES(?,?,?,?,?);";

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getFilmingLocation());
			pstmt.setLong(3, dto.getFigures());
			pstmt.setInt(4, dto.getReleasedYear());
			pstmt.setInt(5, dto.getAudienceNumber());
			return pstmt.executeUpdate();


		} catch (SQLException e) {
			e.printStackTrace();
			
			//Cannot add or update a child row: a foreign key constraint fails 
			//(`movie`.`movie_inform`, CONSTRAINT `movie_inform_ibfk_1` FOREIGN KEY (`released_year`) REFERENCES `genre` (`released_year`))
		}
		return -1;
	}
		
	
	
	public String deleteProperty(MovieDTO dto) {
		
		String sql = "DELETE FROM movie_inform WHERE title=?;";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getDeleteName());
			pstmt.executeUpdate();
			return "0";
			
		} catch (SQLException e) {
			e.printStackTrace();
			//Can not issue data manipulation statements with executeQuery().
			//타입이 [Movie.ActorDTO]인 bean의 프로퍼티 [deleteName]에 대한 정보를 찾을 수 없습니다.
		}
		return "-1";
	}
	
	
	
	public ArrayList<MovieDTO> getProperty(String title) {

		String sql = "SELECT title, released_year, figures, audience_number FROM movie_inform WHERE title=?";
		
		ArrayList<MovieDTO> list = new ArrayList<>();
		MovieDTO dto = new MovieDTO();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto.setTitle(rs.getString(1));
				dto.setReleasedYear(rs.getInt(2));
				dto.setFigures(rs.getLong(3));
				dto.setAudienceNumber(rs.getInt(4));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<MovieDTO> getProperty(String title, String location) {

		String sql = "SELECT title, released_year, figures, audience_number FROM movie_inform WHERE title=? && filming_location=?";
		
		ArrayList<MovieDTO> list = new ArrayList<>();
		MovieDTO dto = new MovieDTO();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, location);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto.setTitle(rs.getString(1));
				dto.setReleasedYear(rs.getInt(2));
				dto.setFigures(rs.getLong(3));
				dto.setAudienceNumber(rs.getInt(4));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static void main(String[] args) {
		
		MovieDao dao = MovieDao.getInstance();
		ArrayList<MovieDTO> list = dao.getProperty("7번방의 선물");
		System.out.println(dao.conn);
		for(MovieDTO dto:list) {
			System.out.println(dto.getTitle());
			System.out.println(dto.getReleasedYear());
			System.out.println(dto.getFigures());
			System.out.println(dto.getAudienceNumber());
		}
		
	}

}
