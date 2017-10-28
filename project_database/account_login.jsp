<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta charset="utf-8">
    <title>My Website</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/styles.css" rel="stylesheet">
    <script src="js/respond.js"></script>
</head>

<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="navbar-header">
  <ul class="nav navbar-nav" >
  <a href="index.jsp" class="navbar-brand">WeN °ε°</a>
    <li class="active"><a href="index.jsp">首頁</a></li>
    <li><a href="Allcontent.jsp">文章</a></li>
    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" role="button" expanded="false" href="#" id="myaccount">我的帳號<span class="caret"></span></a>
    <ul class="dropdown-menu" role="menu">
    <li style="color: #282828">hi , <% { out.println(" 訪客");}%></li>
    <li class="divider"></li>
    <li><a href="p_post.jsp">個人文章</a></li>
    </ul>
    </li>
   <% %><li><a style="color: #eee" href="account_login.jsp" id="login">會員登入</a></li>
       <li><a style="color: #eee" href="account_register.jsp" id="create">註冊</a></li>

  </ul>
  </div>

  </nav>



<header class="bgimage" >
<div class="header">
      <h1 class="headera">Shih-Wen.com</h1>
</div></header>
<form action="content_search.jsp" method="post" accept-charset="Big5">
    <div class="input-group">
    
      <input type="text" class="form-control" name="search" id="search">
      <span class="input-group-btn">
     <input  class="btn btn-default" type="submit" aria-label="Left Align" onclick="self.location.href='content_search.jsp'" value="查詢">
      <span class="glyphicon glyphicon-search" aria-hidden="true" > </span>

      </button>
      </span>
     
      </div><!-- /input-group -->
       </form>
  <div class="services">
    <ol class="breadcrumb">
    <li id="navlist"><a href="index.jsp">首頁</a></li>
    <li id="navlist1" style="color: #eee">會員登入 <span style="font-family: Gill Sans MT Condensed">ˊωˋ</span> </li>
    </ol>
  </div>

     
    <div class="aaa">
      <ul class="nav nav-pills nav-stacked" id="nav">
        <li class="active"><a href="index.jsp" style="color: #eee">最新文章</a></li>
        <li><a href="Allcontent.jsp">所有文章</a></li>
      </ul> 
    </div>
    

    <div class="content" align="center">
    <table border="0">
    <tr><th><h3 align="center">&nbsp會員登入</h3><br></th></tr>
 <form name=form1 id="form1" action="account_login1.jsp" method="post" accept-charset="Big5">
 <%
Cookie cookies[]=request.getCookies();
String account="";
String password="";
if(cookies == null){
 %>
<tr><th align="center"><B>帳號 : </B>&nbsp&nbsp&nbsp
<input type=text class="form-group" name="account" id="account" style="font-family: Calibri;"><br><br></th></tr>
<tr><th  align="center"><B>密碼 : </B>&nbsp&nbsp&nbsp
<input type=password class="form-group" name="pasw" id="pasw" style="font-family: Calibri;" ><br><br></th></tr>
<tr><th>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type=checkbox class="form-group" name="box" id="box" value="yes">&nbsp&nbsp保持今日的登入狀態<br><br></th></tr>
<tr><td align="center">&nbsp&nbsp&nbsp&nbsp<input type=submit class="form-group btn btn-default" name="bun" onclick="self.location.href='account_login1.jsp'" value="登入"></button><br><br></td></tr>

<tr><td align="center">&nbsp&nbsp&nbsp&nbsp<button type=button class="form-group btn btn-danger" name="bun1" onclick="self.location.href='#.html'">忘記密碼</button>
&nbsp&nbsp<button type=button class="form-group btn btn-danger" name="bun2" onclick="self.location.href='account_register.jsp'" >加入會員</button><br><br></td></tr>
<%}
else{
  for(int i=0;i< cookies.length;i++)
    {
      if(cookies[i].getName().equals("account"))
        account = cookies[i].getValue();
      else if(cookies[i].getName().equals("password"))
        password = cookies[i].getValue();
    } %>
    <tr><th align="center"><B>帳號 : </B>&nbsp&nbsp&nbsp
<input type=text class="form-group" name="account" id="account" style="font-family: Calibri;" value=<%=account%>><br><br></th></tr>
<tr><th  align="center"><B>密碼 : </B>&nbsp&nbsp&nbsp
<input type=password class="form-group" name="pasw" id="pasw" style="font-family: Calibri;" value=<%=password%>><br><br></th></tr>
<tr><th>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type=checkbox class="form-group" name="box" id="box" value="yes">&nbsp&nbsp保持今日的登入狀態<br><br></th></tr>
<tr><td align="center">&nbsp&nbsp&nbsp&nbsp<input type=submit class="form-group btn btn-default" name="bun" onclick="self.location.href='account_login1.jsp'" value="登入"></button><br><br></td></tr>

<tr><td align="center">&nbsp&nbsp
&nbsp&nbsp<button type=button class="form-group btn btn-danger" name="bun2" onclick="self.location.href='account_register.jsp'" >加入會員</button><br><br></td></tr>
<%}%>
</form>
</table>
</div>
   <div class="breadcrumb">Created 2016 by shih wen.</div>
</div>
<!-- javascript -->
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="js/bootstrap.min.js"></script>


</body>
