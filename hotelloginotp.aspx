<%@ Page Language="C#" AutoEventWireup="true" CodeFile="hotelloginotp.aspx.cs" Inherits="hotelloginotp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Wastage Food Delivery</title>
   <link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300' rel='stylesheet' type='text/css'>
<link href="styles.css" type="text/css" rel="Stylesheet" />
</head>
<body  background="background.jpg">
    <form id="form1" runat="server">
    <img src="header.jpg" width="100%" height="200px" />
<div class="form-style-8">
  <h2>Welcome !!! Login</h2>

     <asp:TextBox ID="TextBox1" runat="server" Width="500px" Height="30px" 
                placeholder="OTP" ValidationGroup="trust" 
                ontextchanged="TextBox1_TextChanged" AutoPostBack="true"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="TextBox1" ValidationGroup="trust"></asp:RequiredFieldValidator>
    
  
     <br/>
 
</div>
    </form>
</body>
</html>
