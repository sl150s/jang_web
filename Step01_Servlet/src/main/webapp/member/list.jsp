<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="test.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<MemberDto> list=new ArrayList<>();
	list.add(new MemberDto(1,"김구라","노량진"));
	list.add(new MemberDto(2,"해골","행신동"));
	list.add(new MemberDto(3,"원숭이","상도동"));
	
	MemberDto dto = new MemberDto();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th>주소</th>
				</tr>
			</thead>
			<tbody class="table-group-divider">
			<%for(MemberDto tmp:list){%>
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getName() %></td>
					<td><%=tmp.getAddr() %></td>
				</tr>
			<%}%>
			
			</tbody>
		</table>
	</div>
</body>
</html>