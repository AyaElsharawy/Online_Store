<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.iti.online_store.saveQuantity"%>
<%
    String url = "jdbc:postgresql://localhost/souq";
    String user = "postgres";
    String psqlPassword = "1235";
    String product_id = request.getParameter("id_product");
%>

<html lang="en">
    <head>
        <meta charset=\"utf-8\">
        <title>E Store - eCommerce HTML Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="eCommerce HTML Template Free Download" name="keywords">
        <meta content="eCommerce HTML Template Free Download" name="description">
        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">
        <link href="CSS/Comment.css" rel="stylesheet">
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
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection(url, user, psqlPassword);
            //mongo database loading the driver and connection to the database
            MongoClient mongo = new MongoClient("localhost", 27017);
            DB db = mongo.getDB("souq");
            DBCollection col = db.getCollection("comments");

            Statement stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select * from product where id =" + product_id + "");
            
        %>            



        <div class="nav">
            <div class="container-fluid">
                <nav class="navbar navbar-expand-md bg-dark navbar-dark">

                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto">
                            <a href="Home.jsp" class="nav-item nav-link active">Home</a>
                            <a href="product_users.jsp" class="nav-item nav-link">Products</a>

                            <a href="profile.jsp" class="nav-item nav-link">My Profile</a>

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
                    <li class="breadcrumb-item active">Product Detail</li>
                </ul>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Product Detail Start -->
        <div class="product-detail">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="product-detail-top">
                            <div class="row align-items-center">
                                <div class="col-md-5">
                                    <div class="product-slider-single normal-slider"> 

                                        <% rs.next();
                                                int prodQuant = rs.getInt(6);
                                                int prodCat = rs.getInt(7);

                                        %>

                                        <img src="<%out.println(rs.getString(4)); %>"  alt="Product Image">
                                    </div>

                                </div>
                                <div class="col-md-7">
                                    <div class="product-content">
                                        <div class="title">
                                            <h2><%out.println(rs.getString(2)); %></h2></div>

                                        <div class="price">
                                            <h4>Price:</h4>
                                            <p><%out.println(rs.getInt(5)); %></p>
                                        </div>
                                        <div class="quantity">
                                            <h4>Quantity:</h4>
                                            <div class="qty"> 

                                                <%
                                                    session.setAttribute("id_product", rs.getInt(1));

                                                %>
                                                <form method="get"  action="saveQuantity">
                                                    <input type="text"  name="Quantity">
                                                    <input type="submit" value="AddToCart">
                                                    <input type="hidden" name="proid" value=<%=product_id%>>
                                                </form>
                                            </div>  
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row product-detail-bottom">
                                <div class="col-lg-12">
                                    <ul class="nav nav-pills nav-justified">
                                        <li class="nav-item">
                                            <a class="nav-link active" data-toggle="pill" href="#description">Description</a>
                                        </li>

                                    </ul>

                                    <div class="tab-content">
                                        <div id="description" class="container tab-pane active">
                                            <h4>Product description</h4>
                                            <p>  <%out.println(rs.getString(3)); %> </p>
                                            <%       %> 
                                        </div>
                                        <div class="container">
                                            <h3>Customers opinions</h3>
  <div class="dialogbox">
      
    <div class="body">
        <h5>Tell us what you think about the product?</h5>
      <span class="tip tip-up"></span>
      <div class="message">
          <span><form id="AddComment" action="AddComment" method="GET">
              <textarea form="AddComment" name ="CommentText" id="AddCommentBox" ></textarea>
              <input type ="hidden" value="<%out.print(rs.getInt(1));%>" name="productID">
              
              <input type="submit" value="Post comment">
                </form>
          </span>
      </div>
    </div>
  </div>
  <%        BasicDBObject searchQuery = new BasicDBObject();
            searchQuery.put("productID", rs.getInt(1));
            DBCursor cursor = col.find(searchQuery);
            //BasicDBObject searchResult = new BasicDBObject();
            while (cursor.hasNext()){
                BasicDBObject searchResult = (BasicDBObject) cursor.next();
           out.print("  <div class=\"dialogbox\">\n" +
"      <h5>"+searchResult.getString("username")+" </h5>\n" +
"    <div class=\"body\">\n" +
"      <span class=\"tip tip-up\"></span>\n" +
"      <div class=\"message\">\n" +
"        <span>"+searchResult.getString("comment")+"</span>\n" +
"      </div>\n" +
"    </div>\n" +
"  </div>");
            
            }
            

                
  %>
 <!-- <div class="dialogbox">
      <h5>charles</h5>
    <div class="body">
      <span class="tip tip-up"></span>
      <div class="message">
        <span>I just made a comment about this comment box which is purely made from CSS.</span>
      </div>
    </div>
  </div>
  
  <div class="dialogbox">
      <h5>michael</h5>
    <div class="body">
      <span class="tip tip-up"></span>
      <div class="message">
        <span>I just made a comment about this comment box which is purely made from CSS.</span>
      </div>
    </div>
  </div>
  
  <div class="dialogbox">
      <h5>john</h5>
    <div class="body">
      <span class="tip tip-up"></span>
      <div class="message">
        <span>I just made a comment about this comment box which is purely made from CSS.I just made a comment about this comment box which is purely made from CSS.I just made a comment about this comment box which is purely made from CSS.I just made a comment about this comment box which is purely made from CSS.I just made a comment about this comment box which is purely made from CSS.</span>
      </div>
    </div>
  </div>-->
</div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Product Detail End --> 
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