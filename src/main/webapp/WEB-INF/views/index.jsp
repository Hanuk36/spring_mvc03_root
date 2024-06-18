<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function geustbook_go() {
		location.href="gb_list.do";
	}
	function geustbook2_go() {
		location.href="gb2_list.do";
	}
	function bbs_go() {
		location.href="bbs_list.do";
	}
	function board_go() {
		location.href="board_list.do";
	}
	function shop_go() {
		location.href="shop_list.do";
	}
	function spring_ajax_go() {
		location.href="spring_ajax_go.do";
	}
	function spring_ajax_go2() {
		location.href="spring_ajax_go2.do";
	}
	function spring_sns_go() {
		location.href="spring_sns_go.do";
	}
	function dynamic_query() {
		location.href="dynamic_query.do";
	}
	function email_send() {
		location.href="email_send.do";
	}
	function data_go() {
		location.href="data_go.do";
		//AjaxController.java 로 간다.
	}
	function data_go2() {
		location.href="data_go2.do";
		//AjaxController.java 로 간다.
	}
	function transaction_go() {
		location.href="transaction_go.do";
	}
</script>
</head>
<body>
	<button onclick="geustbook_go()">guestbook</button>
	<button onclick="geustbook2_go()">guestbook2</button>
	<button onclick="bbs_go()">게시판</button>
	<button onclick="board_go()">게시판2</button>
	<button onclick="shop_go()">쇼핑</button>
	<button onclick="spring_ajax_go()">Spring Ajax</button>
	<button onclick="spring_ajax_go2()">Spring Ajax2</button>
	<button onclick="spring_sns_go()">Spring sns</button>
	<button onclick="dynamic_query()">동적Query</button>
	<button onclick="email_send()">이메일 보내기</button>
	<button onclick="data_go()">공공데이터 미세먼지(xml)</button>
	<button onclick="data_go2()">공공데이터 미세먼지(json)</button>
	<button onclick="transaction_go()">트랜젝션</button>
	
	<!--
		1. summernote Editor 사용하기 위해서 라이브러리 다운 받아서 webapp-resources 안에 넣기
		guestbook- write.jsp  => onelist.jsp, update.jsp, SummernoteController, ImgVO,
	  -->

	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>