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
 <%request.setCharacterEncoding("Big5");
    String account =(String)session.getAttribute("account"); 
    String account2=request.getParameter("account2");
    String content_header=request.getParameter("content_header");
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
    <li id="navlist1" style="color: #eee"><a href="index.jsp" style="color: #eee">最新文章 <span style="font-family: Gill Sans MT Condensed">ˊωˋ</span></a> </li>
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
String time123 = null;
String id=request.getParameter("id");
String content_postBy = null;
String content_contents = null;

int id2=0;
String messageBy = null;
String message_content = null;
String time = null;
String messageWhere = null;


%>
<table border="1" class="table_content">
<% 

try { 
  Class.forName("com.mysql.jdbc.Driver").newInstance(); 
} 
catch(ClassNotFoundException e)
 { System.out.println("oh! Can't find Driver"); System.exit(1); }

try{ 

con = DriverManager.getConnection( "jdbc:mysql://140.137.41.137:3308/w10552?user=w10552&password=4bfqcn&useUnicode=true&characterEncoding=Big5");

stmt =con.createStatement( ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE); 
String query = "SELECT * FROM content WHERE id='"+id+"'";

rs = stmt.executeQuery(query);
rs.next();
content_header= rs.getString("content_header");
content_postBy=rs.getString("content_postBy");
content_contents=rs.getString("content_contents");
time123=rs.getString("time");

stmt.close(); 
con.close(); 
} 
catch(SQLException sqle)
{ out.println("sqle="+sqle);} 
finally { try { if(con != null) { con.close(); } } 

catch(SQLException sqle) {out.println("sqle="+sqle);} } 

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


<tr><th style="padding-left: 5%;"><h3><%=content_header%>
<span style="font-size: 15px; font-weight: normal;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbspby &nbsp&nbsp&nbsp<%=content_postBy%></span>
<span style="font-size: 15px; font-weight: normal;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp發表時間 &nbsp&nbsp&nbsp<%=time123%></span>
</h3></th></tr>
<tr><th style="width: 90%; font-size: 18px; font-weight: normal; padding: 10%;"><%String contents = turn123(content_contents);
out.println(contents);%></th></tr>

</table>
<br><br>
<p style="font-size: 15px; color: #595959">留言區</p><br><br>
<% 

try { 
  Class.forName("com.mysql.jdbc.Driver").newInstance(); 
} 
catch(ClassNotFoundException e)
 { System.out.println("oh! Can't find Driver"); System.exit(1); }

try{ 

con = DriverManager.getConnection( "jdbc:mysql://140.137.41.137:3308/w10552?user=w10552&password=4bfqcn&useUnicode=true&characterEncoding=Big5");

stmt =con.createStatement( ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE); 
String query = "SELECT * FROM message Order by id ";

rs = stmt.executeQuery(query);
rs.beforeFirst();
while(rs.next()){
  messageBy = rs.getString("messageBy");
  message_content = rs.getString("message_content");
  time = rs.getString("time");
  messageWhere = rs.getString("messageWhere");
  if(messageWhere.equals(content_header)){
%>  
<div class="panel panel-success" style="min-width: 60%; border-color: #282828; margin-right: 5%; margin-left: 5%; font-family: Calibri">
<div class="panel-heading" align="left" style="border-right: 1px solid #282828; float: left; height: 100px;"  ><h6 style="float: left;"></h6>&nbsp&nbsp<h4 style="float: left;">&nbsp&nbsp&nbsp&nbsp<%=messageBy%>&nbsp&nbsp&nbsp<br><h6><%=time%></h6></h4></div>
<div class="panel-body" align="left" style="padding: 5%; margin-left:20%; height: 100px;"><%=message_content%></div>
</div>
<%
}
}

stmt.close(); 
con.close(); 
} 
catch(SQLException sqle)
{ out.println("sqle="+sqle);} 
finally { try { if(con != null) { con.close(); } } 

catch(SQLException sqle) {out.println("sqle="+sqle);} } 



if(account!=null){%>
<table border="1" class="table_content">
<form name=form1 id="form1" action="message_insert.jsp" method="post" accept-charset="Big5"><br>
<tr><th><h4>留言</h4></th></tr>
<tr><td><textarea name="message" id="message" style="width: 100%; height: 100px;"></textarea><br><br>
<%session.setAttribute("messageBy",account);session.setAttribute("messageWhere",content_header);session.setAttribute("id",id);%>
<input type="submit" class="btn btn-danger" name="bun" style="margin-left: 50%" onclick="self.location.href='message_insert.jsp'" value="留言">
</td></tr>
</form>
</table>
<%}%>
</div>
   <div class="breadcrumb">Created 2016 by shih wen.</div>
</div>
<!-- javascript -->
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="js/bootstrap.min.js"></script>


</body>

</html>