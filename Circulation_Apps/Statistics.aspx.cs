using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Data.Common;

public partial class Statistics : System.Web.UI.Page
{
    clsDataProvider dataProvider= new clsDataProvider();
    SqlConnection con = new SqlConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }


    
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void btnPreview_Click(object sender, EventArgs e)
    {
        string statistics = "Select  CustomerName, Sum(Quantity) as Quantity , (sum(Quantity)/(DATEDIFF(d,'" + txtFrmDate.Text + "','" + txtToDate.Text + "')+1)) as [Avg Quantity] from View_Statistics where Date between '" + txtFrmDate.Text + "' and '" + txtToDate.Text + "' and userName='"+this.Session["UserName"].ToString()+"' Group by CustomerName order by CustomerName ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(statistics, "View_Statistics_Table");
        GridView.DataSource = ds;
        GridView.DataBind();

    }   
        
    
}