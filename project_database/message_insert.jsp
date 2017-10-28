<%@ page import="java.sql.*,java.util.*, java.text.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<body>

<%
request.setCharacterEncoding("Big5"); 
	Connection con = null;
	Statement stmt = null;
	Statement stmt1 = null;
	ResultSet rs = null;
	String time = null;
	String messageBy =(String)session.getAttribute("messageBy"); 
	String messageWhere =(String)session.getAttribute("messageWhere"); 
	String message_content =request.getParameter("message"); 
	String id =(String)session.getAttribute("id");
	if(message_content==null || message_content==""){
	%><script>alert("請輸入留言內容 !");</script><%
	 response.setHeader("Refresh","0; URL=content_show.jsp");
}else{

try 
{ Class.forName("com.mysql.jdbc.Driver").newInstance(); } 

catch (ClassNotFoundException e)
{ System.out.println("oh! Can't find Driver"); System.exit(1); }

try
{ 
	con = DriverManager.getConnection( "jdbc:mysql://140.137.41.137:3308/w10552?user=w10552&password=4bfqcn&useUnicode=true&characterEncoding=Big5");
	stmt = con.createStatement();
   

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



    String upd = "INSERT INTO message(messageBy, message_content,  time ,messageWhere) VALUES ('" + messageBy + "','" + message_content+ "','" + time + "' ,'" + messageWhere + "')"; 

    stmt.executeUpdate(upd);

    
    stmt.close();  con.close();
   
}
catch(SQLException sqle){ out.println("sqle="+sqle); } 
finally{ try { if(con != null) { con.close(); } } 
catch(SQLException sqle) { out.println("sqle="+sqle); } }
	response.setHeader("Refresh","0; URL=content_show.jsp?id="+id);
}	 
%>

</body>