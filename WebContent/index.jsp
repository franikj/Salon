<%@ page language="java" contentType="text/html; charset=utf-8" 
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<link rel="stylesheet" type="text/css" href="/Login-Registration_Form-master/WebContent/style.css">
<link href="style.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lobster&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Yanone+Kaffeesatz&display=swap" rel="stylesheet">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Login</title>
<body>

	 <center><h1>Салон краси Людмили Чайки</h1></center>
	 
<form method="post" action="Indexcontroller" >

    <center><input type="text" required name="Username" placeholder="Username" ></input><br></center>
    <center><input type="password" required name="Password" placeholder="Password"></input><br></center><br>
  	<center><input id="in" type= "submit" name="submit" value="Увійти"></input><br><br></center>
</form>
<!-- <a href="Login.jsp? s1=link">Get all user detail</a> -->
	<!-- <center><h2>Немає акаунту? <a href="register.jsp" style="color:#73C6B6"> Створити</a></h2></center>
   --><footer>
 <center><i id="i" > Salon 2019 ©</i></center>
 </footer> 
</body>

</html>



