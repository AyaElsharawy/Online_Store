<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%
    String url = "jdbc:postgresql://localhost/souq";
    String user = "postgres";
    String psqlPassword = "1235";
    // String product_id = request.getParameter("id_product"); 

%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>E Store </title>
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
        <%            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection(url, user, psqlPassword);

            Statement stmt = con.createStatement();

            HttpSession test = request.getSession(false);
            // String ids = ;
            ArrayList<Integer> ids = new ArrayList<Integer>();
            ArrayList<Integer> count = new ArrayList<Integer>();

            ids = (ArrayList<Integer>) test.getAttribute("productID");
            count = (ArrayList<Integer>) test.getAttribute("quantityProd");
        %>            
   

        <!-- Nav Bar Start -->
        <div class="nav">
            <div class="container-fluid">
                <nav class="navbar navbar-expand-md bg-dark navbar-dark">
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto">
                            <a href="Home.jsp" class="nav-item nav-link">Home</a>
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
                            <a href="cart.jsp" class="btn cart">
                                <i class="fa fa-shopping-cart"></i>
                                <span> <% out.print(ids.size());  %></span>
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
                    <li class="breadcrumb-item active">Cart</li>
                </ul>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Cart Start -->
        <div class="cart-page">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="cart-page-inner">
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead class="thead-dark">
                                        <tr>

                                            <th>Product</th>
                                            <th>Price</th>
                                            <th>Quantity</th>
                                            <th>Total</th>
                                            <th>Remove</th>
                                        </tr>
                                    </thead>
                                    <tbody class="align-middle">

                                        <%

                                            double result = 0;
                                            double total = 0;

                                            ResultSet rs = null;
                                            for (int i = 0; i < ids.size(); i++) {
                                                int product_id = ids.get(i);
                                                int count_prod = count.get(i);
                                                rs = stmt.executeQuery("select name,price from product where id =" + product_id + "");
                                                rs.next();
                                                total = rs.getDouble("price") * count_prod;
                                                out.println("<tr>\n"
                                                        + " \n"
                                                        + " <td>\n"
                                                        + " \n"
                                                        + " <p>" + rs.getString("name") + "</p>\n"
                                                        + " </div>\n"
                                                        + " </td>\n"
                                                        + " <td>" + rs.getDouble("price") + "</td>\n"
                                                        + " <td>\n"
                                                        + " <div class=\"qty\">\n"
                                                        + "<form   action=\"saveQuantity\">\n"
                                                        + "<input type=\"text\" placeholder=\"" + count_prod + "\" name=\"Quantity\">\n"
                                                        + "   <input type=\"submit\" value=\"new\">\n"
                                                        + "<input type=\"hidden\" name=\"proid\" value=" + product_id + ">\n"
                                                        + "  </form>"
                                                        + " </div>\n"
                                                        + " </td>\n"
                                                        + " <td>" + total + "</td>\n"
                                                        + " <td><a href=\"removeCart?id_product=" + product_id + "\"  ><button><i class=\"fa fa-trash\"></i></button></td>\n"
                                                        + " </tr>"
                                                );

                                                result = result + total;
                                                test.setAttribute("total", (result+50));
                                            }

                                        %>


                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="cart-page-inner">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="cart-summary">
                                        <div class="cart-content">
                                            <h1>Cart Summary</h1>
                                            <p>Sub Total<span><%  out.print(result); %></span></p>
                                            <p>Shipping Cost<span>$50</span></p>
                                            <h2>Grand Total<span>$<%  out.print(result + 50); %></span></h2>
                                        </div>
                                        <div class="cart-btn">
                                            <a href="Checkout"  > <button  >Checkout</button> </a>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Cart End -->
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
        <%
            rs.close();
            con.close();
            stmt.close();
        %>
    </body>
</html>
