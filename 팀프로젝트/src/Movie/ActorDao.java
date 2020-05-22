package Movie;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ActorDao implements Crud{

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	static private ActorDao dao = new ActorDao();

	public ActorDao() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/movie?"; //
			String dbID = "root"; //mysql 계정
			String dbPassword = "1234"; //mysql 비밀번호
			String driver = "org.gjt.mm.mysql.Driver";

			Class.forName(driver);
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static ActorDao getInstance() {
		return dao;
	}

	
	//id번호 갱신기능
	public String modifyIdNumber(int number) {
		String sql = "ALTER TABLE movie AUTO_INCREMENT = ?;";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.executeUpdate();
			return String.valueOf(pstmt.executeUpdate());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "-1";
	}
	
	
	//배우 id로 데이터 가져오기
	public ArrayList<String> getProperty(int id) {

		String sql = "SELECT * FROM actor where actor_id=?";
		ArrayList<String> list = new ArrayList<>();


		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				list.add(rs.getString(1));
				list.add(rs.getString(2));
				list.add(rs.getString(3));
				list.add(rs.getString(4));
				list.add(rs.getString(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	//배우 정보 삭제기능
	@Override
	public String deleteProperty(ActorDTO dto) {
		String sql = "DELETE FROM actor WHERE name=?;";
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

	@Override
	public String updateProperty() {
		return null;
	}


	//배우정보삽입
	public int insertProperty(ActorDTO dto) {

		String sql = "INSERT INTO actor VALUES(?,?,?,?,?);";

		try {

			pstmt = conn.prepareStatement(sql);
			char gender = dto.getGender();
			pstmt.setInt(1, dto.getActorID());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, String.valueOf(gender));
			pstmt.setString(4, dto.getCountry());
			pstmt.setString(5, dto.getMovie());
			return pstmt.executeUpdate();


		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	@Override
	public int insertProperty(Object obj) {
		// TODO Auto-generated method stub
		return 0;
	}
	

	@Override
	public String deleteProperty(String name) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	public static void main(String[] args) {
		ActorDao dao = ActorDao.getInstance();
		ArrayList<String> list = dao.getProperty("이병헌");
		for(String str: list) {
			System.out.println(str);
		}
	}

	@Override
	public ArrayList<String> getProperty(String var) {
		// TODO Auto-generated method stub
		return null;
	}
}
