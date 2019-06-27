<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderQuantity.aspx.cs" Inherits="OrderQuantity" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       
    
    <title>:::Order Quantity:::</title>
   

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

    <!--Bootstrap-Datepicker -->
     <script src="js/jquery-1.10.2.min.js"></script>
     <link href="css/bootstrap-datepicker.css" rel="stylesheet" />
     <script src="js/bootstrap-datepicker.js"></script>
   <!--Bootstrap-Datepicker -->
         
    

</head>

    <script>
     $(document).ready(function () {
           $("#txtDate").datepicker({ format: 'dd-MM-yyyy', autoclose: true, todayBtn: 'linked' })
     });
    </script>

<body>
    
    <form id="frmOrderQty" runat="server">

     

        <!--------------------Main Content Starts----------------->   
        
                    <%--<nav class="navbar navbar-fixed-top">

                    </nav>--%>
                                    
                  <%--<asp:HyperLink ID="lnkLogout" CssClass="btn-default"  runat="server" text="Logout" style="position:relative;  font-family:Arial; font-weight:bold; color:navy; padding-top: 20%; left:80%;" 
                            NavigateUrl="~/Logout.aspx"></asp:HyperLink>--%>   

                    
         <div class="container">
              
             <h2>Change Order Quantity </h2>
                        
                 <asp:Label ID="lbWellcome" runat="server" Text="Regional Manager," CssClass="control-label" ></asp:Label>
                 <asp:Label ID="lblWellCome1" runat="server"  CssClass="control-label" style="color:Navy; font-style:italic;font-size:11px; font-family: Verdana;" ></asp:Label>
             <hr/>

             
              <div class="form-horizontal">

                <div class="form-group" >
                     <asp:Label ID="lblDate"  runat="server" CssClass="col-md-3 control-label" Text="Date"></asp:Label>
                           <div class="col-md-3" >                            
                               <asp:TextBox ID="txtDate" CssClass="datepicker" AutoComplete="off" runat="server" ></asp:TextBox>    
                           </div>
                 </div>

                 <div class="form-group">
                    <asp:Label ID="lblCategory" CssClass="col-md-3 control-label" runat="server" Text="Category"></asp:Label>
                      <div class="col-md-3">
                          <asp:DropDownList ID="ddlCategory" runat="server" CssClass="btn btn-default dropdown" AutoPostBack="True" ></asp:DropDownList>
                      </div>
                 </div>

                 <div class="form-group">
                    <asp:Label ID="lblAgnName" CssClass="col-md-3 control-label" runat="server" Text="Agency Name">  </asp:Label>
                        <div class="col-md-3">
                            <asp:DropDownList ID="ddlCustomer" runat="server" CssClass="btn btn-default dropdown" AutoPostBack="True" OnSelectedIndexChanged="ddlCustomer_SelectedIndexChanged" ></asp:DropDownList>
                        </div>     
                  </div>

                  
              

                 <div class="form-group">
                    <asp:Label ID="lblStnName" CssClass="col-md-3 control-label" runat="server" Text="Station Name"></asp:Label>
                      <div class="col-md-3">
                          <asp:DropDownList ID="ddlStation" runat="server" CssClass="btn btn-default dropdown" AutoPostBack="True" onselectedindexchanged="ddlStation_SelectedIndexChanged" ></asp:DropDownList>
                      </div>
                 </div>
                  
                <div class="form-group">
                    <asp:Label ID="lblQty" CssClass="col-md-3 control-label" runat="server" Text="Quantity" ></asp:Label>
                       <div class="col-md-3">
                          <asp:TextBox ID="txtQty" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                       </div>
                </div>
                  
                 <div class="form-group">
                     <asp:Label ID="lblChangQty" CssClass="col-md-3 control-label" runat="server" Text="Change Quantity"></asp:Label>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtChngQty" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                 </div> 
                  
                  <div class="form-group">
                      <div class="col-md-2" ></div>      
                        <div class="col-md-5" >
                            <asp:Button ID="Updatebtn" CssClass="btn btn-primary center-block" runat="server" Text="Update" OnClick="Updatebtn_Click"/>
                            
                        </div>
                      </div>                                 
             </div>
             
        </div>
      

        

        <!--------Main Content End----->

     
        </form>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <%-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> --%>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
