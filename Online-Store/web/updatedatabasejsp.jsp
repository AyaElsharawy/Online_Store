<%-- 
    Document   : deletejsp
    Created on : Apr 6, 2021, 11:32:23 PM
    Author     : Dell
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Estore</title>
             <meta charset="utf-8">
        
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="eCommerce HTML Template Free Download" name="keywords">
        <meta content="eCommerce HTML Template Free Download" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Source+Code+Pro:700,900&display=swap" rel="stylesheet">

        <!-- CSS Libraries -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="CSS/slick.css" rel="stylesheet">
        <link href="CSS/slick-theme.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="CSS/style.css" rel="stylesheet">
    </head>
    <body>
       <%
                                        try {
                                       int id = Integer.parseInt(request.getParameter("userId").trim());
                                             int bal = Integer.parseInt(request.getParameter("Balance"));
                                            String driver = "org.postgresql.Driver";
                                            String url = "jdbc:postgresql://localhost:5432/souq";
                                            String username = "postgres";
                                            String password = "1235";
                                            String myDataField = null;
                                            
                                            String myQuery = "update users set balance="+bal+" where id='"+id+"';";
                                            Connection myConnection = null;
                                            PreparedStatement myPreparedStatement = null;
                                            ResultSet myResultSet = null;
                                            Class.forName(driver).newInstance();
                                            myConnection = DriverManager.getConnection(url, username, password);
                                            myPreparedStatement = myConnection.prepareStatement(myQuery);
                                            ResultSet rs = myPreparedStatement.executeQuery();

                                            ResultSetMetaData rsmd = rs.getMetaData();
                                            
                                            
                                     %>
                                                
                                          <%}
                                         catch (ClassNotFoundException e) {
                                            e.printStackTrace();
                                        } catch (SQLException ex) {
                                            response.sendRedirect("UserList_1.jsp");
                                        }
                                    %>

    </body>
</html>
