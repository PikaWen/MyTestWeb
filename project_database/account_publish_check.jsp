<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
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
	String content_header = request.getParameter("content_header");
  	String content_contents = request.getParameter("content_contents");
 	String content_postBy =(String)session.getAttribute("content_postBy"); 

 	if(content_header=="" || content_header==null)
 	{
 		if(content_contents == "" || content_contents==null){
 		%><script> alert("請輸入標題與文章內容");</script><%
 		response.setHeader("Refresh","0; URL=account_publish.jsp");  
 		}
 		else{
 			%><script> alert("請輸入標題");</script><%
 			response.setHeader("Refresh","0; URL=account_publish.jsp");  
 		}
}
else{
	if(content_contents == "" || content_contents==null){
 		%><script> alert("請輸入文章內容");</script><%

 response.setHeader("Refresh","0; URL=account_publish.jsp");  
 		}
 		else{
 			session.setAttribute("content_header",content_header);
	session.setAttribute("content_postBy",content_postBy);
	session.setAttribute("content_contents",content_contents);

 response.setHeader("Refresh","0; URL=account_publish2.jsp");  
 		}
 			
}
%>