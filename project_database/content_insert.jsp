<%@ page import="java.sql.*,java.util.*, java.text.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<body>

<%
	Connection con = null;
	Statement stmt = null;
	Statement stmt1 = null;
	ResultSet rs = null;
	String time = null;

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

    String content_header =(String)session.getAttribute("content_header"); 
	String content_postBy = (String)session.getAttribute("content_postBy"); 
    String content_contents = (String)session.getAttribute("content_contents");

    java.util.Date date = new java.util.Date();

    SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
	date.getYear();
	date.getMonth();
	date.getDate();
	date.getDay();
	date.getHours();
	date.getMinutes();
	date.getSeconds();  
 	time = sdf1.format(date) ;



    String upd = "INSERT INTO content(content_header, content_postBy, content_contents , time) VALUES ('" + content_header + "','" + content_postBy+ "','" + content_contents + "','" + time + "')"; 

    stmt.executeUpdate(upd);

    
    stmt.close();  con.close();
   
}
catch(SQLException sqle){ out.println("sqle="+sqle); } 
finally{ try { if(con != null) { con.close(); } } 
catch(SQLException sqle) { out.println("sqle="+sqle); } }

 response.setHeader("Refresh","0; URL=index.jsp");  
%>
	
</body>