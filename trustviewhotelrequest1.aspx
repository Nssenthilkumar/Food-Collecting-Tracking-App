<%@ Page Language="C#" AutoEventWireup="true" CodeFile="trustviewhotelrequest1.aspx.cs" Inherits="trustviewhotelrequest1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Wastage Food Delivery</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
  <link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300' rel='stylesheet' type='text/css'>
<style type="text/css">
.form-style-8{
    font-family: 'Open Sans Condensed', arial, sans;
    width: 500px;
    padding: 30px;
    background: #FFFFFF;
    margin: 50px auto;
    box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.22);
    -moz-box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.22);
    -webkit-box-shadow:  0px 0px 15px rgba(0, 0, 0, 0.22);

}
.form-style-8 h2{
    background: #4D4D4D;
    text-transform: uppercase;
    font-family: 'Open Sans Condensed', sans-serif;
    color:White;
    font-size: 18px;
    font-weight: 100;
    padding: 20px;
    margin: -30px -30px 30px -30px;
}
.form-style-8 input[type="text"],
.form-style-8 input[type="date"],
.form-style-8 input[type="datetime"],
.form-style-8 input[type="email"],
.form-style-8 input[type="number"],
.form-style-8 input[type="search"],
.form-style-8 input[type="search"],
.form-style-8 input[type="time"],
.form-style-8 input[type="url"],
.form-style-8 input[type="password"],
.form-style-8 textarea,
.form-style-8 select

{
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    outline: none;
    display: block;
    width: 100%;
    padding: 7px;
    border: none;
    border-bottom: 1px solid #ddd;
    background: transparent;
    margin-bottom: 10px;
    font: 18px Arial, Helvetica, sans-serif;
    height: 50px;
}
.form-style-8 textarea{
    resize:none;
    overflow: hidden;
}
.form-style-8 input[type="button"],
.form-style-8 input[type="submit"]{
    -moz-box-shadow: inset 0px 1px 0px 0px #45D6D6;
    -webkit-box-shadow: inset 0px 1px 0px 0px #45D6D6;
    box-shadow: inset 0px 1px 0px 0px #45D6D6;
    background-color: #2CBBBB;
    border: 1px solid #27A0A0;
    display: inline-block;
    cursor: pointer;
    color: #FFFFFF;
    font-family: 'Open Sans Condensed', sans-serif;
    font-size: 14px;
    padding: 8px 18px;
    text-decoration: none;
    text-transform: uppercase;
}
.form-style-8 input[type="button"]:hover,
.form-style-8 input[type="submit"]:hover {
    background:linear-gradient(to bottom, #34CACA 5%, #30C9C9 100%);
    background-color:#34CACA;
}
</style>
</head>
<body background="background.jpg">
    <form id="form1" runat="server">
    <img src="header.jpg" width="100%" height="200px" />
  <div>
    <div>
      <div id="logo"> <a href="#">
      
   <%--   <img src="food.jpg" width="200px" height="200px" />--%>
      </a> </div>
     
    </div>
    <ul>
      <li class="current"><a href="trusthome.aspx">Members</a></li>
      <li><a href="viewmembers.aspx">View Members</a></li>
      <li><a href="trustrequest.aspx">Trust Request</a></li>
      <li><a href="viewstatus.aspx">View Status</a></li>
      <li><a href="othersrequest.aspx">Others Request</a></li>
      <li><a href="confirmrequest.aspx">Confirm Request</a></li>
      <li><a href="routemap.aspx">Map</a></li>
      <li><a href="trustlogin.aspx">Logout</a></li>
    </ul>
    <div id="section">
      <img src="food.jpg" width="100%" height="100%" />
    </div>
  </div>
</div>
<div id="content">
  <div class="home">
    <div class="aside">
      <div class="form-style-8">
<asp:TextBox ID="TextBox7" runat="server" Width="500px" Height="30px" placeholder="Hotel Name" ValidationGroup="trust"></asp:TextBox>
      
<asp:TextBox ID="TextBox9" runat="server" Width="500px" Height="30px" placeholder="Address" ValidationGroup="trust"></asp:TextBox>
       
<asp:TextBox ID="TextBox11" runat="server" Width="500px" Height="30px" placeholder="Phoneno" ValidationGroup="trust"></asp:TextBox>
     <asp:DropDownList ID="DropDownList2" runat="server" Width="500px" Height="30px">
            
            </asp:DropDownList>       
           
      <asp:Button ID="Button2" runat="server" Text="Click Here" onclick="Button2_Click" 
                ValidationGroup="trust" Width="101px"/>
</div>
</div>
  </div>
</div>
<div id="footer">
 
  <div id="featured">
   
  </div>
  <div id="navigation">
    <div>
    
      </div>
  </div>
</div>
    </form>
</body>
</html>
