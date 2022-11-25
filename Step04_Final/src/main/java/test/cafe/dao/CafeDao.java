package test.cafe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.cafe.dto.CafeDto;
import test.util.DbcpBean;

public class CafeDao {
	private static CafeDao dao;
	/*
	 * static 메소드는 생성자를 호출하지 않고 클래스명으로 바로 호출을 하기 때문에 메소드 호출전에 무언가 준비 작업을 하고 싶다면
	 * static 블럭 안에서 하면된다. static 블럭은 해당 클래스를 최초로 사용할 때 한 번만 실행되기 때문에 초기화 작업을 하기에
	 * 적당한 블럭이다.
	 */

	static {
		if (dao == null) {
			dao = new CafeDao();
		}
	}

	private CafeDao() {
	}

	public static CafeDao getInstance() {
		return dao;
	}

	// 글 하나의 정보를 리턴해주는 메소드
	public CafeDto getDate(int num) {
		CafeDto dto = null;

		// 필요한 객체를 담을 지역변수를 미리 만들어둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();

			// 실행할 sql문의 뼈대 구성하기
			String sql = "SELECT writer, title, content, viewCount, regdate" + " FROM board_cafe" + " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 바인딩 할게 있으면 하기
			pstmt.setInt(1, num);
			// sql 문 수행하고 ResultSet 객체 얻어내기
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new CafeDto();
				dto.setNum(num);
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setViewCount(rs.getInt("viewCount"));
				dto.setRegdate(rs.getString("regdate"));
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
					conn.close();// Connection Pool에 Connection 반납하기
			} catch (Exception e) {
			}
		}
		 return dto;      

	}

	// 게시글 하나씩 추가하는 메소드
	public boolean insert(CafeDto dto) {
		int rowCount = 0;
		// 필요한 객체를 담을 지역변수를 미리 만들어둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			// Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();

			// 실행할 sql문의 뼈대 구성하기
			String sql = "INSERT INTO board_cafe" + " (num, writer,title,content,viewCount,regdate)"
					+ " VALUES(board_cafe_seq.NEXTVAL,?,?,?,0,SYSDATE)";

			pstmt = conn.prepareStatement(sql);
			// ?에 바인딩 할게 있으면 한다.
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());

			// INSERT OR UPDATE OR DELETE 문을 수행하고 수정되거나, 삭제되거나, 추가된 row의 갯수 리턴받기
			rowCount = pstmt.executeUpdate();// 업데이트된 rowCount가 리턴 (숫자)
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();// Connection Pool에 Connection 반납하기
			} catch (Exception e) {
			}
		}
		// return rowCount > 0 ? true : false;
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}

	// 게시글 전체목록 리턴하는 메소드
	public List<CafeDto> getList() {
		// ArrayList 객체를 생성해서 담아두기
		List<CafeDto> list = new ArrayList<CafeDto>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			// select 문의 뼈대 구성하기
			String sql = "SELECT num, writer, title, viewCount, regdate" + " FROM board_cafe" + " ORDER BY num DESC";
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 바인딩 할게 있으면 하기

			// sql 문 수행하고 ResultSet 객체 얻어내기
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// select 된 row 하나의 정보를 CafeDto 객체를 생성해서 담고
				CafeDto dto = new CafeDto();
				// 글의 갯수만큼 객체가 필요해서 while문 안에서 생성해야함
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setViewCount(rs.getInt("viewCount"));
				dto.setRegdate(rs.getString("regdate"));
				// CafeDto 객체의 참조값을 List 에 누적 시키기
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
					conn.close();
			} catch (Exception e) {
			}
		}
		return list;
	}

}
