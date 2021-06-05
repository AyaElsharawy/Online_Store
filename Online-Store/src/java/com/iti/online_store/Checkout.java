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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
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
public class Checkout extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse respond) throws ServletException, IOException {
         try{
             String fname = request.getParameter("fname");
             String lname = request.getParameter("lname");
             String email = request.getParameter("email");
             String mobile = request.getParameter("mobile");
             String address = request.getParameter("address");
             System.out.println(fname);
             System.out.println(lname);
             System.out.println(email);
             System.out.println(mobile);
             System.out.println(address);
             
             Class.forName("org.postgresql.Driver");
             Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/souq", "postgres", "1235"); 
             int id = 0;
             double balance = 0.0;
             PreparedStatement statment;
             Statement stmt=con.createStatement();
             int index = 0;
             int order_id=0;
             try {
                 //con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/souq", "postgres", "1235");
                 statment = con.prepareStatement("select id,balance from users where  first_name=? and  last_name=? and  email=?  and  phone=? and  address=? ");
                 
                 statment.setString(1, fname);
                 statment.setString(2, lname);
                 statment.setString(3, email);
                 statment.setString(4, mobile);
                 statment.setString(5, address);
                 
                 ResultSet result = statment.executeQuery();
                 boolean check = false;
                 while (result.next()) {
                     id = result.getInt(1);
                     balance = result.getDouble(2);
                     System.out.println("id" + id);
                     System.out.println("balance" + balance);
                     check = true;
                 }
                 
                 if (check) {
                     
                     HttpSession test = request.getSession(false);
                     
                     ArrayList<Integer> ids = new ArrayList<Integer>();
                     ArrayList<Integer> count = new ArrayList<Integer>();
                     
                     ids = (ArrayList<Integer>) test.getAttribute("productID");
                     count = (ArrayList<Integer>) test.getAttribute("quantityProd");
                     Double total = (Double) test.getAttribute("total");
                     String payment_method = request.getParameter("payment");
                     System.out.println("payment_method" + payment_method);
                     int y_ = 0;
                     if (total < balance) {
                         Double total_balance = balance - total;
                         statment = con.prepareStatement("update users set balance=" + total_balance + "where id=" + id);
                         int result_update = statment.executeUpdate();
                     } else {
                         out.println("please recharge your balance");
                     }
                     int result_insert = 0;
                     int Size = ids.size();
                     System.out.println("Size" + ids.size());
                     if ("cash".equals(payment_method) || "paypal".equals(payment_method) ) {
                         //statment = con.prepareStatement("insert into orders(user_id,total,address,quantity, product_id,payment_method)values(?,?,?,?,?,?)");
                         /*statment = con.prepareStatement("insert into orders(user_id,total,address,payment_method,status,date)values(?,?,?,?,?,?)");
                         statment.setInt(1, id);
                         statment.setDouble(2, total);
                         statment.setString(3, address);
                         //statment.setInt(4, y);
                         //statment.setInt(5, x);
                         statment.setString(4, payment_method);
                         statment.setString(5, "'del_shipping'");
                         
                         statment.setString(6, java.time.LocalDate.now().toString());
                         //statment.setString(7, );*/
                         //String sub=java.time.LocalDate.now().toString();
                         String query="insert into orders (user_id,total,address,payment_method,status,date)values("+id+","+total+",'"+address+"','"+payment_method+"',"+"'del_shipping',current_date);";
                         
                         stmt.executeUpdate(query);
                         statment = con.prepareStatement("select Max(id) from orders;");
                         
                         result = statment.executeQuery();
                         while (result.next()) {
                             order_id = result.getInt(1);
                             System.out.println("max"+order_id);
                             
                         }}
                     for (int i = 0; i < ids.size(); i++) {
                         
                         int x = ids.get(i);
                         int y = count.get(i);
                         statment = con.prepareStatement("select quantity from product where id=" + x);
                         result = statment.executeQuery();
                         result.next();
                         int quantity_db = result.getInt(1);
                         System.out.println("quantity_db" + quantity_db);
                         if (quantity_db > y) {
                             y_ = quantity_db - y;
                             if (y_== 0) {
                                 statment = con.prepareStatement("delete  from product where id=" + x );
                                 result_insert = statment.executeUpdate();
                             } else {
                                 statment = con.prepareStatement("update product  set quantity=" + y_ + " where id=" + x );
                                 result_insert = statment.executeUpdate();
                                 
                                 statment = con.prepareStatement("insert into order_product(order_id,product_id,quantity)values(?,?,?)");
                                 statment.setInt(1, order_id);
                                 statment.setInt(2, x);
                                 statment.setInt(3, y);
                                 statment.executeUpdate();
                                 
                                 
                             }
                             
                         }
                         
                         System.out.println("end loop" + i);
                         System.out.println("Size" + ids.size());
                     }
                     ids.removeAll(ids);
                     count.removeAll(count);
                     respond.sendRedirect("Home.jsp");
                     test.setAttribute("productID", ids);
                     test.setAttribute("quantityProd", count);
                     
                     for (int i = 0; i < ids.size(); i++) {
                         System.out.println("id" + ids.get(i));
                         System.out.println("quantity" + count.get(i));
                     }
                 } /*catch (SQLException ex) {
                 Logger.getLogger(Checkout.class.getName()).log(Level.SEVERE, null, ex);
                 } catch (ClassNotFoundException ex) {
                 Logger.getLogger(Checkout.class.getName()).log(Level.SEVERE, null, ex);
                 }*/
                 else{respond.sendRedirect("check_out.jsp");}
                
                 
                 
                 result.close();
                 statment.close();
                 stmt.close();
                 con.close();
                 
             } catch (SQLException ex) {
                 Logger.getLogger(Checkout.class.getName()).log(Level.SEVERE, null, ex);
             }
             
         } catch (SQLException ex) {
            Logger.getLogger(Checkout.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Checkout.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
/*if ("cash".equals(payment_method) || "paypal".equals(payment_method) || result_insert == 1) {
                                 //statment = con.prepareStatement("insert into orders(user_id,total,address,quantity, product_id,payment_method)values(?,?,?,?,?,?)");
                                 statment = con.prepareStatement("insert into orders(user_id,total,address,payment_method,status,date)values(?,?,?,?,?,?)");
                                 statment.setInt(1, id);
                                 statment.setDouble(2, total);
                                 statment.setString(3, address);
                                 //statment.setInt(4, y);
                                 //statment.setInt(5, x);
                                 statment.setString(4, payment_method);
                                 statment.setString(5, "'del_shipping'");
                                 
                                 statment.setString(6, java.time.LocalDate.now().toString());
                                 //statment.setString(7, );
                                 result_insert = statment.executeUpdate();
                                 statment = con.prepareStatement("select Max(id) from orders;");
                                 result = statment.executeQuery();
                                 while (result.next()) {
                                 int order_id;
                                 order_id = result.getInt(1);
                                 
                                 }*/