package test.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.Set;

import test.member.dto.MemberDto;
import test.util.DbcpBean;

public class MemberDao {
	//자신의 참조값을 저장할 static 필드(하나만 만들어놓고 사용할 예정이기 때문)
	private static MemberDao dao;
	
	//외부에서 객체 생성하지 못하도록 생성자의 접근지정자를 private 로 한다. 
	private MemberDao() {
		
	}
	
	//자신의 참조값을 리턴하는 static 메소드를 제공한다
	public static MemberDao getInstance() {
		//만일 최초 호출이라면 자신의 객체를 생성해서 static 필드에 담아둔다.
		if(dao==null) {
			dao=new MemberDao();
		}
		//필드에 있는 자신의 참조값을 리턴해준다.
		return dao;
		/*
		 * MemberDao dao = MemberDao.getinastance(); 
		   -> 이렇게 불러야하는 이유 ? private 이기 때문에 메소드를 통해서 참조값을 불러가야함.
		 */
		
	}
	
	//전체 회원의 목록을 리턴해주는 메소드 
	public List<MemberDto> getList(){
		//회원 목록을 담을 객체 생성
		List<MemberDto> list = new ArrayList<>();
		
		//필요한 객체를 담을 지역변수를 미리 만들어둔다. 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다. 
			conn = new DbcpBean().getConn();

			//실행할 sql문의 뼈대 구성하기
			String sql = "SELECT num, name,addr"
					+ " from member"
					+ " ORDER BY num ASC";
			//?에 바인딩 할게 있으면 한다. 

			pstmt = conn.prepareStatement(sql);
			//Select문을 수행하고 결과값을 받아온다.
			rs = pstmt.executeQuery();
			//반복문 돌면서 ResultSet에서 필요한 값을 얻어낸다. 
			while (rs.next()) {
				MemberDto dto=new MemberDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				//ArrayList 객체에 누적시킨다.
				list.add(dto);
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
			} catch (Exception e) {}
		}
		return list;
	}
	
	//회원정보 추가하기 
	public boolean insert(MemberDto dto) {
		int rowCount = 0;
		//필요한 객체를 담을 지역변수를 미리 만들어둔다. 
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다. 
			conn = new DbcpBean().getConn();

			//실행할 sql문의 뼈대 구성하기
			String sql = "INSERT INTO member"
					+ " (num, name, addr)"
					+ " VALUES (member_seq.NEXTVAL, ? ,?)";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할게 있으면 한다. 
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			
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
			} catch (Exception e) {}
		}
		//return rowCount > 0 ? true : false;
		if(rowCount > 0) {
			return true;
		}else {
			return false;
		}
	}
	
	
	//회원정보 삭제하기
	public boolean delete(int num) {
		int rowCount = 0;
		//필요한 객체를 담을 지역변수를 미리 만들어둔다. 
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다. 
			conn = new DbcpBean().getConn();

			//실행할 sql문의 뼈대 구성하기
			String sql = "DELETE FROM member"
					+ " WHERE num = ?";

			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할게 있으면 한다. 
			pstmt.setInt(1,num);

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
	
	//회원 한명의 정보를 리턴하는 메소드
	public MemberDto getData(int num) {
		//필요한 객체를 담을 지역변수를 미리 만들어둔다. 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDto dto = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다. 
			conn = new DbcpBean().getConn();

			//실행할 sql문의 뼈대 구성하기
			String sql = "SELECT name, addr"
					+ " FROM member"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);

			//?에 바인딩 할게 있으면 한다. 
			pstmt.setInt(1, num);
			//Select문을 수행하고 결과값을 받아온다.
			rs = pstmt.executeQuery();
			//만일 slect된 row가 있다면(커서 다음에 select된 row가 있다면)
			if (rs.next()) {
				dto=new MemberDto();
				dto.setNum(num);
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
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
	
	//회원 한명의 정보를 수정반영하는 메소드
	public boolean update(MemberDto dto) {
		int rowCount = 0;
		//필요한 객체를 담을 지역변수를 미리 만들어둔다. 
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다. 
			conn = new DbcpBean().getConn();

			//실행할 sql문의 뼈대 구성하기
			String sql = "UPDATE member"
					+ " SET name=?, addr=?"
					+ " WHERE num=?";

			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할게 있으면 한다. 
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			pstmt.setInt(3, dto.getNum());

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
