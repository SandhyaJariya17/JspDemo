<%-- 
    Document   : index
    Created on : 6 Feb, 2021, 1:21:11 PM
    Author     : 1711j
--%>

<%@page import="Util.SqlUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  try{
            
            SqlUtil.connectDB();
            String countqry="select count(*) as n from signup";
            ResultSet countrs=SqlUtil.fetch(countqry);
            if(countrs.next()){
                int no_of_rows=countrs.getInt("n");
                if(no_of_rows>0){
                    String query="select * from signup";
                    ResultSet rs=SqlUtil.fetch(query);
                    %>
                    <table border="2" cellpadding="5" cellspacing="2">
                        <tr>
                            <td>id</td>
                            <td>fname</td>
                              <td>lname</td>
                                <td>email</td>
                                  <td>phone</td>
                                  <td>delete data</td>
                                  <td>update data</td>
                            
                        </tr>
                        <%
                    while(rs.next()){
                    %>
                    <tr>
                        <td><%=rs.getInt("id")%></td>
                        <td><%=rs.getString("fname")%></td>
                        <td><%=rs.getString("lname")%></td>
                        <td><%=rs.getString("email")%></td>
                        <td><%=rs.getString("phone")%></td>
                        <td><a href="DeleteServlet?id=<%=rs.getInt("id")%>">Delete the data</a></td>
                        <td><a href="update.jsp?id=<%=rs.getInt("id")%>">Update the data</a></td>
                        
                    </tr>
                    <%
                    }
                    %>
                    </table>
                    
                    <% 
                }else {
                            %>
                            <p> no data found</p>
                            <% 
                   }
                    
                  }
              
                 
        }
            catch(Exception ex){
            System.out.println(ex);
        }
            %>
 </body>
</html>
