using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


public partial class OrderQuantity : System.Web.UI.Page
{
    clsDataProvider dataProvider = new clsDataProvider();

    SqlConnection con = new SqlConnection();
    clsConnection dbCon = new clsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblWellCome1.Text = this.Session["UserName"].ToString();


        if (!IsPostBack)
        { 
            bindCategory();

            bindCustomer();


        }





    }

    protected void MyTrace(string msg)
    {
        Response.Write("<script>alert('" + msg + "')</script>");
    }

    #region All Private Methods

    protected void ddlCustomer_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtChngQty.Text = "0";
        txtQty.Text = "0";
        bindStation();
    }

    protected void ddlStation_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtChngQty.Text = "0";
        txtQty.Text = "0";
        bindDailyQuantity();
    }
    #endregion

    protected void Updatebtn_Click(object sender, EventArgs e)
    {
        string strSelCustId = "select distinct custId from CustNameForRMOrder where CustomerName='" + ddlCustomer.SelectedItem.Text + "'";
        string strCustID = dataProvider.getResultString(strSelCustId);

        string strUpdate = "UPDATE orderEntry set smsQuantity='" + txtChngQty.Text + "' where stationName ='" + ddlStation.SelectedItem.Text.Replace("'", "''") + "' and orderDate='" + txtDate.Text + "' and catagory= '" + ddlCategory.SelectedItem.Text + "' and  customerId='" + strCustID + "'";
        dataProvider.ExecuteCommand(strUpdate);
        MyTrace("Updated Successfully");
    }


    #region Binding

    private void bindCategory()
    {
        string query = "SELECT  CatName from CATEGORY where delStatus<>1 ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "CatName");
        ddlCategory.DataSource = ds;
        ddlCategory.DataTextField = "CatName";
        ddlCategory.DataValueField = "CatName";
        ddlCategory.DataBind();
        //ddlCategory.Items.Insert(0, "-- Select --");
    }

    private void bindCustomer()
    {
        string query = "SELECT distinct CustomerName from CustNameForRMOrder where userName='" + this.Session["UserName"].ToString() + "' Order By CustomerName ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "CustomerName");
        ddlCustomer.DataSource = ds;
        ddlCustomer.DataTextField = "CustomerName";
        ddlCustomer.DataValueField = "CustomerName";
        ddlCustomer.DataBind();
        ddlCustomer.Items.Insert(0, "-- Select --");
    }

    private void bindStation()
    {
        string strSelCustId = "select distinct custId from CustNameForRMOrder where CustomerName='" + ddlCustomer.SelectedItem.Text + "'";
        string strCustID = dataProvider.getResultString(strSelCustId);

        string query = "SELECT distinct stationName from  CustNameForRMOrder where userName='"+this.Session["userName"].ToString()+"' and custId='" + strCustID + "' and orderDate='" + txtDate.Text + "'  Order By stationName ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "stationName");
        ddlStation.DataSource = ds;
        ddlStation.DataTextField = "stationName";
        ddlStation.DataValueField = "stationName";
        ddlStation.DataBind();
        ddlStation.Items.Insert(0, "-- Select --");


    }

    private void bindDailyQuantity()
    {
        string strSelCustId = "select distinct custId from CustNameForRMOrder where CustomerName='" + ddlCustomer.SelectedItem.Text + "'";
        string strCustID = dataProvider.getResultString(strSelCustId);

        string query = "select (quantity+daywiseChngQuantity+daywiseDefQuanttity) as quantity, smsQuantity from orderEntry  where stationName ='" + ddlStation.SelectedItem.Text.Replace("'", "''") + "'  and  orderDate='" + txtDate.Text + "' and catagory= '" + ddlCategory.SelectedItem.Text + "' and  customerId='" + strCustID + "' ";
        SqlDataReader sdr = dataProvider.getDataReader(query);
        while (sdr.Read())
        {
            txtQty.Text = sdr["quantity"].ToString();
            txtChngQty.Text = sdr["smsQuantity"].ToString();
        }

        
    }

    #endregion
}
