/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.online_store;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Hagar
 */
public class loginServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse respond) throws ServletException, IOException {
        String username = request.getParameter("uname");
        String password = request.getParameter("password");
        Connection con = null;
        String username_ = null;
        String pass = null;
        int id = 0 ;
        String role=null;
        // ResultSet result;
        PreparedStatement statment;

        try {
               ArrayList<Integer> ids = new ArrayList<Integer>();
               ArrayList<Integer> count = new ArrayList<Integer>();
                        
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/souq", "postgres", "1235");
            statment = con.prepareStatement("select id,username,password,role from users where username=? and password=?");
            statment.setString(1, username);
            statment.setString(2, password);

            ResultSet result = statment.executeQuery();
            boolean check = false;
            while (result.next()) {
                check = true;
                role=result.getString(4);
               username_ = result.getString(2);
               pass = result.getString(3);
                id = result.getInt(1); 
             
            }

            if (check && "customer".equals(role)) {
                HttpSession session = request.getSession(true);
                session.setAttribute("productID", ids);
                          session.setAttribute("quantityProd", count);
                session.setAttribute("check", "true");
                session.setAttribute("username", username_);
                session.setAttribute("password",pass);
                session.setAttribute("id",id);
                //session.setAttribute("username", user_n);
                respond.sendRedirect("Home.jsp");

                //respond.sendRedirect("Profile_page?username="+first_name);
            } 
            else if(check && "admin".equals(role)){
                respond.sendRedirect("UserList_1.jsp");
            }
            else {
                respond.sendRedirect("index.html");
            }

            result.close();
            statment.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(loginServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(loginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
