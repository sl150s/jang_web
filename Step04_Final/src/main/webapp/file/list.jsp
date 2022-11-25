<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인된 아이디를 읽어온다.(로그인을 하지 않았으면 null이다)
	String id = (String)session.getAttribute("id");

	//한 페이지에 몇개씩 표시할 것인지
	final int PAGE_ROW_COUNT=5;
	//하단 페이징 번호를를 몇 개(12345, 56789... )씩 표시할 것인지
	final int PAGE_DISPLAY_COUNT=5;
	//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
	int pageNum=1;
	
	//페이지 번호가 파라미터로 전달되는지 읽어와본다.
	String strPageNum=request.getParameter("pageNum");
	//만일 페이지 번호가 파라미터로 넘어온다면
	if(strPageNum!=null){
		//숫자로 바꿔서 보여줄 페이지 번호를 지정한다. 
		pageNum=Integer.parseInt(strPageNum);
	}
	
	//보여줄 페이지의 시작 ROWNUM
	int startRowNum = 1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지의 끝 ROWNUM
	int endRowNum=pageNum*PAGE_ROW_COUNT;
	
	//하단 시작 페이지 번호
	int startPageNum = 1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	//하단 끝 페이지 번호 
	int endPageNum = startPageNum+PAGE_DISPLAY_COUNT-1;
	
	//FileDto 객체를 생성해서
	FileDto dto = new FileDto();
	//위에서 계산된 startRowNum, endRowNum을 담아서
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	//파일 목록을 select 한다 
	List<FileDto> list = FileDao.getInstance().getList(dto);
	
	//전체 글 갯수를 구해온다
	int totalRow = FileDao.getInstance().getCount();
	//전체 페이지의 갯수 구하기(총 글의 갯수가 10개, 한페이지에 3개씩 나타내기로했다면  4페이지까지 있는게 맞음.)
	int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//.ceil은 천장을 의미(올림연산)하고 , .floor은 바닥(내림연산)을 의미한다. 
	
	//끝 페이지 번호가 이미 전체페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
	if(endPageNum > totalPageCount){
		endPageNum=totalPageCount; //보정해준다.
	}
	
	
	//응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/list.jsp</title>
<jsp:include page="/include/boot.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<a href="${pageContext.request.contextPath}/file/private/upload_form.jsp" class="btn btn-dark">
			업로드 하기
		</a>
		<h3>자료실 목록 보기</h3>
		<table class="table table-striped">
			<thead class="table-dark">
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>파일명</th>
					<th>크기</th>
					<th>등록일</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<%for(FileDto tmp:list){ %>
					<tr>
						<td><%=tmp.getNum() %> </td>
						<td><%=tmp.getWriter() %> </td>
						<td><%=tmp.getTitle() %> </td>
						<td>
							<a href="download.jsp?num=<%=tmp.getNum() %>"><%=tmp.getOrgFileName()%> </a>
						</td>
						<td><%=tmp.getFileSize()%> </td>
						<td><%=tmp.getRegdate()%></td>
						<td>
							<!-- 글 작성자가 로그인된 아이디와 같을 때만 삭제 링크가 제공한다.  -->
							<%if(tmp.getWriter().equals(id)){%>
								<a href="javascript:deleteConfirm(<%=tmp.getNum() %>)">삭제</a>
							<% }%>
						</td>
					</tr>
				<%} %>
			</tbody>
		</table>
		
		<nav>
			<ul class="pagination">
				<%--startPageNu,이 1이 아닌 경우에만 prev 링크를 제공한다 --%>
				<%if(startPageNum != 1){ %>
					<li class="page-item">
						<a href="list.jsp?pageNum=<%=startPageNum-1%>" class="page-link">Prev</a>
					</li>
				<%} %>
				<%for(int i = startPageNum; i<=endPageNum; i++){ %>
					<li class="page-item">
						<a href="list.jsp?pageNum=<%=i%>" class="page-link <%=pageNum == i ? "active":""%>"><%=i %></a>
					</li>
				<%} %>
				<%--마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next 링크를 제고앟ㄴ다.  --%>
				<%if(endPageNum < totalPageCount){ %>
					<li class="page-item" >
						<a href="list.jsp?pageNum=<%=endPageNum+1%>" class="page-link">Next</a>
					</li>
				<%} %>
			</ul>
		</nav>
	</div>
	<script>
		function deleteConfirm(num){
			let isDelete = confirm("삭제하시겠습니까?");
			if(isDelete){
				location.href="delete.jsp?num="+num;
			}
		}
	</script>
</body>
</html>