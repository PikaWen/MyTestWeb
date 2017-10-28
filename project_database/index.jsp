<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="PaginationExample.*" %>
<%@ page import="java.util.*"%>
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
<%
 request.setCharacterEncoding("Big5"); 

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
  <div class="services">
    <ol class="breadcrumb">
    <li id="navlist"><a href="index.jsp">首頁</a></li>
    <li id="navlist1" style="color: #eee">最新文章 <span style="font-family: Gill Sans MT Condensed">ˊωˋ</span> </li>
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
      String content_header = null;
      String content_header2 = null;
      String content_header3 = null;
      String pageNoStr = request.getParameter("pageNoStr"); 
      int count =(Integer)session.getAttribute("count"); 
      int id = 0, id2 = 0, id3 = 0 , page555 = 3, pagenow=1 , totalPage=1;;
 
       if (pageNoStr != null && !pageNoStr.equals("")) {
        try {
            pagenow = Integer.parseInt(pageNoStr);
            
            if (pagenow < 1) {
          
                pagenow = 1;
            }
        }
        catch (NumberFormatException e) {
            pagenow = 1;
        }
    }
    else {
        pagenow = 1;
    }

       totalPage = count % page555 == 0 ? count / page555 : (int)(count / page555) + 1;  

      if(pagenow > totalPage){
       pagenow = totalPage;
      }
int startIndex = (pagenow - 1) * page555 ;
     
try 
{ Class.forName("com.mysql.jdbc.Driver").newInstance(); } 

catch (ClassNotFoundException e)
{ System.out.println("oh! Can't find Driver"); System.exit(1); }

try
{ 
  con = DriverManager.getConnection( "jdbc:mysql://140.137.41.137:3308/w10552?user=w10552&password=4bfqcn&useUnicode=true&characterEncoding=Big5");
  stmt = con.createStatement();

stmt =con.createStatement( ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE); 
  String  query = "select content_header,id from content order by id desc limit "+startIndex+",3" ; 

  rs = stmt.executeQuery(query);

  
  if(rs.next()){
    content_header = rs.getString("content_header");
    id = rs.getInt("id");}
    if(rs.next()){
    content_header2 = rs.getString("content_header");
     id2 = rs.getInt("id");
     }
     if(rs.next()){
    content_header3 = rs.getString("content_header");
    id3=rs.getInt("id");
    }
    
 stmt.close(); 
  con.close(); 
  
} 
catch(SQLException sqle)
{ out.println("sqle="+sqle);} 
finally { try { if(con != null) { con.close(); } } 

catch(SQLException sqle) {out.println("sqle="+sqle);} } 

   if(content_header!=null){%>
  <div class="content-header">
    <h3><%=content_header%>&nbsp&nbsp&nbsp<%if(pagenow==1){%><span class="label label-danger" style="color:#ffffff;font-family: Segoe Print;font-size: 10px;">New</span><%}%></h3>
   <br><br><br>
   <a accept-charset="Big5" href="content_show.jsp?content_header=<%=content_header%>&&id=<%=id%>" id="continue" >( 繼續閱讀 ...)</a>
    </div>
    <%}%>
    <% if(content_header2!=null){ %>
    <div class="content-second" >
    <h3><%=content_header2%></h3>
    <br><br><br>
    <a href="content_show.jsp?content_header=<%=content_header2%>&&id=<%=id2%>" id="continue" >( 繼續閱讀 ...)</a>
    </div>
    <%} if(content_header3!=null){%>
     <div class="content-third" >
    <h3><%=content_header3%></h3>
    <br><br><br>
    <a href="content_show.jsp?content_header=<%=content_header3%>&&id=<%=id3%>" id="continue" >( 繼續閱讀 ...)</a>
    </div>
    <%}%>
    
    <div align="center">
     <ul class="pager">
     <%if(pagenow>1){%>
    <li><a href="index.jsp?pageNoStr=<%=pagenow-1%>">前一頁</a></li>
    <%}if(content_header3!=null && (totalPage > pagenow)){%>
    <li><a href="index.jsp?pageNoStr=<%=pagenow+1%>">下一頁</a></li>
    <%}%>
    </div>
   

</div>
   <div class="breadcrumb">Created 2016 by shih wen.</div>
</div>
<!-- javascript -->
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="js/bootstrap.min.js"></script>


</body>
