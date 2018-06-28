<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자리바꾸기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <title>Side Menu</title>
 <link rel="stylesheet" href="templateStyle.css">
 <link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js" type="text/javascript"></script>
 <script>
$(document).ready(function(){
  /*
  $(".first").mouseover(function(){
    $(".second").css("background-color", '#6b81d5');
    $(".first").css("background-color", '#D56B81');

  });
  $(".second").mouseover(function(){
    $(".second").css("background-color", '#8a6bd5');
    $(".first").css("background-color", '#6bd5bf');

  });
  */
  $(".wrap").click(function(){
    $(".top").toggleClass("addedtop");
    $(".mid").toggleClass("addedmid");
    $(".bot").toggleClass("addedbot");
$(".side").toggleClass("triggered");
    $(".sidebtn").toggleClass("sideopacity");


  });
  
}); //final
</script>
</head>
<body>
<%
	String contentpage=request.getParameter("CONTENTPAGE");
%>
  <div class="wrap">
<span class="line top"></span>
  <span class="line mid"></span>
  <span class="line bot"></span>
  </div>
  <div class="side">
    <a href="main.jsp" class="sidebtn">홈</a>
    <a href="change.jsp" class="sidebtn">자리바꾸기</a>
    <a href="info.jsp" class="sidebtn">정보관리</a>
    <%
  		String id = (String)session.getAttribute("id");
  		if(id==null){
  	%><a href="login.jsp" class="sidebtn">로그인</a><%
  		}else{%>
  		<a href="logout.jsp" class="sidebtn">로그아웃</a>
  		<%} %>
  </div>
  <jsp:include page="<%= contentpage %>"></jsp:include>
</body>
</html>