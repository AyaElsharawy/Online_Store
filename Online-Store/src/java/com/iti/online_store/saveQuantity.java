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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
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
public class saveQuantity extends HttpServlet {

    private final String url = "jdbc:postgresql://localhost/souq";
    private final String user = "postgres";
    private final String psqlPassword = "1235";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        Connection conn = null;
        PreparedStatement s;
        PrintWriter out = resp.getWriter();
        int id_ = Integer.parseInt(req.getParameter("proid"));
        int Qua_ = Integer.parseInt(req.getParameter("Quantity"));

        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection(url, user, psqlPassword);
            s = conn.prepareStatement("select quantity  from product where id =" + id_ + "");

            ResultSet rs = s.executeQuery();
            ArrayList<Integer> ids = new ArrayList<Integer>();
            ArrayList<Integer> count = new ArrayList<Integer>();
            if (rs.next()) {
                int QuaDb = rs.getInt(1);
                if (QuaDb > Qua_) {
                    ids = (ArrayList<Integer>) session.getAttribute("productID");
                    count = (ArrayList<Integer>) session.getAttribute("quantityProd");
                      for (int i = 0; i < ids.size(); i++) {
                        System.out.println("id before" + ids.get(i));
                        System.out.println("quantity before" + count.get(i));
                    }
                    Iterator itr = ids.iterator();
                    int index = 0;
                    while (itr.hasNext()) {
                        int x = (Integer) itr.next();
                        if (x == id_) {
                            index = ids.indexOf(x);
                            itr.remove();
                            
                                  System.out.println("index"+index);
                                count.remove(index);
                            
                        }

                    }

                    ids.add(id_);
                    count.add(Qua_);
                    for (int i = 0; i < ids.size(); i++) {
                        System.out.println("id" + ids.get(i));
                        System.out.println("quantity" + count.get(i));
                    }
                    session.setAttribute("productID", ids);
                    session.setAttribute("quantityProd", count);

                    resp.sendRedirect("cart.jsp");
                } else {
                    resp.sendRedirect("Product_Details.jsp?id_product=" + id_);
                }
            }
            rs.close();
            s.close();
            conn.close();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(saveQuantity.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(saveQuantity.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
