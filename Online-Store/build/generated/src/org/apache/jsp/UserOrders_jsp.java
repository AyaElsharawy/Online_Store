package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import java.sql.SQLException;
import java.sql.ResultSetMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;

public final class UserOrders_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <title>E Store - eCommerce HTML Template</title>\n");
      out.write("        <meta content=\"width=device-width, initial-scale=1.0\" name=\"viewport\">\n");
      out.write("        <meta content=\"eCommerce HTML Template Free Download\" name=\"keywords\">\n");
      out.write("        <meta content=\"eCommerce HTML Template Free Download\" name=\"description\">\n");
      out.write("\n");
      out.write("        <!-- Favicon -->\n");
      out.write("        <link href=\"img/favicon.ico\" rel=\"icon\">\n");
      out.write("\n");
      out.write("        <!-- Google Fonts -->\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css?family=Open+Sans:300,400|Source+Code+Pro:700,900&display=swap\"\n");
      out.write("              rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("        <!-- CSS Libraries -->\n");
      out.write("        <link href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"CSS/slick.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"CSS/slick-theme.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("        <!-- Template Stylesheet -->\n");
      out.write("        <link href=\"CSS/style.css\" rel=\"stylesheet\">\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("\n");
      out.write("         <!-- Nav Bar Start -->\n");
      out.write("        <div class=\"nav\">\n");
      out.write("            <div class=\"container-fluid\">\n");
      out.write("                <nav class=\"navbar navbar-expand-md bg-dark navbar-dark\">                    \n");
      out.write("                    <div class=\"collapse navbar-collapse justify-content-between\" id=\"navbarCollapse\">\n");
      out.write("                        <div class=\"navbar-nav mr-auto\">\n");
      out.write("                             <a href=\"Home.jsp\" class=\"nav-item nav-link active\">Home</a>\n");
      out.write("                            <a href=\"product_users.jsp\" class=\"nav-item nav-link\">Products</a>\n");
      out.write("                            <a href=\"profile.jsp\" class=\"nav-item nav-link\">My Profile</a>\n");
      out.write("                            <a href=\"UserOrders.jsp\" class=\"nav-item nav-link\">My Orders</a>\n");
      out.write("\n");
      out.write("                            \n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                </nav>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <!-- Nav Bar End -->      \n");
      out.write("\n");
      out.write("        <!-- Bottom Bar Start -->\n");
      out.write("        <div class=\"bottom-bar\">\n");
      out.write("            <div class=\"container-fluid\">\n");
      out.write("                <div class=\"row align-items-center\">\n");
      out.write("                    <div class=\"col-md-3\">\n");
      out.write("                        <div class=\"logo\">\n");
      out.write("                            <a href=\"UserOrder.jsp\">\n");
      out.write("                                <img src=\"img/logo.png\" alt=\"Logo\">\n");
      out.write("                            </a>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                   \n");
      out.write("                   \n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <!-- Bottom Bar End -->       \n");
      out.write("<!-- Breadcrumb Start -->\n");
      out.write("<div class=\"breadcrumb-wrap\">\n");
      out.write("    <div class=\"container-fluid\">\n");
      out.write("        <ul class=\"breadcrumb\">\n");
      out.write("            <li class=\"breadcrumb-item\"><a href=\"#\">Home</a></li>\n");
      out.write("            <li class=\"breadcrumb-item\"><a href=\"#\">Products</a></li>\n");
      out.write("            \n");
      out.write("        </ul>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("<!-- Breadcrumb End -->\n");
      out.write("\n");
      out.write("<!-- Users Start -->\n");
      out.write("<div class=\"wishlist-page\">\n");
      out.write("    <div class=\"container-fluid\">\n");
      out.write("        <div class=\"wishlist-page-inner\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-md-12\">\n");
      out.write("                    <div class=\"table-responsive\">\n");
      out.write("                        <table class=\"table table-bordered\">\n");
      out.write("                            <thead class=\"thead-dark\">\n");
      out.write("                                <tr>\n");
      out.write("                                    <th>Order ID</th>\n");
      out.write("                                    <th>Total</th>\n");
      out.write("                                    <th>Payment Method</th>\n");
      out.write("                                    <th>Status</th>\n");
      out.write("                                    <th> Date </th>\n");
      out.write("                                    <th> Expected Date </th>\n");
      out.write("                                    <th> Order Details </th>\n");
      out.write("                                </tr>\n");
      out.write("                            </thead>\n");
      out.write("                            ");

                                try {
                                    HttpSession test = request.getSession(false);
                                    int userID= (Integer)(session.getAttribute("id"));
                                    String driver = "org.postgresql.Driver";
                                    String url = "jdbc:postgresql://localhost:5432/souq";
                                    String username = "postgres";
                                    String password = "1235";
                                    String myDataField = null;
                                    String myQuery = "  select * from orders where user_id ="+userID+" group by id,user_id order by date  ; ";
                                    String myQuery2 = " select product_id,quantity from order_product , orders where order_id = id ;";
                                    Connection myConnection = null;
                                    PreparedStatement myPreparedStatement = null;
                                    PreparedStatement myPreparedStatement2 = null;
                                    ResultSet myResultSet = null;
                                    Class.forName(driver).newInstance();
                                    myConnection = DriverManager.getConnection(url, username, password);
                                    System.out.println("Opened database successfully");
                                    myPreparedStatement = myConnection.prepareStatement(myQuery);
                                    myPreparedStatement2 = myConnection.prepareStatement(myQuery2);
                                    ResultSet rs = myPreparedStatement.executeQuery();
                                     ResultSet rs2 = myPreparedStatement2.executeQuery();

                                    ResultSetMetaData rsmd = rs.getMetaData();
                                    
                                    while (rs.next()) { 
                            
      out.write(" \n");
      out.write("                            <tr>\n");
      out.write("                                <td> \n");
      out.write("                                 ");
  int OrderID = rs.getInt("id");
                                    out.println(OrderID);
                                    
      out.write("\n");
      out.write("                                </td>\n");
      out.write("                                <td> \n");
      out.write("                                    \n");
      out.write("                                   ");
  int Total = rs.getInt("total");
                                    out.println(Total);
                                    
      out.write("\n");
      out.write("                                \n");
      out.write("                                </td>\n");
      out.write("                                <td>");
 String Payment_Method = rs.getString("payment_method");
                                    out.println(Payment_Method);
                                    
      out.write("</td>\n");
      out.write("                                <td>");
String Status = rs.getString("status");
                                    out.println(Status);
                                    
      out.write("</td> \n");
      out.write("                                <td>");
String date = rs.getString("date");
                                    out.println(date);
                                    
      out.write("</td>\n");
      out.write("                                <td>\n");
      out.write("                                    ");
String exp_date = rs.getString("exp_date");
                                    out.println(exp_date);
                                    
      out.write("\n");
      out.write("                                </td>\n");
      out.write("                                <td>\n");
      out.write("                                    ");

 
  while (rs2.next()) {
String product_id = rs2.getString("product_id");
String quantity = rs2.getString("quantity");

  out.println("ProductID: "+product_id+"---->"+"Quantity: "+quantity+ "\n");
break;
  } 

                                    
      out.write("\n");
      out.write("                                </td>\n");
      out.write("                                \n");
      out.write("       \n");
      out.write("                                \n");
      out.write("                            </tr>                                 \n");
      out.write("                            ");
         }
                                } catch (ClassNotFoundException e) {
                                    e.printStackTrace();
                                } catch (SQLException ex) {
                                    out.print("SQLException: " + ex.getMessage());
                                    out.print("SQLState: " + ex.getSQLState());
                                    out.print("VendorError: " + ex.getErrorCode());
                                }
                            
      out.write("\n");
      out.write("\n");
      out.write("                        </table>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <!-- Wishlist End -->\n");
      out.write("\n");
      out.write("                    \n");
      out.write("                    \n");
      out.write("                    \n");
      out.write("                    \n");
      out.write("\n");
      out.write("                    <!-- Footer Start -->\n");
      out.write("                    <div class=\"footer\">\n");
      out.write("                        <div class=\"container-fluid\">\n");
      out.write("                            <div class=\"row\">\n");
      out.write("                                <div class=\"col-lg-3 col-md-6\">\n");
      out.write("                                    <div class=\"footer-widget\">\n");
      out.write("                                        <h2>Get in Touch</h2>\n");
      out.write("                                        <div class=\"contact-info\">\n");
      out.write("                                            <p><i class=\"fa fa-map-marker\"></i>Smart Village</p>\n");
      out.write("                                            <p><i class=\"fa fa-envelope\"></i>support@gmail.com</p>\n");
      out.write("                                            <p><i class=\"fa fa-phone\"></i>+01281856864</p>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                                <div class=\"col-lg-3 col-md-6\">\n");
      out.write("                                    <div class=\"footer-widget\">\n");
      out.write("                                        <h2>Follow Us</h2>\n");
      out.write("                                        <div class=\"contact-info\">\n");
      out.write("                                            <div class=\"social\">\n");
      out.write("                                                <a href=\"\"><i class=\"fab fa-twitter\"></i></a>\n");
      out.write("                                                <a href=\"\"><i class=\"fab fa-facebook-f\"></i></a>\n");
      out.write("                                                <a href=\"\"><i class=\"fab fa-linkedin-in\"></i></a>\n");
      out.write("                                                <a href=\"\"><i class=\"fab fa-instagram\"></i></a>\n");
      out.write("                                                <a href=\"\"><i class=\"fab fa-youtube\"></i></a>\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                                <div class=\"col-lg-3 col-md-6\">\n");
      out.write("                                    <div class=\"footer-widget\">\n");
      out.write("                                        <h2>Company Info</h2>\n");
      out.write("                                        <ul>\n");
      out.write("                                            <li><a href=\"#\">About Us</a></li>\n");
      out.write("                                            <li><a href=\"#\">Privacy Policy</a></li>\n");
      out.write("                                            <li><a href=\"#\">Terms & Condition</a></li>\n");
      out.write("                                        </ul>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                                <div class=\"col-lg-3 col-md-6\">\n");
      out.write("                                    <div class=\"footer-widget\">\n");
      out.write("                                        <h2>Purchase Info</h2>\n");
      out.write("                                        <ul>\n");
      out.write("                                            <li><a href=\"#\">Pyament Policy</a></li>\n");
      out.write("                                            <li><a href=\"#\">Shipping Policy</a></li>\n");
      out.write("                                        </ul>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <div class=\"row payment align-items-center\">\n");
      out.write("                                <div class=\"col-md-6\">\n");
      out.write("                                    <div class=\"payment-method\">\n");
      out.write("                                        <h2>We Accept:</h2>\n");
      out.write("                                        <img src=\"img/payment-method.png\" alt=\"Payment Method\" />\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"col-md-6\">\n");
      out.write("                                    <div class=\"payment-security\">\n");
      out.write("                                        <h2>Secured By:</h2>\n");
      out.write("                                        <img src=\"img/godaddy.svg\" alt=\"Payment Security\" />\n");
      out.write("                                        <img src=\"img/norton.svg\" alt=\"Payment Security\" />\n");
      out.write("                                        <img src=\"img/ssl.svg\" alt=\"Payment Security\" />\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <!-- Footer End -->\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                    <!-- Footer Bottom Start -->\n");
      out.write("                    <div class=\"footer-bottom\">\n");
      out.write("                        <div class=\"container\">\n");
      out.write("                            <div class=\"row\">\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <!-- Footer Bottom End -->        \n");
      out.write("\n");
      out.write("\n");
      out.write("                    <!-- Back to Top -->\n");
      out.write("                    <a href=\"#\" class=\"back-to-top\"><i class=\"fa fa-chevron-up\"></i></a>\n");
      out.write("\n");
      out.write("                    <!-- JavaScript Libraries -->\n");
      out.write("                    <script src=\"https://code.jquery.com/jquery-3.4.1.min.js\"></script>\n");
      out.write("                    <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("                    <script src=\"lib/easing/easing.min.js\"></script>\n");
      out.write("                    <script src=\"lib/slick/slick.min.js\"></script>\n");
      out.write("\n");
      out.write("                    <!-- Template Javascript -->\n");
      out.write("                    <script src=\"js/main.js\"></script>\n");
      out.write("                    </body>\n");
      out.write("\n");
      out.write("                    </html>\n");
      out.write("                    </body>\n");
      out.write("                    </html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
