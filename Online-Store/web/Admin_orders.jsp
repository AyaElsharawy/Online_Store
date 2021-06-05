<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>E Store - eCommerce HTML Template</title>
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
<%try{
    Class.forName("org.postgresql.Driver");
    Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost/souq","postgres","1235");
    String query ="select * from orders";     
    Statement stmt= connection.createStatement();
    ResultSet res= stmt.executeQuery(query);
%>
    <body>
        <!-- Top bar Start -->
        <div class="top-bar">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-6">
                       
                       
                    </div>
                    <div class="col-sm-6">
                     
              
                    </div>
                </div>
            </div>
        </div>
        <!-- Top bar End -->
        
        <!-- Nav Bar Start -->
        <div class="nav">
            <div class="container-fluid">
                <nav class="navbar navbar-expand-md bg-dark navbar-dark">
                    <a href="#" class="navbar-brand">MENU</a>
                   

                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto">
                            <a href="UserList_1.jsp" class="nav-item nav-link">Users</a>
                            <a href="Product_Details.jsp" class="nav-item nav-link">Products</a>
                           
                            
                        </div>
                       
                    </div>
                </nav>
            </div>
        </div>
        <!-- Nav Bar End -->      
        
        <!-- Bottom Bar Start -->
        <div class="bottom-bar">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <div class="col-md-3">
                        <div class="logo">
                            <a href="#">
                                <img src="img/logo.png" alt="Logo">
                            </a>
                        </div>
                    </div>
                    
                    <div class="col-md-3">
                        
                    </div>
                </div>
            </div>
        </div>
        <!-- Bottom Bar End --> 
        
        <!-- Breadcrumb Start -->
        <div class="breadcrumb-wrap">
            <div class="container-fluid">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Products</a></li>
                </ul>
            </div>
        </div>
        <!-- Breadcrumb End -->
        
        <!-- Product_Details-page Start -->
        <div class="Product_Details-page">
            <div class="container-fluid">
                <div class="Product_Details-page-inner">
                    <div class="row">
                        <div class="col-md-12">
                            
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>Order ID</th>
                                            <th>Customer ID</th>
                                            
                                            <th>Address</th>
                                            <th>Total</th>
                                            <th>Payment method</th>
                                            <th>Status</th>
                                            <th>Status date</th>
                                            <th>expected delivery date</th>
                                            <th>Products</th>
                                        </tr>
                                    </thead>
                                    <tbody class="align-middle">
 
                                     
                               <%while (res.next()){%>
                               
                                        <tr>
                                         
                                            <form id="form<%out.print(res.getString(1));%>" action="EditOrder" method="GET">
                                            <td >
                                                <div class="img">
                                                    <% out.println(res.getString(1));%>
                                                </div>
                                            </td>
                                            <%//out.println("<td><input type=\"text\" name=\"id\" size=\"3\" value=\""+res.getInt(2)+"\"></td>");%>
                                            <td >
                                                <%out.println(res.getString(2));%>
                                                
                                                </td><td >
                                                <%out.println(res.getString(3));%>
                                                
                                                </td>
                                                 <td >
                                                <%out.println(res.getString(4));%>
                                                
                                                </td>
                                                <td >
                                                <%out.println(res.getString(5) );%>
                                                
                                                </td>
                                                 <td >
                                                     Current status: <%out.println(res.getString(6) );%>
                                                     <br>
                                                     <select name="status" id="status">
    <option value="del_shipping">on its way to shipping</option>
    <option value="shipping_com">being shipped</option>
    <option value="del_customer">delivered</option>
  </select>
                                                <%//out.println("<input type=\"text\" name=\"status\" size=\"5\" value=\""+res.getString(6)+"\">");%>
                                                
                                                </td>
                                                         
                                                <%//out.println("<td >$<input type=\"text\" name=\"price\" size=\"3\" value=\""+res.getString(5)+"\"></td>");%>
                                                <%//out.println("<td ><input type=\"text\" name=\"quantity\" size=\"3\" value=\""+res.getString(6)+"\"></td>");%>

                                            <td >
                                                <%//out.println("<textarea form=\"form"+res.getString(1)+"\" name=\"description\" >"+res.getString(3)+"</textarea>");%>
                                                <!--<input type="date" id="status_date" name="status_date">-->
                                                <!--<input type="submit" value="submit ">-->
                                                <%out.println(res.getString(7) );%>
                                            </td>
                                            <td >
                                                <%//out.println("<textarea form=\"form"+res.getString(1)+"\" name=\"description\" >"+res.getString(3)+"</textarea>");%>
                                               D:<input type="text" size="1" id="expected_day" name="expected_day">
                                               M:<input type="text" size="1" id="expected_month" name="expected_month">
                                               y:<input type="text" size="3" id="expected_year" name="expected_year">
                                                <!--<input type="submit" value="submit ">-->
                                                <%//out.println(res.getString(7) );%>
                                            </td>
                                            <td></td>
                                            <td> <input type="submit" value="submit " form="form<%out.print(res.getInt(1));%>"></td>
                                            
                                            <!--wrap=\"soft\"-->
                                            <!--<td >
                                                
                                                
                                                
                                                <input type="reset">
                                                <input type="submit"  value="update" >
                                                <input type="submit"  value="delete" onclick="form.action='DeleteProduct';" >
                                                <button form="form<%//out.print(res.getString(1));%>" onclick="form.action='SecondServlet';" type="submit" name="updatebtn" class="btn-cart" value="Update">Update</button>
                                                <button form="form<%//out.print(res.getString(1));%>" type="submit" name="deletebtn" class="btn-cart" value="Delete"><i class="fa fa-trash"></i></button>
                                            
                                            </td>-->
                                            <input form ="form<%out.print(res.getInt(1));%>" type="hidden" name="hidden" value="<%out.print(res.getInt(1));%>">
                                            </form>
                                           
                                        </tr>
                                        
                                <%}%> 
                                <%res.close();
                                connection.close();
                                stmt.close();
                                }catch(ClassNotFoundException ex){
                                response.sendRedirect("Exception2.html"); 
                                }catch(SQLException ex){
                                response.sendRedirect("Exception.html");
                                }
                                %>
                                    </tbody>
                                </table>
                                    
                          
                    </div>
                </div>
            </div>
        </div>

        <!-- Product_Details-page End -->
        
         <!-- Footer Start -->
                    <div class="footer">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-3 col-md-6">
                                    <div class="footer-widget">
                                        <h2>Get in Touch</h2>
                                        <div class="contact-info">
                                            <p><i class="fa fa-map-marker"></i>Smart Village</p>
                                            <p><i class="fa fa-envelope"></i>support@gmail.com</p>
                                            <p><i class="fa fa-phone"></i>+01281856864</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-6">
                                    <div class="footer-widget">
                                        <h2>Follow Us</h2>
                                        <div class="contact-info">
                                            <div class="social">
                                                <a href=""><i class="fab fa-twitter"></i></a>
                                                <a href=""><i class="fab fa-facebook-f"></i></a>
                                                <a href=""><i class="fab fa-linkedin-in"></i></a>
                                                <a href=""><i class="fab fa-instagram"></i></a>
                                                <a href=""><i class="fab fa-youtube"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-6">
                                    <div class="footer-widget">
                                        <h2>Company Info</h2>
                                        <ul>
                                            <li><a href="#">About Us</a></li>
                                            <li><a href="#">Privacy Policy</a></li>
                                            <li><a href="#">Terms & Condition</a></li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-6">
                                    <div class="footer-widget">
                                        <h2>Purchase Info</h2>
                                        <ul>
                                            <li><a href="#">Pyament Policy</a></li>
                                            <li><a href="#">Shipping Policy</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <div class="row payment align-items-center">
                                <div class="col-md-6">
                                    <div class="payment-method">
                                        <h2>We Accept:</h2>
                                        <img src="img/payment-method.png" alt="Payment Method" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="payment-security">
                                        <h2>Secured By:</h2>
                                        <img src="img/godaddy.svg" alt="Payment Security" />
                                        <img src="img/norton.svg" alt="Payment Security" />
                                        <img src="img/ssl.svg" alt="Payment Security" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Footer End -->




                    <!-- Footer Bottom Start -->
                    <div class="footer-bottom">
                        <div class="container">
                            <div class="row">

                            </div>
                        </div>
                    </div>
                    <!-- Footer Bottom End -->        


                    <!-- Back to Top -->
                    <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

        
       
    </body>
</html>
