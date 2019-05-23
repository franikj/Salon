<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="/Login-Registration_Form-master/WebContent/style.css">
<link href="style.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lobster&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Yanone+Kaffeesatz&display=swap" rel="stylesheet">
<%@ include file="go.jsp" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>Welcome</title>
</head>
<style>

.time{

  position: length 700 px;
  right: 50px;
  width: 300px;
  height: 100px;
  border: 3px solid #73C6B6;
}
</style>

<body>
<div class="time">
<script type="text/javascript">
document.write ('<p> Сьогодні: <span id="date-time">', new Date().toLocaleString(), '<\/span>.<\/p>')
if (document.getElementById) onload = function () {
	setInterval ("document.getElementById ('date-time').firstChild.data = new Date().toLocaleString()", 50)
}
</script>
</div>
</body>
</html>