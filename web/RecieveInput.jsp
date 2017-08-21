<%-- 
    Document   : RecieveInput
    Created on : Aug 19, 2017, 2:05:04 PM
    Author     : vkunal1996
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import ="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    </head>
    <body>
        <h1 id="heading">Generated ScoreCard</h1>
         <center>
             <%
             String name=request.getParameter("Sname");
             String roll=request.getParameter("Roll");
             String address=request.getParameter("Address");
             int cint=Integer.parseInt(request.getParameter("CInternal"));
             int cout=Integer.parseInt(request.getParameter("CExternal"));
             int cppint=Integer.parseInt(request.getParameter("CPPInternal"));
             int cppout=Integer.parseInt(request.getParameter("CPPExternal"));
             int javaint=Integer.parseInt(request.getParameter("JavaInternal"));
             int javaout=Integer.parseInt(request.getParameter("JavaExternal"));
             int phpint=Integer.parseInt(request.getParameter("PhpInternal"));
             int phpout=Integer.parseInt(request.getParameter("PhpExternal"));
             int sqlint=Integer.parseInt(request.getParameter("SQLInternal"));
             int sqlout=Integer.parseInt(request.getParameter("SQLExternal"));
             
             float total=(float)(cint+cout+javaint+javaout+phpint+phpout+cppint+cppout+sqlint+sqlout);
             float percentage=total/5;
             String Grade;
                if(percentage>70)
                    Grade="A";
                else if(percentage>=60)
                    Grade="B";
                        else
                            Grade="C";
                String totaltoinsert=String.valueOf(total);
                String percentagetoinsert=String.valueOf(percentage);
               
             try
             {
                Connection cn;
                PreparedStatement st;
                ResultSet rs;
                String sql;
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String url="jdbc:sqlserver://localhost:1433;databaseName=ScoreCard;user=vkunal1996;password=12345";
                cn=DriverManager.getConnection(url);
                
                
                sql="Select * from StudentDetails where RollNumber=?";
                st=cn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
                st.setString(1,roll);
                rs=st.executeQuery();
                rs.last();
                    if(rs.getRow()==0)
                    {
                        sql="Insert into StudentDetails values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                        st=cn.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
                        st.setString(1,name);
                        st.setString(2,roll);
                        st.setString(3,address);
                        st.setInt(4,cint);
                        st.setInt(5,cout);
                        st.setInt(6,cppint);
                        st.setInt(7,cppout);
                        st.setInt(8,javaint);
                        st.setInt(9,javaout);
                        st.setInt(10,phpint);
                        st.setInt(11,phpout);
                        st.setInt(12,sqlint);
                        st.setInt(13,sqlout);
                        st.setString(14,totaltoinsert);
                        st.setString(15,percentagetoinsert);
                        
                        st.setString(16,Grade);
                        st.executeUpdate();
                        out.println("<h2>Data Inserted SuccesFully</h2>"
                        +"<form action='AdminPanel.jsp' method=post>"
                                + "<input type='hidden' name='uname' value='admin'>"
                                + "<input type='hidden' name='upass' value='admin'>"
                                + "<input type='Submit' value='Home'>"
                                
                                + "</form>");
                    }
                        else
                    {
                        out.println("<h2>Roll Number Already Existed</h2>"
                        +"<form action='AdminPanel.jsp' method=post>"
                               + "<input type='hidden' name='uname' value='admin'>"
                                + "<input type='hidden' name='upass' value='admin'>"
                                + "<input type='Submit' value='Home'>"
                                
                                + "</form>");
                    }
                        cn.close();
             }catch(Exception e){out.println(e);}
             %>
            
            
            </center>
    </body>
</html>
