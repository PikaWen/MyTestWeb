<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
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

<%
  Connection con = null;
  Statement stmt = null;
  Statement stmt1 = null;
  ResultSet rs = null;
  String checkaccount = null;
  String query = null;

request.setCharacterEncoding("Big5"); 
%>

<%

try 
{ Class.forName("com.mysql.jdbc.Driver").newInstance(); } 

catch (ClassNotFoundException e)
{ System.out.println("oh! Can't find Driver"); System.exit(1); }

try
{ 
  con = DriverManager.getConnection( "jdbc:mysql://140.137.41.137:3308/w10552?user=w10552&password=4bfqcn&useUnicode=true&characterEncoding=Big5");
  stmt = con.createStatement();

  stmt =con.createStatement( ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);  

 

  

 stmt.close(); 
  con.close(); 
  }
  
catch(SQLException sqle)
{ out.println("sqle="+sqle);} 
finally { try { if(con != null) { con.close(); } } 

catch(SQLException sqle) {out.println("sqle="+sqle);} } 
   
%>

<Script>

function checkRetype(){
 
if ((document.form1.pasw.value != document.form1.pasw2.value)||(document.form1.pasw.value=="")&&(document.form1.pasw2.value==""))
{ 
  document.getElementById('ok2').style.display='none';
   document.getElementById('no2').style.display='';
  document.form1.pasw.focus();
  document.form1.pasw2.value="";
  std="false";
   
}
else{
  std="true";
   document.getElementById('ok2').style.display='';
    document.getElementById('no2').style.display='none';
}
}

function checkPw(index,str){
  if(index==2){
  if(str.length < 8)
  { 
    document.getElementById('ok1').style.display='none';
    document.getElementById('no1').style.display='';
   document.form1.pasw.value="";
  
  }

  else
  {
     document.getElementById('ok1').style.display='';
    document.getElementById('no1').style.display='none';
  }
}
else if(index==0){
  if(str.length < 4)
  { 
    document.getElementById('ok').style.display='none';
    document.getElementById('no').style.display='';
    
  }
  else{
     document.getElementById('no').style.display='none';
    document.getElementById('ok').style.display='';
  }

}
else if(index==7){
  if(str.length < 4)
  { 
    document.getElementById('ok4').style.display='none';
    document.getElementById('no4').style.display='';
    
  }

  else
  {
     document.getElementById('ok4').style.display='';
    document.getElementById('no4').style.display='none';
  }
}
else if(index==4){
  if(str.length < 1)
  { 
    document.getElementById('ok3').style.display='none';
    document.getElementById('no3').style.display='';
    
    
  }

  else
  {

  document.getElementById('ok3').style.display='';
  document.getElementById('no3').style.display='none';

  }
}
}
function sex(){
  if (document.form1.elements[6].checked) 
    document.form1.gender.value="女生";
  else
    document.form1.gender.value="男生";
}

</Script>


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
    <li id="navlist1" style="color: #eee">註冊 <span style="font-family: Gill Sans MT Condensed">ˊωˋ</span> </li>
    </ol>
  </div>

     
    <div class="aaa">
      <ul class="nav nav-pills nav-stacked" id="nav">
        <li class="active"><a href="index.jsp" style="color: #eee">最新文章</a></li>
        <li><a href="Allcontent.jsp">所有文章</a></li>
      </ul> 
    </div>
    

    <div class="content" align="center">
   
   <h4><B>填寫會員資料</B></h4><br>
<B> ( * ) 代表欄位必須填寫</B><br>


<form name=form1 id="form1" action="account_register1.jsp" method="post" accept-charset="Big5"><br>
<table class="table1" name="table1" border=1>
<tr>
<th>&nbsp&nbsp* 會員帳號</th>
<td>&nbsp&nbsp<input type=text name="account"onkeyup="value=value.replace(/[\W]/g,'') " 
　　 onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/)" id="account" onblur="checkPw(0,this.value);" maxlength="8">&nbsp&nbsp4 ~ 8字元 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp

<button class="btn btn-default" type="button"  id="checkaccount" >檢查帳號 &nbsp<input TYPE=image id=no SRC=images/no.jpg align="center" style="display: none;"><input TYPE=image id=ok SRC=images/ok.jpg align="center" style="display: none;"></td>
</button>

</tr>
<tr>
<th>&nbsp&nbsp* 密碼</th>
<td>&nbsp&nbsp<input type=password name="pasw" id="pasw" onblur="checkPw(2,this.value);" maxlength="12">&nbsp&nbsp8 ~ 12 字元 &nbsp&nbsp<input TYPE=image id=no1 SRC=images/no.jpg align="center" style="display: none;"><input TYPE=image id=ok1 SRC=images/ok.jpg align="center" style="display: none;"></td>
</tr>
<tr>
<th>&nbsp&nbsp* 再次輸入密碼&nbsp&nbsp</th>
<td>&nbsp&nbsp<input type=password name="pasw2" id="pasw2" onblur="checkRetype();" maxlength="12"><input TYPE=image id=no2 SRC=images/no.jpg align="center" style="display: none;"><input TYPE=image id=ok2 SRC=images/ok.jpg align="center" style="display: none;"></td>
</tr>
<tr>
<th>&nbsp&nbsp* 暱稱</th>
<td>&nbsp&nbsp<input type=text name="name" id="name" onblur="checkPw(4,this.value);"  onclick="checkaccount1(this.value);"> &nbsp&nbsp<button class="btn btn-default" type="button" id="checkaccount" >檢查暱稱 &nbsp<input TYPE=image id=no3 SRC=images/no.jpg align="center" style="display: none;"><input TYPE=image id=ok3 SRC=images/ok.jpg align="center" style="display: none;"></td>
</tr>
<tr>
<th>&nbsp&nbsp&nbsp&nbsp性別</th>
<td>&nbsp&nbsp<input type=radio name="gender" id="gender" onfocus="sex();" value="男生">&nbsp&nbsp男生
&nbsp&nbsp<input type=radio name="gender" id="gender" onfocus="sex();" value="女生">&nbsp&nbsp女生</td>
</tr>

<tr>
<th>&nbsp&nbsp* 備忘碼</th>
<td>&nbsp&nbsp<input type=text name="content" onblur="checkPw(7,this.value);" id="content" maxlength="4" onKeyPress="return /[0-9]/.test(String.fromCharCode(event.keyCode));">&nbsp&nbsp 數字 4 碼 / 以防忘記密碼，作為認證用&nbsp&nbsp<input TYPE=image id=no4 SRC=images/no.jpg align="center" style="display: none;"><input TYPE=image id=ok4 SRC=images/ok.jpg align="center" style="display: none;"></td>
</tr>
</table>
<br><input type="submit" class="btn btn-danger" name="bun" onclick="self.location.href='account_register1.jsp'" value="確認註冊會員"></input><br>
</form>



</div>
   <div class="breadcrumb">Created 2016 by shih wen.</div>
</div>
<!-- javascript -->
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="js/bootstrap.min.js"></script>


</body>
