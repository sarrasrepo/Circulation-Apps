<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>:::Home:::</title>

    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
   

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/Custom.css" rel="stylesheet"/>
   
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
</head>

    <body>
        <form id="frmHome" runat="server">
            <%--<nav class="navbar navbar-fixed-top">
            </nav>--%>
            <div class="container">
                <div class="col-lg-4"> </div>
                <asp:ImageButton ID="ImgBtnStatistics" runat="server" CssClass="img-responsive" Width="370" Height="120" ImageUrl="~/Image/the-button-3.png"  OnClick="ImgBtnStatistics_Click" />
                
                <div class="col-lg-4"> </div>
                <asp:ImageButton ID="ImgBtnCOQty" runat="server" CssClass="img-responsive" Height="120px"  Width="370px"  ImageUrl="~/Image/the-button-4.png" OnClick="ImgBtnCOQty_Click"/>

                <div class="col-lg-4"> </div>
                <asp:ImageButton ID="ImgBtnOdrEntry" runat="server" CssClass="img-responsive" Height="120px" Width="370px"  ImageUrl="~/Image/the-button-5.png" OnClick="ImgBtnOdrEntry_Click" />
            </div>  
        </form>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>

    </body>

</html>
