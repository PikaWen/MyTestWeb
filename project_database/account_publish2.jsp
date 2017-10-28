<%@ page import="java.sql.*" %>

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta charset="utf-8">
    <title>My Website</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style type="text/javascrip"></style>
<!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/styles.css" rel="stylesheet">
    <script src="js/respond.js"></script>	

</head>
 <%request.setCharacterEncoding("Big5") ;%>
<%
    String account =(String)session.getAttribute("account"); 
    String account2=request.getParameter("account2");
  if(account2!=null){
  account=null;
    session.setAttribute("account",account);
  }
  else
  {
  }
%>

<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="navbar-header">
  <ul class="nav navbar-nav" >
  <a href="index.jsp" class="navbar-brand">WeN °ε°</a>
    <li class="active"><a href="index.jsp">首頁</a></li>
    <li><a href="Allcontent.jsp">文章</a></li>
    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" role="button" expanded="false" href="#" id="myaccount">我的帳號<span class="caret"></span></a>
    <ul class="dropdown-menu" role="menu">
    <li style="color: #282828">hi , <% if(account==null){ out.println(" 訪客");}else{ out.println(account);}%></li>
    <li class="divider"></li>
    <li><a href="p_post.jsp">個人文章</a></li>
     <%if(account!=null){%>
    <li class="divider"></li>
    <li><a href="account_publish.jsp">發表文章</a></li>
    <%}%>
    </ul>
    </li>
   <% if(account==null){%><li><a style="color: #eee" href="account_login.jsp" id="login">會員登入</a></li>
       <li><a style="color: #eee" href="account_register.jsp" id="create">註冊</a></li>
    <%}else{%> <li><a style="color: #eee" href='index.jsp?account2="123"' id="logout">登出</a></li><%}%>
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
      </div><!-- /input-group -->
  <div class="services">
    <ol class="breadcrumb">
    <li id="navlist"><a href="index.jsp">首頁</a></li>
        <li id="navlist1" style="color: #eee"><a href="account_publish.jsp" style="color: #eee">發表文章</a> <span style="font-family: Gill Sans MT Condensed">ˊωˋ</span> </li>
    <li id="navlist1" style="color: #eee">預覽文章 <span style="font-family: Gill Sans MT Condensed">ˊωˋ</span> </li>
    </ol>
  </div>

     
    <div class="aaa">
      <ul class="nav nav-pills nav-stacked" id="nav">
        <li class="active"><a href="index.jsp" style="color: #eee">最新文章</a></li>
        <li><a href="Allcontent.jsp">所有文章</a></li>

      </ul> 
    </div>
    
    <div class="content" align="center">
   
   <h4><B>確認文章內容</B></h4><br>

<%

	String content_header = (String)session.getAttribute("content_header");
  String content_contents = (String)session.getAttribute("content_contents");
 String content_postBy =(String)session.getAttribute("content_postBy"); 

%>


<%! // 字符处理函数 换行符变成<br>
public String turn123(String str) {  

    while (str.indexOf("\n") != -1) {  
        str = str.substring(0, str.indexOf("\n")) + "<br>"  
                + str.substring(str.indexOf("\n") + 1);  
    }  
    while (str.indexOf(" ") != -1) {  
        str = str.substring(0, str.indexOf(" ")) + "&nbsp"  
                + str.substring(str.indexOf(" ") + 1);  
    }  
    return str;  
}  
%>

<form name=form1 id="form1" action="content_insert.jsp" method="post" accept-charset="Big5"><br>
<table class="table3" name="table3" border=1>
<tr>
<th>&nbsp&nbsp 標題 : 
<%out.println(content_header);%></th>
</tr>
<tr>
<th>&nbsp&nbsp 發表人 :
<%out.println(content_postBy);%></th>
</tr>
<tr>
<th style="font-size: 18px; font-weight: normal;"><% 
String contents = turn123(content_contents);
out.println(contents);%></th>
</tr>
</table>
<%
	session.setAttribute("content_header",content_header);
	session.setAttribute("content_postBy",content_postBy);
	session.setAttribute("content_contents",content_contents);

%>
<br><input type="submit" class="btn btn-danger" name="bun" onclick="self.location.href='content_insert.jsp'" value="發表文章"></input><br>

</form>


</div>
   <div class="breadcrumb">Created 2016 by shih wen.</div>
</div>
<!-- javascript -->
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="js/bootstrap.min.js"></script>


</body>

</html>