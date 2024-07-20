<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Wastage Food Delivery</title>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

   <link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300' rel='stylesheet' type='text/css'>
<link href="styles.css" type="text/css" rel="Stylesheet" />
<style>


.topnav {
  overflow: hidden;
  background-color:brown;
}

.topnav a {
  float: left;
  font-family:Arial;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #4CAF50;
  color: white;
}

.topnav .icon {
  display: none;
}

@media screen and (max-width: 600px) {
  .topnav a:not(:first-child) {display: none;}
  .topnav a.icon {
    float: right;
    display: block;
  }
}

@media screen and (max-width: 800px) {
  .topnav.responsive {position: relative;}
  .topnav.responsive .icon {
    position: absolute;
    right: 0;
    top: 0;
  }
  .topnav.responsive a {
    float: none;
    display: block;
    text-align: left;
  }
}
</style>
<script>
    function myFunction() {
        var x = document.getElementById("myTopnav");
        if (x.className === "topnav") {
            x.className += " responsive";
        } else {
            x.className = "topnav";
        }
    }
</script>
</head>
<body background="background.jpg">
    <form id="form1" runat="server">
    <img src="header.jpg" width="100%" height="200px" />
    <div class="topnav" id="myTopnav">

  <a href="trustlogin.aspx">Trust Login</a>
  <a href="publiclogin.aspx">Public Login</a>

 
  
  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  </a>
</div>
<div class="form-style-8">
  <h2>Welcome !!! Login</h2>

     <asp:TextBox ID="TextBox1" runat="server" Width="500px" Height="30px" placeholder="Registered Email Id" ValidationGroup="trust"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="TextBox1" ValidationGroup="trust"></asp:RequiredFieldValidator>
    
     <asp:TextBox ID="TextBox2" runat="server" Width="500px" Height="30px" placeholder="Password" ValidationGroup="trust" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="TextBox2" ValidationGroup="trust"></asp:RequiredFieldValidator>
   
   
    <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click" />
    <br/>
 <a href="publiclogin.aspx">New Public Login</a>
</div>
    </form>
</body>
</html>
