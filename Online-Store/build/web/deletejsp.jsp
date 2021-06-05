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
        <title>JSP Page</title>
    </head>
    <body>
       <%
                                        try {
                                             int id = Integer.parseInt(request.getParameter("userId").trim());
                                            String driver = "org.postgresql.Driver";
                                            String url = "jdbc:postgresql://localhost:5432/souq";
                                            String username = "postgres";
                                            String password = "1235";
                                            String myDataField = null;
                                            
                                            String myQuery = "delete from users where id="+id+"";
                                            Connection myConnection = null;
                                            PreparedStatement myPreparedStatement = null;
                                            ResultSet myResultSet = null;
                                            Class.forName(driver).newInstance();
                                            myConnection = DriverManager.getConnection(url, username, password);
                                            System.out.println("Opened database successfully");
                                            myPreparedStatement = myConnection.prepareStatement(myQuery);
                                          myPreparedStatement.executeUpdate();

                            //                ResultSetMetaData rsmd = rs.getMetaData();
                                            response.sendRedirect("UserList_1.jsp");
                                            
                                     %>
                                                
                                          <%}
                                         catch (ClassNotFoundException e) {
                                            e.printStackTrace();
                                        } catch (SQLException ex) {
                                            out.print("SQLException: " + ex.getMessage());
                                            out.print("SQLState: " + ex.getSQLState());
                                            out.print("VendorError: " + ex.getErrorCode());
                                        }
                                    %>

    </body>
</html>