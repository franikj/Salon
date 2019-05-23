<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Change password</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div class="menu">
<a href="contact.jsp">Contact</a>
<a href="aboutus.jsp">About us</a>
<a href="index.jsp">Home</a>
<a href="index.jsp">Log out</a>
</div><br><br>
<center><h1>Зміна паролю <span style="color: #e6b800"> </span></h1></center>
</head>
<h2 align="center" ><strong><span style="color: #e6b800"></span></strong></h2>

<script language="javascript">
function fncSubmit()
{

if(document.ChangePassword.OldPassword.value == "")
{
alert('Please input old password');
document.ChangePassword.OldPassword.focus();
return false;
} 

if(document.ChangePassword.newpassword.value == "")
{
alert('Please input Password');
document.ChangePassword.newpassword.focus(); 
return false;
} 

if(document.ChangePassword.conpassword.value == "")
{
alert('Please input Confirm Password');
document.ChangePassword.conpassword.focus(); 
return false;
} 

if(document.ChangePassword.newpassword.value != document.ChangePasswordForm.conpassword.value)
{
alert('Confirm Password Not Match');
document.ChangePasswordForm.conpassword.focus(); 
return false;
} 

document.ChangePasswordForm.submit();
}
</script>
<form name="ChangePasswordForm" method="post" action="processChangePWD.jsp" OnSubmit="return fncSubmit();">
<div class="forms" >

<center><p>Старий пароль </p><input name="OldPassword" type="password" id="OLDpwd" size="55"></center>
<center><p>Новий пароль </p><input name="newpassword" type="password" id="newpassword" size="55"></center>
<center><p>Підтвердіть пароль </p><input name="conpassword" type="password" id="conpassword" ><br></center>
<h2> hhhhhhhhhh</h2>
</div>
<center><input id="in"  type="submit" name="submit" value="Зберегти"></input></center> 
</form>
</head>
<body>

</body>
</html>
