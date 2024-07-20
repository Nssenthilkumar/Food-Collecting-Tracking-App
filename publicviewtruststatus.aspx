<%@ Page Language="C#" AutoEventWireup="true" CodeFile="publicviewtruststatus.aspx.cs" Inherits="publicviewtruststatus" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Wastage Food Delivery</title>
   
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

@media screen and (max-width: 600px) {
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
<script src="jquery-1.9.1.js" type="text/javascript"></script>
    <link href="jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="jquery-ui.js" type="text/javascript"></script>
		<script type="text/javascript">
        $(document).ready(function () {
            $("#TextBox1").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                      url: "WebService.asmx/GetItem",
                         data: "{'IName':'" + document.getElementById('TextBox1').value + "'}",
                        dataType: "json",
                        success: function (data) {
                            response(data.d);
                        },
                        error: function (result) {
                            alert("Error......");
                        }
                    });
                }
            });
        });
        </script>
</head>
<body background="background.jpg" >
     <form id="form1" runat="server">
    <img src="header.jpg" width="100%" height="200px" />
    <div class="topnav" id="Div1">
    <div class="topnav" id="myTopnav">

  <a href="publichome.aspx" class="active">Home</a>
  <a href="publicforward.aspx">Forward Wastage </a>
<a href="publicviewtruststatus.aspx">Trust Status</a>
  <a href="publiclogin.aspx">Logout</a>
     <a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  </a>
</div>
  <div>
    <div>
      <div id="logo"> <a href="#">
      
   <%--   <img src="food.jpg" width="200px" height="200px" />--%>
      </a> </div>
     
    </div>
    <%--<ul>
      <li><a href="publichome.aspx">Search</a></li>
      <li><a href="publicforward.aspx">Forward Wastage </a></li>
      <li><a href="publicviewtruststatus.aspx">Trust Status</a></li>
       <li><a href="publiclogin.aspx">Logout</a></li>
    </ul>--%>
  
  </div>
</div>
<div id="content">
  </div>

            <h2> Trust Details</h2>
       
        <div id = "dvGrid" style ="width:100%; overflow:scroll;  position:absolute;  height:100%">
   
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="True" 
       PageSize="5" onselectedindexchanged="GridView1_SelectedIndexChanged1" 
              Height="98px" Font-Bold="True"  HorizontalAlign="Center" 
            CellPadding="4" 
         style="width: 433px; " 
                ForeColor="Black" BackColor="#CCCCCC" BorderColor="#999999" 
             BorderStyle="Solid" BorderWidth="3px" CellSpacing="2">
            <RowStyle HorizontalAlign="Center" BackColor="White"/>
                <Columns>
                     <asp:BoundField DataField="id" HeaderText="Sno" />
                      <asp:BoundField DataField="trustname" HeaderText="Trust Name"/>
                     <asp:BoundField DataField="personname" HeaderText="Person Name"/>
                         <asp:BoundField DataField="phoneno" HeaderText="Phone No"/>
            <asp:BoundField DataField="address" HeaderText="Address"/>
        <asp:BoundField DataField="totalmembers" HeaderText="Total Members"/>
         <asp:BoundField DataField="status" HeaderText="Status"/>
       
        <asp:BoundField DataField="senddate" HeaderText="Send Date"/>
        <asp:BoundField DataField="forwarddate" HeaderText="Forward Date"/>
       
                 </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <PagerStyle ForeColor="Black" HorizontalAlign="Left" BackColor="#CCCCCC" />
            <SelectedRowStyle BorderColor="Orange" BackColor="#000099" Font-Bold="True" 
                 ForeColor="White"  />
            <HeaderStyle BorderColor="Orange"  HorizontalAlign="Center" BackColor="Black" 
                Font-Bold="True" ForeColor="White" />
        </asp:GridView> 
      </div></div>
  

    </form>
</body>
</html>
