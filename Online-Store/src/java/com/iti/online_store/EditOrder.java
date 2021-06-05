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
public class EditOrder extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response){
        
        try {
            Class.forName("org.postgresql.Driver");
                        Connection con = null;
                        try {
                            con = DriverManager.getConnection("jdbc:postgresql://localhost/souq","postgres","1235");
                        } catch (SQLException ex) {
                            Logger.getLogger(Edit.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        Statement stmt= con.createStatement();
                        
            //System.out.println(request.getParameter("hidden"));
            //System.out.println(request.getParameter("status"));
            String status = request.getParameter("status");
            String exp_day=request.getParameter("expected_day");
            String exp_month=request.getParameter("expected_month");
            String exp_year=request.getParameter("expected_year");
            String exp_date=exp_day+"-"+exp_month+"-"+exp_year;
            System.out.println(exp_date);
            int id = Integer.parseInt(request.getParameter("hidden"));
            System.out.println(status);
            if (status =="on its way to shipping")
                status="del_shipping";
            else if (status == "being shipped")
                status="shipping_com";
            else if (status =="delivered")
                status ="del_customer";
            else System.out.println("error with status ");
            String query="update orders set status='"+status+"', exp_date='"+exp_date+"',date=current_date where id ="+id+";";
            stmt.executeUpdate(query);
            stmt.close();
            con.close();
            
            response.sendRedirect("Admin_orders.jsp");
        } catch (IOException ex) {
            System.out.println("io");
        } catch (SQLException ex) {
            System.out.println("sql");
        } catch (ClassNotFoundException ex) {
            System.out.println("io");
        }
    }
            

}
