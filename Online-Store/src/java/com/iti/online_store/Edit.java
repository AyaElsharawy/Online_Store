/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.online_store;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 *
 * @author anton
 */
public class Edit extends HttpServlet {
        protected void doGet(HttpServletRequest request, HttpServletResponse response){
            PrintWriter out = null;
            try {
                out = response.getWriter();
            } catch (IOException ex) {
                Logger.getLogger(Edit.class.getName()).log(Level.SEVERE, null, ex);
            }
          //  out.print("hello");
            try {
                String name=request.getParameter("name");
                String description=request.getParameter("description");
                String id=request.getParameter("hidden");
                String quantity=request.getParameter("quantity");
                String price=request.getParameter("price");
                Class.forName("org.postgresql.Driver");
                Connection con = null;
                try {
                    con = DriverManager.getConnection("jdbc:postgresql://localhost/souq","postgres","1235");
                } catch (SQLException ex) {
                    Logger.getLogger(Edit.class.getName()).log(Level.SEVERE, null, ex);
                }
                String query ="update product set name='"+name+"', description='"+description+"',price="+price+",quantity="+quantity+"where id="+id+";";
                Statement stmt= con.createStatement();
                
                stmt.executeUpdate(query);
                response.sendRedirect("Products.jsp");
                
                stmt.close();
                con.close();
                
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Edit.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(Edit.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(Edit.class.getName()).log(Level.SEVERE, null, ex);
            }  
    }
    
    
 

}
