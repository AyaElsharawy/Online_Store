/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.online_store;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author anton
 */
public class removeCart extends HttpServlet {

    ArrayList<Integer> ids = new ArrayList<Integer>();
    ArrayList<Integer> count = new ArrayList<Integer>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {

            HttpSession session = request.getSession(false);
            ids = (ArrayList<Integer>) session.getAttribute("productID");
            count = (ArrayList<Integer>) session.getAttribute("quantityProd");
            int id = Integer.parseInt(request.getParameter("id_product").trim());
            Boolean page = (Boolean) session.getAttribute("duplicated");

            Iterator itr = ids.iterator();
            int index = 0;
            while (itr.hasNext()) {
                int x = (Integer) itr.next();
                if (x == id) {
                    index = ids.indexOf(x);
                    itr.remove();
                    count.remove(index);
                }

            }

            response.sendRedirect("cart.jsp");

        } catch (IOException ex) {
            Logger.getLogger(removeCart.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
