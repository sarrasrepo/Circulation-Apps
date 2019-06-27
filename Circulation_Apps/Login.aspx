<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
       
    
    <title>:::Login:::</title>
   

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
       
    
             
    <form id="frmLogin" runat="server">
    
        <!--sign in start-->
        
    <%--<nav class="navbar navbar-fixed-top" role="navigation">
      </nav>--%>
            <div class="container">
                <div class="form-horizontal">
                    <h2>Login</h2>
                    <hr />
                    <div class="form-group">            
                        <asp:Label ID="lblName"  runat="server" CssClass="col-md-2 control-label" Text  ="User Name"></asp:Label>
                            
                        <div class="col-md-3" >
                        <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>


                <div class="form-group">            
                        <asp:Label ID="lblPassword"  runat="server" CssClass="col-md-2 control-label" Text  ="Password"></asp:Label>
                            
                        <div class="col-md-3" >
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                    </div>
                        </div>

                    

                    <div class="form-group">            
                        <div class="col-md-2" ></div>      
                        <div class="col-md-6" >
                            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnLogin_Click"/>
                       
                    </div>
                        </div>
         
            
                         
            </div>
         </div>

        <!--sign in End-->

                  
   
    </form>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>


    </body>
</html>
