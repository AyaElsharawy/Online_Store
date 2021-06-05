<%-- 
    Document   : sign_out
    Created on : Apr 9, 2021, 10:27:08 AM
    Author     : Eng.Aya
--%>

<%
    session.invalidate();
    response.sendRedirect("index.html");
%>
