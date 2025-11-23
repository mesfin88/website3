
<%@ Page Language = "C#" AutoEventWireup="true" CodeFile="CourtList2.aspx.cs" Inherits="WebApplication5.CourtList2" %>

<!DOCTYPE html>
<html xmlns = "http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>WHC Daily Court List </title>
    	<script src="jquery.min.js" type="text/javascript"></script>
	 <link rel="stylesheet" href="bootstrap.min.css" type="text/css"  />
		<script src="bootstrap.min.js" type="text/javascript"></script>
    <style>

    <style>
        body {
            align-items: center
            font-family: Arial, sans-serif;
            margin: 0;
            background-color: #f4f4f9;
        }
        .banner {
            background-image: url('banner.jpg');
            background-size: cover;
            background-position: center;
            color: #fff;
            padding: 60px 0;
            text-align: center;
            box-shadow: 0 4px 20px rgba(0,0,0,0.2);
        }
        .banner h1 {
            align-items: center
            font-size: 1.5em;
            margin: 0;
        }
       
        .container {
            width: 80%;
            max-width: 1200px;
            margin: 20px auto;
            background-color: #e3f2fd; 

            padding: 20px 30px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        
        .search-container {
            margin-bottom: 20px;
            background-color: #e3f2fd;
            
                justify-content: center; /* vertical centering */
                 align-items: center;
        }
        label {
            font-weight: bold;
            margin-right: 10px;
        }
  
        .grid-view th {
            background-color: #4CAF50;
            color: white;
            padding: 12px;
            text-align: left;
        }
        .grid-view td {
            padding: 8px;
            border: 1px solid #ddd;
        }
        .grid-view tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .current-date {
            color: #2196F3;
            margin-bottom: 15px;
        }
    </style>
</head>
<body class="d-flex justify-content-center align-items-center min-vh-100 bg-light">  
    <form id="form1" runat="server">
       
        <div class="row" style="background-color: #2196F3 ;">
                         <div class="col-md-2 col-xl-2">
                                 
                         </div>
                       <div class="col-md-8 col-xl-8" style="position: relative; background-color: #205266; color: white; text-align: center; padding: 20px; overflow: hidden;">
    <!-- Ethiopian Flag Animation (Left) -->
    <img src="flag.png" alt="Ethiopian Flag" style="width: 183px; height: 150px; position: absolute; top: 0; right: 0; z-index: 1; animation: floatFlag 4s ease-in-out infinite;" />

    <!-- Wolaita Zone High Court Logo (Right) -->
    <img src="logo.png" alt="Wolaita Zone High Court Logo" style="width: 120px; height: 130px; position: absolute; top: 0; left: 0; z-index: 1;" />

    <!-- Heading Text -->
    <h3 style="margin-left: 190px; margin-right: 140px; color: white; font-size: 23px; z-index: 2; position: relative;">
        እንኳን ወደ ወላይታ ዞን  ከፍተኛ ፍርድ ቤት በሰላም መጣችሁ!<br />
        የወላይታ ዞን  ከፍተኛ ፍርድ ቤት የዛሬ የፍትሐብሔር ቀጠሮዎች
    </h3>
</div>
                         
                          </div>

               
        <div class="container d-flex justify-content-center gap-3 mt-3">
                    <div class="search-container">   
        </div>
                 
          <div class="search-container">                      
          </div>       
            <asp:Label ID = "lblRowCount" runat= "server" /> 
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
<asp:Timer ID="Timer1" runat="server" Interval="10000" OnTick="Timer1_Tick" />
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
         
        <asp:GridView ID = "gvAppointments" runat= "server" CssClass="grid-view" Width="100%" AutoGenerateColumns= "false" AllowPaging="true" PageSize="11" OnPageIndexChanging="gvAppointments_PageIndexChanging">
            <Columns >
                <asp:BoundField DataField = "መዝገብ ቁጥር" HeaderText= "መዝገብ ቁጥር"/>
                <asp:BoundField DataField = "ከሳሽ" HeaderText= "ከሳሽ/ይግባኝ ባይ" />
                <asp:BoundField DataField = "ተከሳሽ" HeaderText= "ተከሳሽ/መልስ ሰጪ" />
              <asp:BoundField DataField = "ችሎት" HeaderText= "ችሎት" />
                <asp:BoundField DataField = "የቀጠሮ ቀን" HeaderText= "የቀጠሮ ቀን" />
                <asp:BoundField DataField = "የቀጠሮ ምክኒያት" HeaderText= "የቀጠሮ ምክንያት" />
            </Columns >
        </asp:GridView>
         </ContentTemplate>
</asp:UpdatePanel>
    </form>
</body>
</html>