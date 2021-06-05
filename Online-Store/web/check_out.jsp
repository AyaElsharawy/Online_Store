<%//@page import="java.lang.System.out"%> 
<%//@page import="com.sun.corba.se.spi.presentation.rmi.StubAdapter.request(Object, String, boolean)"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.iti.online_store.Checkout"%>
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

    <body>
          <!-- Nav Bar Start -->
        <div class="nav">
            <div class="container-fluid">
                <nav class="navbar navbar-expand-md bg-dark navbar-dark">                    
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto">
                            <a href="Home.jsp" class="nav-item nav-link active">Home</a>
                            <a href="product_users.jsp" class="nav-item nav-link">Products</a>

                            <a href="profile.jsp" class="nav-item nav-link">My Profile</a>

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
                            <a href="Home.jsp">
                                <img src="img/logo.png" alt="Logo">
                            </a>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="search">
                            <form id="myForm" action="logic_search.jsp">
                                <input type="text" name="search_input" placeholder="Search">
                                <button onclick="submitForm()"><i class="fa fa-search"></i></button>
                                <label for="price">Price</label>
                                <input type="radio" id="price" name="search" value="price" >
                                <label for="category">Category</label>
                                <input type="radio" id="category" name="search" value="category" >
                            </form>
                            <script>
                                function submitForm() {
                                    document.getElementById("myForm").submit();
                                }
                            </script>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="user">
                            <%  HttpSession test = request.getSession(false);
                                ArrayList<Integer> ids = new ArrayList<Integer>();
                                ArrayList<Integer> count = new ArrayList<Integer>();
                                ids = (ArrayList<Integer>) test.getAttribute("productID");
                                count = (ArrayList<Integer>) test.getAttribute("quantityProd");%>
                            <a href="cart.jsp" class="btn cart">
                                <i class="fa fa-shopping-cart"></i>
                                <span><% out.print(ids.size());  %></span>
                            </a>
                        </div>
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
                    <li class="breadcrumb-item active">Checkout</li>
                </ul>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Checkout Start -->
        <div class="checkout">
            <div class="container-fluid"> 
                <div class="row">
                    <div class="col-lg-8">
                        <div class="checkout-inner">
                            <div class="billing-address">
                                <form action="Checkout">
                                <h2>Billing Address</h2>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>First Name</label>
                                        <input class="form-control" type="text" placeholder="First Name" name="fname">
                                    </div>
                                    <div class="col-md-6">
                                        <label>Last Name"</label>
                                        <input class="form-control" type="text" placeholder="Last Name" name="lname">
                                    </div>
                                    <div class="col-md-6">
                                        <label>E-mail</label>
                                        <input class="form-control" type="text" placeholder="E-mail" name="email">
                                    </div>
                                    <div class="col-md-6">
                                        <label>Mobile No</label>
                                        <input class="form-control" type="text" placeholder="Mobile No" name="mobile">
                                    </div>
                                    <div class="col-md-12">
                                        <label>Address</label>
                                        <input class="form-control" type="text" placeholder="Address" name="address">
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="checkout-inner">
                            <div class="checkout-summary">
                                <h1>Cart Total</h1>
                                <%Double total=(Double)session.getAttribute("total");
                                %>
                                <p class="sub-total">Total<span><%out.println("$"+ total);%></span></p>
                                <p class="ship-cost">Shipping Cost<span>$50</span></p>
                                <h2>Grand Total<span><%out.println("$"+(total+50));%></span></h2>
                            </div>
                              <%
                           %>
                            <div class="checkout-payment">
                                <div class="payment-methods">
                                    <h1>Payment Methods</h1>
                                    <div class="payment-method">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" id="payment-1" name="payment" value="paypal">
                                            <label class="custom-control-label" for="payment-1">Paypal</label>
                                        </div>
                                      
                                    </div>
                                    
                                   
                                    <div class="payment-method">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" id="payment-5" name="payment" value="cash">
                                            <label class="custom-control-label" for="payment-5">Cash on Delivery</label>
                                        </div>
                                       
                                    </div>
                                </div>
                               
                                    
                                <div class="checkout-btn">
                                    <input type="submit" value="Place Order">
                                        </form>
                         <!--        <%!
                            /*        int  connect( ) throws SQLException, ClassNotFoundException{
                                        Connection con = null;
                        PreparedStatement statment;
                        HttpSession session = request.getSession(false);
                        int user_id =(Integer) session.getAttribute("user_id");
                        int product_id =(Integer) session.getAttribute("product_id");
                        int quantity =(Integer) session.getAttribute("quantity");
                        String address = String.valueOf(session.getAttribute("address"));
                        Double total=(Double)session.getAttribute("total");
                        Double balance=(Double)session.getAttribute("balance");
                        String payment_method = request.getParameter("payment");
                        Class.forName("org.postgresql.Driver");
                        con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/souq", "postgres", "0000");
                        if (total<balance)
                        {
                            Double total_balance = balance - total;
                            statment = con.prepareStatement("update users set balance="+total_balance+"where id="+user_id);
                        }
                        else
                        {
                            out.println("please recharge your balance");
                        }
                        
                        statment = con.prepareStatement("select quantity from product where id=?");
                        statment.setInt(1,product_id );
                         ResultSet result = statment.executeQuery(); 
                         int quantity_db = result.getInt(1);
                         quantity = quantity - quantity_db;
                         int result_insert =0;
                         
                         if (payment_method == "cash")
                         { 
                               statment=con.prepareStatement( "insert into orders(user_id,total,address,quantity,payment_method)values(?,?,?,?,'cash')");
                              statment.setInt(1, user_id );
                                statment.setDouble(2, total );
                                statment.setString(3, address  );
                                 statment.setInt(4, quantity );
                                  result_insert = statment.executeUpdate();
                         }
                         else if (payment_method == "paypal")
                         {
                              statment=con.prepareStatement( "insert into orders(user_id,total,address,quantity,payment_method)values(?,?,?,?,'paypal')");
                              statment.setInt(1, user_id );
                                statment.setDouble(2, total );
                                statment.setString(3, address  );
                                 statment.setInt(4, quantity );
                                   result_insert = statment.executeUpdate();
                         }

                                        return result_insert;
                                    }
                                    */
                                    %> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Checkout End -->
        
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
        
        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="js/easing.min.js"></script>
        <script src="js/slick.min.js"></script>
        
        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>
</html>