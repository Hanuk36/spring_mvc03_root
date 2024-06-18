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
	$("#result").empty();
	$.ajax({
		url : "dustdata.do" ,           
		method : "post",            
		dataType : "xml",            
		success : function (data) {
			let table ="<table>";
			table+= "<thead><tr><th>stationName</th><th>dataTime</th><th>o3Value</th><th>pm10Value</th></tr></thead>";
			table += "<tbody>";
			$(data).find("item").each(function() {
				let stationName = $(this).find("stationName").text();
				let dataTime = $(this).find("dataTime").text();
				let o3Value = $(this).find("o3Value").text();
				let pm10Value = $(this).find("pm10Value").text();
			
				table += "<tr>";
				table += "<td>" + stationName + "</td>";
				table += "<td>" + dataTime + "</td>";
				table += "<td>" + o3Value + "</td>";
				table += "<td>" + pm10Value + "</td>";
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
</script>
</head>
<body>
	<div id="result"></div>
</body>
</html>