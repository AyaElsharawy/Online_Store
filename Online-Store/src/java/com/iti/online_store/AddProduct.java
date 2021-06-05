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
public class AddProduct extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request , HttpServletResponse response){
                    try {
                        String id = request.getParameter("addId");
                        String image = request.getParameter("addImage");
                        String quantity = request.getParameter("addQuantity");
                        String price = request.getParameter("addPrice");
                        String category = request.getParameter("addCategory");
                        String description = request.getParameter("addDescription");
                        String name = request.getParameter("addName");
                        
                        String query = "insert into product values("+id+",'"+name+"','"+description+"','"+image+"',"+price+","+quantity+","+category+");";
                        Class.forName("org.postgresql.Driver");
                        Connection con = null;
                        try {
                            con = DriverManager.getConnection("jdbc:postgresql://localhost/souq","postgres","1235");
                        } catch (SQLException ex) {
                            Logger.getLogger(Edit.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        Statement stmt= con.createStatement();
                        stmt.executeUpdate(query);
                        response.sendRedirect("Products.jsp");
                        stmt.close();
                        con.close();
                        
                    } catch (SQLException ex) {
                        Logger.getLogger(AddProduct.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (ClassNotFoundException ex) {
            Logger.getLogger(AddProduct.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(AddProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
    
    }
}
