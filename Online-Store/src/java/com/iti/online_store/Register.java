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
//import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
public class Register extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse respond) throws ServletException, IOException {
        try {
            String firstname = request.getParameter("fname");
            String lastname = request.getParameter("lname");
            String username = request.getParameter("uname");
            String mail = request.getParameter("mail");
            String password = request.getParameter("password");
            String address = request.getParameter("address");
            String mobile = request.getParameter("mobile");
            String birthday = request.getParameter("birthday");
            String balance = request.getParameter("balance");
            String job = request.getParameter("job");
            
            
            Connection con = null;
            
            
            
             
            String query ="insert into users (first_name,last_name, username , email, password ,address, phone , birthday , balance , job,role) values ('"+firstname+"','"+lastname+"','"+username+"','"+mail+"','"+password+"','"+address+"','"+mobile+"','"+birthday+"',"+balance+",'"+job+"','customer') ; ";
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/souq", "postgres", "1235");
            Statement statement = con.createStatement();
            
            
            statement.executeUpdate(query);
            

            
            HttpSession session = request.getSession(true);
            session.setAttribute("check", "true");
            session.setAttribute("fname", firstname);
            session.setAttribute("lname",lastname);
            session.setAttribute("username", username);
            session.setAttribute("mail",mail);
            
            session.setAttribute("password",password);
            session.setAttribute("address", address);
            session.setAttribute(" mobile", mobile );
            session.setAttribute("birthday",birthday);
            session.setAttribute("balance", balance);
            session.setAttribute(" job", job  );
            
            
            
            
            
            
            
            
            //respond.sendRedirect("Profile_page?username="+first_name);
            
            respond.sendRedirect("Home.jsp");
            
            
             statement.close();
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }
        } 

    }
