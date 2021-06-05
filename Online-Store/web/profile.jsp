<%-- 
    Document   : profile
    Created on : Mar 25, 2021, 11:54:05 AM
    Author     : Dell
--%>



<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Source+Code+Pro:700,900&display=swap"
              rel="stylesheet">

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
                            <%   HttpSession test = request.getSession(false);
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
                    <li class="breadcrumb-item active">My Profile</li>
                </ul>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- My Account Start -->
        <div class="my-account">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3">
                        <div class="nav flex-column nav-pills" role="tablist" aria-orientation="vertical">
                            <a class="nav-link" id="account-nav" data-toggle="pill" href="#account-tab" role="tab"><i
                                    class="fa fa-user"></i>Account Details</a>
                            <a class="nav-link" href="sign_out.jsp"><i class="fa fa-sign-out-alt"></i>Logout</a>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="dashboard-tab" role="tabpanel"
                                 aria-labelledby="dashboard-nav">

                            </div>
                           
                            
                            <div class="tab-pane fade" id="account-tab" role="tabpanel" aria-labelledby="account-nav">
                                <h2>Account Details</h2>
                                <%
                                        try {
                                               
                                            int user_id= (Integer)(session.getAttribute("id"));
                                            String driver = "org.postgresql.Driver";
                                            String url = "jdbc:postgresql://localhost:5432/souq";
                                            String username = "postgres";
                                            String password = "1235";
                                            String myDataField = null;
                                           
                                            String myQuery = "select * from users where id="+user_id;
                                            Connection myConnection = null;
                                            PreparedStatement myPreparedStatement = null;
                                            ResultSet myResultSet = null;
                                            Class.forName(driver).newInstance();
                                            myConnection = DriverManager.getConnection(url, username, password);
                                            System.out.println("Opened database successfully");
                                            myPreparedStatement = myConnection.prepareStatement(myQuery);
                                            ResultSet rs = myPreparedStatement.executeQuery();

                                            ResultSetMetaData rsmd = rs.getMetaData();
                                            while (rs.next()) { %> 
                                
                                <div class="row">
                                    <div class="col-md-6">
                                        <h4>User Name : <%String Uname = rs.getString("username");
                                            out.println(Uname);
                                            %></h4>
                                    </div>
                                    <div class="col-md-6">
                                        <h4>E-mail :<%String Email = rs.getString("email");
                                            out.println(Email);
                                            %> </h4>
                                    </div>
                                    <div class="col-md-6">
                                        <h4>Password :<% int Password = rs.getInt("password");
                                            out.println(Password);
                                            %> </h4>
                                    </div>
                                    <div class="col-md-6">
                                        <h4>Address :<%String Address = rs.getString("address");
                                            out.println(Address);
                                            %> </h4>
                                    </div>
                                    <div class="col-md-6">
                                        <h4>Job :<%String Job = rs.getString("job");
                                            out.println(Job );
                                            %> </h4>
                                    </div>
                                            <div class="col-md-6">
                                            <h4>Birthday :<%Date Birthdate = rs.getDate("birthday");
                                            out.println(Birthdate);
                                            %> </h4>
                                            </div>
                                            <div class="col-md-6">
                                         <h4>Balance :<%int Balance = rs.getInt("balance");
                                            out.println(Balance);
                                            %> </h4>
                                            </div>
                                              <div class="col-md-6">
                                        <h4>Phone:<% String Phone = rs.getString("phone");
                                            out.println(Phone);
                                            %> </h4>
                                              </div>
                                        <%         }
                                        } catch (ClassNotFoundException e) {
                                            e.printStackTrace();
                                        } catch (SQLException ex) {
                                            out.print("SQLException: " + ex.getMessage());
                                            out.print("SQLState: " + ex.getSQLState());
                                            out.print("VendorError: " + ex.getErrorCode());
                                        }
                                    %>
                                    </div>
                                    
                                </div>



                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- My Account End -->

    <!-- Brand Start -->
        <div class="brand">
            <div class="container-fluid">
                <div class="brand-slider">
                    <div class="brand-item"><img src="img/1.png" width="150" height="80" alt=""></div>
                    <div class="brand-item"><img src="img/2.png" width="150" height="80" alt=""></div>
                    <div class="brand-item"><img src="img/3.png" width="150" height="80" alt=""></div>
                    <div class="brand-item"><img src="img/4.png" width="150" height="80" alt=""></div>
                    <div class="brand-item"><img src="img/5.png" width="150" height="80" alt=""></div>
                    <div class="brand-item"><img src="img/6.png" width="150" height="80" alt=""></div>
                </div>
            </div>
        </div>
        <!-- Brand End -->      




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
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/slick/slick.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>
</body>
</html>
