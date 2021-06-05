/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.online_store;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;
import com.mongodb.WriteResult;
import com.mongodb.client.MongoDatabase;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.Integer;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author anton
 */
public class AddComment extends HttpServlet {
    
 
      
    protected void doGet(HttpServletRequest request, HttpServletResponse response){
        
        HttpSession session = request.getSession(false);
        
        String username= (String) session.getAttribute("username");
        String comment = request.getParameter("CommentText");
        int productID=Integer.parseInt(request.getParameter("productID"));
        //System.out.println(2* productID);
        
        
        MongoClient mongo = new MongoClient("localhost", 27017);
        DB db = mongo.getDB("souq");
        DBCollection col = db.getCollection("comments");
        BasicDBObject document = new BasicDBObject();
        document.put("username", username);
        document.put("productID",productID);
        document.put("comment",comment);
        
        col.insert(document);
        try {
            response.sendRedirect("Product_Details.jsp?id_product="+productID);
        } catch (IOException ex) {
            Logger.getLogger(AddComment.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
             

}
