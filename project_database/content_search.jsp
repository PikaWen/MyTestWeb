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
 <%request.setCharacterEncoding("Big5");%>
<%
    String account =(String)session.getAttribute("account"); 
    String account2=request.getParameter("account2");
    String search=request.getParameter("search");
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
  <div class="services">
    <ol class="breadcrumb">
    <li id="navlist"><a href="index.jsp">首頁</a></li>
    <li id="navlist1" style="color: #eee">收尋文章 <span style="font-family: Gill Sans MT Condensed">ˊωˋ</span>
    </ol>
  </div>

     
    <div class="aaa">
      <ul class="nav nav-pills nav-stacked" id="nav">
        <li class="active"><a href="index.jsp" style="color: #eee">最新文章</a></li>
        <li><a href="Allcontent.jsp">所有文章</a></li>
      </ul> 
    </div>
    

    <div class="content" align="center">

<%

Connection con = null;
Statement stmt = null;
ResultSet rs = null;
String content_postBy=null;
String content_header=null;

int id=0;
%>

<% 

try { 
  Class.forName("com.mysql.jdbc.Driver").newInstance(); 
} 
catch(ClassNotFoundException e)
 { System.out.println("oh! Can't find Driver"); System.exit(1); }

try{ 

con = DriverManager.getConnection( "jdbc:mysql://140.137.41.137:3308/w10552?user=w10552&password=4bfqcn&useUnicode=true&characterEncoding=Big5");

stmt =con.createStatement( ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE); 
String query = "SELECT content_header,content_postBy, id FROM content WHERE content_header='"+search+"'";

rs = stmt.executeQuery(query);
if(rs.next()){
rs.beforeFirst();
%><div class="panel panel-info"><ul class="list-group"><%
while(rs.next()){
content_header= rs.getString("content_header");
content_postBy= rs.getString("content_postBy");
id= rs.getInt("id");
%> <li class="list-group-item"><a href="content_show.jsp?id=<%=id%>" style="padding: 2%; margin-top: 3%;  font-family: Calibri , 微軟正黑體; font-size: 18px; color: #282828"><%=content_header%> &nbsp&nbsp&nbsp by <%=content_postBy%></a></li><br><%

}
}
else{
  %><h5 align="center" style="padding: 10%;"><%out.println("查無此文章 !");%></h5><%
}
%></ul></div><%
stmt.close(); 
con.close(); 
} 
catch(SQLException sqle)
{ out.println("sqle="+sqle);} 
finally { try { if(con != null) { con.close(); } } 

catch(SQLException sqle) {out.println("sqle="+sqle);} } 

%>

</div>
   <div class="breadcrumb">Created 2016 by shih wen.</div>
</div>
<!-- javascript -->
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="js/bootstrap.min.js"></script>


</body>

</html>