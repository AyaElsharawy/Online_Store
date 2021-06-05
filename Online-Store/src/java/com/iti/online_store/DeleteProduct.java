/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.online_store;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author anton
 */
public class DeleteProduct extends HttpServlet {
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response){
                        try {
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
                    String query ="delete from product where id="+id+";";
                    Statement stmt= con.createStatement();
                    stmt.executeUpdate(query);
                    stmt.close();
                    con.close();
                    
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(Edit.class.getName()).log(Level.SEVERE, null, ex);
                } catch (SQLException ex) {
                    Logger.getLogger(Edit.class.getName()).log(Level.SEVERE, null, ex);
                }
                response.sendRedirect("Products.jsp");
            } catch (IOException ex) {
                Logger.getLogger(Edit.class.getName()).log(Level.SEVERE, null, ex);
            }  
    }

}
