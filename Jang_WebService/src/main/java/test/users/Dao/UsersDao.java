package test.users.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import test.users.Dto.UsersDto;
import test.util.DbcpBean;

public class UsersDao {
	private static UsersDao dao;
	
	//외부에서 객체 생성할 수 없도록
	private UsersDao() {}
	//참조값을 리턴해주는 static 메소드
	public static UsersDao getInstance() {
		if(dao==null) {
			dao=new UsersDao();
		}
		return dao;
	}
	
	//인자로 전달되는 아이디와 비밀번호를 이용해서 해당 정보가 유효한 정보인지 여부를 리턴하는 메소드
	public boolean isValid(UsersDto dto) {
		//아이디 비밀번호 유효성 여부를 담을 변수 만들고 초기값 false
		boolean isValid=false;
		
		//필요한 객체를 담을 지역변수를 미리 만들어둔다. 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다. 
			conn = new DbcpBean().getConn();

			//실행할 sql문의 뼈대 구성하기
			String sql = "SELECT id"
					+ " FROM users"
					+ " WHERE id=? AND pwd=?";
			pstmt = conn.prepareStatement(sql);

			//?에 바인딩 할게 있으면 한다. 
			pstmt.setString(1,dto.getId());
			pstmt.setString(2,dto.getPwd());

			//Select문을 수행하고 결과값을 받아온다.
			rs = pstmt.executeQuery();
			//SELECT된 ROW가 있는지 확인해 본다.
			if (rs.next()) {
				//SELECT 된 row가 있다면 유효한 정보가 맞다.
				isValid = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();//Connection Pool에 Connection 반납하기 
			} catch (Exception e) {
			}
		}
		return isValid;
	}
	
	
	//회원 한명의 정보를 DB에 저장하고 성공여부를 리턴하는 메소드
	public boolean insert(UsersDto dto) {//UsersDto에 id,pwd, email이 있다.
		int rowCount = 0;
		//필요한 객체를 담을 지역변수를 미리 만들어둔다. 
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다. 
			conn = new DbcpBean().getConn();

			//실행할 sql문의 뼈대 구성하기
			String sql = "INSERT INTO users"
					+ " (id, pwd, email, regdate)"
					+ " VALUES(?,?,?,SYSDATE)";

			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할게 있으면 한다. 
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());

			//INSERT OR UPDATE OR DELETE 문을 수행하고 수정되거나, 삭제되거나, 추가된 row의 갯수 리턴받기
			rowCount = pstmt.executeUpdate();//업데이트된 rowCount가 리턴 (숫자)
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();//Connection Pool에 Connection 반납하기 
			} catch (Exception e) {
			}
		}
		//return rowCount > 0 ? true : false;
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}

	//인자로 전달된 아이디에 해당하는 가입정보를 리턴해주는 메소드
	public UsersDto getData(String id) {
		//필요한 객체를 담을 지역변수를 미리 만들어둔다. 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UsersDto dto = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다. 
			conn = new DbcpBean().getConn();

			//실행할 sql문의 뼈대 구성하기
			String sql = "SELECT pwd, email, profile,TO_CHAR(regdate,'YYYY.MM.DD HH24:MI') AS regdate"
					+ " FROM users"
					+ " WHERE id=?";
			pstmt = conn.prepareStatement(sql);

			//?에 바인딩 할게 있으면 한다. 
			pstmt.setString(1, id);

			//Select문을 수행하고 결과값을 받아온다.
			rs = pstmt.executeQuery();
			//반복문 돌면서 ResultSet에서 필요한 값을 얻어낸다. 
			if (rs.next()) {
				dto = new UsersDto();
				dto.setId(id);
				dto.setPwd(rs.getString("pwd"));
				dto.setEmail(rs.getString("email"));
				dto.setProfile(rs.getString("profile"));
				dto.setRegdate(rs.getString("redate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();//Connection Pool에 Connection 반납하기 
			} catch (Exception e) {
			}
		}
		return dto;
	}
	
	
	//비밀번호를 수정하는 메소드 (작업의 성공 여부를 리턴받고, dto의 인자를 전달받아야하기 때문에 UsersDto dto를 변수로 넣는다)
	public boolean updatePwd(UsersDto dto) {
		int rowCount = 0;
		//필요한 객체를 담을 지역변수를 미리 만들어둔다. 
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다. 
			conn = new DbcpBean().getConn();

			//실행할 sql문의 뼈대 구성하기
			String sql = "UPDATE users"
					+ " SET pwd = ?"
					+ " WHERE id = ? AND pwd = ?";

			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할게 있으면 한다. 
			pstmt.setString(1, dto.getNewPwd());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPwd());

			//INSERT OR UPDATE OR DELETE 문을 수행하고 수정되거나, 삭제되거나, 추가된 row의 갯수 리턴받기
			rowCount = pstmt.executeUpdate();//업데이트된 rowCount가 리턴 (숫자)
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();//Connection Pool에 Connection 반납하기 
			} catch (Exception e) {
			}
		}
		//return rowCount > 0 ? true : false;
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
		
	}
	
	
	//개인정보(이메일,프로필사진)을 수정하는 메소드
	public boolean update(UsersDto dto) {
		int rowCount = 0;
		//필요한 객체를 담을 지역변수를 미리 만들어둔다. 
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다. 
			conn = new DbcpBean().getConn();

			//실행할 sql문의 뼈대 구성하기
			String sql = "UPDATE users"
					+ " SET email =?, profile =?"
					+ " WHERE id =?";

			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할게 있으면 한다. 
			pstmt.setString(1, dto.getEmail());
			pstmt.setString(2, dto.getProfile());
			pstmt.setString(3, dto.getId());

			//INSERT OR UPDATE OR DELETE 문을 수행하고 수정되거나, 삭제되거나, 추가된 row의 갯수 리턴받기
			rowCount = pstmt.executeUpdate();//업데이트된 rowCount가 리턴 (숫자)
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();//Connection Pool에 Connection 반납하기 
			} catch (Exception e) {
			}
		}
		//return rowCount > 0 ? true : false;
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	//개인정보(가입정보) 삭제하는 메소드
	public boolean delete(String id) {
		int rowCount = 0;
		//필요한 객체를 담을 지역변수를 미리 만들어둔다. 
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다. 
			conn = new DbcpBean().getConn();

			//실행할 sql문의 뼈대 구성하기
			String sql = "DELETE FROM users"
					+ " WHERE id=?";

			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할게 있으면 한다. 
			pstmt.setString(1, id);

			//INSERT OR UPDATE OR DELETE 문을 수행하고 수정되거나, 삭제되거나, 추가된 row의 갯수 리턴받기
			rowCount = pstmt.executeUpdate();//업데이트된 rowCount가 리턴 (숫자)
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();//Connection Pool에 Connection 반납하기 
			} catch (Exception e) {
			}
		}
		//return rowCount > 0 ? true : false;
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
}
