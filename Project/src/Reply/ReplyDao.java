package Reply;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.StringTokenizer;

import Movie.UserDTO;

public class ReplyDao implements PrototypeReply{

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	static private ReplyDao dao = new ReplyDao();

	public ReplyDao() {
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



	//싱글톤 객체 리턴
	public static ReplyDao getInstance() {
		return dao;
	}



	@Override
	public int replyCount() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}


	//댓글 리스트 가져오기
	@Override
	public ArrayList<ReplyDTO> replyList() throws Exception {

		ArrayList<ReplyDTO> list = new ArrayList<>();
		String sql = "SELECT * FROM reply_tb";

		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		ReplyDTO dto = new ReplyDTO();

		while(rs.next()) {
			dto.setReplyID(rs.getInt(1));
			dto.setBoardID(rs.getInt(2));
			dto.setUserID(rs.getString(3));
			dto.setDate(rs.getInt(4));
			dto.setReplyContent(rs.getString(5));
			list.add(dto);
		}
		return list;
	}

	//비회원 댓글 리스트 가져오기
	public ArrayList<ReplyUserDTO> replyList2() throws Exception {

		ArrayList<ReplyUserDTO> list = new ArrayList<>();
		String sql = "SELECT * FROM reply_user";

		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		ReplyUserDTO dto = new ReplyUserDTO();

		while(rs.next()) {
			dto.setReplyID(rs.getInt(1));
			dto.setUserID(rs.getString(2));
			dto.setUserPW(rs.getString(3));
			dto.setReplyContent(rs.getString(4));
			list.add(dto);
		}
		return list;
	}



	//댓글 입력하기
	@Override
	public String replyInsert(ReplyDTO dto) throws Exception {
		String sql = "INSERT INTO reply_tb(USER_ID,REPLY_CONTENT) VALUES(?,?);"; //아이디, 댓글 입력

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getUserID());
		pstmt.setString(2, dto.getReplyContent());

		if(true) // 가입된 회원 ID와 회원테이블 ID 일치여부 확인
			return String.valueOf(pstmt.executeUpdate());

		return "-1";
	}


	//비회원용 댓글입력메소드
	public String replyInsert(ReplyUserDTO dto) {
		String sql = "INSERT INTO reply_user(USER_ID,USER_PW,REPLY_CONTENT) VALUES(?,?,?);"; 
		//비회원 아이디, 비번,댓글 입력
		
		try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getUserID());
		pstmt.setString(2, dto.getUserPW());
		pstmt.setString(3, dto.getReplyContent());
		return String.valueOf(pstmt.executeUpdate());
		} catch(Exception e) {
			e.printStackTrace();
			return "-1";
		}
	}



	@Override
	public boolean replyUpdate(ReplyDTO dto) throws Exception {
		String sql = "UPDATE reply_tb SET REPLY_CONTENT=?" + "where USER_ID=?";

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getReplyContent());
		pstmt.setString(2, dto.getUserID());
		boolean flag = false;

		if(pstmt.executeUpdate() == 2) //반영된 레코드개수가 리턴(여기서는 2개)
			flag = true;

		return flag;
	}



	@Override
	public String replyDelete(ReplyDTO dto) throws Exception {
		String sql = "DELETE FROM reply_tb where USER_ID=?";

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getUserID());

		if(true)
			return String.valueOf(pstmt.executeUpdate());

		return "0";
	}

	public static void main(String[] args) {

//		ReplyDao dao = ReplyDao.getInstance();
//
//		try {
//			ArrayList<ReplyUserDTO> list = dao.replyList2();
//			ReplyUserDTO dto = new ReplyUserDTO();
//			dto = list.get(0);
//			String str = null;
//			String str2 = null;
//
//			for(int i=0; i<list.size(); i++) {
//				dto = list.get(i);
//				str = dto.getUserID();
//				str2 = dto.getReplyContent();
//
//				System.out.println(str +" "+ str2);
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}

//		String query = "name=hamin&addr=jeju&age=25";
//		StringTokenizer st = new StringTokenizer(query,"&=");
//		
//		int n = st.countTokens();
//		
//		for(int i=0; i<n; i++) {
//			String str = st.nextToken();
//			System.out.println(str);
//		}
		boolean a = spaceCheck("반갑  습니다");
		System.out.println(a);
	}
	
	
	//문자열 공백체크 기능
	public static boolean spaceCheck(String spaceCheck)
	{
	    for(int i = 0 ; i < spaceCheck.length(); i++)
	    {
	        if(spaceCheck.charAt(i) == ' ')
	            return true;
	    }
	    return false;
	}

	
	
	
	@Override
	public String replyInsert(ReplyDTO dto, String sessionID) {
		String sql = "INSERT INTO reply_tb(USER_ID,REPLY_CONTENT) VALUES(?,?);"; //아이디, 댓글 입력
		 try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, sessionID);
		pstmt.setString(2, dto.getReplyContent());
		return String.valueOf(pstmt.executeUpdate());
		 } catch(Exception e) {
		return "-1";
		 }
	}

}
