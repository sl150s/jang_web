package test.prop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.prop.Dto.PropoDto;
import test.util.DbcpBean;

public class PropoDao {
	private static PropoDao dao;
	
	//외부에서 객체 생성할 수 없도록
	private PropoDao() {}
	//참조값을 리턴해주는 static 메소드
	public static PropoDao getInstance() {
		if(dao==null) {
			dao=new PropoDao();
		}
		return dao;
	}
	
	//전체 글의 갯수를 가져오는 메소드 
	public int getCount() {
		int count = 0;
		//필요한 객체를 담을 지역변수를 미리 만들어둔다. 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다. 
			conn = new DbcpBean().getConn();

			//실행할 sql문의 뼈대 구성하기
			String sql = "SELECT MAX(ROWNUM) num"
					+ " FROM board_prop";
			pstmt = conn.prepareStatement(sql);

			//?에 바인딩 할게 있으면 한다. 
			//Select문을 수행하고 결과값을 받아온다.
			rs = pstmt.executeQuery();
			//반복문 돌면서 ResultSet에서 필요한 값을 얻어낸다. 
			if (rs.next()) {
				count = rs.getInt("num");
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
		return count;
	}
	
	//전체 게시글을 보여주는 메소드
	public List<PropoDto> getlist(PropoDto dto){
		List<PropoDto> list= new ArrayList<PropoDto>();
		//필요한 객체를 담을 지역변수를 미리 만들어둔다. 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다. 
			conn = new DbcpBean().getConn();

			//실행할 sql문의 뼈대 구성하기
			 String sql = "SELECT *"
		               + " FROM"
		               + " (SELECT result1.*, ROWNUM AS rnum"
		               + " FROM"
		               + " (SELECT num, title, writer, TO_CHAR(regdate,'yyyy.mm.dd hh24:mi') AS regdate, viewCount"
		               + " FROM board_prop"
		               + " ORDER BY num DESC) result1)"
		               + " WHERE rnum BETWEEN ?  AND ?";
			pstmt = conn.prepareStatement(sql);

			//?에 바인딩 할게 있으면 한다. 
			pstmt.setInt(1, dto.getStartRowNum());
	        pstmt.setInt(2, dto.getEndRowNum());

			//Select문을 수행하고 결과값을 받아온다.
			rs = pstmt.executeQuery();
			//반복문 돌면서 ResultSet에서 필요한 값을 얻어낸다. 
			while (rs.next()) {
				PropoDto tmp = new PropoDto();
				tmp.setNum(rs.getInt("num"));
				tmp.setTitle(rs.getString("title"));
				tmp.setWriter(rs.getString("writer"));
				tmp.setRegdate(rs.getString("regdate"));
				tmp.setViewCount(rs.getInt("viewCount"));
				list.add(tmp);
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
		return list;
	}
	
	
	//게시글을 하나씩 추가하는 메소드
	public boolean insert(PropoDto dto) {
		int rowCount = 0;
		//필요한 객체를 담을 지역변수를 미리 만들어둔다. 
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다. 
			conn = new DbcpBean().getConn();

			//실행할 sql문의 뼈대 구성하기
			String sql = "INSERT INTO board_prop"
					+ " (num, writer, title, content, viewCount, regdate)"
					+ " VALUES (board_prop_seq.NEXTVAL,?,?,?,0,SYSDATE)";

			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할게 있으면 한다. 
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());

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
