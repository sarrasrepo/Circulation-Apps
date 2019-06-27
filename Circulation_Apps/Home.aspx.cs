using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ImgBtnStatistics_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Statistics.aspx");
    }
   
    protected void ImgBtnCOQty_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("OrderQuantity.aspx");
    }
    protected void ImgBtnOdrEntry_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ReturnEntry.aspx");
    }
}