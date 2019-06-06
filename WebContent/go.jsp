<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Lobster&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Yanone+Kaffeesatz&display=swap" rel="stylesheet">
<title>Menu</title>
</head>
<style>

#mainnav{
z-index: 10;
}

.header {
  padding: 10px 16px;
  background: #555;
  color: #f1f1f1;
}

.sticky {
  position: fixed;
  top: 0;
  width: 100%;
}


body {
  font-family: "Lato", sans-serif;
}

.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.sidenav a:hover {
  color: #f1f1f1;
}


.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>


</head>
<body>
<div id="mainnav"  class="header">
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="schedule">Журнал</a>
  <a href="services">Послуги</a>
  <a href="clients">Клієнти</a>
  <a href="sales">Продаж</a>
  <a href="products">Товари</a>
  <a href="writeoff">Cписання</a>
  <a href="staff">Працівники</a>
  <a href="reports">Звіти</a>
  
</div>
<div id="bla">
<center><h2>Салон краси Людмили Чайки</h2></center>

</div>
<span style="font-size:25px;cursor:pointer" onclick="openNav()">&#9776; Відкрити меню</span>
</div>


<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "260px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}
</script>

<script>
window.onscroll = function() {myFunction()};

var header = document.getElementById("mainnav");
var sticky = header.offsetTop;
function myFunction() {
  if (window.pageYOffset > sticky) {
    header.classList.add("sticky");
  }  
  else {
    header.classList.remove("sticky");
  }
}
</script>
</body>
</html>