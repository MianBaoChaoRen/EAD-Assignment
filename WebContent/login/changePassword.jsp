<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


 //ChangePassword.jsp
    <FORM ACTION="ChangePassword" METHOD="GET">
<div id="login_box">
  <div id="login_header">
        Login
  </div>
  <div id="form_val">
    <div class="label">Email:</div>
    <div class="control"><input type="text" name="Email" id="Email"/></div>

    <div class="label">Password:</div>
    <div class="control"><input type="password" name="Password" id="Password"/></div>

    <div class="label">Confirm Password:</div>
    <div class="control"><input type="password" name="Password" id="Password"/></div>
    <div style="clear:both;height:0px;"></div>

    <div id="msgbox"></div>
  </div>

  <div id="login_footer">
  <!-- <script type="text/javascript">
  function closewindow() {
  window.close()
  }
  </script>-->
     <label>
    <input type="submit" onclick="location.href='http://localhost:8080/IntegrateAll/Index.jsp'" window.close();" name="Submit" id="Submit" value="Submit" class="send_button" />
    </label>
  </div>
</div>


</body>
</html>