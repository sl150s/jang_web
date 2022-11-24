<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test.jsp</title>
</head>
<body>
   <div id="one"></div>
   <script>
      let data={imagePath:"/images/7.png"};
      
      let img1='<img src="/Step04_Final/images/7.png">'; 
      
      let img2='<img src="/Step04_Final' + data.imagePath + '">';
      
      let img3=`<img src="/Step04_Final\${data.imagePath}">`;
      
    	//${ }아주 특별한 기호 -> 클라이언트에 출력하기도 전에 jsp에서 해석하려한다(해석하려하지만 아무값도 없어서 아무것도 출력되지 않음)
		//특별하게 해석하지말라는 의미로 \(역슬래쉬)를 앞에 붙인다.
   </script>
</body>
</html>



