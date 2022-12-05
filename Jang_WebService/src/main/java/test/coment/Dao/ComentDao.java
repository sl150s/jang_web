package test.coment.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.coment.Dto.ComentDto;
import test.prop.Dao.PropoDao;
import test.util.DbcpBean;

public class ComentDao {
	private static ComentDao dao;
	
	//외부에서 객체 생성할 수 없도록
	private ComentDao() {}
	//참조값을 리턴해주는 static 메소드
	public static ComentDao getInstance() {
		if(dao==null) {
			dao=new ComentDao();
		}
		return dao;
	}
	
	//코멘트 전체 목록을 불러오는 메소드 
	public List<ComentDto> list(){
		List<ComentDto> list = new ArrayList<ComentDto>();
		//필요한 객체를 담을 지역변수를 미리 만들어둔다. 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다. 
			conn = new DbcpBean().getConn();

			//실행할 sql문의 뼈대 구성하기
			String sql = "SELECT num, name, coment, TO_CHAR(comentDate, 'yyyy.mm.dd hh24:mi') comentDate"
					+ " FROM coment"
					+ " ORDER BY num DESC";
			pstmt = conn.prepareStatement(sql);

			//?에 바인딩 할게 있으면 한다. 

			//Select문을 수행하고 결과값을 받아온다.
			rs = pstmt.executeQuery();
			//반복문 돌면서 ResultSet에서 필요한 값을 얻어낸다. 
			while (rs.next()) {
				ComentDto dto = new ComentDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setComent(rs.getString("coment"));
				dto.setComentDate(rs.getString("comentDate"));
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
			} catch (Exception e) {
			}
		}
		return list;
	}
	
	//코멘트 하나를 추가하는 메소드 
	public boolean insert(ComentDto dto) {
		int rowCount = 0;
		//필요한 객체를 담을 지역변수를 미리 만들어둔다. 
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다. 
			conn = new DbcpBean().getConn();

			String sql = "INSERT INTO coment"
					+ " (num, name, coment, comentDate)"
					+ " VALUES(coment_seq.NEXTVAL,?,?,SYSDATE)";
			pstmt = conn.prepareStatement(sql);

			//?에 바인딩 할게 있으면 한다. 
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getComent());

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
