<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchAppointment.aspx.cs" Inherits="YourNamespace.SearchAppointment" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript">
    function appendDigit(digit) {
        var txt = document.getElementById('<%= txtCaseNumber.ClientID %>');
        txt.value += digit;
    }

    function clearInput() {
        var txt = document.getElementById('<%= txtCaseNumber.ClientID %>');
        txt.value = '';
    }
</script>
    
    <style>
       
    .large-input {
        font-size: 20px;
        padding: 10px;
        width: 400px;
        height: 40px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .large-input::placeholder {
        color: #888;
        font-style: italic;
    }

        
    .number-btn {
        padding: 17px;
        font-size: 42px;
        margin: 4px;
        background-color: #205266;
        color: white
    }
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
            width: 100%;
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

    <!-- Wolaita Zone High Court Logo (Right) -->
    <img src="logo.png" alt="Wolaita Zone High Court Logo" style="width: 120px; height: 130px; position: absolute; top: 0; left: 0; z-index: 1;" />

    <!-- Heading Text -->
    <h3 style="margin-left: 190px; margin-right: 140px; color: white; font-size: 23px; z-index: 2; position: relative;">
        እንኳን ወደ ወላይታ ዞን  ከፍተኛ ፍርድ ቤት በሰላም መጣችሁ!<br />
        የወላይታ ዞን  ከፍተኛ ፍርድ ቤት መዝገብ መከታተያ
    </h3>
</div>
                         
                          </div>


        <div class="container d-flex justify-content-center gap-3 mt-3">
            
            <div class="search-container">
              
                <label style=" align-items: center;border-radius: 5px;color: green;padding: 10px 30px; font-size: 28px;"for="txtCaseNumber">       ወላይታ ሶዶ ከፍተኛ ፍርድ ቤት የቀጠሮ መፈለጊያ</label><br></br>
                <asp:TextBox ID="txtCaseNumber" runat="server" CssClass="large-input" /><br></br>
                
                 <asp:Button ID="btnClearOneByOne" runat="server"  class="btn btn-primary" style="border-radius: 5px;color: green;padding: 8px 30px; font-size: 28px;" Text="አንድ በአንድ አጥፋ" OnClick="btnClearOneByOne_Click" />   
                <asp:Button ID="btnSearch" runat="server"  class="btn btn-primary" style="border-radius: 5px;color: green;padding: 8px 50px; font-size: 28px;" Text="ፈልግ" OnClick="btnSearch_Click" />                
                <asp:Button ID="btnClearAll" runat="server"  class="btn btn-primary" style="border-radius: 5px;color: green;padding: 8px 30px; font-size: 28px;" Text="ሁሉንም አጥፋ" OnClick=" btnClearAll_Click" />   


<div class="col-lg-7">
<asp:Button ID="btn1" runat="server" Text="1"  CssClass="number-btn" OnClick="Number_Click" />
<asp:Button ID="btn2" runat="server" Text="2"  CssClass="number-btn" OnClick="Number_Click" />
<asp:Button ID="btn3" runat="server" Text="3"  CssClass="number-btn" OnClick="Number_Click" />
<asp:Button ID="btn4" runat="server" Text="4"  CssClass="number-btn" OnClick="Number_Click" />
<asp:Button ID="btn5" runat="server" Text="5"  CssClass="number-btn" OnClick="Number_Click" />
<asp:Button ID="btn6" runat="server" Text="6"  CssClass="number-btn" OnClick="Number_Click" />
<asp:Button ID="btn7" runat="server" Text="7"   CssClass="number-btn" OnClick="Number_Click" />
<asp:Button ID="btn8" runat="server" Text="8"  CssClass="number-btn" OnClick="Number_Click" />
<asp:Button ID="btn9" runat="server" Text="9" CssClass="number-btn" OnClick="Number_Click" />
<asp:Button ID="btn0" runat="server" Text="0"  CssClass="number-btn" OnClick="Number_Click" />
          
                    </div>         
                
                </div>
            <br />
 <div style="display: flex; gap:30px;font-size:18px;">
    <asp:Label ID="lblCaseNumber" runat="server" Visible="false"/>
    <asp:Label ID="lblPlaintiff" runat="server" Visible="false"/>
    <asp:Label ID="lblDefendant" runat="server" Visible="false"/><br></br>
    <asp:Label ID="lblStatus" runat="server"  Visible="false"/>
</div>
            
            <asp:GridView ID="gvAppointments" runat="server" CssClass="grid-view" Width ="100%" AutoGenerateColumns="false" EmptyDataText="ቀጠሮ አልተገኘም">
                <Columns>
                   <asp:BoundField DataField = "መዝገብ ቁጥር" HeaderText= "መዝገብ ቁጥር"/>
                <asp:BoundField DataField = "ከሳሽ" HeaderText= "ከሳሽ/ይግባኝ ባይ" />
                <asp:BoundField DataField = "ተከሳሽ" HeaderText= "ተከሳሽ/መልስ ሰጪ" />
              <asp:BoundField DataField = "ችሎት" HeaderText= "ችሎት" />
                <asp:BoundField DataField = "የቀጠሮ ቀን" HeaderText= "የቀጠሮ ቀን" />
                <asp:BoundField DataField = "የቀጠሮ ምክኒያት" HeaderText= "የቀጠሮ ምክንያት" />
               <asp:BoundField DataField = "ጉዳዩ ያልበት ሁኔታ" HeaderText= "ጉዳዩ ያልበት ሁኔታ" />

                </Columns>
               
            </asp:GridView>
        </div>

    </form>
</body>
</html>
