<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<body>

<%
  request.setCharacterEncoding("Big5"); 
  Connection con = null;
  Statement stmt = null;
  Statement stmt1 = null;
  ResultSet rs = null;
  int i = 0;
  String account123=request.getParameter("account");
 String password123=request.getParameter("pasw");
  String box=request.getParameter("box");
 if(account123==""){
 if(password123==""){
  %>
  <script>
    alert("請輸入帳號密碼 !");
  </script>

  <% 
 Cookie newuserCookie=new Cookie("account",null);  
    Cookie newpasswordCookie=new Cookie("password",null);  
     newuserCookie.setMaxAge(60*60*24);
     newpasswordCookie.setMaxAge(60*60*24);
     response.addCookie(newuserCookie);            
     response.addCookie(newpasswordCookie); 
  response.setHeader("Refresh","0;URL=account_login.jsp");
  }
  else{
   %>
  <script>
    alert("請輸入帳號 !");
  </script>
  <% 
   Cookie newuserCookie=new Cookie("account",null);  
    Cookie newpasswordCookie=new Cookie("password",null);  
     newuserCookie.setMaxAge(60*60*24);
     newpasswordCookie.setMaxAge(60*60*24);
     response.addCookie(newuserCookie);            
     response.addCookie(newpasswordCookie); 
  response.setHeader("Refresh","0;URL=account_login.jsp");
  }
 }
else{
if(password123==""){
   %>
  <script>
    alert("請輸入密碼 !");
  </script>
  <%
   Cookie newuserCookie=new Cookie("account",null);  
    Cookie newpasswordCookie=new Cookie("password",null);  
     newuserCookie.setMaxAge(60*60*24);
     newpasswordCookie.setMaxAge(60*60*24);
     response.addCookie(newuserCookie);            
     response.addCookie(newpasswordCookie); 
  response.setHeader("Refresh","0;URL=account_login.jsp");
}
else{

try 
{ Class.forName("com.mysql.jdbc.Driver").newInstance(); } 

catch (ClassNotFoundException e)
{ System.out.println("oh! Can't find Driver"); System.exit(1); }

try
{ 
  con = DriverManager.getConnection( "jdbc:mysql://140.137.41.137:3308/w10552?user=w10552&password=4bfqcn&useUnicode=true&characterEncoding=Big5");
  stmt = con.createStatement();

  stmt =con.createStatement( ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE); 
    String query = "SELECT * FROM accountdata WHERE account='"+account123+"' and password='"+password123+"'"; 

  rs = stmt.executeQuery(query);
 
  if(!rs.next())
  {
    %><script>
    alert("無此帳號密碼 !");
  </script><%
 Cookie newuserCookie=new Cookie("account",null);  
    Cookie newpasswordCookie=new Cookie("password",null);  
     newuserCookie.setMaxAge(60*60*24);
     newpasswordCookie.setMaxAge(60*60*24);
     response.addCookie(newuserCookie);            
     response.addCookie(newpasswordCookie); 

  }
  else 
  {
    if(box!=null){
        Cookie userCookie = new Cookie("account", account123);
        Cookie passwordCookie = new Cookie("password", password123);
        userCookie.setMaxAge(60*60*24);
        passwordCookie.setMaxAge(60*60*24);
        response.addCookie(userCookie);
        response.addCookie(passwordCookie);
    }
    else{
     Cookie newuserCookie=new Cookie("account",null);  
    Cookie newpasswordCookie=new Cookie("password",null);  
     newuserCookie.setMaxAge(60*60*24);
     newpasswordCookie.setMaxAge(60*60*24);
     response.addCookie(newuserCookie);            
     response.addCookie(newpasswordCookie); 
    }
    session.setAttribute("account",account123);
    i=1;
  }   

 stmt.close(); 
  con.close(); 
  
} 
catch(SQLException sqle)
{ out.println("sqle="+sqle);} 
finally { try { if(con != null) { con.close(); } } 

catch(SQLException sqle) {out.println("sqle="+sqle);} } 
 
 if(i==1)
  {response.setHeader("Refresh","0; URL=index.jsp");}
else{ response.setHeader("Refresh","0; URL=account_login.jsp");
}

}
}
%>
  
</body>