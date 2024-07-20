<%@ Page Language="C#" AutoEventWireup="true" CodeFile="routemap.aspx.cs" Inherits="routemap" %>

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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
       <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyB0ckTthL1bvZjHrFW-9TvkhMaUz-s_yU0"></script> 
       <script>
        google.load('visualization', '1', { 'packages': ['map'] });
        google.setOnLoadCallback(drawMap);

        function drawMap() {
            var data = google.visualization.arrayToDataTable([
        ['Country', 'Population'],
        ['China', 'China: 1,363,800,000'],
        ['India', 'India: 1,242,620,000'],
        ['US', 'US: 317,842,000'],
        ['Indonesia', 'Indonesia: 247,424,598'],
        ['Brazil', 'Brazil: 201,032,714'],
        ['Pakistan', 'Pakistan: 186,134,000'],
        ['Nigeria', 'Nigeria: 173,615,000'],
        ['Bangladesh', 'Bangladesh: 152,518,015'],
        ['Russia', 'Russia: 146,019,512'],
        ['Japan', 'Japan: 127,120,000']
      ]);

            var options = { showTip: true, enableScrollWheel: true, useMapTypeControl: true, showLine: true, lineWidth: 10, lineColor: '#800000', mapType: 'hybrid' };

            var map = new google.visualization.Map(document.getElementById('Map_Div'));

            map.draw(data, options);
        };
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#btnSearch").click(function () {
                var geocoder = new google.maps.Geocoder();
                var strSearch = document.getElementById('txtSearch').value;
                geocoder.geocode({ 'address': strSearch }, function (results, status) {
                    if (status == google.maps.GeocoderStatus.OK) {
                        var x = results[0].geometry.location.lat();
                        var y = results[0].geometry.location.lng();
                        document.getElementById('txtLat').value = x;
                        document.getElementById('txtLng').value = y;
                        //alert(x + "|" + y);
                        var latlng = new google.maps.LatLng(x, y);
                        var myOptions = {
                            zoom: 8,
                            center: latlng,
                            mapTypeId: google.maps.MapTypeId.ROADMAP
                        };
                        map = new google.maps.Map(document.getElementById("Map_Div"), myOptions);
                        var marker = new google.maps.Marker({
                            position: new google.maps.LatLng(x, y),
                            map: map,
                            title: strSearch
                        });
                        s
                        var infowindow = new google.maps.InfoWindow({
                            content: strSearch
                        });
                        infowindow.open(map, marker);
                        google.maps.event.addDomListener(window, 'load');
                    } else {
                        alert("Location Not Found...");
                        document.getElementById('txtSearch').value = "";
                    }
                });
            });
        });
    </script>
    <script language="javascript" type="text/javascript">
   function view(id)
  {
   location.href='routemap.aspx?id='+id;
  }
 </script>
</head>
<body background="background.jpg">
    <form id="form1" runat="server">
        <img src="header.jpg" width="100%" height="200px" />
  
    
    
    <div class="topnav" id="myTopnav">

   <a href="trusthome.aspx">Members</a>
     <a href="viewmembers.aspx">View Members</a>
      <a href="trustrequest.aspx">Trust Request</a>
      <a href="viewstatus.aspx">View Status</a>
      <a href="othersrequest.aspx">Others Request</a>
         <a href="routemap.aspx">Map</a>
      <a href="trustlogin.aspx">Logout</a>

 
  
  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  </a>
</div>
  
</div>
 
  
<div id="content">
  <div class="home">
    <div class="aside">
     
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
             <asp:BoundField DataField="publicname" HeaderText="Public Name"/>
              <asp:BoundField DataField="publictype" HeaderText="Type"/>
             <asp:BoundField DataField="publicaddress" HeaderText="Address"/>
             <asp:BoundField DataField="pubphoneno" HeaderText="Phone No"/>
             <asp:BoundField DataField="status" HeaderText="Status"/>
             <asp:BoundField DataField="senddate" HeaderText="Send Date"/>
             <asp:BoundField DataField="forwarddate" HeaderText="Forward Date"/>
                <asp:TemplateField>
                 <ItemTemplate>
                     <a href="javascript:view('<%#DataBinder.Eval(Container.DataItem,"id")%>')">
                     View</a> &nbsp;&nbsp;
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
        <div style="height: 42px; border: 1px Solid Black; margin: 2%; padding: 1%;">
   
       <asp:TextBox runat="server" ID="txtSearch" PlaceHolder="Enter the Location Name" Font-Size="14px"
            Width="100px"/>
        <asp:Button ID="btnSearch" runat="server" Text="Search" Style="font-family: Lao UI;
            font-size: 14px; width: 150px;" OnClientClick="return false;" 
                BackColor="White" ForeColor="#FF3300" onclick="btnSearch_Click"/>
            
    </div>
        <div id="Map_Div" style="height: 250px; border: 1px Solid Black; margin: 2%; padding: 1%; width:900px;">
    </div>
     <div style="height: 50px; border: 1px Solid Black; margin: 2%; padding: 1%; width:900px;">
        <asp:Label runat="server" ID="lblLat" Text="Lat : " />
        <asp:TextBox runat="server" ID="txtLat" Font-Size="15px" Enabled="false" Width="150px" style="margin-right:50px;" />
        <br />
        <asp:Label runat="server" ID="lblLng" Text="Lng : " />
        <asp:TextBox runat="server" ID="txtLng" Font-Size="15px" Enabled="false" Width="150px" />
    </div>
    
    
    
        </div>
       </div>
       
  </div>
</div>

    </form>
</body>
</html>
