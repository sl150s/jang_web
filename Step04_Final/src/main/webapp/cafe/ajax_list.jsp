<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="java.util.List"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	//한 페이지에 몇개씩 표시할 것인지
	final int PAGE_ROW_COUNT=5;
	//하단 페이징 번호를를 몇 개(12345, 56789... )씩 표시할 것인지
	final int PAGE_DISPLAY_COUNT=3;
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
	
	//전체 글 갯수를 구해온다
	int totalRow = CafeDao.getInstance().getCount();
	//전체 페이지의 갯수 구하기(총 글의 갯수가 10개, 한페이지에 3개씩 나타내기로했다면  4페이지까지 있는게 맞음.)
	int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//.ceil은 천장을 의미(올림연산)하고 , .floor은 바닥(내림연산)을 의미한다. 
	
	//끝 페이지 번호가 이미 전체페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
	if(endPageNum > totalPageCount){
		endPageNum=totalPageCount; //보정해준다.
	}
	//FileDto 객체를 생성해서
	CafeDto dto = new CafeDto();
	//위에서 계산된 startRowNum, endRowNum을 담아서
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	//CafeDto를 인자로 전달해서 글 목록 얻어오기 
	List<CafeDto> list = CafeDao.getInstance().getList(dto);
	

		
%>

[
<% for(int i=0; i<list.size(); i++){
	CafeDto tmp = list.get(i);%>
	
	{
		"num":<%=tmp.getNum() %>,
		"writer":"<%=tmp.getWriter() %>",
		"Title":"<%=tmp.getTitle() %>",
		"viewCount":<%=tmp.getViewCount() %>,
		"regdate":"<%=tmp.getRegdate() %>"
	}
	<% if(i != list.size()-1) { %> <%-- 배열의 마지막 인덱스만 아니면 ,찍기 --%>
		,
	<%} %>
<%} %>

]
