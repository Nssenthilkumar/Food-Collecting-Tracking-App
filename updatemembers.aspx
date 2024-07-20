<%@ Page Language="C#" AutoEventWireup="true" CodeFile="updatemembers.aspx.cs" Inherits="updatemembers" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Wastage Food Delivery</title>
      <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>


.topnav {
  overflow: hidden;
  background-color:brown;
}

.topnav a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 14px;
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
     <meta name="viewport" content="width=device-width, initial-scale=1">
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
<script language="javascript" type="text/javascript">
   function view(id)
  {
   location.href='updatemembers.aspx?id='+id;
  }
      function dele(id)
  {
   location.href='updatemembers.aspx?sno='+sno;
  }
     </script>
</head>
<body background="background.jpg">
    <form id="form1" runat="server">
       <img src="header.jpg" width="100%" height="200px" />
    <div class="topnav" id="myTopnav">

  <a href="trusthome.aspx" class="active">Home</a>
  <a href="viewmembers.aspx">View Members</a>
  <a href="trustrequest.aspx">Trust Request</a>
  <a href="viewstatus.aspx"> Status</a>
 <a href="othersrequest.aspx"> Request</a>
  <a href="confirmrequest.aspx">Confirm </a>
  <a href="routemap.aspx">Map</a>
  <a href="trustlogin.aspx">Logout</a>
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
    
   
  </div>
</div>
<div id="content">
  <div class="home">
    <div class="aside">
      <div class="form-style-8">
  <h2>Update Members</h2>

     <asp:TextBox ID="TextBox1" runat="server" Width="500px" Height="30px" placeholder="Name" ValidationGroup="trust"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="TextBox1" ValidationGroup="trust"></asp:RequiredFieldValidator>
    
     <asp:TextBox ID="TextBox2" runat="server" Width="500px" Height="30px" placeholder="Age" ValidationGroup="trust" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="TextBox2" ValidationGroup="trust"></asp:RequiredFieldValidator>
   
          <asp:DropDownList ID="DropDownList1" runat="server" ValidationGroup="trust" Width="500px" Height="30px">
          <asp:ListItem Text="--Gender--"></asp:ListItem>
          <asp:ListItem Text="Male"></asp:ListItem>
           <asp:ListItem Text="Female"></asp:ListItem>
          </asp:DropDownList>   
          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="DropDownList1" ValidationGroup="trust"></asp:RequiredFieldValidator>
    <asp:DropDownList ID="DropDownList2" runat="server" ValidationGroup="trust" Width="500px" Height="30px">
          <asp:ListItem Text="--Type--"></asp:ListItem>
          <asp:ListItem Text="Child"></asp:ListItem>
           <asp:ListItem Text="Adult"></asp:ListItem>
           <asp:ListItem Text="Old"></asp:ListItem>
          </asp:DropDownList>   
          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="DropDownList2" ValidationGroup="trust"></asp:RequiredFieldValidator>
      <asp:TextBox ID="TextBox3" runat="server" Width="500px" Height="30px" placeholder="Place of Birth" ValidationGroup="trust" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="TextBox2" ValidationGroup="trust"></asp:RequiredFieldValidator>
    <asp:TextBox ID="TextBox4" runat="server" Width="500px" Height="30px" placeholder="Join Date" ValidationGroup="trust" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="TextBox2" ValidationGroup="trust"></asp:RequiredFieldValidator>
     
    <asp:Button ID="Button1" runat="server" Text="Update" onclick="Button1_Click" />
      <asp:Button ID="Button2" runat="server" Text="Clear" onclick="Button2_Click" />
      </div>
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
                      <asp:BoundField DataField="membername" HeaderText="Name"/>
                     <asp:BoundField DataField="age" HeaderText="Age"/>
                         
            <asp:BoundField DataField="placeofbirth" HeaderText="Place of Birth"/>
        <asp:BoundField DataField="joindate" HeaderText="Date"/>
        
              <asp:TemplateField>
                 <ItemTemplate>
                     <a href="javascript:view('<%#DataBinder.Eval(Container.DataItem,"id")%>')">
                     View</a> &nbsp;&nbsp;
                 </ItemTemplate>
             </asp:TemplateField>
             
              <asp:TemplateField>
                 <ItemTemplate>
                     <a href="javascript:dele('<%#DataBinder.Eval(Container.DataItem,"id")%>')">
                     Delete</a> &nbsp;&nbsp;
                 </ItemTemplate>
             </asp:TemplateField>
                 </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <PagerStyle ForeColor="Black" HorizontalAlign="Left" BackColor="#CCCCCC" />
            <SelectedRowStyle BorderColor="Orange" BackColor="#000099" Font-Bold="True" 
                 ForeColor="White"  />
            <HeaderStyle BorderColor="Orange"  HorizontalAlign="Center" BackColor="Black" 
                Font-Bold="True" ForeColor="White" />
        </asp:GridView> 
        </div>
    <br/>

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
