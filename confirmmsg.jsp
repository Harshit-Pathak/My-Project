<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>Message</title>
<link href="confirm msg design.css" rel="stylesheet" type="text/css"/>


<script src="ism-2.1.js"></script>


</head>

<body>
    <div class="message">
         <%


				String u=(String)session.getAttribute("username");

				if(u==null)

				{

				%>  
  
	        
                <a href="Login page.html" class="button"><b>LOG IN</b></a>
                 <a href="Registration page.html" class="button"><b>SIGN UP</b></a>
              
			  <%
				}
				else

				{
				%>
                                Welcome!!!&nbsp <%=u%> &nbsp &nbsp<a href="change password.html" class="button">Change Password</a>&nbsp<a href="logout.jsp" class="button">Logout</a>
                                
				<%
				}
				%>
                 
    </div>

    
    
    <div class="logo" align="center">
        <a href="Index1.jsp"><img src="final_select (1).png" height="95"></a>
			</div><br/><br><br>
                        
		<div class="list">	
            <ul>
                  <li><a href="About.jsp"><b>ABOUT</b></a></li>
                  
                  <li><a href="#"><b>CLOTHING</b></a>
                      
                 <ul>
                 <li><a href="view_products.jsp?p_category=Mens&pageno=1">MENS</a></li>
                 <li><a href="view_products.jsp?p_category=Womens&pageno=1"><b>WOMENS</b></a>
                 </ul>
                      <li><a href="view_cart.jsp"><img src="ecommerce.png" height="15" width="18">&nbsp <b>MY CART</b></a></li>
                 </li>
                 
                  
                   
                  <li><a href="view_products.jsp?p_category=Electronics&pageno=1"><b>ELECTRONICS</b></a>
                  		
                    
                  <li><a href="view_products.jsp?p_category=Home Appliances&pageno=1"><b>HOME APPLIANCES</b></a>
                 
                 </li>
                   <li><a href="view_products.jsp?p_category=Furnitures&pageno=1"><b>FURNITURES</b></a>
                 
                 </li>
                  
                  <li><a href="Feedback.html" target="new"><b>FEEDBACK</b></a></li>&nbsp&nbsp;
                  
                  
				
                 <form action="">
                     
            	<input type="text" name="" placeholder="Search..." style=" font-size: 20px;
  padding: 9px 7px; width: 20% ; padding-top:3px; padding-bottom:2px; border-radius:11px;" align="right"   >
             </form>
		</ul>
		</div>
        
    
   
    
    
    
    
    
    
    
    
    
    
    


<tr height=400>
<td colspan="3" align="right">

    <center>  <align="center"><br></br>
<h3 style="color:white">Order Placed Successfully</h3>
<%

String oid=(String)session.getAttribute("oid");

%>

<h3 style="color:white">Order Id:<%=oid%></h3>

<table border=1 width="1000" cellspacing=5 style="color:white">
<tr align=left>
<th>Product Id</th>
<th>Product Name</th>
<th>Price</th>
<th>Quantity</th>
<th>Total</th>
</tr>
<%
session.setAttribute("oid",null);

int total_bill=0;
try
{
	
	Class.forName("com.mysql.jdbc.Driver"); 
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/ecommerce","root","hgmp");
	PreparedStatement ps=con.prepareStatement("select p.product_id,p.product_name,p.product_price,od.qty,p.product_price*od.qty from products p, orderdetails od where p.product_id=od.pid and od.oid=?");
	ps.setString(1,oid);
	ResultSet rs= ps.executeQuery();
	while(rs.next())
	{
		total_bill+=Integer.parseInt(rs.getString(5));
%>
		<tr>
		<td><%=rs.getString(1)%></td>
		<td><%=rs.getString(2)%></td>
		<td><%=rs.getString(3)%></td>
		<td><%=rs.getString(4)%></td>
		<td><%=rs.getString(5)%></td>
		</tr>

<%
	}
}
catch (Exception e)
{
	out.println(e);
}

%>
<tr>
<td align=left colspan=5>Total</td>
<td><%=total_bill%></td>
</tr>
<tr>
<td align=center colspan=6><form>
<button value="Print this page" onClick="window.print()"><img src="images/printbutton.png"></button>
</form></td>
</tr>
</table>
</center>



</td></tr>

<tr>

<td colspan="3" align="center">&nbsp;<BR>
<font face="Tahoma, Geneva, sans-serif" size="2" color="#FFFFFF">Copyright &copy; All Rights Reserved. Select Genie 2018 </font>
</td></tr>
</table>


</body>
</html>
