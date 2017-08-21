<%-- 
    Document   : DisplayInformation
    Created on : Aug 21, 2017, 7:05:03 PM
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
    <center>
        <h1 id="heading">Detail of the Student</h1>
        <%
            String name="";
            String roll="";
            String address="";
            int cint=0;
            int cout=0;
            int cppint=0;
            int cppout=0;
            int javaint=0;
            int javaout=0;
            int phpint=0;
            int phpout=0;
            int sqlint=0;
            int sqlout=0;
            float total=0;
            float percentage=0;
            String Grade="";
            try
            {
                 Connection cn;
                PreparedStatement st;
                ResultSet rs;
                String sql;
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String url="jdbc:sqlserver://localhost:1433;databaseName=ScoreCard;user=vkunal1996;password=12345";
                cn=DriverManager.getConnection(url);
                roll=request.getParameter("Roll");
                
                sql="Select * from StudentDetails where RollNumber=?";
                st=cn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
                st.setString(1,roll);
                rs=st.executeQuery();
                rs.last();
                    if(rs.getRow()==0)
                    {
                        
                        out.println("<h2>Roll Number DoesNot Exists</h2>"
                        +"<form action='AdminPanel.jsp' method=post>"
                                + "<input type='hidden' name='uname' value='admin'>"
                                + "<input type='hidden' name='upass' value='admin'>"
                                + "<input type='Submit' value='Home'>"
                                
                                + "</form>");
                    }
                        else
                    {
                        name=rs.getString("Name");
                        roll=rs.getString("RollNumber");
                        address=rs.getString("Address");
                        cint=rs.getInt("Cinternal");
                        cout=rs.getInt("CExternal");
                        cppint=rs.getInt("CPPinternal");
                        cppout=rs.getInt("CPPExternal");
                        javaint=rs.getInt("Javainternal");
                        javaout=rs.getInt("JavaExternal");
                        phpint=rs.getInt("Phpinternal");
                        phpout=rs.getInt("PhpExternal");
                        sqlint=rs.getInt("SQLinternal");
                        sqlout=rs.getInt("SqlExternal");
                        total=Float.parseFloat(rs.getString("Total"));
                        percentage=Float.parseFloat(rs.getString("Percentage"));
                        Grade=rs.getString("Grade");
                        out.println("<h2>Detials</h2>"
                        +"<form action='AdminPanel.jsp' method=post>"
                               + "<input type='hidden' name='uname' value='admin'>"
                                + "<input type='hidden' name='upass' value='admin'>");
                        out.println("<table>"
                                + "<tr>"
                                + "<td align='left'>Student Name: </td>"
                                + "<td>"+name+"</td>"
                                + "</tr>"
                                + "<tr>"
                                + "<td align='left'>Student RollNumber: </td>"
                                + "<td>"+roll+"</td>"
                                + "</tr>"
                                + "<tr>"
                                + "<td align='left'>Student Address: </td>"
                                + "<td>"+address+"</td>"
                                + "</tr>"
                                +"</table>"
                                +"<table>"
                                        + "<tr>"
                                        + "<td align='left'>Subject</td>"
                                        + "<td align='center'>Internal</td>"
                                        + "<td align='center'>External</td>"
                                        + "<td align='center'>Total</td>"
                                        +"</tr>"
                                        + "<tr>"
                                        + "<td align='left'>C</td>"
                                        + "<td align='center'>"+cint+"</td>"
                                        + "<td align='center'>"+cout+"</td>"
                                        + "<td align='center'>"+(cint+cout)+"</td>"
                                        +"</tr>"
                                        + "<tr>"
                                        + "<td align='left'>CPP</td>"
                                        + "<td align='center'>"+cppint+"</td>"
                                        + "<td align='center'>"+cppout+"</td>"
                                        + "<td align='center'>"+(cppint+cppout)+"</td>"
                                        +"</tr>"
                                                + "<tr>"
                                        + "<td align='left'>Java</td>"
                                        + "<td align='center'>"+javaint+"</td>"
                                        + "<td align='center'>"+javaout+"</td>"
                                        + "<td align='center'>"+(javaint+javaout)+"</td>"
                                        +"</tr>"
                                                + "<tr>"
                                        + "<td align='left'>PHP</td>"
                                        + "<td align='center'>"+phpint+"</td>"
                                        + "<td align='center'>"+phpout+"</td>"
                                        + "<td align='center'>"+(phpint+phpout)+"</td>"
                                        +"</tr>"
                                                + "<tr>"
                                        + "<td align='left'>SQL</td>"
                                        + "<td align='center'>"+sqlint+"</td>"
                                        + "<td align='center'>"+sqlout+"</td>"
                                        + "<td align='center'>"+(sqlint+sqlout)+"</td>"
                                        +"</tr>"
                                                + "<tr>"
                                                + "<td colspan='3' align='center'> Total Marks :"+total+"</td>"
                                                + "</tr>"
                                                        + "<tr>"
                                                + "<td colspan='3' align='center'> Total Percentage :"+percentage+" %</td>"
                                                + "</tr>"
                                                        + "<tr>"
                                                + "<td colspan='3' align='center'> Grade :"+Grade+"</td>"
                                                + "</tr>"
                                                  
 
                                        
                                + "</table>"
                                



                        );
                                out.println( "<input type='Submit' value='Home'>"
                                + "</form>");
                        
                        
                        
                        
                        
                    }
                        cn.close();
            }catch(Exception e){out.println(e);}
        %>
        
        </center>
    </body>
</html>
