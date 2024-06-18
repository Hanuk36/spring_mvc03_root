<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#btn1").click(function() {
			//alert("눌렀네");
			$("#result").empty();
			$.ajax({
				url : "test01.do" ,           //서버주소
				method : "post",             // 전달방식
				dataType : "text",            // 가져오는 결과 타입
				// data :                     // 서버에 보낼 때 같이 가는 데이터 (파라미터) 타입이 아님
				// async : true 또는 false     // true 비동기(기본값, 생략), false 동기 
				success : function (data) {
					$("#result").append(data);
				},
				error : function () {
					alert("읽기실패");
				}
			});
		});
		$("#btn2").click(function() {
			// alert("눌렀네");
			$("#result").empty();
			$.ajax({
				url : "test02.do" ,            //서버주소
				method : "post",               // 전달방식
				dataType : "xml",              // 가져오는 결과 타입
				// data :                      // 서버에 보낼 때 같이 가는 데이터 (파라미터) 타입이 아님
				// async : true 또는 false      // true 비동기(기본값, 생략), false 동기 
				success : function (data) {    //위의 text 형태를  data가 받는다.
					let table ="<table>";
					table += "<thead><tr><th>종류</th><th>가격</th></tr></thead>";
					table += "<tbody>";
					$(data).find("product").each(function() {
						let name = $(this).find("name").text();
						let price = $(this).find("price").text();
						table += "<tr>";
						table += "<td>" + name + "</td>";
						table += "<td>" + price + "</td>";
						table += "</tr>";
					});
					table += "</tbody>";
					table += "</table>";
					$("#result").append(table);
				},
				error : function () {
					alert("읽기실패");
				}
			});
		});
		
		/* $("#btn3").click(function() {
			
		}); */
		
		$("#btn3").on("click", function() {
			$("#result").empty();
			$.ajax({
				url : "test03.do" ,            //서버주소
				method : "post",               // 전달방식
				dataType : "xml",              // 가져오는 결과 타입
				// data :                      // 서버에 보낼 때 같이 가는 데이터 (파라미터) 타입이 아님
				// async : true 또는 false      // true 비동기(기본값, 생략), false 동기
				success: function(data){       //public String Xml_Exam03() 
					let table ="<table>";
					table += "<thead><tr><th>차 종류</th><th>차 대수</th></tr></thead>";
					table += "<tbody>";
					$(data).find("product").each(function() {  //find 는 product 라는 태그를 찾는다.
						let name = $(this).attr("name");  // 이것은 name 이라는 속성을 찾는다. 위에것은 텍스트를 찾는다.
						let count = $(this).attr("count");
						
						table += "<tr>";
						table += "<td>" + name + "</td>";
						table += "<td>" + count + "</td>";
						table += "</tr>";
					});
					table += "</tbody>";
					table += "</table>";
					$("#result").append(table);
				},
				error: function() {
					alert("읽기실패");
				}
			});
		});
		
		
		$("#btn4").on("click", function() {
			$("#result").empty();
			$.ajax({
				url : "test04.do" ,            //서버주소
				method : "post",               // 전달방식
				dataType : "xml",              // 가져오는 결과 타입
				// data :                      // 서버에 보낼 때 같이 가는 데이터 (파라미터) 타입이 아님
				// async : true 또는 false      // true 비동기(기본값, 생략), false 동기
				success: function(data){       //public String Xml_Exam04() 를 불러온다
					let table ="<table>";
					table += "<thead><tr><th>회사</th><th>차 종류</th><th>차 대수</th></tr></thead>";
					table += "<tbody>";
					
					$(data).find("product").each(function() {  //find 는 product 라는 태그를 찾는다.
						let company = $(this).text();
						let count = $(this).attr("count");  // 이것은 name 이라는 속성을 찾는다. 위에것은 텍스트를 찾는다.
						let name = $(this).attr("name");
							
						table += "<tr>";
						table += "<td>" + company + "</td>";
						table += "<td>" + name + "</td>";
						table += "<td>" + count + "</td>";
						table += "</tr>";
					});
					table += "</tbody>";
					table += "</table>";
					$("#result").append(table);	
				},
				error: function() {
					alert("읽기실패")
				}
			});
		});
		
		$("#btn5").on("click", function() {
			$("#result").empty();
			$.ajax({
				url : "test05.do" ,            //서버주소
				method : "post",               // 전달방식
				dataType : "xml",              // 가져오는 결과 타입
				// data :                      // 서버에 보낼 때 같이 가는 데이터 (파라미터) 타입이 아님
				// async : true 또는 false      // true 비동기(기본값, 생략), false 동기
				success: function(data){       //public String Xml_Exam05() 를 불러온다
					let table ="<table>";
					table += "<thead><tr><th>지역</th><th>온도</th><th>상태</th><th>아이콘</th></tr></thead>";
					table += "<tbody>";
					
					$(data).find("local").each(function() {  //find 는 local 라는 태그를 찾는다.
						let local = $(this).text();
						let ta = $(this).attr("ta"); 
						let desc = $(this).attr("desc");
						let icon = $(this).attr("icon");
							
						table += "<tr>";
						table += "<td>" + local + "</td>";
						table += "<td>" + ta + "</td>";
						table += "<td>" + desc + "</td>";
						table += "<td><img src='http://www.kma.go.kr/images/icon/NW/NB"+icon+".png'></td>";
						table += "</tr>";					
					});
					table += "</tbody>";
					table += "</table>";
					$("#result").append(table);	
				},
				error: function() {
					alert("읽기실패")
				}
			});
		});
		
		$("#btn6").on("click", function() {
			$("#result").empty();
			$.ajax({
				url : "test06.do" ,            //서버주소
				method : "post",               // 전달방식
				dataType : "json",              // 가져오는 결과 타입
				// data :                      // 서버에 보낼 때 같이 가는 데이터 (파라미터) 타입이 아님
				// async : true 또는 false      // true 비동기(기본값, 생략), false 동기
				success: function(data){       //public String Xml_Exam06() 를 불러온다
					let table ="<table>";
					table += "<thead><tr><th>이름</th><th>범위</th></tr></thead>";
					table += "<tbody>";
					
					$.each(data, function(index, obj) { 
						let name = obj.name;
						let scope = obj.scope; 
										
						table += "<tr>";
						table += "<td>" + name + "</td>";
						table += "<td>" + scope + "</td>";
						table += "</tr>";					
					});
					table += "</tbody>";
					table += "</table>";
					$("#result").append(table);	
				},
				error: function() {
					alert("읽기실패")
				}	
			});
		});
		
		$("#btn7").on("click", function() {
			$("#result").empty();
			$.ajax({
				url : "test07.do" ,            //서버주소
				method : "post",               // 전달방식
				dataType : "json",              // 가져오는 결과 타입
				// data :                      // 서버에 보낼 때 같이 가는 데이터 (파라미터) 타입이 아님
				// async : true 또는 false      // true 비동기(기본값, 생략), false 동기
				success: function(data){       //public String Xml_Exam07() 를 불러온다
					let table ="<table>";
					table += "<thead>";
					table += "<tr>"
					table += "<th>시·도별(1)</th>"
					table += "<th>총인구 (명)</th>"
					table += "<th>1차 접종 누계</th>"
					table += "<th>2차 접종 누계</th>"
					table += "<th>1차 접종 퍼센트</th>"
					table += "<th>2차 접종 퍼센트</th>"
					table += "</tr>"
					table += "</thead>";
					table += "<tbody>";
					
					$.each(data, function(index, obj) { 
						
						// 자바스크립ㄴ트에서 천단위 코마(내장함수)
						// 천단위 콤마(내장함수)  : toLocaleString(),
					    // toLocaleString('ko-KR', {maximumFractionDigits:2})
									
						table += "<tr>";
						table += "<td>" + obj["시·도별(1)"] + "</td>";
						table += "<td>" + obj["총인구 (명)"].toLocaleString() + "</td>";
						table += "<td>" + obj["1차 접종 누계"].toLocaleString() + + "</td>";
						table += "<td>" + obj["2차 접종 누계"].toLocaleString() + + "</td>";
						table += "<td>" + obj["1차 접종 퍼센트"].toLocaleString('ko-KR', {maximumFractionDigits:2}) + "</td>";
						table += "<td>" + obj["2차 접종 퍼센트"].toLocaleString('ko-KR', {maximumFractionDigits:2}) + "</td>";
						table += "</tr>";					
					});
					table += "</tbody>";
					table += "</table>";
					$("#result").append(table);	
				},
				error: function() {
					alert("읽기실패")
				}	
			});
		});	
	});
</script>
</head>
<body>
	<h2>Ajax 연습하는 곳</h2>
	
	<button id="btn1">테스트</button>
	<button id="btn2">xml01</button>
	<button id="btn3">xml02</button>
	<button id="btn4">xml03</button>
	<button id="btn5">날씨_xml</button>
	<button id="btn6">json01</button>
	<button id="btn7">json02</button>
	
	<hr>
	<div id="result"></div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>