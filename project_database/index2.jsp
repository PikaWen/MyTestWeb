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

%>

   <%
      Connection con = null;
      Statement stmt = null;
      ResultSet rs = null;

try 
{ Class.forName("com.mysql.jdbc.Driver").newInstance(); } 

catch (ClassNotFoundException e)
{ System.out.println("oh! Can't find Driver"); System.exit(1); }

try
{ 
  con = DriverManager.getConnection( "jdbc:mysql://140.137.41.137:3308/w10552?user=w10552&password=4bfqcn&useUnicode=true&characterEncoding=Big5");
  stmt = con.createStatement();

stmt =con.createStatement( ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE); 
  String  query = "select count(*) as rowcount from content" ; 

  rs = stmt.executeQuery(query);
  rs.next();
   int count123 = rs.getInt("rowcount");
session.setAttribute("count",count123);
 stmt.close(); 
  con.close(); 
  
} 
catch(SQLException sqle)
{ out.println("sqle="+sqle);} 
finally { try { if(con != null) { con.close(); } } 

catch(SQLException sqle) {out.println("sqle="+sqle);} } 
 

response.setHeader("Refresh","0; URL=index.jsp");
%>


</div>
   <div class="breadcrumb">Created 2016 by shih wen.</div>
</div>
<!-- javascript -->
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="js/bootstrap.min.js"></script>


</body>
