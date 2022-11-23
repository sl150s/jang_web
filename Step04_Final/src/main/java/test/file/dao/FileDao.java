package test.file.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.file.dto.FileDto;
import test.util.DbcpBean;

public class FileDao {
	// static 필드
	private static FileDao dao;

	// 외부에서 객체 생성하지 못하도록 생성자를 private로
	private FileDao() {
	}

	// 자신의 참조값을 리턴해주는 메소드
	public static FileDao getInstance() {
		if (dao == null) {
			dao = new FileDao();
		}
		return dao;
	}
	
	//파일 삭제하는 메소드
	public boolean delete(int num) {
		int rowCount = 0;
		//필요한 객체를 담을 지역변수를 미리 만들어둔다. 
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다. 
			conn = new DbcpBean().getConn();

			//실행할 sql문의 뼈대 구성하기
			String sql = "DELETE"
					+ " FROM board_file"
					+ " WHERE num=?";

			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할게 있으면 한다. 
			pstmt.setInt(1, num);

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

	// 파일 하나의 정보를 리턴하는 메소드
	public FileDto getData(int num) {
		// 필요한 객체를 담을 지역변수를 미리 만들어둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		FileDto dto = null;
		try {
			// Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();

			// 실행할 sql문의 뼈대 구성하기
			String sql = "SELECT writer, title, orgFileName, saveFileName, fileSize, regdate" + " FROM board_file"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);

			// ?에 바인딩 할게 있으면 한다.
			pstmt.setInt(1, num);

			// Select문을 수행하고 결과값을 받아온다.
			rs = pstmt.executeQuery();
			// 반복문 돌면서 ResultSet에서 필요한 값을 얻어낸다.
			if (rs.next()) {
				dto = new FileDto();
				dto.setNum(num);
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setOrgFileName(rs.getString("orgFileName"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setFileSize(rs.getLong("fileSize"));
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

	// 업로드된 파일 정보를 DB에 저장하는 메소드
	public boolean insert(FileDto dto) {
		int rowCount = 0;
		// 필요한 객체를 담을 지역변수를 미리 만들어둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			// Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();

			// 실행할 sql문의 뼈대 구성하기
			String sql = "INSERT INTO board_file"
					+ " (num, writer, title, orgFileName, saveFileName, fileSize, regdate)"
					+ " VALUES( board_file_seq.NEXTVAL,?,?,?,?,?,sysdate)";

			pstmt = conn.prepareStatement(sql);
			// ?에 바인딩 할게 있으면 한다.
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getOrgFileName());
			pstmt.setString(4, dto.getSaveFileName());
			pstmt.setLong(5, dto.getFileSize());

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

	// 파일 목록을 리턴하는 메소드
	public List<FileDto> getList() {
		// 파일목록을 담을 ArrayList 객체 생성
		List<FileDto> list = new ArrayList<FileDto>();

		// 필요한 객체를 담을 지역변수를 미리 만들어둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();

			// 실행할 sql문의 뼈대 구성하기
			String sql = "SELECT num, writer, title, orgFileName,fileSize,TO_CHAR(regdate,'YYYY.MM.DD HH24:MI') regdate"
					+ " FROM board_file" + " ORDER BY num DESC";
			pstmt = conn.prepareStatement(sql);

			// ?에 바인딩 할게 있으면 한다.

			// Select문을 수행하고 결과값을 받아온다.
			rs = pstmt.executeQuery();
			// 반복문 돌면서 ResultSet에서 필요한 값을 얻어낸다.
			while (rs.next()) {
				// 반복문 돌때마다 FileDto 객체를 반복문 안에서 생성
				FileDto dto = new FileDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setOrgFileName(rs.getString("orgFileName"));
				dto.setFileSize(rs.getLong("fileSize"));
				dto.setRegdate(rs.getString("regdate"));

				// 반복문 돌때마다 ArrayList 객체에 누적시킨다.
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
					conn.close();// Connection Pool에 Connection 반납하기
			} catch (Exception e) {
			}
		}
		return list;
	}
}
