<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/promise/test01.jsp</title>
</head>
<body>
	<h1>비동기 테스트</h1>
	<script>
		
		//setTimeout(function(){},delay); 함수
		//가상의 주어진 작업을 처리 하는 함수 (주어진 작업을 처리하는데  random 한 시간이 걸린다고 가정하자)
		function work(job, callback){
			
			//0 ~ 5000 사이의 랜덤한 숫자 얻어내기
			let ranTime=Math.random()*5000;
			
			// 첫번째 인자로 전달된 함수를 random 한 이후에 호출하기 
			setTimeout(function(){
				console.log(job+" 을(를) 수행 했습니다.");
				//callback안에는 function type이 들어있다는 가정하에 해당함수를 호출한다.
				callback();
			}, ranTime);
			
		}
		
		/*
		work("달리기", function(){
			work("쉬기", function(){
				work("잠자기", function(){
					
				});
			});
		});
		*/
		
		
		work("냉장고 문을 연다",function(){
			work("코끼리를 넣는다",function(){
				work("냉장고 문을 닫는다.",function(){
					//콜백지옥
				});
			});
		});
		//순서대로 나오지 않는 이유는 작업 수행 시간이 랜덤이기 때문이다. 무슨 코드가 먼저 끝나는지 알수없음.
		//
		
		
		
		
		
		
		
		
		

		//1. Promise 객체를 생성해서 참조값을 p1 에 담기
		let p1=new Promise(function(resolve){
			/*
				함수의 인자로 전달되는 resolve,reject는 함수이다.
				resolve 는 작업을 완료 했을때 호출 해야하는 함수
				resolve 함수가 호출되면 .then() 안에 있는 함수가 자동 호출된다.
				
				이름이 꼭 resolve, reject일 필요없다.a와b 여도 되지만 의미가 없기 때문에 
				알아보기 쉽도록  resolve, reject 로 변수명 짓기 
				
				new Promise 객체를 생성하고, resolve가 인자로 된 함수를 
				실행하면, 이어서 그 뒤에 연결된 then 함수가 호출된다. 
			*/
			resolve();
			//reject(); //에러가 난 상황에서 reject 호출 
		});
		//2.p1 Promise가 resolve 되었을 때 호출되는 함수 등록
		p1.then(function(){
			console.log("then 안에 있는 함수가 호출되었습니다.");
		});
		
		
		
	</script>
</body>
</html>













