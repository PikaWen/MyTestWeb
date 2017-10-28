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

<body>

<%
	
	String password = request.getParameter("pasw");
    String name = request.getParameter("name");
  	String sex = request.getParameter("gender"); 
  	String content = request.getParameter("content");  
String account =request.getParameter("account"); 
    if(account==null || account==""){
      if(password==null || password==""){
        if(name==null || name==""){
          if(content==null || content==""){
            %><script>alert("請確實填寫資料");</script><%
            response.setHeader("Refresh","0; URL=account_register.jsp");
          }
          else
          {
            %><script>alert("請確實填寫資料");</script><%
            response.setHeader("Refresh","0; URL=account_register.jsp");

          }
        }
        else{
         if(content==null || content==""){
             %><script>alert("請確實填寫資料");</script><%
             response.setHeader("Refresh","0; URL=account_register.jsp");
            }
          else
          {
            %><script>alert("請填寫帳號密碼");</script><%
            response.setHeader("Refresh","0; URL=account_register.jsp");
          }
        }
      }
        else{
          if(name==null || name==""){
          if(content==null || content==""){
            %><script>alert("請確實填寫資料");</script><%
            response.setHeader("Refresh","0; URL=account_register.jsp");
          }
          else
          {
            %><script>alert("請填寫帳號暱稱");</script><%
            response.setHeader("Refresh","0; URL=account_register.jsp");

          }
        }
        else{
         if(content==null || content==""){
             %><script>alert("請填寫帳號備忘碼");</script><%
             response.setHeader("Refresh","0; URL=account_register.jsp");
            }
          else
          {
            %><script>alert("請填寫帳號");</script><%
            response.setHeader("Refresh","0; URL=account_register.jsp");
          }
        }
      }
    }
        else{
          if(password==null || password==""){
        if(name==null || name==""){
          if(content==null || content==""){
            %><script>alert("請確實填寫資料");</script><%
            response.setHeader("Refresh","0; URL=account_register.jsp");
          }
          else
          {
            %><script>alert("請填寫密碼暱稱");</script><%
            response.setHeader("Refresh","0; URL=account_register.jsp");

          }
        }
        else{
         if(content==null || content==""){
             %><script>alert("請填寫密碼備忘碼");</script><%
             response.setHeader("Refresh","0; URL=account_register.jsp");
            }
          else
          {
            %><script>alert("請填寫密碼");</script><%
            response.setHeader("Refresh","0; URL=account_register.jsp");
          }
        }
      }
        else{
          if(name==null || name==""){
          if(content==null || content==""){
            %><script>alert("請填寫暱稱備忘碼");</script><%
            response.setHeader("Refresh","0; URL=account_register.jsp");
          }
          else
          {
            %><script>alert("請填寫暱稱");</script><%
              response.setHeader("Refresh","0; URL=account_register.jsp");
          }
        }
        else{
         if(content==null || content==""){
             %><script>alert("請填寫備忘碼");</script><%
             response.setHeader("Refresh","0; URL=account_register.jsp");
            }
          else
          {


  Connection con = null;
  Statement stmt = null;
  Statement stmt1 = null;
  ResultSet rs = null;

try 
{ Class.forName("com.mysql.jdbc.Driver").newInstance(); } 

catch (ClassNotFoundException e)
{ System.out.println("oh! Can't find Driver"); System.exit(1); }

try
{ 
  con = DriverManager.getConnection( "jdbc:mysql://140.137.41.137:3308/w10552?user=w10552&password=4bfqcn&useUnicode=true&characterEncoding=Big5");
  stmt = con.createStatement();


    String upd = "INSERT INTO accountdata(account, password, name, sex, content) VALUES ('" + account + "','" + password+ "','" + name + "','" + sex + "','" + content + "')"; 

    stmt.executeUpdate(upd);

    session.setAttribute("account",account);
    stmt.close();  con.close();
   
}
catch(SQLException sqle){ out.println("sqle="+sqle); } 
finally{ try { if(con != null) { con.close(); } } 
catch(SQLException sqle) { out.println("sqle="+sqle); } }

 response.setHeader("Refresh","0; URL=index.jsp");  
}
}
}
}
%>
  

</form>


</div>
   <div class="breadcrumb">Created 2016 by shih wen.</div>
</div>
<!-- javascript -->
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="js/bootstrap.min.js"></script>


</body>
