<%-- 
    Document   : update
    Created on : 6 Feb, 2021, 9:42:43 PM
    Author     : 1711j
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Util.SqlUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Page</title>
    </head>
    <body>
        <%  try{
            SqlUtil.connectDB();
            int id=Integer.parseInt(request.getParameter("id"));
            String query="select * from signup where id='"+id+"'";
            ResultSet rs=SqlUtil.fetch(query);
            if(rs.next()){
                %>
                <form action="UpdateServlet">
                    <input type="hidden" name="id" value="<%=id%>">
                    <input type="text" name="fname" value="<%=rs.getString("fname")%>">
                     <input type="text" name="lname" value="<%=rs.getString("lname")%>">
                      <input type="text" name="email" value="<%=rs.getString("email")%>">
                       <input type="text" name="phone" value="<%=rs.getString("phone")%>">
                       <input type="submit" value="update">
                </form>
                
                <%  }
            
            
     }
        catch(Exception ex){
            System.out.println(ex);
        }
        %>
    </body>
</html>
