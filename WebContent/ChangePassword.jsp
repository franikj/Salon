<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="//cdn.jsdelivr.net/gh/dmhendricks/bootstrap-grid-css@4.1.3/dist/css/bootstrap-grid.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Change password</title>
</head>
<body>
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

<center><h1>Зміна паролю</h1></center>
<form name="ChangePasswordForm" method="post" action="processChangePWD.jsp" OnSubmit="return fncSubmit(); ">
	<div class="container" style="wigth: 50%;">
	
	<div class="form-group" style="wigth: 50%;">
		<label>Старий пароль</label>
		<input type="password" class="form-control" required name="OldPassword" />
	</div>

	<div class="form-group" style="wigth: 50%;">
		<label>Новий пароль</label>
		<input type="password" class="form-control" name="newpassword"/></input>
	</div>
	<div class="form-group" style="wigth: 50%;">
		<label>Підтвердіть пароль</label>
		<input type="password" class="form-control" name="conpassword"/></input>
	</div>
	
	<button type="submit" class="btn btn-primary" name="submit"> Ok</button>
	<a href="./" class="btn btn-default">Back</a>
	</div> 
</form> 
	</body>

</html>
