<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReturnEntry.aspx.cs" Inherits="ReturnEntry" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %> 

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>:::Return Entry:::</title>
        
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
            $("#txtOdrDate").datepicker({ format: 'dd-MM-yyyy', autoclose: true, todayBtn: 'linked' })
        });
    </script>


    <body>
            
        <form id="frmOrderEntry" runat="server" autocomplete="off">
             <%--<nav class="navbar navbar-fixed-top">
               </nav>--%>
            <div class="container">
                 <div class="page-header" style="border-bottom-width:thin; border-bottom-color:#160cf2">
                    <h2>Return Entry</h2>
                     <asp:Label ID="lbWellcome" runat="server" Text="Regional Manager," CssClass="control-label" ></asp:Label>
                     <asp:Label ID="lblRmName" runat="server"  CssClass="control-label" style="color:Navy; font-style:italic;font-size:11px; font-family: Verdana;" ></asp:Label>
                     <hr/>
                    <div class="form-horizontal">
                        <div class="form-group">
                          <asp:Label ID="lblOdrDate" runat="server" CssClass="col-md-3 control-label" Text="Order Date"></asp:Label>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtOdrDate" runat="server" CssClass="form-control" AutoComplete="off" ></asp:TextBox>
                            </div>
                         </div>
                        <div class="form-group">
                            <asp:Label ID="lblAgntName" runat="server" CssClass="col-md-3 control-label" Text="Agent Name"></asp:Label>
                            <div class="col-md-3">
                                <asp:DropDownList ID="ddlAgntName" runat="server" CssClass="btn btn-default dropdown" AutoPostBack="True" OnSelectedIndexChanged="ddlAgntName_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                        </div>
                        


                     </div> 
                    
                </div> <!--Page Header End-->

   <asp:GridView ID="grdOrder" CssClass="table table-hover" runat="server"  GridLines="Both" HorizontalAlign= "Center" style="border-color: inherit; border-width: medium; position:relative; width:71%; top:-10px;"
               

                AutoGenerateColumns="false"  
                AutoGenerateSelectButton="false" ShowHeader="false" 
                onrowcreated="grdOrder_RowCreated" onrowdatabound="grdOrder_RowDataBound"   >                
               

                 <Columns>
                        
                        <%--<asp:CommandField ItemStyle-Width="50px" ShowEditButton="True" ShowHeader="True" />--%>
                        <%--<asp:CommandField HeaderText="Edit" ShowEditButton="True" ShowHeader="True" />--%>

                        <asp:BoundField DataField="stationId" SortExpression="stationId"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                          ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="stationName" SortExpression="stationName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>                     
                        
                        <asp:BoundField DataField="Quantity" SortExpression="Quantity"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>  

                   <%--     <asp:BoundField DataField="BonusCopy" SortExpression="BonusCopy"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                      ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>  --%>
                      

                        <asp:TemplateField HeaderText="Regular Return">
                            <ItemTemplate>
                                <asp:TextBox ID="txtReturnCopy"  CssClass="form-control"  BackColor="Yellow" runat="server" >
                                </asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%--<asp:TemplateField HeaderText="Additional Return">
                            <ItemTemplate>
                                <asp:TextBox ID="txtAdditionalReturn" CssClass="form-control" BackColor="Yellow" runat="server" >
                                </asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        --%>
                        <asp:TemplateField HeaderText="Reason of Return">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlReason" CssClass="btn btn-default dropdown" runat="server">
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                          
                            
                 </Columns>

                    
            </asp:GridView>
     
                <div class="col-lg-5"> </div>
                <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="btnSaveOrder_Click"/>
                
            </div> <!--Container End-->
    
    </form>
        
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   <%-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>--%>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
