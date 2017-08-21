<%-- 
    Document   : AdminPanel
    Created on : Aug 21, 2017, 5:22:37 PM
    Author     : vkunal1996
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            body
            {
               background-image: url("images/bk.jpg");
               background-size: cover;
            }
            #heading
            {
                color:azure;
                background:pink;
                border: inset;
                border-bottom-left-radius: 30px;
                border-bottom-right-radius: 30px;
                border-top-left-radius: 30px;
                border-top-right-radius: 30px;
            }
            </style>
        <title>JSP Page</title>
    </head>
    <body>
        <h1 id="heading">Admin Panel</h1>
        <%
            try
            {
                Connection cn;
                PreparedStatement st;
                ResultSet rs;
                String sql;
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String url="jdbc:sqlserver://localhost:1433;databaseName=ScoreCard;user=vkunal1996;password=12345";
                cn=DriverManager.getConnection(url);
                String user=request.getParameter("uname");
                String pass=request.getParameter("upass");
                if(pass==null)
                {
                    pass="admin";
                    
                }
                
                sql="Select * from AdminPanel where Username=? and PAssword=?";
                st=cn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
                st.setString(1,user);
                st.setString(2,pass);
                rs=st.executeQuery();
                rs.last();
                    if(rs.getRow()==0)
                    {
                        out.println("<center>"
                                + "<h2> User does not exists </center>");
                        out.println(user);
                        out.println(pass);
                    }
                        else
                            {
                                out.println("<center>"
                                        + "<table>"
                                        + "<tr>"
                                        + "<td>Add Details</td>"
                                        + "<td><form action='Insertinfo.html' method=post><input type='submit' value='Enter Detials'></form></td>"
                                        +"<td>View Details</td>"
                                        + "<td><form action='ViewDetails.html' method=post><input type='submit' value='ViewDetials'></form></td>");
                            }
                
                
            }catch(Exception e)
            {
                out.println(e);
            }
        %>
    </body>
</html>
