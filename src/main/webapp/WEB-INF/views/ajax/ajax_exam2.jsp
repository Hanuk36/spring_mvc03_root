<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	span { width: 150px; color: red;}
	input{border:1px solid red;}
	table{width: 80%; margin: 0 auto;}
	table,th,td {border: 1px solid gray; text-align: center;}
	h2{text-align: center;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		function getList(){
			$.ajax({
				url: "getAjaxList.do",
				method : "post", // type : "post", //type : "post", 메서드와 동일  <= type: "post" 같은뜻이다.
				dataType: "xml",
				success : function(data){
					//브라우져에서 먼저 확인후, 그 데이타를 여기에 가지고 온다.
					//테이블은 밑에 있으므로 만들필요없다.
					let tbody = "";
					$(data).find("member").each(function() {
						tbody += "<tr>";
						tbody += "<td>"+$(this).find("m_idx").text()+"</td>";
						tbody += "<td>"+$(this).find("m_id").text()+"</td>";
						tbody += "<td>"+$(this).find("m_pw").text()+"</td>";
						tbody += "<td>"+$(this).find("m_name").text()+"</td>";
						tbody += "<td>"+$(this).find("m_age").text()+"</td>";
						tbody += "<td>"+$(this).find("m_reg").text()+"</td>";
						
			
						tbody += "<td><input type='button' value='삭제' id='del' name=' "+$(this).find("m_idx").text()+" '></td>";
						
						
						
						tbody += "</tr>";
					});
					$("#tbody").append(tbody);
				},
				error:function(){
					alert("읽기 실패");
				}
			});
		};
		
		//다시 하기
		// 키보드를 누르고 띠어을때 날라가서 아이디가 있는지 없는지 검사
		$("#m_id").keyup(function() {
			$.ajax({
				url: "getAjaxIdChk.do",
				data : "m_id="+$("#m_id").val(),
				method : "post", // type : "post", // <= type: "post" 같은뜻이다.
				dataType: "text",
				success : function(data) {
					if(data == '1'){
						// 사용가능
						$("#join_btn").removeAttr("disabled");
						$("span").text("사용가능");
					}else if(data == '0'){
						// 사용불가능
						$("#join_btn").attr("disabled","disabled");
						$("span").text("사용불가");
					}
				},
				error : function() {
					alert("읽기실패");
				}
			});
		});
		// data가 여러개 일때는 직렬화를 사용한다.
		// serialize() => 직렬화, form 태그안에  있는 요소만 가능
		$("#join_btn").click(function() {
			let param = $("#myform").serialize();
			$.ajax({
				url : "getAjaxJoin.do",
				data : param,
				method : "post", // <= type: "post" 같은뜻이다.
				dataType : "text",
				success : function(data) {
					if(data == 0){
						alert("가입실패");
					}else if(data == 1){
					    $("#tbody").empty();
					}
				},
				error:function(){
					alert("실패");
				}
			});
		});
		
		$("table").on("click","#del" ,function() {
			$.ajax({
				url : "getAjaxDelete.do",
				data : "m_idx="+$(this).attr("name"),
				method : "post",
				dataType : "text",
				success : function(data) {
					if(data == 0){
						alert("삭제실패");
					}else if(data == 1){
					    $("#tbody").empty();
					    getList();
					}
				},
				error:function(){
					alert("실패");
				}
			});

		});
		
		//브라우저가 밑에 코드를 다 읽고 난 다음에 getList() 가 실행된다. 
		//ajax 는 자동으로 디비에 갔다와서 실행된다. 버튼 눌러서 실행되는게 아니다.
		getList();
	});
</script>
</head>
<body>
	<h2>Ajax를 이용한 DB 처리</h2>
	<h2> 회원 정보 입력하기 </h2>
	<form name="myform" id="myform" autocomplete="off" >
		<table>
			<thead>
				<tr>
					<th>아이디</th><th>패스워드</th><th>이름</th><th>나이</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<input type="text" size="14" name="m_id" id="m_id" ><br><span>중복여부</span>
					</td>
					<td> <input type="password" size="8" name="m_pw" ></td>  
					<td> <input type="text" size="14" name="m_name" ></td>  
					<td> <input type="text" size="25" name="m_age" ></td>   
				</tr>
			</tbody>
			<tfoot>
				<tr><td colspan="7" align="center"><input type="button" value="가입하기" id="join_btn" disabled></td></tr>
			</tfoot>
		</table>
	</form>
	<br /> <br /> <br />
	<h2> 회원 정보 보기 </h2>
	<div>
		<table id="list">
			<thead>
				<tr>
					<th>번호</th><th>아이디</th><th>패스워드</th><th>이름</th><th>나이</th><th>가입일</th><th>삭제</th>
				</tr>
			</thead>
			<tbody id="tbody"></tbody>
		</table>
	</div>
	
</body>
</html>