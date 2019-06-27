<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Statistics.aspx.cs" Inherits="Statistics" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %> 

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>:::Statistics:::</title>
        
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
            $("#txtFrmDate, #txtToDate").datepicker({ format: 'dd-MM-yyyy', autoclose: true, todayBtn: 'linked' })
        });
    </script>
    
    
    <body>
        
        
        <form id="frmStatistics" runat="server">
            <%--<nav class="navbar navbar-fixed-top">
             </nav>--%>
    
            <div class="container">
                
                <div class="page-header" style="border-bottom-width:thin; border-bottom-color:#160cf2">
                    <h2> Statistics </h2> 

                    <hr />
                     <div class="form-horizontal">
                        <div class="form-group" >
                             <asp:Label ID="lblFrmDate"  runat="server" CssClass="col-md-2 control-label" Text="From Date"></asp:Label>
                                 <div class="col-md-3" >                            
                                     <asp:TextBox ID="txtFrmDate" CssClass="datepicker" AutoComplete="off" runat="server" ></asp:TextBox>
                      
                                 </div>
                        </div>
                               
                       
                            <div class="form-group">
                                <asp:Label ID="lblToDate"  runat="server" CssClass="col-md-2 control-label" Text="To Date" ></asp:Label>
                                    <div class="col-md-3" >
                                        <asp:TextBox ID="txtToDate" CssClass="datepicker" AutoComplete="off" runat="server"></asp:TextBox>                 
                                    </div>
                             
                            </div>

                    <div class="form-group">            
                        <div class="col-md-2" ></div>      
                        <div class="col-md-6" >
                            <asp:Button ID="btnPreview" runat="server" Text="Preview" CssClass="btn btn-primary" style="position:relative; left:2%" OnClick="btnPreview_Click"/>
                       
                        </div>
                     </div>
                               
                </div>
             </div>
           </div>                
                    
            <%--<div class="jumbotron"style="border:1px solid; width:200px; height:200px;">--%>
                
                
             <asp:GridView ID="GridView" CssClass="table table-hover" runat="server"  GridLines="Vertical" HorizontalAlign= "Center" AutoGenerateColumns="true" style=" position:relative; border:double; width:90%; top:-10px;">
                <Columns>

                </Columns>
                  
                </asp:GridView>

                

            <%--</div>--%>
        

    </form>
       
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   <%-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>--%>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
   


    </body>

</html>
