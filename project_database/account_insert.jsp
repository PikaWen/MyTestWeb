<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<body>

<%
	Connection con = null;
	Statement stmt = null;
	Statement stmt1 = null;
	ResultSet rs = null;

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

    String account =(String)session.getAttribute("account"); 
	String name = (String)session.getAttribute("name"); 
    String sex = (String)session.getAttribute("gender");
    String password = (String)session.getAttribute("pasw"); 
    String content = (String)session.getAttribute("content"); 

    String upd = "INSERT INTO accountdata(account, password, name, sex, content) VALUES ('" + account + "','" + password+ "','" + name + "','" + sex + "','" + content + "')"; 

    stmt.executeUpdate(upd);

    session.setAttribute("account",account);
    stmt.close();  con.close();
   
}
catch(SQLException sqle){ out.println("sqle="+sqle); } 
finally{ try { if(con != null) { con.close(); } } 
catch(SQLException sqle) { out.println("sqle="+sqle); } }

 response.setHeader("Refresh","0; URL=index.jsp");  
%>
	
</body>