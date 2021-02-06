/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Util.SqlUtil;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 1711j
 */
public class DeleteServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      try{
          
          SqlUtil.connectDB();
          int id=Integer.parseInt(req.getParameter("id"));
          String query="delete from signup where id='"+id+"'";
          SqlUtil.delete(query);
          resp.sendRedirect("fetch.jsp");
      }
      catch(Exception ex){
          System.out.println(ex);
      }
    }
    
    



 

}
