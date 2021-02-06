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
public class UpdateServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
          
          SqlUtil.connectDB();
          int id=Integer.parseInt(req.getParameter("id"));
          String fname=req.getParameter("fname");
          String lname=req.getParameter("lname");
          String email=req.getParameter("email");
          String phone=req.getParameter("phone");
          
          String query="update signup set fname='"+fname+"',lname='"+lname+"',email='"+email+"',phone='"+phone+"' where id='"+id+"'";
          SqlUtil.update(query);
          resp.sendRedirect("fetch.jsp");
      }
      catch(Exception ex){
          System.out.println(ex);
      }                                                                                   
    }

    

}
